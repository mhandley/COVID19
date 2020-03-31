import glob
files = []

wikifiles = glob.glob("wiki-data/*")
jhufiles = glob.glob("jhu-data/*")
nytfiles = glob.glob("nyt-data/*")
myfiles = glob.glob("country_data/*")
filenames = jhufiles + wikifiles + nytfiles + myfiles
             #J  F   M   A   M   J   J   A   S   O   N   D
monthlens = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
d = 0
monstarts = []
for mlen in monthlens:
    monstarts.append(d)
    d += mlen

def convert_date(date):
    if "-" in date:
        parts = date.split("-")
    elif "/" in date:
        parts = date.split("/")
    else:
        return 0
    year = int(parts[0])
    mon = int(parts[1])
    try:
        day = int(parts[2].strip(","))
    except:
        return -1
        
    if mon-1 < len(monstarts):
        dnum = monstarts[mon-1] + day
    else:
        return -1
    if dnum > 1000:
        exit()
    return dnum

# print("2020-01-01:",  convert_date("2020-01-01"))
# print("2020-01-31:",  convert_date("2020-01-31"))
# print("2020-01-01:",  convert_date("2020-02-01"))
# print("2020-03-01:",  convert_date("2020-03-01"))
# print("2020-02-29:",  convert_date("2020-02-29"))

maxday = 0
for filename in filenames:
    print(filename)
    try:
        ifile = open(filename, "r")
    except:
        print("failed to open " + filename)
        continue
    for line in ifile:
        if line.strip() == "":
            continue
        parts = line.split()
        date = parts[0]
        dnum = convert_date(date)
        if dnum < 0:
            print("bad file: ", filename)
            continue
        if dnum > maxday:
            maxday = dnum

for filename in filenames:
    try:
        ifile = open(filename, "r")
    except:
        continue
    dateset = set()
    ofname = filename.split("/")[1]
    srcname = filename.split("/")[0].split("-")[0]
    ofile = open("aligned/" + srcname + "/" + ofname, "w")
    print(filename)
    for line in ifile:
        if line.strip() == "":
            continue
        parts = line.split()
        date = parts[0]
        cases = int(parts[1])
        try:
            deaths = int(parts[2])
        except:
            deaths = -1
        dnum = convert_date(date) - maxday
        if dnum < -1000:
            os.exit()
        if date in dateset:
            print("duplicate date: ", date)
            os.exit()
        dateset.add(date)
        print(dnum, cases, deaths, file = ofile)
    
