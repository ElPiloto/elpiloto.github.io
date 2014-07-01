---
layout: post
title: "Sleep EEG Meeting: First Pass New Pilot Data"
date: 2014-03-27 11:29
comments: true
categories: 
- noarchive 
- hide 
---

## Meeting with Ken:

### Status
Recently received new pilot data from James.  First pass at classification with variety of classification styles didn't yield phenomenal results (0.25-0.29 using 5 categories)

### Next Steps  
  
##### General Classification
Decided __we should try to isolate exactly when the training data is most classifiable__ - there's no reason that the time point feature in wake data should match up with time point features
in sleep data.  
  
The general gist of the analysis is this: assuming we have $$t$$ time points, let's create a plot with $$ t $$ data points, where the y-axis plots the _cross-validation_ accuracy using just that particular time point.  We hope that, like Ehren found, there will be a single or range of timepoints that are most predictive between the face categories.  Once we've isolated this best time point, we perform the same style of search over the frequencies.  We do this because we don't necessarily have a notion of how frequencies will carry over into sleep, so instead, we z-score the frequencies across channels to produce a type of topography (manifested in the form of a single z-scored vector across channels) and see which topography is most discriminative.  
    
  So how do we __use__ this if the sleep data has the full set of time and frequencies?  We __create a new feature set__ by taking the dot product of each (z-scored) channel, frequency topography against the z-scored, channel frequency  topography for the sleep data.  This will produce exactly channel x freq x time features with which we can try to perform cross-validation __on the sleep data__
  
##### Plotting Results + Dif. Time/Freq Bins
Ken wants me to pick up the following from Ehren:   
1. Plot AUC plots - __not optional__  
2. Look at how Ehren did binning, this reflects a lot of careful consideration on his part  - __as needed__  
   
##### Logistics
Agreed that I can allocate one day a week to this sleep EEG project
