---
layout: post
title: "Non-markov SFA: Matt Botvinick Meeting"
date: 2014-04-10 17:54
comments: true
categories: 
- noarchive 
- hide 
- sfa
- nonmarkov
- elman network
- lstm
---

### Status:

- Still unable to train successfully on non-markov loop
- Tried the following things:
  1. Training on markov loop (simply go around in a circle) and succeeded in training that network - this serves as a sanity check
  2. Tried lower learning rate
  3. Tried penalizing the training examples corresponding to the appropriate left or right choice more than other examples, but this produced funky, erratically erroneous behavior
  4. Switched state representation from $(x,y)$ coordinates to place cell locations:
      - Helped with training non-markov: now the network simply chooses one side and incurs the cost of being wrong once every 2 cycles

### Comments:

- Matt thought this is more like the problem you'd expect if the recurrent neural network was just having a hard time remembering

### Next Steps:

- Troubleshoot neural network:
  - Try using LSTM network (Schmidhuber probably has an implementation)
    - **Ensure** that the LSTM network produces an internal, vector of scalar representation that we can subsequently use for SFA
    - Matt would like a briefing of how LSTM works (though he didn't explicitly ask for one, it'd be a sweet thing to do for him)
  - Alternatively: try, Larry Abbott and David Sussillo FORCE algorithm
  - Alternatively: implement Matt's recurrent neural network with an additional set of targets that serve as an autoencoder of the recurrent layer

### Random:
1. Matt spoke about another motivation for using SFA, which was Earl Miller's dog/cat discrimination task in monkeys with stimuli which were morphed on a continuum between dog and cat (I think).  That experiment showed that visual areas represented dogs and cats "veridically", but that prefrontal areas represented the stimuli based on the category boundary (which was manipulated).  He thought, how would you come up with that representation?  Well, you would have to think that the time series is: stimulus, press left, receive reward and that maybe we could perform SFA on this.
2. Matt mentioned there is a "teacher" in the Sussillo FORCE algorithm that prevents the network from being wrong on a particular trial - he thinks perhaps this relationship could be instantiated by the model-free and model-based systems.  Furthermore, that this teacher might only provide information some of the times - that it computes when it needs to monitor/control/teach/supervise the model-free system.
