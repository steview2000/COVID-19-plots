#!/bin/bash
# This is to analyse the corona epidemics

export COUNTRY1=germany
export COUNTRY2=italy
export COUNTRY3=uk
export COUNTRY4=malaysia
export COUNTRY5=spain
export COUNTRY6=korea

export CONFIRMED="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"
export DEATH="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Deaths.csv"
export RECOVERED="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Recovered.csv"

function create_header {
	head -n 1 $CONFIRMED |tr "," "\n"|tail -n +5 
}

function create_confirmed {
	grep "$1" $CONFIRMED | tr "," "\n" | tail -n +5 
}

function create_recovered {
	grep "$1" $RECOVERED | tr "," "\n" | tail -n +5 
}

function create_deaths {
	grep "$1" $DEATH | tr "," "\n" | tail -n +5 
}

function create_all_col {
	paste <(create_header) <(create_confirmed "$1"|tail -n +$2 ) <(create_recovered "$1"|tail -n +$2 ) <(create_deaths "$1"|tail -n +$2 )| tr "\r" " "
}
# Create the data file:
#head -n 1 $CONFIRMED |tr "," "\n"|tail -n +5 >header.csv

create_all_col Germany 1 | awk '{print $1,$2,$3,$4,83}'> germany.csv
create_all_col Italy 1 | awk '{print $1,$2,$3,$4,60}' > italy.csv
create_all_col "France,France" 1 | awk '{print $1,$2,$3,$4,67}'> france.csv
create_all_col Spain 1 | awk '{print $1,$2,$3,$4,47}'> spain.csv
create_all_col Korea 2 | awk '{print $1,$2,$3,$4,77}'> korea.csv
create_all_col Malaysia 1 | awk '{print $1,$2,$3,$4,33}'> malaysia.csv
create_all_col Iran 1 | awk '{print $1,$2,$3,$4,83}'> iran.csv
create_all_col "United Kingdom,United Kingdom" 1 | awk '{print $1,$2,$3,$4,67}'> uk.csv

# special treatment for the US
csvtool transpose <(grep "US" $CONFIRMED ) |tail -n +5 |tr "," "+"|bc >us.csv
csvtool transpose <(grep "China" $CONFIRMED ) |tail -n +5 |tr "," "+"|bc >china.csv

gnuplot -p <(sed -e "s/country1/$COUNTRY1/g" -e "s/country2/$COUNTRY2/g" -e "s/country3/$COUNTRY3/g" -e "s/country4/$COUNTRY4/g" -e "s/country5/$COUNTRY5/g" -e "s/country6/$COUNTRY6/g" plot.gpl)

convert -density 300 plot.eps plot.png

