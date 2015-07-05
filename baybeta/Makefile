BASE = baybeta
HTDOCS = $(shell www pdf)
HTM = $(BASE).html
#DVI = $(BASE).dvi
#LTX = $(BASE).ltx
#PDF = $(BASE).pdf


.PHONY : clean install 

#all : $(DVI) $(PDF)


#$(DVI) : $(LTX) bibli.ltx margins.ltx
#	latex $(LTX)
#	latex $(LTX)

#$(PDF) : $(DVI)
#	pdflatex $(LTX)

install : $(HTM)
	cp $(HTM)  $(HTDOCS)/
	echo Did you run mkhtml.bat?

clean :
	rm -f *~ *.aux *.dvi *.log *.html
