---
layout: post
title: "Paper: Deep Learning from Temporal Coherence in Video"
date: 2014-05-30 15:32
comments: true
categories: 
- noarchive 
- hide 
- nonmarkov
- sfa
- lstm
- botvinick
- neural networks
- convolutional
---

### Punchline:  
    
They used a convolutional neural network to do object recognition on video streams.  Motivated by the idea that consecutive video frames likely contain the same objects and therefore should have similar representations, they modify the neural network cost function to include a "coherence" term:  
  
$$ L_{coh}(\theta, inputx, inputy) = \begin{cases}
		  \|z_{\theta}(input_x) - z_{\theta}(input_y) \|_1  & \textbf{if x,y consecutive}\\
		  max(0, \delta - \|z_{\theta}(input_x) - z_{\theta}(input_y) \|_1)   & \textbf{otherwise}\\
\hline
\end{cases}  \\
\delta: \text{hyperparam push apart non-consecutive representations} \\
z_{\theta}(x) = \text{hidden layer representation for input x just before output layer} $$ 

### Noteworthy Details:
Training: They do some weird training where you have to look at the output of the network for two different outputs, they call this a siamese architecture.

### Ideas: 
- Modify $ L_{coh} $ to be a function of the number of time steps between inputs  
- What if we could use slow-features as a better proxy for temporal distance between training samples i.e. push representations closer together based on the difference between their slowest features?


