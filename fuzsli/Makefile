BASE = fuzsli

LTX = $(BASE).ltx
PDF = $(BASE).pdf

.PHONY : all clean install

all : $(BASE).dvi $(PFD)

clean :
	rm -f *~ *.aux *.dvi *.eps *.log

$(BASE).dvi : $(LTX) bibli.ltx margins.ltx fuzsli.py
	latex $(LTX)
	latex $(LTX)

$(PDF) : $(BASE).dvi
	dvipdfm $<

install :
	cp $(PDF) /var/ftp

