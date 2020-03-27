def do_country(country):
    ifile = None
    try:
        ifile = open("country_data/"+country, "r")
    except FileNotFoundError:
        pass
    if ifile == None:
        try:
            ifile = open("jhu-data/"+country+"-wiki", "r")
        except FileNotFoundError:
            pass
    if ifile == None:
        ifile = open("jhu-data/"+country+"-jhu", "r")

    ofile = open("increase_rates/"+country, "w")
    prevval = -1
    diffs = []
    dates = []
    for line in ifile:
        parts = line.split()
        date = parts[0]
        val = int(parts[1])
        if prevval != -1:
            dates.append(date)
            diffs.append(val - prevval)
        prevval = val

    for i in range(len(dates)):
        if i == 0 or i == len(dates)-1:
            smoothed = diffs[i]
            #elif i == 1 or i == len(dates)-2:
        else:
            smoothed =  (diffs[i-1] +  diffs[i] +  diffs[i+1])/3
        #else:
        #    smoothed =  (diffs[i-2] + diffs[i-1] +  diffs[i] +  diffs[i+1] + diffs[i+2])/5
        print(dates[i], diffs[i], smoothed, file=ofile)
    ifile.close()
    ofile.close()


countries = ["italy", "spain", "france", "uk", "germany", "netherlands", "greece", "denmark", "finland", "us", "lombardy",
             "greece", "slovenia", "czechia", "romania", "poland", "serbia", "hungary", "bulgaria", "slovakia"]
for country in countries:
    do_country(country)
               
