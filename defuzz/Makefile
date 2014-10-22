.PHONY : all clean

BUILD = defuzz.dvi defuzz.pdf

all : $(BUILD)

risk.eps : risk.jpg
	convert risk.jpg risk.eps

defuzz.dvi : defuzz.ltx risk.eps
	latex defuzz.ltx
	latex defuzz.ltx

defuzz.pdf : defuzz.dvi
	dvipdfm defuzz.dvi

clean :
	rm -f $(BUILD) risk.eps *.aux *.dvi *.log*
