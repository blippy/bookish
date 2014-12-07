BASE = hackinvest

DVI = $(BASE).dvi
LTX = $(BASE).ltx
PDF = $(BASE).pdf

.PHONY : all clean install

all : $(DVI) $(PDF)



clean :
	rm -f *~ *.aux *.eps *.glo *.glg *.gls 
	rm -f *.idx *.ilg *.ind *.ist *.log *.lot *.toc
	rm -f *.dvi *.pdf

$(DVI) : $(LTX)
	latex $(LTX)
	makeindex hackinvest.idx
	makeglossaries hackinvest
	latex $(LTX)

$(PDF) : $(DVI)
	dvipdfm $<

install :
	cp $(PDF) $(WWW_PDF_DIR)
