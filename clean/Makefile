BASE = clean

.PHONY : all clean install

all : $(BASE).dvi $(BASE).pdf

clean :
	rm -f *~ *.aux *.dvi *.eps *.log



$(BASE).dvi : $(BASE).ltx
	latex $(BASE).ltx

$(BASE).pdf : $(BASE).dvi
	dvipdfm $<

install :
	cp $(BASE).pdf /var/ftp
