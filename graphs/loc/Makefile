all:
	./json2csv.pl < chrome.json > chrome.csv
	./json2csv.pl < firefox.json > firefox.csv
	./json2csv.pl < gcc.json > gcc.csv
	gnuplot plot.gp
	pdflatex loc.tex

