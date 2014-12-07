BASE = fuzsli

DVI = $(BASE).dvi
LTX = $(BASE).ltx
PDF = $(BASE).pdf


.PHONY : all clean install

all : $(DVI) $(PDF)

clean :
	rm -f *~ *.aux *.dvi *.eps *.log

$(DVI) : $(LTX) bibli.ltx margins.ltx fuzsli.py
	latex $(LTX)
	latex $(LTX)

$(PDF) : $(DVI)
	dvipdfm $<

install :
	cp $(PDF) $(WWW_PDF_DIR)

