---
layout: post
title: "Towers of Hanoi SFA and 8-ball SFA results: Robustness and Potential Neural Data to Model"
date: 2014-07-06 15:29
comments: true
categories: 
- noarchive 
- hide 
- lstm
- sfa
- botvinick
---


#### Towers of Hanoi To-Do:
1. **Run SFA on random walk using multiple different random number seeds** 
2. I am using the same starting location, this might affect the solutions found by SFA.  However, looking at the average input values (<code>SFA_STRUCTS.avg0</code>) shows that each feature has an average value of approximately 0.33, indicating that we do traverse all configurations equally frequently.
3. <code>sfa_tk</code> toolbox does not give features with unit variance when performing linear SFA. This might be a problem in the general case, but shouldn't be a problem for towers of hanoi because the point of getting unit variance is so that the weights you find that minimize the derivative are directly comparable to each other.  But in our case, the derivatives should already be directly comparable because the input features all have exactly the same distribution for a random walk on towers of hanoi. I'm not entirely sure about this last bit, so I'll have to verify this if Ari doesn't have any useful input on the matter - easy way forward: look at MDP (python SFA implementation).


#### General Tips for sfa_tk toolbox
1. <code>SFA_STRUCTS.SF</code> - contains slow feature functions along the rows
2. Can get degenerate eigendecompositions, where an eigenvalue has greater algebraic multiplicity than geometric multiplicity (e.g. $ (2 - \lambda)^2(3-\lambda)^2 $ -- alg. mult = 2, geometric = 1 for both eigenvalues).  In this case, extracted slow features are redundant (though they'll have opposite signs).
