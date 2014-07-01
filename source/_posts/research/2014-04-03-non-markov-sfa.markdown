---
layout: post
title: "Non-markov SFA"
date: 2014-04-03 17:31
comments: true
categories: 
- noarchive 
- hide 
- sfa
- elman network
- nonmarkov
---

## Meeting with Matt Botvinick:

### Status  
     
- Got SFA toolbox installed on local machine   
- Generated figure eight trajectory  
- Trained elman neural network on figure eight trajectory (3x3 world) with __unsatisfactory results:__  

### Next Steps   

- Troubleshoot neural network:  
	- Test on markov loop    
	- Decrease learning rate (perhaps it's getting stuck in a local minimum)   
	- Use place cells instead of $(x,y)$ coordinates   

#### Read paper that Ari sent out:
