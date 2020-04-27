all: graphs/covid-eu.png graphs/covid-eu-norm.png graphs/rates-eu.png graphs/rates-eeu.png graphs/rates-nordic.png graphs/deaths-eu-norm.png graphs/deaths-eu-norm2.png graphs/deaths-us.png graphs/covid-eu-norm-lom.png graphs/covid-eu-norm2.png graphs/covid-eu-norm2b.png graphs/covid-eu-norm3.png graphs/covid-eu-norm4.png graphs/covid-eu-norm5.png graphs/covid-eu-linear.png graphs/covid-uk.png graphs/covid-uk-all.png graphs/covid-uk-linear.png graphs/covid-world.png graphs/covid-world-norm.png graphs/covid-us-norm.png graphs/covid-world-norm2.png graphs/covid-world-norm3.png graphs/covid-world-sa2.png graphs/covid-world-sa3.png graphs/covid-world-seasia.png graphs/covid-world-warm.png graphs/covid-world-warm2.png graphs/covid-world-linear.png graphs/covid-world-ca.png graphs/rates-seasia.png graphs/rates-asia.png graphs/rates-peaked.png graphs/rates-level.png graphs/deathrates-eu.png graphs/deathrates-eu-raw.png graphs/rates-norm-peaked.png graphs/rates-us.png graphs/rates-eu-norm5.png graphs/rates-uk.png graphs/deaths-eu.png graphs/deaths-eu-nordic.png graphs/deaths-us.png graphs/rates-low.png graphs/rates-norm-low.png graphs/deathrates-eu-nonnorm.png graphs/deathrates-us.png graphs/deaths-eu-us-norm.png graphs/deaths-eu-us.png graphs/rates-ca-sa.png

DATEDIR = www/26apr2020/
DATE=26
OFFSET=71


graphs/covid-world-linear.png: templates/plot-world-linear
	cat populations templates/plot-world-linear | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-linear
	python set_ymax.py gnuplot/plot-world-linear 1.1
	cat gnuplot/plot-world-linear | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-linear-lp
	cat gnuplot/plot-world-linear | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-world-linear-large
	cat gnuplot/plot-world-linear-lp | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-world-linear-lp-large
	cd gnuplot; gnuplot plot-world-linear; gnuplot plot-world-linear-lp; gnuplot plot-world-linear-large; gnuplot plot-world-linear-lp-large 
	cp graphs/covid-world-linear.png graphs/covid-world-linear-lp.png ${DATEDIR}
	cp graphs/covid-world-linear-large.png graphs/covid-world-linear-lp-large.png ${DATEDIR}
	open graphs/covid-world-linear.png

graphs/covid-%.png: templates/plot-%
	cat populations templates/plot-$* | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-$*
	python set_ymax.py gnuplot/plot-$*
	cat gnuplot/plot-$* | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-$*-lp
	cat gnuplot/plot-$* | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-$*-large
	cat gnuplot/plot-$*-lp | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-$*-lp-large
	cd gnuplot; gnuplot plot-$*; gnuplot plot-$*-lp; gnuplot plot-$*-large; gnuplot plot-$*-lp-large; 
	cp graphs/covid-$*.png graphs/covid-$*-lp.png ${DATEDIR}
	cp graphs/covid-$*-large.png graphs/covid-$*-lp-large.png ${DATEDIR}
	open graphs/covid-$*.png

graphs/rates-%.png:	templates/plot-rates-% 
	cat populations templates/plot-rates-$* | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-rates-$*
	cat gnuplot/plot-rates-$* | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-rates-$*-lp
	cat gnuplot/plot-rates-$* | sed -e "s/800,600/1280,1024/g" | sed -e "s/900,600/1440,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-rates-$*-large
	cat gnuplot/plot-rates-$*-lp | sed -e "s/800,600/1280,1024/g" | sed -e "s/900,600/1440,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-rates-$*-lp-large
	cd gnuplot; gnuplot plot-rates-$*; gnuplot plot-rates-$*-lp; gnuplot plot-rates-$*-large; gnuplot plot-rates-$*-lp-large; 
	cp graphs/rates-$*.png graphs/rates-$*-lp.png ${DATEDIR}
	cp graphs/rates-$*-large.png graphs/rates-$*-lp-large.png ${DATEDIR}
	open graphs/rates-$*.png

graphs/deathrates-%.png:	templates/deathrates-% 
	cat populations templates/deathrates-$* | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/deathrates-$*
	cat gnuplot/deathrates-$* | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/deathrates-$*-lp
	cat gnuplot/deathrates-$* | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/deathrates-$*-large
	cat gnuplot/deathrates-$*-lp | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/deathrates-$*-lp-large
	cd gnuplot; gnuplot deathrates-$*; gnuplot deathrates-$*-lp; gnuplot deathrates-$*-large; gnuplot deathrates-$*-lp-large; 
	cp graphs/deathrates-$*.png graphs/deathrates-$*-lp.png ${DATEDIR}
	cp graphs/deathrates-$*-large.png graphs/deathrates-$*-lp-large.png ${DATEDIR}
	open graphs/deathrates-$*.png

