BASE = ladder

DVI = $(BASE).dvi
LTX = $(BASE).ltx
PDF = $(BASE).pdf

.PHONY : all clean install

all : $(DVI) $(PDF)


clean :
	rm -f *~ *.aux *.dvi *.eps *.log



ladder.eps : ladder.dia
	dia --export=ladder.eps -t eps ladder.dia

$(DVI) : $(LTX) ladder.eps margins.ltx
	latex $(LTX)
	latex $(LTX)

$(PDF) : $(DVI)
	dvipdfm $<

install :
	cp $(PDF)  $(WWW_PDF_DIR)
