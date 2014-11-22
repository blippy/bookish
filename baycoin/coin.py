import pprint
import random


##################################################
# plotting routines and setup

import matplotlib.pyplot as plt

plt.ylim(bottom=0.0, top = 0.1)

def make_plot(title, pdf):
    xs = sorted(pdf.keys())
    ys = [ pdf[x] for x in xs]
    plt.plot(xs, ys, label = title)

##################################################
# a simple initialisation of the prior

def prior():
    pdf = {}
    for i in range(100):
        prob = i/100
        v = 1
        if i> 30 and i < 70: v = 2
        if i > 40 and i < 60: v = 3
        pdf[prob] = v
    norm(pdf)
    return pdf

##################################################
# crucial engine-work

def norm(pdf):
    s = sum(pdf.values())
    for k in pdf.keys(): pdf[k] = pdf[k]/s

def is_head(): return random.random() <= 0.6

def update(pdf, ishead):
    for p in pdf.keys():
        if ishead: 
            pdf[p] = p * pdf[p]
        else: 
            pdf[p] = (1-p) * pdf[p]
    norm(pdf)

##################################################
# running the simulation

pdf = prior()
norm(pdf)
make_plot("n = 0 (init)", pdf)

update(pdf, False)
make_plot("n = 1 (tails)", pdf)

for i in range(9): update(pdf,  is_head())
make_plot("n = 10", pdf)

for i in range(90): update(pdf,  is_head())
make_plot("n = 100", pdf)


plt.legend()
plt.show()