graphs/deaths-%.png:	templates/deaths-% 
	cat populations templates/deaths-$* | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/deaths-$*
	python set_ymax.py gnuplot/deaths-$*
	cat gnuplot/deaths-$* | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/deaths-$*-lp
	cat gnuplot/deaths-$* | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/deaths-$*-large
	cat gnuplot/deaths-$*-lp | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/deaths-$*-lp-large
	cd gnuplot; gnuplot deaths-$*; gnuplot deaths-$*-lp; gnuplot deaths-$*-large; gnuplot deaths-$*-lp-large; 
	cp graphs/deaths-$*.png graphs/deaths-$*-lp.png ${DATEDIR}
	cp graphs/deaths-$*-large.png graphs/deaths-$*-lp-large.png ${DATEDIR}
	open graphs/deaths-$*.png




graphs/covid-uk.png: templates/plot-uk increase_rates/uk
	cat populations templates/plot-uk | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-uk
	cat gnuplot/plot-uk | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-uk-lp
	cat gnuplot/plot-uk | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-uk-large
	cat gnuplot/plot-uk-lp | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-uk-lp-large
	cd gnuplot; gnuplot plot-uk; gnuplot plot-uk-lp; gnuplot plot-uk-large; gnuplot plot-uk-lp-large
	cp graphs/covid-uk*.png ${DATEDIR}
	open graphs/covid-uk.png

graphs/covid-uk-linear.png: templates/plot-uk2
	cat populations templates/plot-uk2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-uk2
	python set_ymax.py gnuplot/plot-uk2 1.1
	cat gnuplot/plot-uk2 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-uk2-lp
	cat gnuplot/plot-uk2 | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-uk2-large
	cat gnuplot/plot-uk2-lp | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-uk2-lp-large
	cd gnuplot; gnuplot plot-uk2; gnuplot plot-uk2-lp
	cp graphs/covid-uk-linear*.png ${DATEDIR}
	open graphs/covid-uk-linear.png

graphs/covid-uk-all.png: templates/plot-uk3
	cat populations templates/plot-uk3 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-uk3
	python set_ymax.py gnuplot/plot-uk3
	cat gnuplot/plot-uk3 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-uk3-lp
	cat gnuplot/plot-uk3 | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-uk3-large
	cat gnuplot/plot-uk3-lp | sed -e "s/800,600/1280,1024/g" | sed -e "s/\.png/-large\.png/g" > gnuplot/plot-uk3-lp-large
	cd gnuplot; gnuplot plot-uk3; gnuplot plot-uk3-lp; gnuplot plot-uk3-large; gnuplot plot-uk3-lp-large
	cp graphs/covid-uk-all*.png ${DATEDIR}
	open graphs/covid-uk-all.png



increase_rates/uk:	country_data/uk
	python smoothrates.py

increase_rates/spain:	country_data/spain
	python smoothrates.py

increase_rates/france:	country_data/france
	python smoothrates.py

increase_rates/germany:	country_data/germany
	python smoothrates.py

increase_rates/italy:	country_data/italy
	python smoothrates.py

increase_rates/switzerland:	country_data/switzerland
	python smoothrates.py

increase_rates/vietnam-wiki:	wiki_data/vietnam-wiki
	python smoothrates.py

increase_rates/us:	country_data/us
	python smoothrates.py

# we don't really need these for all countries - just sentinel countries to avoid forgetting to run when we've updated each directory

aligned/country_data/us:	country_data/us
	python process-time.py

aligned/country_data/uk:	country_data/uk
	python process-time.py

aligned/country_data/italy:	country_data/italy
	python process-time.py

aligned/country_data/france:	country_data/france
	python process-time.py

aligned/wiki-data/slovenia-wiki:	wiki-data/slovenia-wiki
	python process-time.py

aligned/jhu-data/poland-jhu:	jhu-data/poland-jhu
	python process-time.py

# gnuplot plot-eu-norm
# gnuplot plot-rates
# gnuplot deaths-eu-norm
# gnuplot deaths-eu-norm2
# gnuplot deaths-us
# gnuplot plot-eu-norm-lom
# gnuplot plot-eu-norm2
# gnuplot plot-eu-norm2b
# gnuplot plot-eu-norm3
# gnuplot plot-eu-norm4
# gnuplot plot-eu-norm5
# gnuplot plot-eu-linear
# gnuplot plot-uk
# gnuplot plot-uk2
# gnuplot plot-uk3
# gnuplot plot-world
# gnuplot plot-world-norm
# gnuplot plot-us-norm
# gnuplot plot-world-norm2
# gnuplot plot-world-warm
# gnuplot plot-world-linear
# gnuplot plot-world-warm
# gnuplot plot-world-warm2
# gnuplot plot-world-linear
# cd ..
# cp graphs/*.png www/26mar2020/
