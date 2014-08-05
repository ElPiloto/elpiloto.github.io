---
layout: post
title: "Sleep EEG: Group Meeting"
date: 2014-07-28 17:10
comments: true
categories: 
- noarchive 
- hide 
- sleep
- EEG
---

### Ken succinctly described two levels of complexity in our sleep analysis:  
1. How do we transform the sleep?  Recall this can be face or scene transformed, we can use correlation or the dot product, we can use data from different frequencies and different time bins in the wake data, etc.  
  - Perhaps we don't need to sleep transform?
  - Perhaps we need to exclude electrodes explicitly? We thought the McDuff importance maps method implemented this, but correlation doesn't care about the magnitude so we need to re-evaluate this (either use dot product OR filter out electrodes by some other measure)  **(TODO ITEM: dot product)**
2. When does reinstatement happen?  How should we score reinstatement?  If we do classification, do we just look at one time bin for the sleep?  Do we sum up classification across all time bins, etc.  
  - Maybe we want to use a simpler method than classification a la Staresina paper: sum correlation between template and sleep pattern and threshold to indicate replay event.   
  - We could and should look at trial-by-trial plots of correlation across time for both the incorrect and correct pattern - eyeball the crap out of this.  **(TODO ITEM)**
3. James also mentioned trial-by-trial variability: if cue during down phase, won't expect reactivation in next 500 ms when all neurons are turned off.

### Behavioral Results Look great
1. Spindles too rare to use to limit the sleep data   

### Additional thoughts:
1. We should leave open the option to look at ERPs for classification, although Ehren's thoughts were that ERP winds up showing in theta band of power spectrum, plus see things in power spectrum that you don't see in the ERPs.
2. We can theoretically get more classification juice if we exclude forgotten items from the sleep analysis.  
3. Waiting on James to get power spectrum for bands using Hilbert transform  
4. We have the data to look at wake classification during wake reactivation i.e. can we classify when they're learning the associated locations?   

### TODO ITEMS:
**dot product:**  
<del>currently running sleep log reg mcduff using both faces and scenes, results will be in <code>sleep_xform_mcduff_scene_face_8subjs_dotprod.mat</code></del>  Results in post: sleep-eeg-boosting-results
<del>currently running boosting gentle log reg using both faces and scenes, results will be in <code>boosting_mcduff_best8_gentle_scene_face_dotprod.mat</code></del>Results in post: sleep-eeg-boosting-results, **EXCEPT** for some reason

