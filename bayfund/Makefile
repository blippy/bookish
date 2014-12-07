BASE = bayfund

HTM = $(BASE).html
NB = $(BASE).ipynb

.PHONY :  all install

all : $(HTM)

$(HTM) : $(NB)
	ipython3 nbconvert $(NB)

install :
	cp $(HTM) $(NB) $(WWW_PDF_DIR)
