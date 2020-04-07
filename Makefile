all: graphs/covid-eu.png graphs/covid-eu-norm.png graphs/rates.png graphs/rates-eeu.png graphs/rates-nordic.png graphs/deaths-eu-norm.png graphs/deaths-eu-norm2.png graphs/deaths-us.png graphs/covid-eu-norm-lom.png graphs/covid-eu-norm2.png graphs/covid-eu-norm2b.png graphs/covid-eu-norm3.png graphs/covid-eu-norm4.png graphs/covid-eu-norm5.png graphs/covid-eu-linear.png graphs/covid-uk.png graphs/covid-uk-all.png graphs/covid-uk-linear.png graphs/covid-world.png graphs/covid-world-norm.png graphs/covid-us-norm.png graphs/covid-world-norm2.png graphs/covid-world-norm3.png graphs/covid-world-sa2.png graphs/covid-world-sa3.png graphs/covid-world-seasia.png graphs/covid-world-warm.png graphs/covid-world-warm2.png graphs/covid-world-linear.png graphs/covid-world-ca.png graphs/rates-seasia.png graphs/rates-asia.png graphs/rates-peaked.png graphs/rates-level.png

DATEDIR = www/6apr2020/
DATE=6
OFFSET=51
graphs/covid-eu.png: templates/t-plot-eu increase_rates/uk increase_rates/italy increase_rates/france increase_rates/spain increase_rates/germany
	cat populations templates/t-plot-eu | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu
	python set_ymax.py gnuplot/plot-eu
	cat gnuplot/plot-eu | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-lp
	cd gnuplot; gnuplot plot-eu; gnuplot plot-eu-lp
	cp graphs/covid-eu.png graphs/covid-eu-lp.png ${DATEDIR}
	open graphs/covid-eu.png

graphs/covid-eu-norm.png: templates/t-plot-eu-norm increase_rates/uk
	cat populations templates/t-plot-eu-norm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu-norm
	python set_ymax.py gnuplot/plot-eu-norm
	cat gnuplot/plot-eu-norm | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-norm-lp
	cd gnuplot; gnuplot plot-eu-norm; gnuplot plot-eu-norm-lp
	cp graphs/covid-eu-norm*.png ${DATEDIR}
	open graphs/covid-eu-norm.png

graphs/covid-eu-norm2.png: templates/t-plot-eu-norm2
	cat populations templates/t-plot-eu-norm2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu-norm2
	python set_ymax.py gnuplot/plot-eu-norm2
	cat gnuplot/plot-eu-norm2 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-norm2-lp
	cd gnuplot; gnuplot plot-eu-norm2; gnuplot plot-eu-norm2-lp
	cp graphs/covid-eu-norm2*.png ${DATEDIR}
	open graphs/covid-eu-norm2.png

graphs/covid-eu-norm2b.png: templates/t-plot-eu-norm2b
	cat populations templates/t-plot-eu-norm2b | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu-norm2b
	python set_ymax.py gnuplot/plot-eu-norm2b
	cat gnuplot/plot-eu-norm2b | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-norm2b-lp
	cd gnuplot; gnuplot plot-eu-norm2b; gnuplot plot-eu-norm2b-lp
	cp graphs/covid-eu-norm2b*.png ${DATEDIR}
	open graphs/covid-eu-norm2b.png

graphs/covid-eu-norm3.png: templates/t-plot-eu-norm3
	cat populations templates/t-plot-eu-norm3 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu-norm3
	python set_ymax.py gnuplot/plot-eu-norm3
	cat gnuplot/plot-eu-norm3 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-norm3-lp
	cd gnuplot; gnuplot plot-eu-norm3; gnuplot plot-eu-norm3-lp
	cp graphs/covid-eu-norm3*.png ${DATEDIR}
	open graphs/covid-eu-norm3.png

graphs/covid-eu-norm4.png: templates/t-plot-eu-norm4
	cat populations templates/t-plot-eu-norm4 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu-norm4
	python set_ymax.py gnuplot/plot-eu-norm4
	cat gnuplot/plot-eu-norm4 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-norm4-lp
	cd gnuplot; gnuplot plot-eu-norm4; gnuplot plot-eu-norm4-lp
	cp graphs/covid-eu-norm4*.png ${DATEDIR}
	open graphs/covid-eu-norm4.png

