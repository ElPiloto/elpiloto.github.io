---
layout: post
title: "Sleep EEG: Varying regularization and simulated results"
date: 2014-08-01 10:27
comments: true
categories: 
- noarchive 
- hide 
- EEG
- sleep
---

### Logistic Regression Untransformed Sleep Data: Varying regularization term
The motivation for this line of inquiry is contained in [this post](/blog/2014/07/27/sleep-eeg-post-boosting-results/) under the discussion section for figure 4.

{% img /images/research/untransformed_log_reg_lambda250and750.jpg 700 350 %}

**Figure 1:** This shows the sleep classification accuracy for logistic regression using untransformed sleep data with <code>statmap_anova</code> feature selection (stat_thresh = 0.1).

**Thoughts** Well this is interesting.  I had previously been using a regularization term of 1 for all the logistic regression analyses and to see this level of classification accuracy using a regularization penalty two orders of magnitude higher than previously suggests that I didn't have much of a grasp on the role of the regularization term in this analysis.  The $\lambda = 750$ case is encouraging because it's up there in terms of the highest average classification accuracy we've seen AND it includes that largest regularization term we've used thus far.  It's worth investigating how far we can push regularization before it collapses, thus I've launched an additional analysis trying results with regularization = 1250 and 1750.  Will update this post when those results are in.  ALSO, this begs the question: should we re-run our sleep transformed analyses using stronger regularization for the wake classes?  **YES**

{% img /images/research/untransformed_log_reg_lambda1250and1750.jpg 700 350 %}

**Figure 2:** This shows the sleep classification accuracy for logistic regression using untransformed sleep data with <code>statmap_anova</code> feature selection (stat_thresh = 0.1).

**Thoughts:** This still doesn't make it seem like we've hit the upper bound on the regularization penalty. I'm not sure what to make of the fact that 750 = good regularzation, 1750 = good regularization, but 1250 gives pretty crappy results.  I guess I don't have any strong theoretical justification to think classification accuracy would vary smoothly as we modify the regularization parameter.  I'm now launching sleep untransformed classification on _all_ the subjects with a high regularization term.

{% img /images/research/untransformed_log_reg_lambda12000_ALLSUBJS.jpg 700 350 %}

**Figure 3:** This shows the sleep classification accuracy for logistic regression using untransformed sleep data with <code>statmap_anova</code> feature selection (stat_thresh = 0.1).

**Thoughts:** This is clearly too high for most subjects. Although __some__ of the subjects that have been doing well in our "best 8" analysis get pretty good classification with $\lambda = 2000$, which is unsurprising given their results for $\lambda = 1750$, some other subjects (e.g. subject 7) that did well are now getting below-chance accuracy.  The flop of some of the good "best 8" subjects from above to below chance accuracy makes a good case for reducing the regularization penalty.  Thus, I'm gunna try running all subjects with a smaller value for $\lambda$ because the infrastructure is in place to do that.

### Simulated Results

<del>**STILL CODING**</del> **PUT ON HOLD, GOING TO TRY HILBERT TRANSFORMED DATA ANALYSIS FIRST**



<!--Ken is most interested in the hilbert-transformed data in the hopes that the Hilbert stuff will clean up (induce consistency across subjects) for wake.  Hopefully see good classification across subjects theta, 200-ish, also which electrodes are informative.-->
