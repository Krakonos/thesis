all: thesis.pdf

# LaTeX must be run multiple times to get references right
thesis.pdf: thesis.tex $(wildcard *.tex) bibliography.bib $(wildcard img/*.pdf) $(wildcard graphs/*/*.pdf)
	make -C graphs/loc
	make -C graphs/firefox-objsize
	make -C graphs/firefox-ipa-kpta
	pdflatex $<
	bibtex thesis
	pdflatex $<
	pdflatex $<

clean:
	rm -f *.log *.dvi *.aux *.toc *.lof *.lot *.out *.bbl *.blg
	rm -f thesis.pdf
