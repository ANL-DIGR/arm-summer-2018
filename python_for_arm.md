-----------------------------------------------------
How to build a Python stack for working with ARM data
-----------------------------------------------------

Introduction
============
The Python programming language is vast. And while your interest may be mainly in using Python to work with ARM data
you would be in the vast minority. Most Python users work for tech firms doing tasks like web development. We, as a
community benefit from the wide use of Python.

However, when you work with Python you will note just starting Python up there us very little if use in it.. You need to
build what we call a "Stack".

The Scientific Python Stack
===========================
The scientific Python stack is a collection of modules that create an environment condusive for doing leading edge
science. Generally you will use a package manager to install your stack. We (at Argonne and many others in ARM) use
Anaconda Python Distribution (APD) which has a great tool called Conda. There is a Conda environment file in this
repository called arm-ss.yml. This contains a recipe for Conda to build your stack. You install this by typing:

```conda env create -f arm-ss.yml```

Grab a coffee while a leading edge scientific platform is built. This contains the following packages.

## Numerical Python, numpy
At the core of numpy is the array object (or ndarray). Arrays are a powerful *object* that is they not only contain the 
data but code for working on it.. eg ```mydata.std()``` returns the standard deviation. Most of the code that does the
heavy lifting is written in C/C++ and is highly optimized. 

## Scientific Python, Scipy
Scipy builds in numpy with a collection of common numerical routines including: FFTs, Linear algebra (with links to the 
LAPACK codebase), image processing (very handy!), signal processing (including convolution, filters), optimization and fitting,
interpolation and integration/differentiation etc..

## Project Jupyter
Jupyter is a reproducibility engine. It incorporates notebooks, kernels and clusters all designed to speed the communication 
of science and enabling results to be reproduced. 

## X-Array
X-Array builds on numpy's array object with powerful labeled ndarrays

## Py-ART
The Python ARM Radar Toolkit for interactive radar analysis.

## MetPy
All kinds of meteorological good ess including SkewTs

# PyDSD 
A module for working with drop size distributions including T-Matrix calculations
 
