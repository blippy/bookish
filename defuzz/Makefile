BASE = defuzz
PDF = $(BASE).pdf

.PHONY : all clean install

BUILD = $(BASE).dvi $(BASE).pdf

all : $(BUILD)

risk.eps : risk.jpg
	convert risk.jpg risk.eps

defuzz.dvi : defuzz.ltx risk.eps
	latex defuzz.ltx
	latex defuzz.ltx

$(PDF) : defuzz.dvi
	dvipdfm defuzz.dvi

clean :
	rm -f $(BUILD) risk.eps *.aux *.dvi *.log*

install : $(PDF)
	cp $(PDF) /var/ftp
