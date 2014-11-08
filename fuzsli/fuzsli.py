# fuzsli.py
# use python 3 so that floats are used



#####################################
### INTERNAL DEFINITIONS AND SETUP

from pprint import pprint

def inter(ante, v):
    res = { el[0] :0 for el in ante }
    #print(res)
    h0 = None
    k0 = None
    for a in ante:
        k, l, h = a
        if l <= v and v <= h:
            res[k] = 1
            return res
        if v < l:
            prop = (v-h0)/(l-h0)
            res[k0] = 1 - prop
            res[k] = prop
            return res

        h0 = h
        k0 = k
    return None

def crisp(cons, rulings):
    num = 0
    msum = 0
    for k, c in cons.items():
        x, w = c
        m = rulings[k] * w
        num += m * x
        msum += m
    return num/msum


#####################################
### USER-DEFINED ITEMS

# the antecedants

funding = [('inadequate', 0, 20),
           ('marginal', 50, 50),
           ('adequate', 80, 100)]


staffing = [('small', 0, 30),
            ('medium', 50, 50), # not in original problem
            ('large', 70, 100) ]
    
# the consequents

risk = { 'low' : (.15, 0.3), 'normal' : (.50, .4), 
         'high' : (.85, .3) }

# the rule

def rule(mu_f, mu_s):
    d = { 'low' : max(mu_f['adequate'], mu_s['small']),
          'normal': min(mu_f['marginal'], mu_s['large']),
          'high': mu_f['inadequate'] }
    return d


mu_f = inter(funding, 35)
pprint(mu_f)
mu_s = inter(staffing, 60)
pprint(mu_s)
rulings = rule(mu_f, mu_s)
pprint(rulings)

# a cross-check with my previous paper: defuzz.pdf
#rulings = { 'low': 0.1, 'normal' : 0.2, 'high' : 0.5 } 

print(crisp(risk, rulings))
