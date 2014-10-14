BASE = clean

.PHONY : all clean

all : $(BASE).dvi $(BASE).pdf

clean :
	rm -f *~ *.aux *.dvi *.eps *.log



$(BASE).dvi : $(BASE).ltx
	latex $(BASE).ltx

$(BASE).pdf : $(BASE).dvi
	dvipdfm $<
