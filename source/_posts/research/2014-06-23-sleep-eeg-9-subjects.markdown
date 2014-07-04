---
layout: post
title: "Sleep EEG 9 Subjects"
date: 2014-06-23 12:14
comments: true
categories: 
- noarchive 
- hide 
- EEG
- sleep
---

### Wake Classification Results
These are important because it's likely we'll want to exclude subjects with poor wake cross-validation AUC from subsequent analyses.

{% img /images/research/sleep_eeg_9_subjects_06_23_2014/wake_AUC_most_subjects.png 700 350 %}
  
**Figure 1:** This shows the AUC for leave-one-out cross-validation on wake EEG data training on all the z-scored frequencies corresponding to a particular time bin as indicated on the y-axis.  The AUC was calculating by training a classifier that distinguishes between all classes, but only testing on patterns that corresponded to either a celebrity or a landmark.  The AUC was calculated by feeding in the difference between the output for the celebrity one-vs-all classifier and the landmark one-vs-all classifier for each cross-validation fold and the plotted values show the mean AUC across all cross-validation folds.  We had previously looked at the cross-validation accuracy for the first two subjects across a wider range of times, but narrowed it down to these four windows.

<code>plot_loopify_time_sweep_results_AUC.m </code>    
<code>classify_piloy_log_reg_time_sweep_driver.m </code>      
  
Commit ID: <code> </code>     

### Sleep Cross-Validation Classification: All Frequencies Per Time Bin  
**NOTE:** These results were supposed to be for performing feature selection, but I accidentally set the feature selection statistical threshold to 1, which is the same as not using feature selection.  <del>Re-running these results with feature selection.</del>  The results actually containing feature selection are just below.

{% img /images/research/sleep_eeg_9_subjects_06_23_2014/all_9subjects_sleep_CV_AUC_feature_select.png 700 350 %}
**Figure 2a)** We plot the AUC for classification of celebrity vs. landmarks during sleep across all our subjects (y-axis).  This was calculated by performing cross-validation (somewhere between 15-fold and 40-fold depending on the number of sleep patterns available) using all frequencies z-scored across electrodes for a particular timebin (x-axis).   
{% img /images/research/sleep_eeg_9_subjects_06_23_2014/all_9subjects_sleep_CV_AUC_feature_select_PVAL.png 700 350 %}
**Figure 2b)** We plot the p-values for combinations of subjects and time bins with sleep cross-validation AUC values that are calculated via a shuffled permutation test whereby the labels of the classes are shuffled, we train a classifier with the shuffled patterns, and look at the cross-validation AUC for this shuffled dataset. Areas in red have p-values > 0.05.
{% img /images/research/sleep_eeg_9_subjects_06_23_2014/all_9subjects_sleep_CV_acc_feature_select.png 700 350 %}
**Figure 2c)** Instead of calculating the AUC, we plot the classification accuracy - this should be pretty similar to Figure 2b.
{% img /images/research/sleep_eeg_9_subjects_06_23_2014/all_9subjects_sleep_CV_acc_feature_select_PVAL.png 700 350 %}
**Figure 2d)** Here we plot the p-values for the classification accuracies.

### Sleep Cross-Validation Classification Feature Selection: All Frequencies Per Time Bin  

{% img /images/research/sleep_eeg_9_subjects_06_23_2014/9_subjects_CV_ACTUAL_AUC_feature_select.png 700 350 %}
**Figure 3a)** We plot the AUC for classification of celebrity vs. landmarks during sleep across all our subjects (y-axis).  This was calculated by performing cross-validation (somewhere between 15-fold and 40-fold depending on the number of sleep patterns available) using all frequencies z-scored across electrodes for a particular timebin (x-axis).   
{% img /images/research/sleep_eeg_9_subjects_06_23_2014/9_subjects_CV_ACTUAL_AUC_feature_select_PVAL.png 700 350 %}
**Figure 3b)** We plot the p-values for combinations of subjects and time bins with sleep cross-validation AUC values that are calculated via a shuffled permutation test whereby the labels of the classes are shuffled, we train a classifier with the shuffled patterns, and look at the cross-validation AUC for this shuffled dataset. Areas in red have p-values > 0.05.
{% img /images/research/sleep_eeg_9_subjects_06_23_2014/9_subjects_CV_ACTUAL_acc_feature_select.png 700 350 %}
**Figure 3c)** Instead of calculating the AUC, we plot the classification accuracy - this should be pretty similar to Figure 2b.
{% img /images/research/sleep_eeg_9_subjects_06_23_2014/9_subjects_CV_ACTUAL_acc_feature_select_PVAL.png 700 350 %}
**Figure 3d)** Here we plot the p-values for the classification accuracies.

### Sleep Cross-Validation: Transform Sleep Pattern By Average Wake Pattern
[ dump of plots ]( /blog/2014/07/01/sleep-eeg-transform-avg-pattern/ )   
  
We have 4 x 3 plots per subject (4 plots (AUC, accuracy, and p-val map for both of those) for each result, 3 different results: one for transforming the sleep data with the average face pattern, one for transforming with the average scene pattern, and one for transforming with the difference between the average face and average scene)

### Sleep Cross-Validation: Transform Sleep Pattern By McDuff Importance Map
[ dump of plots ]( /blog/2014/07/01/sleep-eeg-mcduff-transform/ )   
  
We have 4 x 3 plots per subject (4 plots (AUC, accuracy, and p-val map for both of those) for each result, 3 different results: one for transforming the sleep data with the face mcduff importance map, one for transforming with the scene mcduff importance map, and one for transforming with the difference between the face and scene importance maps)
