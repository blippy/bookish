BASE = indices2014-12-15

#DVI = $(BASE).dvi
HTML = $BASE).html
NB   = $BASE).ipynb
#LTX = $(BASE).ltx
#PDF = $(BASE).pdf

.PHONY : all clean install

all : $(DVI) $(PDF)

clean :
	rm -f *~ *.aux *.dvi  *.log *.zip

#$(DVI) : $(LTX) bibli.ltx margins.ltx
#	latex $(LTX)
#	latex $(LTX)

#$(PDF) : $(DVI)
#	dvipdfm $<

$(HTML) : $(NB)
	ipython3 nbconvert --to html $(NB)

install : $(DVI)
	cp $(PDF)  $(WWW_PDF_DIR)
