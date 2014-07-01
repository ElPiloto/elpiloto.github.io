---
layout: post
title: "LSTM trained multiple loops"
date: 2014-05-22 15:46
comments: true
categories: 
- noarchive 
- hide 
- nonmarkov
- sfa
- lstm
- botvinick
---

### Status:  
  
- Rudimentary system for importing rnnlib log information to matlab for performing SFA
- **Successfully trained LSTM on 20 loops through an eightball maze (same dimensions as last time): 0% misclassification**

{% img /images/research/hidden_state_activations_width3_loops20.png 700 350 %}

### Questions for meeting  
- What should we perform the SFA on?
- How many loops around the maze do we need?

### Next steps
Look at similarity metric for each timestep using correlation matrix - send to Matt
Be wary of SFA on multidimensional data and throwing away certain features
Send SFA
Waldo task: Ari did SFA on the task (using sparse representation, 8 units
perhaps LSTM'ing Waldo task
generate figures for a week from now


short term memory for serial order - matt bot paper, network needs to remember things that aren't relevant to current output, 
single unit recording analysis paper by bill newsome, analyzed by valerio monte, nature 2013 "context-dependent computations by recurrent dynamics in prefrontal cortex"

LSTM seems different than orthogonal