graphs/covid-eu-norm5.png: templates/t-plot-eu-norm5
	cat populations templates/t-plot-eu-norm5 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu-norm5
	python set_ymax.py gnuplot/plot-eu-norm5
	cat gnuplot/plot-eu-norm5 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-norm5-lp
	cd gnuplot; gnuplot plot-eu-norm5; gnuplot plot-eu-norm5-lp
	cp graphs/covid-eu-norm5*.png ${DATEDIR}
	open graphs/covid-eu-norm5.png

graphs/covid-eu-linear.png: templates/t-plot-eu-linear
	cat populations templates/t-plot-eu-linear | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu-linear
	python set_ymax.py gnuplot/plot-eu-linear 1.1
	cat gnuplot/plot-eu-linear | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-linear-lp
	cd gnuplot; gnuplot plot-eu-linear; gnuplot plot-eu-linear-lp
	cp graphs/covid-eu-linear*.png ${DATEDIR}
	open graphs/covid-eu-linear.png

graphs/covid-uk.png: templates/plot-uk increase_rates/uk
	cat populations templates/plot-uk | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-uk
	cat gnuplot/plot-uk | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-uk-lp
	cd gnuplot; gnuplot plot-uk; gnuplot plot-uk-lp
	cp graphs/covid-uk*.png ${DATEDIR}
	open graphs/covid-uk.png

graphs/covid-uk-linear.png: templates/t-plot-uk2
	cat populations templates/t-plot-uk2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-uk2
	cat gnuplot/plot-uk2 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-uk2-lp
	cd gnuplot; gnuplot plot-uk2; gnuplot plot-uk2-lp
	cp graphs/covid-uk-linear*.png ${DATEDIR}
	open graphs/covid-uk-linear.png

graphs/covid-uk-all.png: templates/t-plot-uk3
	cat populations templates/t-plot-uk3 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-uk3
	cat gnuplot/plot-uk3 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-uk3-lp
	cd gnuplot; gnuplot plot-uk3; gnuplot plot-uk3-lp
	cp graphs/covid-uk-all*.png ${DATEDIR}
	open graphs/covid-uk-all.png

graphs/covid-eu-norm-lom.png: templates/t-plot-eu-norm-lom
	cat populations templates/t-plot-eu-norm-lom | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-eu-norm-lom
	python set_ymax.py gnuplot/plot-eu-norm-lom
	cat gnuplot/plot-eu-norm-lom | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-eu-norm-lom-lp
	cd gnuplot; gnuplot plot-eu-norm-lom; gnuplot plot-eu-norm-lom-lp
	cp graphs/covid-eu-norm-lom*.png ${DATEDIR}
	open graphs/covid-eu-norm-lom.png

graphs/deaths-eu-norm.png: templates/t-deaths-eu-norm
	cat populations templates/t-deaths-eu-norm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/deaths-eu-norm
	python set_ymax.py gnuplot/deaths-eu-norm
	cat gnuplot/deaths-eu-norm | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/deaths-eu-norm-lp
	cd gnuplot; gnuplot deaths-eu-norm; gnuplot deaths-eu-norm-lp
	cp graphs/deaths-eu-norm*.png ${DATEDIR}
	open graphs/deaths-eu-norm.png

graphs/deaths-eu-norm2.png: templates/t-deaths-eu-norm2
	cat populations templates/t-deaths-eu-norm2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/deaths-eu-norm2
	python set_ymax.py gnuplot/deaths-eu-norm2
	cat gnuplot/deaths-eu-norm2 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/deaths-eu-norm2-lp
	cd gnuplot; gnuplot deaths-eu-norm2; gnuplot deaths-eu-norm2-lp
	cp graphs/deaths-eu-norm2*.png ${DATEDIR}
	open graphs/deaths-eu-norm2.png


graphs/rates.png:	templates/plot-rates increase_rates/us increase_rates/uk  increase_rates/france  increase_rates/germany  increase_rates/spain  increase_rates/netherlands increase_rates/uk increase_rates/us
	cat populations templates/plot-rates | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-rates
	cat gnuplot/plot-rates | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-rates-lp
	cd gnuplot; gnuplot plot-rates; gnuplot plot-rates-lp
	cp graphs/rates*.png ${DATEDIR}
	open graphs/rates.png

graphs/rates-eeu.png:	templates/plot-rates-eeu increase_rates/bulgaria  increase_rates/hungary increase_rates/slovakia  increase_rates/poland  increase_rates/romania  wiki-data/serbia-wiki  increase_rates/czechrepublic  increase_rates/greece
	cat populations templates/plot-rates-eeu | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-rates-eeu
	cat gnuplot/plot-rates-eeu | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-rates-eeu-lp
	cd gnuplot; gnuplot plot-rates-eeu; gnuplot plot-rates-eeu-lp
	cp graphs/rates-eeu*.png ${DATEDIR}
	open graphs/rates-eeu.png

