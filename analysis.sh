#!/bin/bash
# Script to analyse the corona epidemics

export COUNTRY1=germany
export COUNTRY2=italy
export COUNTRY3=korea
export COUNTRY4=spain
export COUNTRY5=uk
export COUNTRY6=us

export CONFIRMED="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
export DEATH="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
export RECOVERED="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"

function create_header {
	head -n 1 $CONFIRMED |tr "," "\n"|tail -n +5 
}

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
			csvtool col 1,145 <(csvtool transpose $CONFIRMED) |tail -n +6 
			;;
	esac
}

function create_recovered {
		csvtool col 239 <(csvtool transpose $DEATH) |tail -n +5 

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
			csvtool col 145 <(csvtool transpose $DEATH) |tail -n +6 
			;;
	esac
}

function create_all_col {
	paste -d "," <(create_confirmed "$1") <(create_recovered) <(create_deaths "$1")
}
# Create the data file:
#head -n 1 $CONFIRMED |tr "," "\n"|tail -n +5 >header.csv

#create_all_col germany >germany.csv

create_all_col germany 1 | awk -F, '{print $1,$2,$3,$4,83}'> germany.csv
create_all_col italy 1 | awk -F, '{print $1,$2,$3,$4,60}' > italy.csv
create_all_col france 1 | awk -F, '{print $1,$2,$3,$4,67}'> france.csv
create_all_col spain 1 | awk -F, '{print $1,$2,$3,$4,47}'> spain.csv
create_all_col korea 2 | awk -F, '{print $1,$2,$3,$4,77}'> korea.csv
create_all_col malaysia 1 | awk -F, '{print $1,$2,$3,$4,33}'> malaysia.csv
create_all_col iran 1 | awk -F, '{print $1,$2,$3,$4,83}'> iran.csv
create_all_col uk df 1 | awk -F, '{print $1,$2,$3,$4,67}'> uk.csv
create_all_col us 1 | awk -F, '{print $1,$2,$3,$4,328}'> us.csv

gnuplot -p <(sed -e "s/country1/$COUNTRY1/g" -e "s/country2/$COUNTRY2/g" -e "s/country3/$COUNTRY3/g" -e "s/country4/$COUNTRY4/g" -e "s/country5/$COUNTRY5/g" -e "s/country6/$COUNTRY6/g" plot.gpl) 2>gnuout.txt
##
convert -density 300 plot-1.eps -resize 640 plot-1.png
convert -density 300 plot-2.eps -resize 640 plot-2.png
convert -density 300 plot-3.eps -resize 640 plot-3.png
##
date_string=$(date)
cat <(tail -n 23 gnuout.txt) README-raw.md|m4  |sed "/*UPDATED:*/c\ *UPDATED: ${date_string}*"> README.md


