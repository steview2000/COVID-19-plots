import numpy as np
import PyGnuplot as gp
import csv
import pandas as pd

DataFile="/home/stevie/COVID-19/csse_covid_19_data/csse_covid_19_time_series/time_series_19-covid-Confirmed.csv"

M = pd.read_csv(DataFile,sep=',',quotechar='"')

germany = np.genfromtxt('germany.csv')
italy   = np.genfromtxt('italy.csv')
france  = np.genfromtxt('france.csv')
spain   = np.genfromtxt('spain.csv')

N=np.size(germany)
days = np.arange(N)

rate_germany = (germany[:-1]>50)*(germany[1:]-germany[0:-1])/germany[0:-1]
rate_italy   = (italy[:-1]>50)*(italy[1:]-italy[0:-1])/italy[0:-1]
rate_france  = (france[:-1]>50)*(france[1:]-france[0:-1])/france[0:-1]
rate_spain   = (spain[:-1]>50)*(spain[1:]-spain[0:-1])/spain[0:-1]

gp.figure(1)
gp.c("set key t l")
gp.c("set logscale y")
gp.c("set title \"accumulated cases\"")
gp.plot([days,germany],"title \"germany\" w p ls 1",\
	    [days,italy],"title \"italy\" w p ls 2",\
	    [days,france],"title \"france\" w p ls 3",\
	    [days,spain],"title \"spain\" w p ls 4",\
)

gp.figure(2)
gp.c("set key t l")
gp.c("unset logscale y")
gp.c("set title \"accumulated cases\"")
gp.plot([days[1:],rate_germany],"title \"germany\" w p ls 1",\
	    [days[1:],rate_italy],"title \"italy\" w p ls 2",\
	    [days[1:],rate_france],"title \"france\" w p ls 3",\
	    [days[1:],rate_spain],"title \"spain\" w p ls 4",\
)