graphs/rates-nordic.png:	templates/plot-rates-nordic
	cat populations templates/plot-rates-nordic | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-rates-nordic
	cat gnuplot/plot-rates-nordic | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-rates-nordic-lp
	cd gnuplot; gnuplot plot-rates-nordic; gnuplot plot-rates-nordic-lp
	cp graphs/rates-nordic*.png ${DATEDIR}
	open graphs/rates-nordic.png

graphs/rates-peaked.png:	templates/plot-rates-peaked
	cat populations templates/plot-rates-peaked | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-rates-peaked
	cat gnuplot/plot-rates-peaked | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-rates-peaked-lp
	cd gnuplot; gnuplot plot-rates-peaked; gnuplot plot-rates-peaked-lp
	cp graphs/rates-peaked*.png ${DATEDIR}
	open graphs/rates-peaked.png

graphs/rates-level.png:	templates/plot-rates-level
	cat populations templates/plot-rates-level | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-rates-level
	cat gnuplot/plot-rates-level | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-rates-level-lp
	cd gnuplot; gnuplot plot-rates-level; gnuplot plot-rates-level-lp
	cp graphs/rates-level*.png ${DATEDIR}
	open graphs/rates-level.png

graphs/rates-seasia.png:	templates/plot-rates-seasia
	cat populations templates/plot-rates-seasia | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-rates-seasia
	cat gnuplot/plot-rates-seasia | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-rates-seasia-lp
	cd gnuplot; gnuplot plot-rates-seasia; gnuplot plot-rates-seasia-lp
	cp graphs/rates-seasia*.png ${DATEDIR}
	open graphs/rates-seasia.png

graphs/rates-asia.png:	templates/plot-rates-asia
	cat populations templates/plot-rates-asia | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-rates-asia
	cat gnuplot/plot-rates-asia | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-rates-asia-lp
	cd gnuplot; gnuplot plot-rates-asia; gnuplot plot-rates-asia-lp
	cp graphs/rates-asia*.png ${DATEDIR}
	open graphs/rates-asia.png

graphs/covid-world.png: templates/t-plot-world country_data/us
	cat populations templates/t-plot-world | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world
	python set_ymax.py gnuplot/plot-world
	cat gnuplot/plot-world | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-lp
	cd gnuplot; gnuplot plot-world; gnuplot plot-world-lp
	cp graphs/covid-world*.png ${DATEDIR}
	open graphs/covid-world.png

graphs/covid-world-norm.png: templates/t-plot-world-norm country_data/us
	cat populations templates/t-plot-world-norm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-norm
	python set_ymax.py gnuplot/plot-world-norm
	cat gnuplot/plot-world-norm | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-norm-lp
	cd gnuplot; gnuplot plot-world-norm; gnuplot plot-world-norm-lp
	cp graphs/covid-world-norm*.png ${DATEDIR}
	open graphs/covid-world-norm.png

graphs/covid-world-norm2.png: templates/t-plot-world-norm2  country_data/us
	cat populations templates/t-plot-world-norm2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-norm2
	python set_ymax.py gnuplot/plot-world-norm2
	cat gnuplot/plot-world-norm2 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-norm2-lp
	cd gnuplot; gnuplot plot-world-norm2; gnuplot plot-world-norm2-lp
	cp graphs/covid-world-norm2*.png ${DATEDIR}
	open graphs/covid-world-norm2.png

graphs/covid-world-norm3.png: templates/t-plot-world-norm3 
	cat populations templates/t-plot-world-norm3 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-norm3
	python set_ymax.py gnuplot/plot-world-norm3
	cat gnuplot/plot-world-norm3 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-norm3-lp
	cd gnuplot; gnuplot plot-world-norm3; gnuplot plot-world-norm3-lp
	cp graphs/covid-world-norm3*.png ${DATEDIR}
	open graphs/covid-world-norm3.png

graphs/covid-us-norm.png: templates/plot-us-norm
	cat populations templates/plot-us-norm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-us-norm
	python set_ymax.py gnuplot/plot-us-norm
	cat gnuplot/plot-us-norm | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-us-norm-lp
	cd gnuplot; gnuplot plot-us-norm; gnuplot plot-us-norm-lp
	cp graphs/covid-us-norm*.png ${DATEDIR}
	open graphs/covid-us-norm.png

