import subprocess
from glob import glob
graphs = [("covid-eu.png", "Western Europe", "logabs"),
          ("covid-eu-norm.png", "Western Europe", "lognorm"),
          ("rates-peaked.png", "Daily Increases, Peaked Countries", "inc"),
          ("rates-eu.png", "Western Europe Daily Increases", "inc"),
          ("rates-norm-peaked.png", "Daily Increases, Peaked Countries", "norminc"),
          ("rates-norm-low.png", "Daily Increases, Successful Countries", "norminc"),
          ("deaths-eu-norm.png", "Deaths: Western Europe", "deaths-eu"),
          ("deathrates-eu.png", "Death per day: Western Europe", "deathrates"),
          ("covid-eu-norm2.png", "Nordic Region", "lognorm"),
          ("rates-nordic.png", "Daily Increases", "inc"),
          ("deaths-eu-nordic.png", "Deaths", "deaths-eu"),
          ("covid-eu-norm3.png","", "lognorm"),
	  ("deaths-eu-norm2.png","Deaths", "deaths-eu"),
	  ("covid-eu-norm4.png","", "lognorm"),
	  ("rates-eeu.png", "Eastern Europe, Daily Increases", "inc"),
	  ("covid-eu-norm5.png","", "lognorm"),
	  ("rates-eu-norm5.png","Daily Increases", "inc"),
	  ("covid-eu-linear.png","Western Europe", "linear"),
	  ("covid-uk.png", "*UK: England Regions", "lognorm"),
	  ("covid-uk-linear.png","*UK: England Regions", "linear"),
	  ("covid-uk-all.png", "*UK: Scotland, Wales, Northern Ireland", "lognorm"),
	  ("rates-uk.png","*UK England Regions, Scotland, Wales, Northern Ireland", "inc"),
	  ("covid-world.png", "World", "logabs"),
	  ("covid-world-norm.png","World", "lognorm"),
	  ("covid-us-norm.png","US States", "lognorm"),
	  ("rates-us.png","US States", "inc"),
	  ("deaths-us.png", "Deaths: USA", "deaths"),
	  ("deathrates-us.png", "Deaths per day: USA", "deathrates"),
	  ("deaths-eu-us.png", "Deaths: EU and US North East region", "deaths-since"),
	  ("deaths-eu-us-norm.png", "Deaths: EU and US North East region", "deaths-since-norm"),
	  ("covid-world-norm2.png","", "lognorm"),
	  ("covid-world-norm3.png","", "lognorm"),
	  ("covid-world-sa2.png","South America (Andean)", "lognorm"),
	  ("covid-world-sa3.png","South America", "lognorm"),
	  ("covid-world-ca.png","Central America", "lognorm"),
	  ("covid-world-seasia.png","South East Asia", "lognorm"),
	  ("covid-world-warm.png", "Warm Countries", "logabs"),
	  ("covid-world-linear.png", "World", "linear")]


# not used anymore
#          ("rates-level.png", "Daily Increases, Countries with Constant Increases", "inc"),
#          ("covid-eu-norm-lom.png", "",  "lognorm"),
#          ("covid-eu-norm2b.png","Nordic Region (offset curves)", "lognorm"),
#	  ("covid-world-warm2.png", "Warm Countries", "logabs"),


deathfile = open("deaths", "r")
deathtxt = deathfile.read()
# deathtxt = """
# <LI>Death statistics need to be interpreted with care, as no two countries have the same criteria for what is actually reported as a COVID19 death, or when those deaths are reported.  As far as I can tell, the death statistics on this graph are as follows:
# <UL>
# <LI>Italy: mostly does not include people who died outside hospitals. 

# <LI>Spain: mostly does not include nursing homes, as only includes confirmed cases, and <a href="https://elpais.com/espana/madrid/2020-04-08/4750-ancianos-mueren-en-las-residencias-de-madrid-en-el-ultimo-mes.html">most nursing home deaths were not tested</a>.

# <LI>France: does include nursing homes - as of 14th April, 29% of deaths occurred in nursing homes

# <LI>UK: does not include nursing homes - as of 3rd April, at least 34% of deaths occured outside of hospitals.  Data is only available up til 3rd April because deaths outside hospitals take time to be registered.  

# <LI>Belgium: does include nursing homes - as of 12th April, <a href="https://epidemio.wiv-isp.be/ID/Pages/2019-nCoV_epidemiological_situation.aspx?lcid=1036">42% of deaths</a> occured in nursing homes

