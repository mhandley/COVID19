import subprocess
from time import sleep
urls = {}
countries = ["iran", "france", "spain", "germany", "singapore", "southkorea", "netherlands", "ecuador", "chile", "peru", "ecuador", "colombia", "uruguay", "paraguay", "bolivia", "venezuela", "argentina", "vietnam", "philippines", "austria", "portugal", "canada", "norway", "brazil", "sweden", "israel", "turkey", "malaysia", "denmark", "ireland", "luxembourg", "iceland", "pakistan", "thailand", "romania", "indonesia", "finland", "russia", "greece", "slovenia", "slovakia", "estonia", "india", "serbia", "bulgaria", "hungary", "croatia", "australia", "japan", "switzerland", "czechrepublic", "saudiarabia", "iraq", "lithuania", "belarus", "belgium", "italy", "newzealand", "us", "china", "poland", "qatar", "egypt", "kuwait", "uae"]

#countries = ["singapore", "us"]

countries = sorted(countries)
# panama doesn't seem to be updated
#Bad countries: poland, switzerland
urls["uae"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/United_Arab_Emirates_medical_cases_chart&action=edit"
urls["venezuela"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Venezuela_medical_cases_chart&action=edit"
urls["mexico"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Mexico_medical_cases_chart&action=edit"
urls["qatar"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Qatar_medical_cases_chart&action=edit"
urls["italy"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Italy_medical_cases_chart&action=edit"
urls["china"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Mainland_China_medical_cases_chart&action=edit"
urls["newzealand"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/New_Zealand_medical_cases_chart&action=edit"
urls["us"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/United_States_medical_cases_chart&action=edit"
urls["iran"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Iran_medical_cases_chart&action=edit"
urls["france"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/France_medical_cases_chart&action=edit"
urls["spain"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Spain_medical_cases_chart&action=edit"
urls["germany"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Germany_medical_cases_chart&action=edit"
urls["singapore"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Singapore_medical_cases_chart&action=edit"
urls["southkorea"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/South_Korea_medical_cases_chart&action=edit"
urls["netherlands"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Netherlands_medical_cases_chart&action=edit"
urls["ecuador"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Ecuador_medical_cases_chart&action=edit"
urls["peru"] = "https://en.wikipedia.org/w/index.php?title=2020_coronavirus_pandemic_in_Peru&action=edit&section=2"
urls["uruguay"] = "https://en.wikipedia.org/w/index.php?title=2020_coronavirus_pandemic_in_Uruguay&action=edit&section=5"
urls["chile"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Chile_medical_cases_chart&action=edit"
urls["philippines"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Philippines_medical_cases_chart&action=edit"
#urls["colombia"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Colombia_medical_cases_chart&action=edit"
urls["domincanrepublic"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Dominican_Republic_medical_cases_chart&action=edit"
urls["czechrepublic"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Czech_Republic_medical_cases_chart&action=edit"
urls["saudiarabia"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Saudi_Arabia_medical_cases_chart&action=edit"
urls["ireland"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Republic_of_Ireland_medical_cases_chart&action=edit"

base_url1 = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/"
base_url2 = "_medical_cases_chart&action=edit"


#urls["switzerland"] = "https://en.wikipedia.org/w/index.php?title=Template:2019%E2%80%9320_coronavirus_pandemic_data/Switzerland_medical_cases_chart/&action=edit"
prev2date = "2020-04-24"
prevdate = "2020-04-25"
date = "2020-04-26"

months = {}
months["february"] = "02"
months["march"] = "03"
months["april"] = "04"
months["may"] = "05"
months["june"] = "06"
months["july"] = "07"

def lookup_month(mon):
    return months[mon.lower()]
    

def fix_date(date):
    if "-" in date:
        parts = date.split("-")
    elif "/" in date:
        parts = date.split("/")
    elif " " in date:
        parts = date.split(" ")
        mon = lookup_month(parts[1])
        day = parts[0]
        if len(parts[0]) == 1:
            day = "0" + day
        date2 = parts[2] + "-" + mon + "-" + day
        return date2
    else:
        return ""
    if parts[0] == "2020" or parts[0] == "2019":
        date2 = parts[0] + "-" + parts[1] + "-" + parts[2]
    elif parts[2] == "2020":
        date2 = parts[2] + "-" + parts[1] + "-" + parts[0]
    else:
        return ""
    return date2

for country in countries:
    print("\n" + country)
    sleep(1)
    subprocess.call("rm -f dump", shell=True)
    try:
        url = urls[country]
    except:
        url = base_url1 + country[0].upper() + country[1:] + base_url2
    subprocess.call(["curl", "-o", "dump", "--silent", "--url",  url])
    file = open("dump", "r")
    success = False
    ofile = open("wiki-tmp/" + country + "-wiki", "w")
    for line in file:
        parts = line.split("|")
        if len(parts) > 4 and "{{Medical cases chart/Row" in parts[0] and "&lt;!" not in parts[0]:
            date2 = fix_date(parts[1].strip())
            deaths = parts[2].strip()
            recovered = parts[3].strip()
            cases = parts[4].strip()
            if not "2020" in date2:
                pass
                #print('date error', line)
            else:
                success = True
                print(date2, cases, deaths, recovered, file=ofile)
                if date == date2 or prevdate == date2  or prev2date == date2:
                    print(date2, cases, deaths, recovered)
    file.close()
    if not success:
        file = open("dump", "r")
        dump = False
        for line in file:
            if "|data=" == "".join(line.strip().split(" "))[:6] or \
               "|bars=" == line[:6]: 
                #print("starting")
                dump = True
            else:
                if dump:
                    if line[:5] == "2019-" or line[:5] == "2020-" or "-2020" in line[:10]:
                        parts = line.split(";")
                        if len(parts) < 5:
                            dump = False
                            break
                        date2 = fix_date(parts[0].strip())
                        deaths = parts[1].strip()
                        if deaths == "":
                            deaths = "0"
                        recovered = parts[2].strip()
                        cases = parts[3].strip()
                        cases2 = "".join(parts[6].split(",")).strip()
     
                        if cases == "":
                            cases = parts[5].strip()
                        print(date2, cases2, deaths, recovered, file=ofile)
                        if date == date2 or prevdate == date2 or prev2date == date2:
                            success = True
                            print(date2, cases2, deaths, recovered)
                            if cases2 != cases:
                                print("mismatch: " + cases + " != " + cases2)
                    elif line[:7] == "&lt;!--" or line[:1] == ";" or line.strip() == "" or line.lstrip()[0]==';':
                        pass
                    else:
                        #print("stop: ", line)
                        dump = False
        file.close()
    if not success:
        file = open("dump", "r")
        for line in file:
            if "{{Bar stacked" in line:
                line = line.strip("\n")
                assert(line[:2] == "{{" and line[len(line)-2:] == "}}")
                # strip enclosing quotes
                line = line[2:len(line)-2]
                                          
                parts = []
                stack = 0
                start = 0
                for i in range(len(line)):
                    if line[i] == "|" and stack == 0:
                        parts.append(line[start:i])
                        start = i+1
                    elif line[i:i+2] == "{{":
                        stack += 1
                    elif line[i:i+2] == "}}":
                        stack -= 1
                date2 = fix_date(parts[1].strip())
                cases = "".join(parts[2].split("&")[0].split(",")).strip()
                deaths = parts[4].split()[1].split("/")[0].strip()
                recovered = parts[6].split()[1].split("/")[0].strip()
                if not "2020" in date2:
                    pass
                else:
                    success = True
                    print(date2, cases, deaths, recovered, file=ofile)
                    if date == date2 or prevdate == date2 or prev2date == date2:
                        print(date2, cases, deaths, recovered)
        file.close()
    if not success:
        file = open("dump", "r")
        dump = False
        for line in file:
            squishline = "".join(line.strip().split(" "))
            if '{|class="wikitable"' == squishline:
                dump = True
            else:
                if dump:
                    if squishline[:7] == "|{{dts|":
                        parts = squishline.split("|")
                        parts2 = line.split("|")
                        if len(parts) < 11:
                            dump = False
                            break
                        date2 = fix_date(parts2[2].strip().strip("}"))
                        deaths = parts[10].strip()
                        recovered = parts[8].strip()
                        cases = parts[6].strip()
                        print(date2, cases, deaths, recovered, file=ofile)
                        if date == date2 or prevdate == date2 or prev2date == date2:
                            success = True
                            print(date2, cases, deaths, recovered)
                    elif line[:2] == "|-" or "New cases" in line or "! scope=" in line:
                        pass
                    else:
                        dump = False
        file.close()
    ofile.close()
