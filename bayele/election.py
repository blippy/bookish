# election.py
# bayesian election forecasting
# http://is.gd/Wwkmvz

import scipy.stats
import matplotlib.pyplot as plt

prior = [1] * 101
def norm(pdf): s = sum(pdf); return [x/s for x in pdf]
prior = norm(prior)

doplot = False # True # if you want to plot results
if doplot: plt.plot(prior)


def update(prior, est, mu, stdev):
    err = scipy.stats.norm(mu, stdev)
    post = [ err.pdf(v-est)*prior[v] for v in range(101)]
    post = norm(post)
    max1 = max(enumerate(post), key = lambda x: x[1])
    print("Prob<50=", sum(post[0:50]), ", Max=", max1)
    if doplot: plt.plot(post)
    return post

post1 = update(prior, 53, -1.1, 3.7) 
# gives Prob<50= 0.257641038477 , 
# Max= (52, 0.10778286521062092)

post2 = update(post1, 49, 2.3, 4.1)
# gives Prob<50= 0.217691279025 , 
# Max= (52, 0.14392927679051784)

#print("Done in reverse produces same result:")
#post1 = update(prior, 49, 2.3, 4.1)
#post2 = update(post1, 53, -1.1, 3.7)

if doplot: plt.show()