graphs/deaths-us.png: templates/t-deaths-us country_data/us
	cat populations templates/t-deaths-us | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/deaths-us
	python set_ymax.py gnuplot/deaths-us
	cat gnuplot/deaths-us | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/deaths-us-lp
	cd gnuplot; gnuplot deaths-us; gnuplot deaths-us-lp
	cp graphs/deaths-us*.png ${DATEDIR}
	open graphs/deaths-us.png

graphs/covid-world-sa2.png: templates/t-plot-world-sa2
	cat populations templates/t-plot-world-sa2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-sa2
	python set_ymax.py gnuplot/plot-world-sa2
	cat gnuplot/plot-world-sa2 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-sa2-lp
	cd gnuplot; gnuplot plot-world-sa2; gnuplot plot-world-sa2-lp
	cp graphs/covid-world-sa2*.png ${DATEDIR}
	open graphs/covid-world-sa2.png

graphs/covid-world-sa3.png: templates/t-plot-world-sa3
	cat populations templates/t-plot-world-sa3 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-sa3
	python set_ymax.py gnuplot/plot-world-sa3
	cat gnuplot/plot-world-sa3 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-sa3-lp
	cd gnuplot; gnuplot plot-world-sa3; gnuplot plot-world-sa3-lp
	cp graphs/covid-world-sa3*.png ${DATEDIR}
	open graphs/covid-world-sa3.png

graphs/covid-world-ca.png: templates/t-plot-world-ca
	cat populations templates/t-plot-world-ca | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-ca
	python set_ymax.py gnuplot/plot-world-ca
	cat gnuplot/plot-world-ca | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-ca-lp
	cd gnuplot; gnuplot plot-world-ca; gnuplot plot-world-ca-lp
	cp graphs/covid-world-ca*.png ${DATEDIR}
	open graphs/covid-world-ca.png

graphs/covid-world-seasia.png: templates/t-plot-world-seasia
	cat populations templates/t-plot-world-seasia | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-seasia
	python set_ymax.py gnuplot/plot-world-seasia
	cat gnuplot/plot-world-seasia | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-seasia-lp
	cd gnuplot; gnuplot plot-world-seasia; gnuplot plot-world-seasia-lp
	cp graphs/covid-world-seasia*.png ${DATEDIR}
	open graphs/covid-world-seasia.png

graphs/covid-world-warm.png: templates/t-plot-world-warm country_data/us
	cat populations templates/t-plot-world-warm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-warm
	python set_ymax.py gnuplot/plot-world-warm
	cat gnuplot/plot-world-warm | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-warm-lp
	cd gnuplot; gnuplot plot-world-warm; gnuplot plot-world-warm-lp
	cp graphs/covid-world-warm*.png ${DATEDIR}
	open graphs/covid-world-warm.png

graphs/covid-world-warm2.png: templates/t-plot-world-warm2
	cat populations templates/t-plot-world-warm2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-warm2
	python set_ymax.py gnuplot/plot-world-warm2
	cat gnuplot/plot-world-warm2 | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-warm2-lp
	cd gnuplot; gnuplot plot-world-warm2; gnuplot plot-world-warm2-lp
	cp graphs/covid-world-warm2*.png ${DATEDIR}
	open graphs/covid-world-warm2.png

graphs/covid-world-linear.png: templates/plot-world-linear country_data/us
	cat populations templates/plot-world-linear | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" | sed -e "s/March/April/g"  > gnuplot/plot-world-linear
	python set_ymax.py gnuplot/plot-world-linear 1.1
	cat gnuplot/plot-world-linear | sed -e "s/ w l / w lp /g" | sed -e "s/\.png/-lp\.png/g"> gnuplot/plot-world-linear-lp
	cd gnuplot; gnuplot plot-world-linear; gnuplot plot-world-linear-lp
	cp graphs/covid-world-linear*.png ${DATEDIR}
	open graphs/covid-world-linear.png

increase_rates/uk:	country_data/uk
	python smoothdata.py

increase_rates/spain:	country_data/spain
	python smoothdata.py

increase_rates/france:	country_data/france
	python smoothdata.py

increase_rates/germany:	country_data/germany
	python smoothdata.py

increase_rates/italy:	country_data/italy
	python smoothdata.py

increase_rates/switzerland:	country_data/switzerland
	python smoothdata.py

increase_rates/vietnam-wiki:	wiki_data/vietnam-wiki
	python smoothdata.py

increase_rates/us:	country_data/us
	python smoothdata.py

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
