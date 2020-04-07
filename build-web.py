import subprocess
from glob import glob
graphs = [("covid-eu.png", "Western Europe", "logabs"),
          ("covid-eu-norm.png", "Western Europe", "lognorm"),
          ("rates-peaked.png", "Daily Increases, Peaked Countries", "inc"),
          ("rates-level.png", "Daily Increases, Countries with Constant Increases", "inc"),
          ("rates-eu.png", "Western Europe Daily Increases", "inc"),
          ("deaths-eu-norm.png", "Deaths: Western Europe", "deaths"),
          ("deathrates-eu.png", "Death per day: Western Europe", "deathrates"),
          ("covid-eu-norm-lom.png", "",  "lognorm"),
          ("covid-eu-norm2.png", "Nordic Region", "lognorm"),
          ("rates-nordic.png", "Daily Increases", "inc"),
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
	  ("covid-world-sa2.png","South America (Andean)", "lognorm"),
	  ("covid-world-sa3.png","South America", "lognorm"),
	  ("covid-world-ca.png","Central America", "lognorm"),
	  ("covid-world-seasia.png","South East Asia", "lognorm"),
	  ("covid-world-warm.png", "Warm Countries", "logabs"),
	  ("covid-world-linear.png", "World", "linear")]


# not used anymore
#          ("covid-eu-norm2b.png","Nordic Region (offset curves)", "lognorm"),
#	  ("covid-world-warm2.png", "Warm Countries", "logabs"),


types = {}
types["logabs"] = (\
"""The graph shows <B>cumulative number of confirmed cases</b>, plotted on a log
scale, against time.  The country curves are shown offset by the
amounts shown. """, "Cases")

types["lognorm"] = (\
"""The graph shows cumulative number of <B>confirmed cases per million                                                                                       inhabitants</B>, plotted on a log scale, against time.  The
country curves are shown offset by the amounts shown.""", "Cases")

types["linear"] = (\
"""The graph shows <b>number of confirmed cases</b>, plotted on a
linear scale, against time.  The country curves are shown offset
by the amounts shown.""", "Cases")

types["inc"] = (\
"""The graph shows <B>daily increase in confirmed cases                                                                                   per million inhabitants</B>, plotted on a log scale, against time.
  A Holt-Winters moving average filter with constants &alpha;=0.5 and
  &beta;=0.5 has been applied to smooth the curves as differences are
  very noisy.  This is a moderate amount of smoothing and it imposes a
  about a days lag, but it does extract trends fairly well.  The
  curves are not offset, today is Day 0 for all curves.""",  "Increases")

types["deathrates"] = (\
"""The graph shows <B>the number of deaths each day per million inhabitants</B>, plotted on a log scale, against time.
  A Holt-Winters moving average filter with constants &alpha;=0.5 and
  &beta;=0.5 has been applied to smooth the curves as daily counts are
  very noisy.  This is a moderate amount of smoothing and it imposes a
  about a days lag, but it does extract trends fairly well.  The
  curves are not offset, today is Day 0 for all curves.""",  "Deaths per day")

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
longnames["scenario4"] = "Scenario 4"

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
    print('<a href="' + datedir + "/" + gprefix + '-large.png">', file=ofile)
    print('<img src="' + datedir + "/" + graph + '"><P>', file = ofile)
    print('</a>', file=ofile)
    print('<br><a href="points.html#' + gprefix + '"><small>SHOW DATA POINTS</small></a>', file=ofile)
    print('<UL>', file=ofile);
    commentfile = "commentaries/" + gprefix
    ls = subprocess.check_output("ls -l " + commentfile, shell=True).decode()
    updatetime = " ".join(ls.split()[5:7])
    print("<LI><I>Commentary updated: " + updatetime + " 2020</I></LI>", file=ofile)
    txt, tag = types[gtype]
    print("<LI>" + txt + "</LI>",  file=ofile)
    try:
        ifile = open(commentfile, "r")
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
datedir = "6apr2020"
for graph,gname,gtype in graphs:
    make_graph(graph, gname, gtype, gnum, datedir)
    gnum+=1

ofile.close()

subprocess.call("cat wwwparts/faq.html >> www/index.html", shell=True)
subprocess.call('cat www/index.html | sed -e "s/\.png/-lp\.png/g" | sed -e "s/large-lp.png/lp-large.png/g" | sed -e "s/SHOW/HIDE/g" | sed -e "s/points\.html/index\.html/g" > www/points.html', shell=True)

#print(longnames)
