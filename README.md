I taught myself Dirichlet processes and Hierarchal DPs in the spring of 2015 in order to understand nonparametric Bayesian models and related inference algorithms. In the process, I wrote a bunch of code and took a bunch of notes; later, I turned these into [blog posts](http://stiglerdiet.com/category/nonparametric-bayes.html).

I implemented the HDP-LDA component of the [data microscopes](datamicroscopes.github.io) project. You can install it with

```
$ conda install -c datamicroscopes -c distributions microscopes-lda
```

You can access these notebooks interactively with Binder: [![Binder](http://mybinder.org/badge.svg)](http://mybinder.org/repo/tdhopper/notes-on-dirichlet-processes)


## Table of Contents

* [Dirichlet Distribution and Dirichlet Processes](http://nbviewer.ipython.org/github/tdhopper/notes-on-dirichlet-processes/blob/master/2015-07-28-dirichlet-distribution-dirichlet-process.ipynb): A quick review of the Dirichlet Distribution and an introduction to the Dirichlet Process by analogy with the Dirichlet Distribution.
* [Sampling from a Hierarchical Dirichlet Process](http://nbviewer.ipython.org/github/tdhopper/notes-on-dirichlet-processes/blob/master/2015-07-30-sampling-from-a-hierarchical-dirichlet-process.ipynb): Code demonstrating how you can sample from a Hierarchical Dirichlet Process without generating an infinite number of parameters first.
* [Nonparametric Latent Dirichlet Allocation](http://nbviewer.ipython.org/github/tdhopper/notes-on-dirichlet-processes/blob/master/2015-08-03-nonparametric-latent-dirichlet-allocation.ipynb): An alternative view of latent Dirichlet allocation using a Dirichlet process, and a demonstration of how it can be easily extended to a nonparametric model (where the number of topics becomes a random variable fit by the inference algorithm) using a hierarchical Dirichlet process.
* [Fitting a Mixture Model with Gibbs Sampling](http://nbviewer.ipython.org/github/tdhopper/notes-on-dirichlet-processes/blob/master/2015-09-02-fitting-a-mixture-model.ipynb): Derivation of a full Gibbs sampler for a finite mixture model with a Dirichlet prior. This is a step on the way to deriving a Gibbs sampler for the Dirichlet Process Mixture Model.
* [Notes on Gibbs Sampling in Hierarchical Dirichlet Process Models](https://github.com/tdhopper/notes-on-dirichlet-processes/blob/master/2015-09-21-hdp-lda-gibbs-sampler.pdf): Notes on apply the equations given in the [Hierarchical Dirichlet Process](http://www.cs.berkeley.edu/~jordan/papers/hdp.pdf) paper to nonparametric Latent Dirichlet Allocation.
* [Sample from Antoniak Distribution with Python](https://github.com/tdhopper/notes-on-dirichlet-processes/blob/master/2015-09-21-antoniak.py): Code for drawing samples from the distribution of tables created by a Chinese restaurant process after `n` patrons are seated.
* [Analysis of the topics of Econtalk with HDP-LDA](http://nbviewer.ipython.org/github/tdhopper/notes-on-dirichlet-processes/blob/master/2015-10-07-econtalk-topics.ipynb): Demonstration of the nonparametric latent Dirichlet allocation component of [data microscopes](http://datamicroscopes.github.io) that I developed. Analyzes the topics of the [Econtalk podcast](http://econtalk.org) by using show notes/transcripts.

## A Note on the term "Dirichlet Process"

Part of the impetus for compiling these notes was how carelessly the term "Dirichlet process" seemed to be used in literature on nonparametric Bayesian models.

Although I thought I had come to the correct understanding (which is presented here), [Dan Roy](https://twitter.com/roydanroy) [helpfully pointed out](http://danroy.org/marginalia/Nomenclature_for_stochastic_processes_and_Bayesian_nonparametric_statistics) that I probably got it wrong _given how Dirichlet Process is defined by [Ferguson 1973](http://www.cs.berkeley.edu/~jordan/courses/281B-spring04/readings/ferguson.pdf)_. Ferguson's use of Dirichlet process does not make it a "distribution over distributions" as [Neal](http://www.stat.columbia.edu/npbayes/papers/neal_sampling.pdf), [Teh](http://www.stats.ox.ac.uk/~teh/research/npbayes/Teh2010a.pdf), [Jordan](http://www.cs.berkeley.edu/~jordan/courses/281B-spring04/lectures/dp1.pdf), and [Blei](http://web.mit.edu/sjgershm/www/GershmanBlei12.pdf) call it. At best, I believe there is equivocation on the term "Dirichlet Process" in the NPB literature. At worst, there is wide scale confusion on what a Dirichlet process is!

At some point, I intend to write a post trying to explain the subtleties of this discussion. In the mean time, I would suggest that my posts will still be valuable in understanding the literature on nonparametric Bayes, even if it won't get you a Ph.D. in measure theory.

## Other Resources

* [A collection of links to resources I've found valuable](https://pinboard.in/u:tdhopper/t:%2540Bayes/)

### HDP-LDA Implementations

* [Gregor Heinrich's ILDA](http://www.arbylon.net/publications/ilda.pdf): A Java-based implementation of the "Posterior Assignment by Direct Sampling" MCMC algorithm from Teh et al (2005). Includes hyperparameter sampling.
* [Shuyo's Implementation](https://github.com/shuyo/iir/blob/master/lda/hdplda2.py): Pure Python implementation of "Posterior sampling in the Chinese restaurant franchise" MCMC algorithm. Doesn't include hyperparameter sampling.
* [Teh's Original Implementations](https://github.com/tdhopper/teh-npbayes): Matlab and C code for MCMC accompanying original paper. I found it impenetrable.
* [HCA](https://github.com/wbuntine/topic-models): C implementation
* [HDP-Faster](https://github.com/renaud/hdp-faster): C++ implementation by Chong Wang using [split-merge algorithm](http://arxiv.org/abs/1201.1657).
* [Gensim](https://radimrehurek.com/gensim/models/hdpmodel.html): Python-based variational inference (following [Chong Wang et al (2011)](http://jmlr.csail.mit.edu/proceedings/papers/v15/wang11a/wang11a.pdf)).
* [bnpy](https://bitbucket.org/michaelchughes/bnpy/): Python implementation of variational inference.