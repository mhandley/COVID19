countries = ["italy", "spain", "france", "uk", "germany", "netherlands", "greece", "denmark", "finland", "us", "lombardy",
             "greece", "slovenia", "czechrepublic", "romania", "poland", "serbia", "hungary", "bulgaria", "slovakia",
             "denmark", "sweden", "finland", "norway", "iceland", "estonia", "belarus", "taiwan", "japan", "singapore",
             "luxembourg", "switzerland", "austria", "southkorea", "china", "australia", "thailand",
             "newzealand", "london", "belgium", "egypt", "lithuania", "latvia", "NewYork", "Washington", "California", "NewJersey", "Colorado", "Louisiana", "Massachusetts", "Illinois", "Michigan", "Florida", "belarus", "latvia", "lithuania", "ukraine", "russia", "uk-e", "uk-emid", "uk-wmid", "uk-yorks", "uk-ne", "uk-nw", "uk-se", "uk-sw", "northernireland", "scotland", "wales", "israel", "argentina", "chile", "canada", "uruguay", "venezuela", "vietnam", "cambodia", "philippines", "malaysia", "iran", "uk-pillar1", "Oklahoma", "Georgia", "portugal", "belgium","ireland", "southafrica", "turkey", "peru", "panama", "mexico", "colombia"]
foo = ["italy-lom", "hubei-china", "china2"]

smooth = 3
def do_country(country):
    print(country)
    ifile = None
    try:
        ifile = open("country_data/"+country, "r")
    except FileNotFoundError:
        pass
    if ifile == None:
        try:
            ifile = open("nyt-data/"+country, "r")
        except FileNotFoundError:
            pass
    if ifile == None:
        try:
            ifile = open("wiki-data/"+country+"-wiki", "r")
        except FileNotFoundError:
            pass
    if ifile == None:
        ifile = open("jhu-data/"+country+"-jhu", "r")

    prevval = -1
    prevdeaths = 0
    diffs = []
    deathdiffs = []
    smoothdiffs = []
    smoothdeathdiffs = []
    
    dates = []
    for line in ifile:
        if line.strip() == "":
            continue
        parts = line.split()
        date = parts[0]
        val = int(parts[1])
        try:
            deaths = int(parts[2])
        except:
            deaths = 0
        if prevval != -1:
            dates.append(date)
            diffs.append(val - prevval)
            deathdiffs.append(deaths - prevdeaths)
        prevval = val
        prevdeaths = deaths
    s = -1
    sd = -1
    maxsmoothdiffs = 0
    maxsmoothdeathdiffs = 0
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
            alpha = 0.5
            beta = 0.5
            prevs = s
            s = alpha * diffs[i] + (1-alpha) * (s + b)
            b = beta * (s -prevs) + (1 - beta)*b
        if s < 0.1:  # for logscale plotting
            s = 0.1

        if sd == -1:
            sd = deathdiffs[0]
        else:
            alpha = 0.25
            sd = alpha * deathdiffs[i] + (1-alpha) * sd
            
        
        #print(dates[i], diffs[i], smoothed, file=ofile)
        if s > maxsmoothdiffs:
            maxsmoothdiffs = s
        if sd > maxsmoothdeathdiffs:
            maxsmoothdeathdiffs = sd
        smoothdiffs.append(s)
        smoothdeathdiffs.append(sd)
        
    ifile.close()

    ofile = open("increase_rates/"+country, "w")
    ofile2 = open("normalized/"+country, "w")
    for i in range(len(dates)):
        print(dates[i], diffs[i], smoothdiffs[i], deathdiffs[i], smoothdeathdiffs[i], file=ofile)
        try:
            norm_sd = smoothdeathdiffs[i]/maxsmoothdeathdiffs
        except:
            norm_sd = 0
        print(dates[i], diffs[i], smoothdiffs[i]/maxsmoothdiffs, deathdiffs[i], norm_sd, file=ofile2)

    ofile.close()
    ofile2.close()

for country in countries:
    do_country(country)
               
