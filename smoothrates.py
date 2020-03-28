smooth = 3
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
    s = -1
    for i in range(len(dates)):
        if i == 0 or i == len(dates)-1 or smooth == 1:
            smoothed = diffs[i]
        elif i == 1 or i == len(dates)-2 or smooth == 3:
            smoothed =  (diffs[i-1] +  diffs[i] +  diffs[i+1])/3
        else:
            smoothed =  (diffs[i-2] + diffs[i-1] +  diffs[i] +  diffs[i+1] + diffs[i+2])/5
        if smoothed == 0:
            smoothed = 0.0001
        # if ewma == -1:
        #     ewma = diffs[i]
        # else:
        #     p = 0.5
        #     ewma = p * diffs[i] + (1-p) * ewma

        # holt-winters
        if s == -1:
            s = diffs[0]
            b = diffs[1]-diffs[0]
        else:
            alpha = 0.25
            beta = 0.25
            prevs = s
            s = alpha * diffs[i] + (1-alpha) * (s + b)
            b = beta * (s -prevs) + (1 - beta)*b
        if s < 0.1:  # for logscale plotting
            s = 0.1
        #print(dates[i], diffs[i], smoothed, file=ofile)
        print(dates[i], diffs[i], s, file=ofile)
    ifile.close()
    ofile.close()


countries = ["italy", "spain", "france", "uk", "germany", "netherlands", "greece", "denmark", "finland", "us", "lombardy",
             "greece", "slovenia", "czechia", "romania", "poland", "serbia", "hungary", "bulgaria", "slovakia",
             "denmark", "sweden", "finland", "norway", "iceland", "estonia"]
for country in countries:
    do_country(country)
               
