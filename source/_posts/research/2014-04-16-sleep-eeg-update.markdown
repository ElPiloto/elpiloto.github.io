---
layout: post
title: "Sleep EEG Update"
date: 2014-04-16 12:50
comments: true
categories: 
- noarchive 
- hide 
- EEG
- sleep
---

### Classification results:

So far I've swept through the various time bins for two subjects and ran cross-validation on the wake data.  This was performed using leave one out cross-validation, zscoring the data across electrodes.   Additionally, I trained the classifier on all five categories (Faces, places, objects, scrambled faces, scrambled places), but only used the examples corresponding to faces or places for cross validation accuracy.  
  
Git branch: <code>sweep_features</code>
Git commit id#: <code>59c7561e0</code>
  
Below is a plot of the results I got, although the **columns are incorrect:**   
- Column 1: Subject 1, Lambda = 1  
- Column 2: Subject 2, Lambda = 1  
- Column 3: Subject 1, Lambda = 50  
- Column 4: Subject 2, Lambda = 50  
- Column 5: Subject 1, Lambda = 100  
- Column 6: Subject 2, Lambda = 100  

{% img /images/research/sweep_time_bins.png 650 550 %}

### Next Steps:  

- Look at next steps from previous meeting, they haven't changed.
