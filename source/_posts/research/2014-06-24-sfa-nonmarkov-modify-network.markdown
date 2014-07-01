---
layout: post
title: "SFA Nonmarkov: Modify network, maze size and type, visualize gates"
date: 2014-06-24 13:38
comments: true
categories: 
- noarchive 
- hide 
- sfa
- lstm
- botvinick
---

### Overview of simulations  
1. Look at the gate values along the maze trajectories (previously we only looked at the hidden state values). Recall that a long-short term memory network has three gates: read, write, and forget   
2. We also need to look at our old MDS plots of the hidden layers and label the trajectory (previously we only showed whether a representation belonged to the center hallway or right or left outer maze locations)
3. We want to see if we get any qualitative differences as we change the width of the maze.  
4. We want to see if changing the maze type to be a ring will still yield the segmenting behavior we see from SFA  
5. We want to see if we get any qualitative differences as we change the number of hidden units

### Different Num Hidden Units

#### Hidden Unit MDS Plots  
{% img /images/research/sfa_lstm/hidden_layer_width3_hidden5_loop.png 750 350 %} 
{% img /images/research/sfa_lstm/hidden_layer_width3_hidden3_loop.png 750 350 %} 

##### Observations:  
1. Much cleaner separation of states with 5 hidden units compared to 3 hidden units based on the loop to which they belong.
2. Also get cleaner separation of states based on center versus non-center.
3. **These results suggest that the hidden layer representation generated using 5 hidden units might be a better representation for looking at the benefits of SFA.**

#### Hidden Unit Similarity Plots According to Location on Maze
{% img /images/research/sfa_lstm/Linear_corr_states_hidden_representation_width3_hidden5.png 750 350 %} 
**Figure 2a) 5 Hidden Units**
{% img /images/research/sfa_lstm/Linear_corr_states_hidden_representation_width3_hidden3.png 750 350 %} 
**Figure 2b) 3 Hidden Units**  

##### Observations:  
This is just another way of seeing how much cleaner the 5 hidden units representation is.

#### Linear SFA Top 2 Slowest Features  
{% img /images/research/sfa_lstm/sfa_1st_2_features_rm_1st_visit_width3_hidden5.png 750 350 %} 
**Figure 3a) 5 Hidden Units**
{% img /images/research/sfa_lstm/sfa_1st_2_features_rm_1st_visit_width3_hidden3.png 750 350 %} 
**Figure 3b) 3 Hidden Units**   

##### Observations:  
1. Here we see exactly what we hoped for in the 5 hidden units case: the first slow-feature indicates which loop we're on!
2. The question is: how much of this is the neural network and how much of this is SFA? Well let's look at the plots below of the raw hidden layer values across the maze.  If the neural network is doing all the heavy lifting, then we would see a single, slowly varying feature that encodes the loops direction but this doesn't seem to be the case!

{% img /images/research/sfa_lstm/hidden_layer_on_maze_raw_left_width3_hidden5.png 750 350 %} 
**Figure 4a) 5 Hidden Units**
{% img /images/research/sfa_lstm/hidden_layer_on_maze_raw_right_width3_hidden5.png 750 350 %} 
**Figure 4b) 5 Hidden Units**   

**NOTE:** These colors look exactly the same along the central corridor (which would be troubling), but their values are actually different if you look at the numbers.


### Different Maze Size  - Width 7, 5 Hidden Units

#### Hidden Unit MDS Plots  
{% img /images/research/sfa_lstm/hidden_layer_mds_width7_hidden5.png 750 350 %} 

#### Linear SFA Top 2 Slowest Features  

{% img /images/research/sfa_lstm/sfa_linear_1st2features_width7_hidden5.png 750 350 %} 

### Different Maze Structure

#### Hidden Unit MDS Plots
{% img /images/research/sfa_lstm/hidden_layer_mds_width7_hidden5.png 750 350 %} 

#### Linear SFA Top 2 Slowest Features  
{% img /images/research/sfa_lstm/sfa_1wayloop_width7_hidden5.png 750 350 %} 


### Meeting with Mattbot:

#### Observations:
1. It does seem like the first slow feature encodes which outer loop we're on.   
2. Cooler than that, our second slow feature for the width 7, 5 hidden units case, encodes which step of the outer loop we're on, regardless of which direction the loop is.  This is motherfucking abstraction! We're going to try to connect this to to-do item #4.

#### To-Do:  
1. Why are the slow-features on such a small scale?    
2. Why are the hidden layer representations (think MDS width3, hidden5) so similar at the fork point - Matt thinks I might be off by one because the point just after the fork diverges which is what you would expect from the fork point - since they make vastly different predictions.  
3. Will PCA give us anything useful?    
4. I should read a paper on rat neurophysiology, an older paper - they showed that in an 8-arm radial maze, certain PFC cells encoded specific parts of an arm, without being specific to the particular arm.  This is similar to our second slow feature in the 
5. Check that these results are invariant o the number of hidden units and size of the maze.
 

#### Other to-do:
This isn't related to the non-markov, but to the factored state towers of hanoi: I was tasked with performing slow feature analysis on a random walk on a factored state representation of the towers of hanoi task.  It seems like I'm getting a result that Ari wasn't able to: The first slow feature seems to represent the location of the largest ring.
* I should check with Ari to make sure I did things the way he did, too   
* I should show Matt the MDS of the slow features   
* I should make sure all of theslow features load on all dimensions of the original input space.  
* We're not sure what the second slowest feature should look like, but it seems like it might be the configuration of the second largest ring conditioned on the location of the largest ring.  That's definitely what the scatter plot of the first two features looks like.
