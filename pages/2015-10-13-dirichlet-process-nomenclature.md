
---
title: Nomenclature of Dirichlet Processes
slug: nomenclature
---


# Nomenclature of Dirichlet Processes


Much of the literature on Dirichlet Processes makes assertions similar to the following:

* "DP is the Dirichlet process, a distribution over distributions." ([Neal, 2000](http://www.stat.columbia.edu/npbayes/papers/neal_sampling.pdf))
* "[The Dirichlet process] is a distribution over distributions, i.e. each draw from a Dirichlet process is itself a distribution." ([Teh, 2010](http://www.stats.ox.ac.uk/~teh/research/npbayes/Teh2010a.pdf))
* "The Dirichlet process (DP) is a distribution over distributions." ([Gershman and Blei, 2012](http://web.mit.edu/sjgershm/www/GershmanBlei12.pdf))
* The "Dirichlet process defines a distribution on random probability measures..." ([Sudderth, 2006](http://cs.brown.edu/~sudderth/papers/sudderthPhD.pdf))
* "Dirichlet processes define a distribution over distributions..." ([Ghahramani, 2005](http://mlg.eng.cam.ac.uk/zoubin/talks/uai05tutorial-b.pdf))

Michael Jordan makes an [equivalent statement](http://www.cs.berkeley.edu/~jordan/courses/281B-spring04/lectures/dp1.pdf).

Each of these sources makes the claim that a Dirichlet Process is a distribution over probability distributions. That is, given a base distribution $G_0$ and a parameter $\alpha$, $DP(\alpha, G_0)$ _is_ a Dirichlet process and _is_ (equivalently) a distribution over probability distributions. Therefore, a sample $G$ drawn from the Dirichlet process $DP(\alpha, G_0)$ is itself a probability distribution. $G$ (where $G\sim DP(\alpha, G_0)$) is a discrete probability distribution whose support is a discrete subset of the support of $G_0$.

Confusingly, while many sources refer to the DP as a distribution over distributions, when using the phrase "sample from a Dirichlet process", they mean a sample from $G$, not from $DP(\alpha, G_0)$. These authors appear to equivocate on the term "Dirichlet process". It means both a distribution over distributions and a distribution sampled from this distribution over distributions.

After being confused by this point for some time, I [prepared these notes](http://nbviewer.ipython.org/github/tdhopper/notes-on-dirichlet-processes/blob/master/2015-07-28-dirichlet-distribution-dirichlet-process.ipynb) arguging that the Dirichlet process _is_ a distribution over distributions. I argued that the term _sample from a Dirichlet process_ should refer to a distribution sampled from the DP, not to a point sampled from the support of $G_0$.

In response to my notes, [Dan Roy](http://danroy.org/marginalia/Nomenclature_for_stochastic_processes_and_Bayesian_nonparametric_statistics) [briefly argued](http://danroy.org/marginalia/Nomenclature_for_stochastic_processes_and_Bayesian_nonparametric_statistics) that "The Dirichlet process is a distribution on the space of probability measures" is a misstatement. In fact, Roy argues that $DP(\alpha, G_0)$ is not a Dirichlet process at all! Instead $G$ (the distribution sampled from $DP(\alpha, G_0)$) is the Dirichlet process.

Thomas Ferguson first defined the Dirichlet Process [in his 1973](http://www.cis.upenn.edu/~taskar/courses/cis700-sp08/papers/ferguson.pdf) paper. Charles Antoniak (a student of Ferguson) repeats the definition [in his his 1974 paper](http://www.cis.upenn.edu/~taskar/courses/cis700-sp08/papers/antoniak.pdf). Antoniak's definition is as follows:

> Let $\Theta$ be a set, and $\mathcal{A}$ a $\sigma$-field of subsets of $\Theta$. Let $\beta$ be a finite, nonnull, nonnegative, finitely additive measure on $(\Theta, \mathcal{A})$. We say a random probability measure $P$ on $(\Theta, \mathcal{A})$ is a Dirichlet process on $(\Theta, \mathcal{A})$ with parameter $\beta$, denoted $P\in \mathcal{D}(\beta)$, if for every $k=1, 2, \ldots$ and measurable partition $B_1,\ldots,B_k$ of $\Theta$, the joint distribution of the random probabilities $(P(B_1),\ldots,P(B_k))$ is Dirichlet with parameters $(\beta(B_1),\ldots,\beta(B_k))$, denoted $(P(B_1),\ldots,P(B_k))\in \mathcal{D}(\beta(B_1),\ldots,\beta(B_k))$.

Let's unpack this dense, measure theoretic definition.

> Let $\Theta$ be a set, and $\mathcal{A}$ a $\sigma$-field of subsets of $\Theta$. Let $\beta$ be a finite, nonnull, nonnegative, finitely additive measure on $(\Theta, \mathcal{A})$.

First, note that $\beta$ here is a finite measure, i.e. a not-necessarily-normalized probability distribution. Antoniak's $\alpha$ is equivalent to $\alpha\cdot G_0$ in our notation. Essentially, this means we have a probability distribution over some set $\Theta$ with density $p(x) = \beta(x) / \beta(\Theta)$. (The business about $\sigma$-field of subsets just allows us to avoid things like the [Banach–Tarski paradox](https://en.wikipedia.org/wiki/Banach%E2%80%93Tarski_paradox).)

> We say a random probability measure $P$ on $(\Theta, \mathcal{A})$ is a Dirichlet process on $(\Theta, \mathcal{A})$ with parameter $\beta$, denoted $P\in \mathcal{D}(\beta)$

TODO

> ...if for every $k=1, 2, \ldots$ and measurable partition $B_1,\ldots,B_k$ of $\Theta$, the joint distribution of the random probabilities $(P(B_1),\ldots,P(B_k))$ is Dirichlet with parameters $(\beta(B_1),\ldots,\beta(B_k))$, denoted $(P(B_1),\ldots,P(B_k))\in \mathcal{D}(\beta(B_1),\ldots,\beta(B_k))$.

