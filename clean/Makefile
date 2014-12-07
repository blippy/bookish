BASE = clean

DVI = $(BASE).dvi
LTX = $(BASE).ltx
PDF = $(BASE).pdf

.PHONY : all clean install

.PHONY : all clean install

clean :
	rm -f *~ *.aux *.dvi *.eps *.log



$(DVI) : $(LTX)
	latex $(LTX)

$(PDF) : $(DVI)
	dvipdfm $<

install :
	cp $(PDF)  $(WWW_PDF_DIR)
