#!/bin/bash

CONFIRMED="/home/sweiss/COVID/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"

csvtool transpose $CONFIRMED >trans.csv

csvtool transpose <(grep "US" $CONFIRMED ) >US_trans.csv

grep Germany $CONFIRMED |tr "," "\n" |tail -n +4>germany.csv
grep Italy $CONFIRMED |tr "," "\n" |tail -n +5 >italy.csv
