BASE = invcom

PDF = $(BASE).pdf
PS = $(BASE).ps

$(PDF) : $(PS)
	ps2pdf -sPAPERSIZE=a4 -dOptimize=true -dEmbedAllFonts=true  $< 

$(PS) : $(BASE).txt
	cat $< | pic | tbl | eqn | groff -Tps -mom -P-pa4 > $@

.PHONY : clean
clean :
	rm -f $(PDF) $(PS)
