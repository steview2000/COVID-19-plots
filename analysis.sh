#!/bin/bash
# Script to analyse the corona epidemics

export COUNTRY1=germany
export COUNTRY2=italy
export COUNTRY3=spain
export COUNTRY4=france
export COUNTRY5=sweden
export COUNTRY6=us

export CONFIRMED="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
export DEATH="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
export RECOVERED="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"

COL_Number=$(csvtool col 122 <(csvtool transpose $CONFIRMED) |tail -n +5 |wc -l)

function create_confirmed {
	case $1 in
		germany) 
			csvtool col 1,122 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
		italy) 
			csvtool col 1,139 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
		us) 
			csvtool col 1,227 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
		uk) 
			csvtool col 1,225 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
		spain) 
			csvtool col 1,203 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
		korea) 
			csvtool col 1,145 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
		sweden) 
			csvtool col 1,207 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
		france) 
			csvtool col 1,118 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
		malaysia) 
			csvtool col 1,155 <(csvtool transpose $CONFIRMED) |tail -n +5 
			;;
	esac
}

function create_recovered {
	case $1 in
		germany) 
			csvtool col 114 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
		italy) 
			csvtool col 133 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
		us) 
			csvtool col 227 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
		uk) 
			csvtool col 225 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
		spain) 
			csvtool col 201 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
		korea) 
			csvtool col 139 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
		sweden) 
			csvtool col 205 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
		france) 
			csvtool col 110 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
		malaysia) 
			csvtool col 150 <(csvtool transpose $RECOVERED) |tail -n +5 
			;;
	esac

}

function create_deaths {
	case $1 in
		germany) 
			csvtool col 122 <(csvtool transpose $DEATH) |tail -n +5 
			;;
		italy) 
			csvtool col 139 <(csvtool transpose $DEATH) |tail -n +5 
			;;
		us) 
			csvtool col 227 <(csvtool transpose $DEATH) |tail -n +5 
			;;
		uk) 
			csvtool col 225 <(csvtool transpose $DEATH) |tail -n +5 
			;;
		spain) 
			csvtool col 203 <(csvtool transpose $DEATH) |tail -n +5 
			;;
		korea) 
			csvtool col 145 <(csvtool transpose $DEATH) |tail -n +5 
			;;
		sweden) 
			csvtool col 207 <(csvtool transpose $DEATH) |tail -n +5 
			;;
		malaysia) 
			csvtool col 155 <(csvtool transpose $DEATH) |tail -n +5 
			;;
		france) 
			csvtool col 118 <(csvtool transpose $DEATH) |tail -n +5 
			;;
	esac
}

function create_all_col {
	paste -d "," <(create_confirmed "$1") <(create_recovered "$1") <(create_deaths "$1")
}
# Create the data file:

#create_recovered korea

create_all_col germany 1 | awk -F, '{print $1,$2,$3,$4,83}'> germany.csv
create_all_col italy 1 | awk -F, '{print $1,$2,$3,$4,60}' > italy.csv
create_all_col france 1 | awk -F, '{print $1,$2,$3,$4,67}'> france.csv
create_all_col spain 1 | awk -F, '{print $1,$2,$3,$4,47}'> spain.csv
create_all_col korea 2 | awk -F, '{print $1,$2,$3,$4,77}'> korea.csv
create_all_col malaysia 1 | awk -F, '{print $1,$2,$3,$4,33}'> malaysia.csv
create_all_col iran 1 | awk -F, '{print $1,$2,$3,$4,83}'> iran.csv
create_all_col uk df 1 | awk -F, '{print $1,$2,$3,$4,67}'> uk.csv
create_all_col us 1 | awk -F, '{print $1,$2,$3,$4,328}'> us.csv
create_all_col sweden 1 | awk -F, '{print $1,$2,$3,$4,10}'> sweden.csv

gnuplot -p <(sed -e "s/country1/$COUNTRY1/g" -e "s/country2/$COUNTRY2/g" -e "s/country3/$COUNTRY3/g" -e "s/country4/$COUNTRY4/g" -e "s/country5/$COUNTRY5/g" -e "s/country6/$COUNTRY6/g" plot.gpl) 2>gnuout.txt
##
convert -density 300 poly-exp-fit.eps -resize 640 poly-exp-fit.png &
convert -density 300 curr-sick.eps -resize 640 curr-sick.png &
convert -density 300 logistic-curve.eps -resize 640 logistic-curve.png &
convert -density 300 logistic-linear.eps -resize 640 logistic-linear.png
##
date_string=$(date)
cat <(tail -n 23 gnuout.txt) README-raw.md|m4  |sed "/*UPDATED:*/c\ *UPDATED: ${date_string}*"> README.md


