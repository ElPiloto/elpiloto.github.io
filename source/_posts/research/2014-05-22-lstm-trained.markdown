---
layout: post
title: "LSTM Trained on Non-Markov Loop"
date: 2014-05-22 13:42
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
   
Successfully trained (finally) a LSTM network on a single loop through an eightball maze.
The eightball maze had a width $= 7$, height $= 3$, giving a total of 17 locations in the maze.
    
{% img /images/research/non_markov_maze.png 700 350 %}

**This is the architecture used:**   
- input layer: represent each location as an input node  
- hidden layer: 2 LSTM blocks  
- output layer: represent each output location as an output node  

**Training/Testing:**   
Input was a single sequence which consisted of a full loop around the maze, which takes 21 time steps. Testing was done simply by specifying the next step in the sequence.

**RNNLIB Config File && CDL**

### Next Steps:
- Run SFA on this output
- Train/test on sequences that have more loops around the maze  
- Run SFA on this output
- Logistical  
  - Develop method of transferring from rnnlib log files to matlab so that we can do SFA

### RNNLIB Discoveries & Questions  
- Default behavior is to have hidden layers be recurrent in time both forwards and backwards, this is **NOT** what we want for our current usage.  
- <code>hiddenSize</code> controls the number of units in the hidden layer, to specify multiple hidden layers can add values here  
- <code>hiddenBlock</code> still unclear what this does   
- <code>inputBlock</code> not sure what the benefit of creating an input block is, it seems to just replicate the input layer and has the same exact activations when I look at the log file  


