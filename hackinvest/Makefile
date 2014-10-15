BASE = hackinvest

.PHONY : all clean install

all : $(BASE).dvi $(BASE).pdf

clean :
	rm -f *~ *.aux *.eps *.glo *.glg *.gls 
	rm -f *.idx *.ilg *.ind *.ist *.log *.lot *.toc
	rm -f *.dvi *.pdf

$(BASE).dvi : $(BASE).ltx 
	latex $(BASE).ltx
	makeindex hackinvest.idx
	makeglossaries hackinvest
	latex $(BASE).ltx

$(BASE).pdf : $(BASE).dvi
	dvipdfm $<

install :
	cp $(BASE).pdf /var/ftp
