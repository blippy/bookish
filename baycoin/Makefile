BASE = baycoin

DVI = $(BASE).dvi
LTX = $(BASE).ltx
PDF = $(BASE).pdf


.PHONY : all clean install

all : $(DVI) $(PDF)

clean :
	rm -f *~ *.aux *.dvi *.eps *.log

results.eps : results.png
	convert results.png results.eps

$(DVI) : $(LTX) bibli.ltx margins.ltx results.eps coin.py
	latex $(LTX)
	latex $(LTX)

$(PDF) : $(DVI)
	dvipdfm $<

install : $(DVI)
	cp $(PDF) $(WWW_PDF_DIR)

