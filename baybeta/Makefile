BASE = baybeta

DVI = $(BASE).dvi
LTX = $(BASE).ltx
PDF = $(BASE).pdf


.PHONY : all clean install

all : $(DVI) $(PDF)

clean :
	rm -f *~ *.aux *.dvi *.log

$(DVI) : $(LTX) bibli.ltx margins.ltx
	latex $(LTX)
	latex $(LTX)

$(PDF) : $(DVI)
	pdflatex $(LTX)

install : $(DVI)
	cp $(PDF)  $(WWW_PDF_DIR)
