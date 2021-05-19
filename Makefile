plot.eps: plot.gpl owid-covid-data.csv 
	gnuplot plot.gpl
	zathura plot.eps

owid-covid-data.csv: ${HOME}/gpg.log	
	curl https://covid.ourworldindata.org/data/owid-covid-data.csv >owid-covid-data.csv
	## Download Tests
	echo "#" >testzahlen-gesamt.csv
	curl "https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Testzahlen-gesamt.xlsx?__blob=publicationFile" >data/testzahlen-gesamt.xlsx
	in2csv --sheet 1_Testzahlerfassung data/testzahlen-gesamt.xlsx >> data/testzahlen-gesamt.csv
	
	## Download Impfungen
	curl "https://www.rki.de/DE/Content/InfAZ/N/Neuartiges_Coronavirus/Daten/Impfquotenmonitoring.xlsx?__blob=publicationFile" > data/impfzahlen.xlsx
	in2csv --sheet Impfungen_proTag data/impfzahlen.xlsx  > data/impfzahlen.csv
	bash analysis.sh
