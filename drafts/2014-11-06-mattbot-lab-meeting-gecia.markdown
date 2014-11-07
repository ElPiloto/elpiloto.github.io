
---
layout: post
title: "Mattbot Meeting: Gecia's Search for Efficient Representations"
date: 2014-10-09 17:28
comments: true
categories: 
- noarchive 
- hide 
- hippocampus
- RL
- successor representation
- place cells
- grid cells
---

1. intrinsic efficency: kolmogorov complexity   
2. specific efficiency: representation allows efficency    
3. general efficency: agent's lifetime tasks   

$ I(X) = log_2(\fract{1}{p(x)}) $   

What about not using probabilities referring 

__Kolmogorov Complexity:__ length of shortest program that describes object x   


## Example of intrinsic efficiency: Brady et al. 2009   
Compression in Visual Working Memory: Using Statistical Regualirities to Form More Efficient Memory Representation   


have 4 "objects" on screen, 1 object = circle with two colors (inner color, outer color) at 4 locations on screen, task, remember which color was at which location and inner vs. outer

have two types of blocks: uniform (all color combination equally likely) vs. patterned (specific color-inner/outer pairs occur more frequently)   

__results:__ capacity of working memory higher for patterned than uniform   

Modeling Approach:   
1. model how observers might learn colors regularities based on the number of times they saw each paira using dirichlet-multinomial model - multinomial over color-inner/outer pairs   
2. assess how the learned statistics translate into representations in bits using huffman coding    
3. with learning and coding models, compute prediction about the number of bits required to encode that display and then correlate the avg. number of bits per display from the model with the memory performace of the observers   

## Example of general efficiency:  
Structural learning: learning a set of rules/representations that governs a set of tasks (Braun et al, 2006) or using experience to infer the relevant causal structure (Gershman & Niv, 2010)   





