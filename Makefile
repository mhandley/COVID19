all: graphs/covid-eu.png graphs/covid-eu-norm.png graphs/rates.png graphs/rates-eeu.png graphs/rates-nordic.png graphs/deaths-eu-norm.png graphs/deaths-eu-norm2.png graphs/deaths-us.png graphs/covid-eu-lom.png graphs/covid-eu-norm2.png graphs/covid-eu-norm2b.png graphs/covid-eu-norm3.png graphs/covid-eu-norm4.png graphs/covid-eu-norm5.png graphs/covid-eu-linear.png graphs/covid-uk.png graphs/covid-uk-all.png graphs/covid-uk-linear.png graphs/covid-world.png graphs/covid-world-norm.png graphs/covid-us-norm.png graphs/covid-world-norm2.png graphs/covid-world-norm3.png graphs/covid-world-sa2.png graphs/covid-world-seasia.png graphs/covid-world-warm.png graphs/covid-world-warm2.png graphs/covid-world-linear.png

DATEDIR = www/28mar2020/
DATE=28
OFFSET=42
graphs/covid-eu.png: templates/t-plot-eu
	cat populations templates/t-plot-eu | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu
	cd gnuplot; gnuplot plot-eu
	cp graphs/covid-eu.png ${DATEDIR}
	open graphs/covid-eu.png

graphs/covid-eu-norm.png: templates/t-plot-eu-norm
	cat populations templates/t-plot-eu-norm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu-norm
	cd gnuplot; gnuplot plot-eu-norm
	cp graphs/covid-eu-norm.png ${DATEDIR}
	open graphs/covid-eu-norm.png

graphs/covid-eu-norm2.png: templates/t-plot-eu-norm2
	cat populations templates/t-plot-eu-norm2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu-norm2
	cd gnuplot; gnuplot plot-eu-norm2
	cp graphs/covid-eu-norm2.png ${DATEDIR}
	open graphs/covid-eu-norm2.png

graphs/covid-eu-norm2b.png: templates/t-plot-eu-norm2b
	cat populations templates/t-plot-eu-norm2b | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu-norm2b
	cd gnuplot; gnuplot plot-eu-norm2b
	cp graphs/covid-eu-norm2b.png ${DATEDIR}
	open graphs/covid-eu-norm2b.png

graphs/covid-eu-norm3.png: templates/t-plot-eu-norm3
	cat populations templates/t-plot-eu-norm3 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu-norm3
	cd gnuplot; gnuplot plot-eu-norm3
	cp graphs/covid-eu-norm3.png ${DATEDIR}
	open graphs/covid-eu-norm3.png

graphs/covid-eu-norm4.png: templates/t-plot-eu-norm4
	cat populations templates/t-plot-eu-norm4 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu-norm4
	cd gnuplot; gnuplot plot-eu-norm4
	cp graphs/covid-eu-norm4.png ${DATEDIR}
	open graphs/covid-eu-norm4.png

graphs/covid-eu-norm5.png: templates/t-plot-eu-norm5
	cat populations templates/t-plot-eu-norm5 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu-norm5
	cd gnuplot; gnuplot plot-eu-norm5
	cp graphs/covid-eu-norm5.png ${DATEDIR}
	open graphs/covid-eu-norm5.png

graphs/covid-eu-linear.png: templates/t-plot-eu-linear
	cat populations templates/t-plot-eu-linear | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu-linear
	cd gnuplot; gnuplot plot-eu-linear
	cp graphs/covid-eu-linear.png ${DATEDIR}
	open graphs/covid-eu-linear.png

graphs/covid-uk.png: templates/t-plot-uk
	cat populations templates/t-plot-uk | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-uk
	cd gnuplot; gnuplot plot-uk
	cp graphs/covid-uk.png ${DATEDIR}
	open graphs/covid-uk.png

graphs/covid-uk-linear.png: templates/t-plot-uk2
	cat populations templates/t-plot-uk2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-uk2
	cd gnuplot; gnuplot plot-uk2
	cp graphs/covid-uk-linear.png ${DATEDIR}
	open graphs/covid-uk-linear.png

graphs/covid-uk-all.png: templates/t-plot-uk3
	cat populations templates/t-plot-uk3 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-uk3
	cd gnuplot; gnuplot plot-uk3
	cp graphs/covid-uk-all.png ${DATEDIR}
	open graphs/covid-uk-all.png

graphs/covid-eu-lom.png: templates/t-plot-eu-lom
	cat populations templates/t-plot-eu-lom | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-eu-lom
	cd gnuplot; gnuplot plot-eu-lom
	cp graphs/covid-eu-lom.png ${DATEDIR}
	open graphs/covid-eu-lom.png

graphs/deaths-eu-norm.png: templates/t-deaths-eu-norm
	cat populations templates/t-deaths-eu-norm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/deaths-eu-norm
	cd gnuplot; gnuplot deaths-eu-norm
	cp graphs/deaths-eu-norm.png ${DATEDIR}
	open graphs/deaths-eu-norm.png