# <LI>Netherlands: <a href="https://www.rivm.nl/en/novel-coronavirus-covid-19/current-information-about-novel-coronavirus-covid-19">appears to only include hospital deaths</a>, but I have not been able to confirm this.

# <LI>Ireland: includes nursing homes.  As of 14th April, <a href="https://www.rte.ie/news/2020/0414/1130463-irish-virus-figures/">46% of deaths</a> occurred in nursing homes.
# </UL>

# <LI><I>Help me update and/or complete this information for other countries.</I>

# <LI>However they are being reported, if the reporting is consistent
# (for example, only reporting hospital deaths) then we can at least
# tell how fast deaths are rising or declining.  For this purpose, what
# we really need is a fast and consistent count of deaths, even if it
# misses half of deaths, than for a complete but delayed count, as this
# lets us know what measures are working.  For other purposes, you
# obviously want the comoplete count, but that takes a lot more
# time to compile.

# <LI>Comparing which country has the highest death count is not the
# purpose of this graph: if you read it that way you will draw the wrong
# conclusions: this is not a competition, and no-one can say the final
# death rates until much later, if ever.
# """





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

types["norminc"] = (\
"""The graph shows <B>daily increase in confirmed cases normalized so the peaks of different countries are all the same height</B>, plotted on a linear scale against time.  A
  Holt-Winters moving average filter with constants &alpha;=0.5 and
  &beta;=0.5 has been applied to smooth the curves as differences are
  very noisy.  This is a moderate amount of smoothing and extracts trends fairly well without smoothing large peaks. """,  "Normalized Increases")

types["deathrates"] = (\
"""The graph shows <B>the number of deaths each day per million inhabitants</B>, plotted on a log scale, against time.
  A Holt-Winters moving average filter with constants &alpha;=0.5 and
  &beta;=0.5 has been applied to smooth the curves as daily counts are
  very noisy.  This is a moderate amount of smoothing and it imposes a
  about a days lag, but it does extract trends fairly well.  The
  curves are not offset, today is Day 0 for all curves.""",  "Deaths per day")

types["deaths-eu"] = (\
"""The graph shows cumulative number of <B>deaths per million
      inhabitants</B>, plotted on a log scale, against time.  The
      country curves are shown offset by the amounts shown.""" + deathtxt, "Deaths")

types["deaths"] = (\
"""The graph shows cumulative number of <B>deaths per million
      inhabitants</B>, plotted on a log scale, against time.  The
      country curves are shown offset by the amounts shown.""", "Deaths")

types["deaths-since"] = (\
"""The graph shows cumulative number of deaths, plotted on a log scale, against time, since the day 100 deaths first occurred""", "Deaths")

types["deaths-since-norm"] = (\
"""The graph shows cumulative number of <B>deaths per million
      inhabitants</B>, plotted on a log scale, against time since 10 deaths per million inhabitants first occurred.""", "Deaths")

subprocess.call("cat wwwparts/header.html wwwparts/update.html wwwparts/explain.html > www/index.html", shell=True)
filemap = {}
def load_templates():
    templates = glob("templates/*")
    for tname in templates:
        if "~" in tname:
            continue
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
    #print(datafiles)
    countries = []
    for path in datafiles:
        parts = path.split("/")
        fname = parts[len(parts)-1].lower()
        prefix = fname.split("-")[0]
        countries.append(prefix)
    file.close()
    print(filename, countries, "\n\n")
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
    updatetime = " ".join(ls.split()[5:7]) + " 2020, " + ls.split()[7]
    ls = subprocess.check_output("ls -l graphs/" + graph, shell=True).decode()
    gupdatetime = " ".join(ls.split()[5:7]) + " 2020, " + ls.split()[7]
    print("<LI><I>Graph updated: " + gupdatetime + " BST</I></LI>", file=ofile)
    print("<LI><I>Commentary updated: " + updatetime + " BST</I></LI>", file=ofile)
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
datedir = "26apr2020"
for graph,gname,gtype in graphs:
    make_graph(graph, gname, gtype, gnum, datedir)
    gnum+=1

ofile.close()

subprocess.call("cat wwwparts/faq.html >> www/index.html", shell=True)
subprocess.call('cat www/index.html | sed -e "s/\.png/-lp\.png/g" | sed -e "s/large-lp.png/lp-large.png/g" | sed -e "s/SHOW/HIDE/g" | sed -e "s/points\.html/index\.html/g" > www/points.html', shell=True)

#print(longnames)
