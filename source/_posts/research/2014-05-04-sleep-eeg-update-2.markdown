---
layout: post
title: "Sleep EEG Update 2"
date: 2014-05-04 20:53
comments: true
categories: 
- noarchive 
- hide 
- EEG
- sleep
---

Here are some questions/conclusions regarding the new data:

### Are the trained classifier weights highest at the frequencies used to generate the wake template?  For instance, given that sleep data was transformed using the faces template at 230 ms and 10 Hz, does the trained sleep classifier have high weights at 10 Hz?
This does not seem to be the case.  If we look at the averaged (across time bins) classifier weights at each frequency, we see that there are hot spots of increased feature importance at frequencies that do not depend on the parameters used for the wake template generation.  This is illustrated in the figure below: we see increased feature importance at 3 Hz regardless of the  wake time bin and frequency used for generating the wake template.  We might be tempted to say there is a relationship between the encoding frequency and the feature importance at 10 Hz, but I don't buy it given that we only see increased feature importance along the y-axis (indicating that there seems to be something informative about the sleep data at 10 Hz) but not the x-axis.

{% img /images/research/collaped_weights_by_freq_faceMINUSscene_wake_template_subj1.png 700 350 %}

### Are there any trends in increased weights across any of the following parameters?  

#### Frequencies? 
Across both subjects, we see increased feature importance around 3 Hz.  Additionally, we can see, in both subjects, something around the 10 Hz range (10 Hz for subject 1,  7-12 Hz for subject 2) and a faint 

#### Time bins?

#### Face vs. Scene Vs. Face minus Scene

#### Is there a link between the magnitude of the trained sleep classifier weights and the maximum CV accuracy achieved at that particular time bin?  This will indicate whether or not there is a benefit to reducing the classification process even further using a subset of the features.

Future To-do: Is there a link between the trained sleep classifier weights and the average cross-validation accuracy for the shuffled sleep?  What would this tell us about the underlying space?

#### What is the relationship between the weights for the sleep transformed classifier compared to the feature selected weights?
I don't have this data yet.

#### Shuffling results: given that we 