graphs/deaths-eu-norm2.png: templates/t-deaths-eu-norm2
	cat populations templates/t-deaths-eu-norm2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/deaths-eu-norm2
	cd gnuplot; gnuplot deaths-eu-norm2
	cp graphs/deaths-eu-norm2.png ${DATEDIR}
	open graphs/deaths-eu-norm2.png


graphs/rates.png:	templates/t-plot-rates
	cat populations templates/t-plot-rates | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-rates
	cd gnuplot; gnuplot plot-rates
	cp graphs/rates.png ${DATEDIR}
	open graphs/rates.png

graphs/rates-eeu.png:	templates/t-plot-rates-eeu country_data/bulgaria  country_data/hungary country_data/slovakia  country_data/poland  country_data/romania  jhu-data/serbia-wiki  country_data/czechrepublic  country_data/greece
	cat populations templates/t-plot-rates-eeu | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-rates-eeu
	cd gnuplot; gnuplot plot-rates-eeu
	cp graphs/rates-eeu.png ${DATEDIR}
	open graphs/rates-eeu.png

graphs/rates-nordic.png:	templates/t-plot-rates-nordic
	cat populations templates/t-plot-rates-nordic | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-rates-nordic
	cd gnuplot; gnuplot plot-rates-nordic
	cp graphs/rates-nordic.png ${DATEDIR}
	open graphs/rates-nordic.png

graphs/covid-world.png: templates/t-plot-world
	cat populations templates/t-plot-world | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world
	cd gnuplot; gnuplot plot-world
	cp graphs/covid-world.png ${DATEDIR}
	open graphs/covid-world.png

graphs/covid-world-norm.png: templates/t-plot-world-norm
	cat populations templates/t-plot-world-norm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world-norm
	cd gnuplot; gnuplot plot-world-norm
	cp graphs/covid-world-norm.png ${DATEDIR}
	open graphs/covid-world-norm.png

graphs/covid-world-norm2.png: templates/t-plot-world-norm2 
	cat populations templates/t-plot-world-norm2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world-norm2
	cd gnuplot; gnuplot plot-world-norm2
	cp graphs/covid-world-norm2.png ${DATEDIR}
	open graphs/covid-world-norm2.png

graphs/covid-world-norm3.png: templates/t-plot-world-norm3 
	cat populations templates/t-plot-world-norm3 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world-norm3
	cd gnuplot; gnuplot plot-world-norm3
	cp graphs/covid-world-norm3.png ${DATEDIR}
	open graphs/covid-world-norm3.png

graphs/covid-us-norm.png: templates/t-plot-us-norm
	cat populations templates/t-plot-us-norm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-us-norm
	cd gnuplot; gnuplot plot-us-norm
	cp graphs/covid-us-norm.png ${DATEDIR}
	open graphs/covid-us-norm.png

graphs/deaths-us.png: templates/t-deaths-us
	cat populations templates/t-deaths-us | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/deaths-us
	cd gnuplot; gnuplot deaths-us
	cp graphs/deaths-us.png ${DATEDIR}
	open graphs/deaths-us.png

graphs/covid-world-sa2.png: templates/t-plot-world-sa2
	cat populations templates/t-plot-world-sa2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world-sa2
	cd gnuplot; gnuplot plot-world-sa2
	cp graphs/covid-world-sa2.png ${DATEDIR}
	open graphs/covid-world-sa2.png

graphs/covid-world-seasia.png: templates/t-plot-world-seasia
	cat populations templates/t-plot-world-seasia | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world-seasia
	cd gnuplot; gnuplot plot-world-seasia
	cp graphs/covid-world-seasia.png ${DATEDIR}
	open graphs/covid-world-seasia.png

graphs/covid-world-warm.png: templates/t-plot-world-warm
	cat populations templates/t-plot-world-warm | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world-warm
	cd gnuplot; gnuplot plot-world-warm
	cp graphs/covid-world-warm.png ${DATEDIR}
	open graphs/covid-world-warm.png

graphs/covid-world-warm2.png: templates/t-plot-world-warm2
	cat populations templates/t-plot-world-warm2 | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world-warm2
	cd gnuplot; gnuplot plot-world-warm2
	cp graphs/covid-world-warm2.png ${DATEDIR}
	open graphs/covid-world-warm2.png

graphs/covid-world-linear.png: templates/t-plot-world-linear
	cat populations templates/t-plot-world-linear | sed -e "s/DATE/${DATE}/g" | sed -e "s/OFFSET/${OFFSET}/g" > gnuplot/plot-world-linear
	cd gnuplot; gnuplot plot-world-linear
	cp graphs/covid-world-linear.png ${DATEDIR}
	open graphs/covid-world-linear.png

# gnuplot plot-eu-norm
# gnuplot plot-rates
# gnuplot deaths-eu-norm
# gnuplot deaths-eu-norm2
# gnuplot deaths-us
# gnuplot plot-eu-lom
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
