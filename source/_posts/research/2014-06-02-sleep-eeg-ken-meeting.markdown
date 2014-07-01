---
layout: post
title: "Sleep EEG Ken Meeting"
date: 2014-06-02 11:27
comments: true
categories: 
- noarchive 
- hide 
- EEG
- sleep
---

### Context  
  
After ending the first-year rotation, I'm now back on the hook for working on this sleep EEG project full-time.  This meeting was simply to re-orient ourselves and plan the next immediate steps.

### Next Steps  
1. Area under ROC instead of classification accuracy   
2. Represent goodness in terms of where it falls on the empirical null distribution (as opposed to previously where we were showing raw-classification accuracy which we really have no clue how good that should be)  
3. Train sleep classifier using wake WEIGHTS instead of wake average pattern as template.  The rationale behind this is that the average pattern templates treat all electrodes as equally important, but this just isn't true.  The importance maps will take that into account   
4. Create existing plots for new subjects [n = 8] (!)

### Next Next Steps  
1. We need to think about how we can collapse down each sleep trial (playing of a sleep sound) into a single reactivation metric.  Currently, we have classifier output for different timebins of the sleep trial and it seems like the maximally-classifiable time bin varies across subjects.   
  - Train an "uberclassifier" that classifies across all timebins - this would give us a single reactivation score per trial   
    - Is there a smart way of reducing the number of features we have?  
      - we might have some _a priori_ ideas about which features to include.  
      - we might want to look at the cross-validation accuracy along certain time-bins to narrow things down.   
    - This is where I thought a recurrent neural network might be helpful for us.  
  - Alternative idea: train a higher-level classifier on the outputs of the individual time bin classifiers    
  
2. How do we relate reactivations to subsequent memory?  Recall that there will be multiple classifier readouts per item, perhaps something a la [P-CIT] (https://code.google.com/p/p-cit-toolbox/) would work for us.

