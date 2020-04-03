import subprocess
import sys

norm = False
calc_deaths = False
def extract_countries(filename):
    global norm
    file = open(filename, "r")
    plot = False
    datafiles = []
    for line in file:
        if "per million" in line:
            norm = True
        if "plot" == line[:4]:
            plot = True
        if line.strip() == "" or line[0] == "#":
            plot = False
        if plot:
            for curve in line.split(","):
                for part in curve.split('"'):
                    if "../" in part:
                        datafiles.append(part)
    countries = []
    for path in datafiles:
        parts = path.split("/")
        fname = parts[len(parts)-1].lower()
        prefix = fname.split("-")[0]
        countries.append((path,prefix))
    file.close()
    return countries

assert(len(sys.argv) == 2 or len(sys.argv) == 3)
filename = sys.argv[1]
scale = 2
if len(sys.argv) == 3:
    scale = float(sys.argv[2])
    
countries = extract_countries(filename)
if "death" in filename:
    calc_deaths = True

pfile = open("populations", "r")
sizes = {}
for line in pfile:
    parts = line.split("#")
    country = "".join(parts[1].strip().split(" ")).lower()
    size = float(parts[0].split("=")[1].strip())
    if country == "usa":
        country = "us"
    if ":" in country:
        country = country.split(":")[1].strip()
    sizes[country] = size

cases_max = 0
for country,short in countries:
    if country[:3] == "../":
        country = country[3:]
    file = open(country, "r")
    for line in file:
        if line.strip() == "":
            continue
        parts = line.split()
        date = parts[0]
        cases = int(parts[1])
        if calc_deaths:
            deaths = int(parts[2])
            cases = deaths
        if norm:
            cases /= sizes[short]
        if cases > cases_max:
            cases_max = cases
    file.close()
ymax = cases_max * scale
subprocess.call("cat " + filename + ' | sed -e "s/YMAX/' + str(ymax) + '/g" >' + filename + ".tmp", shell = True)
subprocess.call("mv " + filename + ".tmp " + filename, shell = True)
