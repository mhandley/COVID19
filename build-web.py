import subprocess
from glob import glob
graphs = [("covid-eu.png", "Western Europe", "logabs"),
          ("covid-eu-norm.png", "Western Europe", "lognorm"),
          ("rates.png", "Western Europe Daily Increases", "inc"),
          ("deaths-eu-norm.png", "Deaths: Western Europe", "deaths"),
          ("covid-eu-lom.png", "",  "lognorm"),
          ("covid-eu-norm2.png", "Nordic Region", "lognorm"),
          ("covid-eu-norm2b.png","Nordic Region (offset curves)", "lognorm"),
          ("rates-nordic.png", " Nordic Region, Daily Increases", "inc"),
          ("covid-eu-norm3.png","", "lognorm"),
	  ("deaths-eu-norm2.png","Deaths", "lognorm"),
	  ("covid-eu-norm4.png","", "lognorm"),
	  ("rates-eeu.png", "Eastern Europe, Daily Increases", "inc"),
	  ("covid-eu-norm5.png","", "lognorm"),
	  ("covid-eu-linear.png","Western Europe", "linear"),
	  ("covid-uk.png", "*UK: England Regions", "lognorm"),
	  ("covid-uk-linear.png","*UK: England Regions", "linear"),
	  ("covid-uk-all.png", "*UK: England, Scotland, Wales, Northern Ireland", "lognorm"),
	  ("covid-world.png", "World", "logabs"),
	  ("covid-world-norm.png","World", "lognorm"),
	  ("covid-us-norm.png","US States", "lognorm"),
	  ("covid-world-norm2.png","", "lognorm"),
	  ("covid-world-norm3.png","", "lognorm"),
	  ("deaths-us.png", "Deaths: USA", "deaths"),
	  ("covid-world-sa2.png","South America", "lognorm"),
	  ("covid-world-seasia.png","South East Asia", "lognorm"),
	  ("covid-world-warm.png", "Warm Countries", "logabs"),
	  ("covid-world-warm2.png", "Warm Countries", "logabs"),
	  ("covid-world-linear.png", "World", "linear")]

#graphs = ["covid-eu.png"]

types = {}
types["logabs"] = (\
"""The graph shows <B>cumulative number of confirmed cases</b>, plotted on a log
scale, against time.  The country curves are shown offset by the
amounts shown.""", "Cases")

types["lognorm"] = (\
"""The graph shows cumulative number of <B>confirmed cases per million                                                                                       inhabitants</B>, plotted on a log scale, against time.  The
country curves are shown offset by the amounts shown.""", "Cases")

types["linear"] = (\
"""The graph shows <b>number of confirmed cases</b>, plotted on a
linear scale, against time.  The country curves are shown offset
by the amounts shown.""", "Cases")

types["inc"] = (\
"""The graph shows <B>daily increase in confirmed cases                                                                                   per million inhabitants</B>, plotted on a log scale, against time.
  A Holt-Winters moving average filter with constants &alpha;=0.25 and
  &beta;=0.25 has been applied to smooth the curves as differences are
  very noisy.  This is quite a lot of smoothing and it imposes a
  couple of days lag, but it does extract trends fairly well.  The
  curves are not offset, today is Day 0 for all curves.""",  "Increases")

types["deaths"] = (\
"""The graph shows cumulative number of <B>deaths per million
      inhabitants</B>, plotted on a log scale, against time.  The
      country curves are shown offset by the amounts shown.""", "Deaths")

subprocess.call("cat wwwparts/header.html wwwparts/update.html wwwparts/explain.html > www/index.html", shell=True)
filemap = {}
def load_templates():
    templates = glob("templates/*")
    for tname in templates:
        file = open(tname, "r")
        for line in file:
            if "output" in line:
                parts = line.split('"')
                filename = parts[1]
                path = filename.split("/")
                shortname = path[len(path)-1]
                filemap[shortname] = tname
        file.close()

tl_to_c = {}
c_to_tl = {}
longnames = {}
longnames["us"] = "USA"

def load_tlcs():
    file = open("populations", "r")
    for line in file:
        parts = line.split("#")
        longcountry = parts[1].strip()
        if ":" in longcountry:
            parts2 = longcountry.split(":")
            longcountry = parts2[1].strip()
        country = ("".join(longcountry.split(" "))).lower()
        name = ""
        for word in longcountry.split(" "):
            if name != "":
                name = name + " "
            name = name + word[0].upper() + word[1:]
        longnames[country] = name

def extract_countries(filename):
    file = open(filename, "r")
    plot = False
    datafiles = []
    for line in file:
        if "plot" == line[:4]:
            plot = True
        if line.strip() == "" or line[0] == "#":
            plot = False
        if plot:
            for curve in line.split(","):
                for part in curve.split('"'):
                    if "../" in part:
                        datafiles.append(part)
    print(datafiles)
    countries = []
    for path in datafiles:
        parts = path.split("/")
        fname = parts[len(parts)-1].lower()
        prefix = fname.split("-")[0]
        countries.append(prefix)
    file.close()
    return countries

def make_country_list(graph):
    countries = extract_countries(filemap[graph])
    s = ""
    for country in countries:
        if s != "":
            s+= ", "
        s += longnames[country]
    return s
    
def make_index_line(graph, gname, gtype):
    s = make_country_list(graph)
    gprefix = graph.split(".")[0]
    txt, tag = types[gtype]
    if gname != "" and gname[0] != '*':
        s = gname + ": " + s
    elif gname != "" and gname[0] == '*':
        s = gname[1:]
    iline = '<DT><a href="#' + gprefix + '">Graph ' + str(gnum) + ":</a> <B>" + tag + "</B>: " + s + "</DT>"
    print(iline, file=ofile)

def make_graph(graph, gname, gtype, gnum, datedir):
    gprefix = graph.split(".")[0]
    s = make_country_list(graph)
    if gname != "" and gname[0] != '*':
        s = gname + ": " + s
    elif gname != "" and gname[0] == '*':
        s = gname[1:]
    print('<hr><P><h3><a name="' + gprefix + '"></a>' + s + "</h3><P>", file=ofile)
    print('<img src="' + datedir + "/" + graph + '"><P>', file = ofile)
    print('<UL>', file=ofile);
    txt, tag = types[gtype]
    print("<LI>" + txt + "</LI>",  file=ofile)
    try:
        ifile = open("commentaries/" + gprefix, "r")
        txt = ifile.read();
        ofile.write(txt);
        ifile.close()
    except:
        pass
    print('</UL>', file = ofile);

load_templates()
load_tlcs()

ofile = open("www/index.html", "a")
print("<h2>Contents</h2>\
<DL>", file= ofile)
gnum = 1
for graph,gname,gtype in graphs:
    make_index_line(graph, gname, gtype)
    gnum+=1
print("</DL>", file=ofile)


gnum = 1
datedir = "28mar2020"
for graph,gname,gtype in graphs:
    make_graph(graph, gname, gtype, gnum, datedir)
    gnum+=1

ofile.close()

subprocess.call("cat wwwparts/faq.html >> www/index.html", shell=True)

#print(longnames)
