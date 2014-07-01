---
layout: post
title: "Sleep EEG Update"
date: 2014-05-04 18:45
comments: true
categories: 
- noarchive 
- hide 
- EEG
- sleep
---


### Results

#### Shuffled Cross-validation Accuracy Using Transformed Sleep Data (Item # 5 on To-Do List)
The plots below were using the generate-template-on-wake-then-transform-sleep-data-then-train-a-sleep-classifier approach.  The x-axis corresponds to training on different sleep time bins (although we use all the frequencies) and the y-axis corresponds to using different time-freq pairs to generate the wake template.  The key part of this plot is that we **randomly permuted the sleep labels** - so we would hope to see 50% classification accuracy here (which unfortunately doesn't seem to be the case).  Ideally, I would have multiple iterations of this shuffling, but so far I've only run a single shuffle - **how serious is it that I haven't run multiple iterations?**

{% img /images/research/subject_1sleep_transform_CV_shuffled.png 700 350 %}
{% img /images/research/subject_2sleep_transform_CV_shuffled.png 700 350 %}

#### Sleep Cross-validation Accuracy using different sleep transformations (Item #2 on To-Do List)
Previously, we had only tried the generate-template-on-wake-then-transform-sleep-data-then-train-a-sleep-classifier using the FACE template, the results below show cross-validation accuracy using the face template (same results as presented previously), the scene template, and face-minus-scene.

{% img /images/research/subject_1sleep_transform_CV.png 700 350 %}
{% img /images/research/subject_2sleep_transform_CV.png 700 350 %}
{% img /images/research/subject_3sleep_transform_CV.png 700 350 %}
{% img /images/research/subject_4sleep_transform_CV.png 700 350 %}
{% img /images/research/subject_5sleep_transform_CV.png 700 350 %}
{% img /images/research/subject_6sleep_transform_CV.png 700 350 %}

#### Sleep Cross-validation Accuracy Using All Frequencies Feature Select (Item #4 on To-Do List)
This is pretty straightforward cross-validation accuracy performed on the labelled sleep data.  For each time bin of the sleep data, we z-scored the power spectrum at all frequencies across electrodes and trained a classifier using 10-fold cross-validation using standard p-value based feature selection.

{% img /images/research/all_2_subjects_sleep_CV_feature_select.png 700 350 %}

#### Classifier Weights for sleep transformed data (Item #1 on To-Do List)
Recall that we have a classifier for each combination of wake time-freq pair and sleep time.  Each classifier sweeps the template across each frequency of the time bin, yielding a classifier with as many features as there are frequencies.  Thus, visualizing the weights would require displaying the magnitude of the weight across three dimensions: wake time-freq pair, sleep time bin, and sleep frequency.  Instead of trying to plot some whacky surface, I've created plots that average the magnitude of the weights either across the sleep time bins OR across sleep frequencies - if a particular time bin or frequency looks promising from these plots, we can look at the uncollapsed results as needed.

The value displayed below is taken as follows:  
<code>
for each wake time-freq bin x sleep time bin pair:<br>
 &nbsp; &nbsp; &nbsp; &nbsp;for each cross-validation iteration:<br>
		 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;z-score weights<br>
	&nbsp; &nbsp; &nbsp; &nbsp;Avg weights over cross-validation iterations and take absolute value<br>
</code>

This 3d matrix was then collapsed either across sleep time bins or sleep frequencies.  This was done for the various wake templates.  
     
**KEN:** I know this is pretty different than the McDuff method for interpreting feature weights - but the requirement to average over the patterns made things difficult so I did things this way as a much easier to accomplish first pass.  It's worth noting that the EEG analysis code rescales all features to be within the range of 0 and 1, so I think this crude way of looking at the features should still be pretty informative.

#### Face Minus Scene Wake Template
{% img /images/research/collaped_weights_by_freq_faceMINUSscene_wake_template_subj1.png 700 350 %}
{% img /images/research/collaped_weights_by_freq_faceMINUSscene_wake_template_subj2.png 700 350 %}

#### Face Wake Template
{% img /images/research/collaped_weights_by_freq_face_wake_template_subj1.png 700 350 %}
{% img /images/research/collaped_weights_by_freq_face_wake_template_subj2.png 700 350 %}

#### Scene Wake Template
{% img /images/research/collaped_weights_by_freq_scene_wake_template_subj1.png 700 350 %}
{% img /images/research/collaped_weights_by_freq_scene_wake_template_subj2.png 700 350 %}


#### Face Minus Scene Wake Template
{% img /images/research/collapsed_weights_by_sleep_time_faceMINUSscene_wake_template_subj1.png 700 350 %}
{% img /images/research/collapsed_weights_by_sleep_time_faceMINUSscene_wake_template_subj2.png 700 350 %}


#### Face Wake Template
{% img /images/research/collapsed_weights_by_sleep_time_face_wake_template_subj1.png 700 350 %}
{% img /images/research/collapsed_weights_by_sleep_time_face_wake_template_subj2.png 700 350 %}


#### Scene Wake Template
{% img /images/research/collapsed_weights_by_sleep_time_scene_wake_template_subj1.png 700 350 %}
{% img /images/research/collapsed_weights_by_sleep_time_scene_wake_template_subj2.png 700 350 %}
<!--### Questions-->
<!--##### Classifier Weights-->
<!--#. When we look at the magnitude of the trained classifier weights for various wake-template-frequencies, do we see that the weights are generally bigger at the frequencies that -->

<!--#### -->
