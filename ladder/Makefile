BASE = ladder

.PHONY : all clean install

all : $(BASE).dvi $(BASE).pdf

clean :
	rm -f *~ *.aux *.dvi *.eps *.log



ladder.eps : ladder.dia
	dia --export=ladder.eps -t eps ladder.dia

$(BASE).dvi : $(BASE).ltx ladder.eps margins.ltx
	latex $(BASE).ltx
	latex $(BASE).ltx

$(BASE).pdf : $(BASE).dvi
	dvipdfm $<

install :
	cp $(BASE).pdf /var/ftp
