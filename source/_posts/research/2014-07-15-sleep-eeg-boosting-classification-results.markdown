---
layout: post
title: "Sleep EEG: Boosting Classification Results"
date: 2014-07-15 09:37
comments: true
categories: 
- noarchive 
- hide 
- EEG
- sleep
---
## The results below "Ensemble Classification Results, Round 1" are all useless

I messed up the calculation of average pattern in wake classification (which is used in creating the mcduff importance map in the preprocessing below).

### Ensemble Classification Results, Round 6 - Cross-validation subject 1

{% img /images/research/ensemble_results_subj1_round6.jpg 700 350 %}

{% img /images/research/ensemble_results_subj1_round6pt2.jpg 700 350 %}

{% img /images/research/ensemble_results_subj1_round6pt3.jpg 700 350 %}

### Ensemble Classification Results, Round 3 

I used the following values to produce the plot below:
10-fold cross validation, GentleBoost, 200 Learners, Wake Time = 152ms, Freq = 7 Hz, Importance Map for Face

{% img /images/research/ensemble_results_subj1thru8_round3.jpg 700 350 %}


### Ensemble Classification Results, Round 1 (INCORRECT)
**these results are wrong - leaving here for historical purposes only**

Previously, I went through and tried various combinations of boosting algorithms (LogitBoost, GentleBoost, Adaboost.M1), number of learners, and number of folds for a single subject (subject 01) to try to determine what to run across all subjects to get the best tradeoff between accuracy and running time.  Below is a summary of those results.

{% img /images/research/subj1_ensemble_params_testing.png 700 300 %}

Ultimately, I chose the following:   
  **GentleBoost:** just as good accuracy as other algorithms *and* better running time than AdaBoost.M1 or LogitBoost for some parametrizations     
  **50-fold cross-validation:** it seemed to me like accuracy would increase with the number of folds     
  **400 Learners:** I was skeptical of AdaBoostM1's results with 700 learners, that begin to overfit, so I aimed for something slightly higher than what I had tried (300 learners) that wouldn't go too far in terms of overfitting.

Below are the results for running **GentleBoost** using the aforementioned parameters, transforming the sleep data with a face minus scene McDuff importance map using wake data from time-bin = 230ms and freq = 11 Hz.   
j  

This is below what we'd like to get and is lower than I would have expected for the first subject.  Possible reasons this could be the case:  
  - not enough data per fold  
  - I (accidentally )probed boosting results on subject 1 with different parameters than used for the current results:   
     - time bin = 152 ms  
     - freq = 7 Hz   
     - mcduff pattern = face   

{% img /images/research/ensemble_results_subj1thru8_round1.jpg 700 350 %}

### Next Steps

The easiest problem to check for is to see if we get better results with more data in each fold, so I've launched a batch of results that use 20 folds.  This should give new results relatively quickly and we can move from there.  If that doesn't ameliorate the poor accuracy, I'll move to using the wake parameters used to probe subject 1 to make sure that the results for subject 1 are consistent with the results I got during the probing phase.
