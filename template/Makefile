BASE = myarticle

DVI = $(BASE).dvi
LTX = $(BASE).ltx
PDF = $(BASE).pdf

.PHONY : all clean install

all : $(DVI) $(PDF)

clean :
	rm -f *~ *.aux *.dvi  *.log *.zip

$(DVI) : $(LTX) bibli.ltx margins.ltx
	latex $(LTX)
	latex $(LTX)

$(PDF) : $(DVI)
	dvipdfm $<

install : $(DVI)
	cp $(PDF)  $(WWW_PDF_DIR)
