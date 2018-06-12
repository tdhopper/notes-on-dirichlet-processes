---
title: Sample from Antoniak Distribution with Python.
slug: antoniak
---

`rand_antoniak` draws a sample from the distribution of tables created by a Chinese restaurant process with parameter `alpha` after `n` patrons are seated. Some notes on this distribution are here: http://www.cs.cmu.edu/~tss/antoniak.pdf.
```python
import numpy as np
from numpy.random import choice

def stirling(N, m):
    if N < 0 or m < 0:
        raise Exception("Bad input to stirling.")
    if m == 0 and N > 0:
        return 0
    elif (N, m) == (0, 0):
        return 1
    elif N == 0 and m > 0:
        return m
    elif m > N:
        return 0
    else:
        return stirling(N-1, m-1) + (N-1) * stirling(N-1, m)

assert stirling(9, 3) == 118124
assert stirling(9, 3) == 118124
assert stirling(0, 0) == 1
assert stirling(1, 1) == 1
assert stirling(2, 9) == 0
assert stirling(9, 6) == 4536

def normalized_stirling_numbers(nn):
    #  * stirling(nn) Gives unsigned Stirling numbers of the first
    #  * kind s(nn,*) in ss. ss[i] = s(nn,i). ss is normalized so that maximum
    #  * value is 1. After Teh (npbayes).
    ss = [stirling(nn, i) for i in range(1, nn + 1)]
    max_val = max(ss)
    return np.array(ss, dtype=float) / max_val

ss1 = np.array([1])
ss2 = np.array([1, 1])
ss10 = np.array([  3.09439754e-01,   8.75395242e-01,   1.00000000e+00,
         6.17105824e-01,   2.29662318e-01,   5.39549757e-02,
         8.05832694e-03,   7.41877718e-04,   3.83729854e-05,
         8.52733009e-07]) # Verified with Yee Whye Teh's code

assert np.sqrt(((normalized_stirling_numbers(1) - ss1)**2).sum()) < 0.00001
assert np.sqrt(((normalized_stirling_numbers(2) - ss2)**2).sum()) < 0.00001
assert np.sqrt(((normalized_stirling_numbers(10) - ss10)**2).sum()) < 0.00001



def rand_antoniak(alpha, n):
    # Sample from Antoniak Distribution
    # cf http://www.cs.cmu.edu/~tss/antoniak.pdf
    p = normalized_stirling_numbers(n)
    aa = 1
    for i, _ in enumerate(p):
        p[i] *= aa
        aa *= alpha
    p = np.array(p) / np.array(p).sum()
    return choice(range(1, n+1), p=p)

rand_antoniak(.5, 10)
```
