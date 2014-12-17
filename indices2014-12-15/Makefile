BASE = indices2014-12-15

#DVI = $(BASE).dvi
H5   = $(BASE).h5
HTML = $(BASE).html
NB   = $(BASE).ipynb
#LTX = $(BASE).ltx
#PDF = $(BASE).pdf
ZIP  = $(BASE).zip

.PHONY : all clean install

all : $(HTML)

clean :
	rm -f *~ *.aux *.dvi  *.log *.zip $(HTML)

#$(DVI) : $(LTX) bibli.ltx margins.ltx
#	latex $(LTX)
#	latex $(LTX)

#$(PDF) : $(DVI)
#	dvipdfm $<

$(HTML) : $(NB)
	ipython3 nbconvert --to html $(NB)

zip : $(ZIP)

$(ZIP) : $(NB) $(H5)
	rm -f $(ZIP)
	cp $^ $(BASE)
	zip  $(ZIP) $(BASE)/*

install : $(HTML) $(ZIP)
	cp $(HTML) $(ZIP) $(WWW_PDF_DIR)
