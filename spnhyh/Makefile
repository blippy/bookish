BASE = spnhyh

DVI = $(BASE).dvi
LTX = $(BASE).ltx
PDF = $(BASE).pdf

.PHONY : all clean install

all : $(DVI) $(PDF)

clean :
	rm -f *~ *.aux *.dvi  *.log *.zip *.eps

$(DVI) : $(LTX) bibli.ltx margins.ltx
	latex $(LTX)
	latex $(LTX)

$(PDF) : $(DVI) hyh-01.eps
	dvipdfm $<

hyh-01.eps: hyh-01.png
	convert $< $@

install : $(DVI)
	cp $(PDF)  $(WWW_PDF_DIR)
