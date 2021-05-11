#!/bin/bash
# Script to analyse the corona epidemics

CURRENT_PATH=$(pwd)

echo "First get the data ...."
cd $HOME/COVID-19
git pull
cd $CURRENT_PATH

export COUNTRY1=germany
export COUNTRY2=italy
export COUNTRY3=spain
export COUNTRY4=france
export COUNTRY5=sweden
export COUNTRY6=us

export CONFIRMED="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
export DEATH="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_deaths_global.csv"
export RECOVERED="$HOME/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_recovered_global.csv"

#COL_Number=$(csvtool col 122 <(csvtool transpose $CONFIRMED) |tail -n +5 |wc -l)
get_dates(){
	head -n 1 $CONFIRMED|tr "," "\n"|tail -n +5
}

create_confirmed(){
	grep -i $1 $CONFIRMED |tr "," "\n" |tail -n +5 
}

create_recovered() {
	grep -i $1 $RECOVERED |tr "," "\n" |tail -n +5 
}

create_deaths(){
	grep -i $1 $DEATH |tr "," "\n" |tail -n +5 
}

create_all_col() {
	paste -d "," <(get_dates) <(create_confirmed "$1") <(create_recovered "$1") <(create_deaths "$1")
}
# Create the data file:

#create_recovered korea

create_all_col germany 1  | awk -F, '{print $1,$2,$3,$4,83}'  > data/germany.csv
create_all_col italy 1    | awk -F, '{print $1,$2,$3,$4,60}'  > data/italy.csv
create_all_col france 1   | awk -F, '{print $1,$2,$3,$4,67}'  > data/france.csv
create_all_col spain 1    | awk -F, '{print $1,$2,$3,$4,47}'  > data/spain.csv
create_all_col korea 2    | awk -F, '{print $1,$2,$3,$4,77}'  > data/korea.csv
create_all_col malaysia 1 | awk -F, '{print $1,$2,$3,$4,33}'  > data/malaysia.csv
create_all_col iran 1     | awk -F, '{print $1,$2,$3,$4,83}'  > data/iran.csv
create_all_col uk 1       | awk -F, '{print $1,$2,$3,$4,67}'  > data/uk.csv
create_all_col us 1       | awk -F, '{print $1,$2,$3,$4,328}' > data/us.csv
create_all_col sweden 1   | awk -F, '{print $1,$2,$3,$4,10}'  > data/sweden.csv
create_all_col israel 1   | awk -F, '{print $1,$2,$3,$4,9.3}'  > data/israel.csv

## Download Tests
echo "#" >Testzahlen-gesamt.csv
curl "https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Testzahlen-gesamt.xlsx?__blob=publicationFile" >data/testzahlen-gesamt.xlsx
in2csv --sheet 1_Testzahlerfassung data/Testzahlen-gesamt.xlsx > data/testzahlen-gesamt.csv

## Download Impfungen
curl "https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Impfquotenmonitoring.xlsx?__blob=publicationFile" > data/impfzahlen.xlsx
in2csv --sheet Impfungen_proTag data/impfzahlen.xlsx  > data/impfzahlen.csv

#gnuplot -p plot.gpl
gnuplot plot.gpl 2>gnuout.txt
##
convert -density 300 plot.eps -resize 640 plot.png &
zathura plot.eps
