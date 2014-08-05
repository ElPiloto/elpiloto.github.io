---
layout: post
title: "Sleep EEG: Post Boosting Results"
date: 2014-07-27 14:46
comments: true
categories: 
- noarchive 
- hide 
- EEG
- sleep
---

### Our to-do list consists of the following:
1. logistic regression on sleep data using data from all time bins of the sleep data and compare this to existing results from boosting  
2. try boosting and logistic regression using **untransformed** sleep data (large volume of data)
3. look at various other parameterizations of boosting classification result (just because it's easy to do)
4. Let's look at what happens when the classifier gets fed in both face and scene transformed data   
5. Let's look at when the classifier gets transformed using both face and scene transformed data using the DOT product (see post )  

### As a refresher, here is the last boosting result:

{% img /images/research/ensemble_best_8_wake_subj_202ms_7hz_gentle.jpg 700 350 %}

**Figure 1:** The y-axis shows classification accuracy.  Subjects and parameters are shown along the x-axis (g = gentleboost algorithm, f = face mcduff importance sleep transform).

## Logistic Regression Sleep Importance Map Transformed Results (To-Do Item #1)
{% img /images/research/log_reg_best_8_subjects_mcduff_xform.jpg 700 350 %}
    
**Figure 2a:** Displayed above is the classifier accuracy for all subjects(x-axis).  The classification accuracy was generated for various sleep importance map transformations (face, scene, or face minus scene), which is indicated along the y-axis.  The classifier features consisted of transforming the sleep data at each timebin and concatenating the sleep transformed data at each timebin into a single data matrix.  The entries along the x and y axis labelled "Mean" simply show the mean along the x and y axis respectively.

**Thoughts**: These results lend further credence to the notion that it may be beneficial to sleep transform data according to both face and scene classifiers and feed both of those into a single classifier.  This idea that perhaps there is information in the scene pattern that isn't in the face pattern (and vice versa) can be further scrutinized by looking at MDS plots of the untransformed data, the face transformed data, and scene transformed data - this may be worth doing depending on how much free time I have.  If I don't end up looking at that, I'm not too upset since item #2 on the to-do list will also give us information about the role of the sleep transformation.  Additionally: note that the average classification accuracy, across both subjects and sleep transformation types, is pretty similar to that achieved with boosting, but none of the individual sleep transformations really give the same classification accuracy profile across subjects as the boosting results (this is easier to see in the plot below where I plot the rows of Figure 2 as separate horizontal bar graphs to match the format of the boosting results.  Why does it matter that accuracy across subjects in the logistic regression case doesn't look like the accuracy achieved with boosting?  If our sleep transformation method yielded enough signal, then it should yield similar classification accuracy across subjects for the different classifier types.

{% img /images/research/log_reg_best_8_subjects_mcduff_xform_supplement.jpg 700 350 %}
**Figure 2b:** A different visualization of the logistic regression plots useful for direct visual comparison against the ensemble results (Figure 1).


## To-Do Item #3: Boosting Classification Results Using Different Sleep Transforms, Best 8 Subjects
{% img /images/research/ensemble_best_8_wake_subj_202ms_7hz_gentle_ALL_TRANSFORMS.jpg 700 350 %}

**Figure 3:** This shows boosting classification accuracy using different sleep transforms.  The x-axis indicates which boosting algorithm (g for gentleboost) was used, the subject id (e.g. '15' or '07'), and the wake pattern that was used for the sleep transformation (f = face, s = scene, M = face minus scene).

**Thoughts:** This is a clear example where the classification accuracy results would look totally different based on which analysis parameters we use.  I suspect that if we get around to doing boosting classification using both the scene and face transformation, that will look entirely different, too.

## To-Do Item #2: Logistic Regression Classification Results Sleep - UNTRANSFORMED, Best 8 Subjects
<del>**3/23 JOBS STILL RUNNING ON CLUSTER**  This takes a relatively long time because the feature selection has to operate over ~100,000 features and that needs to run for each cross-validation fold for each subject.</del>  The results are displayed below

{% img /images/research/sleep_log_reg_raw_best8.jpg 700 350 %}

**Figure 4:** This shows the result of performing logistic regression on the raw sleep data using all frequencies, all time bins, and all electrodes on raw data.  This amounts to about 100,00 features (64 electrodes x ~47 frequencies x ~38 time bins ) so obviously I need to run this analysis with feature selection.  I really wanted to include as many features as I could (without exceeding my RAM limits), so I used a loose stat threshold for statmap_anova feature selection (p = 0.1) which yielded about 10,000 features.

**Thoughts:** This tells us that this data is damn noisy, we need to be smarter about what features we're putting into the data.  Straightforward logistic regression isn't working particularly well on this - it might be worth explicitly using LASSO instead of ridge regression as we're currently using.  Additionally, I found something in the documentation of the <code>logRegFun</code> that suggests I should be trying much higher regularization values than I have been.  I'm going to try this out since it's easy to run and I want to explicitly rule out the penalty term as why we're not getting poor results. I will also look into whether or not it's easy to use LASSO.  **Update** There does seem to be L1 regression in the MVPA toolbox via the <code>SMLR</code> function, although it implements multinomial regression (as compared to the current method of training a single logistic regression classifier for each class), however, it seems like it'll bw

I think the fact that these results are comparable to the sleep transformed data in terms of classification accuracy tells us something about the sleep data, not necessarily about the sleep transformation.  I have to double-check the linear algebra behind this interpretation of the sleep data, but I think that when we transform the sleep data, we're essentially projecting each dimension of the sleep data onto a single vector defined by the average pattern.  Now: if there is some best subspace of the untransformed data where the classes are just barely separable (i.e. you could get 52% accuracy), then whether or not we transform the sleep data won't really matter.  If we don't project, we can build a classifier that goes along the subspace I mentioned.  If we do project, then that same subspace will manifest in a different basis, but with the same separability.  Obviously you won't get this barely classifiable subspace if the vector onto which you project is orthogonal to the subspace, but if there are multiple, weakly classifiable subspaces in the data - which is not crazy to think if the data are in general weakly separable, then one of these subspaces will not be orthogonal to the vector you're choosing yielding once again a weakly separable subspace.  In fact, I suspect that we should be able to project onto random vectors and get the same classification accuracy on average - this comes from some light reading into random subspace projection theory where given a random projection you can give a probabilistic bound on the dot product between two vectors in a random subspace as a function of their dot product in the original space i.e. with some probability the dot product in the transformed space will be within some range of the dot product in the original space.  This is all pretty loosey goosey linear algebra logic, but I think it's a start in the right direction for understanding what's up with the transform vs untransformed data.

## To-Do Item #4:  Feed classifiers face AND scene transformed data using McDuff Importance Maps

{% img /images/research/ensemble_best_8_wake_subj_202ms_7hz_gentle_face_AND_SCENE.jpg 700 350 %}

**Figure 5a:** Boosting classification exactly like the Figure 1) except that these incorporate a feature vector that consists of transforming all frequencies with the importance map for scene and concatenating those features onto the feature vector generated by transforming all frequencies in the sleep data with the importance map for faces.

{% img /images/research/log_reg_sleep_mcduff_best8_faceSCENEtogether.jpg 700 350 %}

**Figure 5b:** Exactly the same as figure 2a, recall we're feeding in all the timepoints to logistic regression (no explicit feature selection in this version, although we still use regularization), except this time we used both face and scene transformed features in the data.

**Thoughts:** Well, not uniformly super awesome classification results for both methods, BUT I'm pretty happy to see that they have the same general profile: across both analyses subjects 11,13,15 and 5,7,8 both pop out whereas classification is poor for both subject 9 and subject 1 in both analyses.  Consistency across analyses is the only proxy we currently have for assessing whether our results are due to random chance so this is a relatively nice result in that context.  That's a score for the veracity of our results, but the other key aspect of evaluating our results, how good the results actually are, is still lacking.  Barring success with modifying the regularization term, we'll have to look into more explicit electrode filtering and using Hilbert transformed data to try to improve our results.  **Importantly** I'd like to run future analyses this same way: modifying features, but running them through both classifiers to make sure we're getting consistent results.

## To-Do Item #5:  Feed classifiers face AND scene transformed data using McDuff Importance Maps with DOT PRODUCT instead of correlation as pattern similarity measure
<del>**IMPORTANT:** For some reason, the boosting results look EXACTLY the same as the correlation-based boosting results.  This is strange because I explicitly verified the dot product and correlation calculations actually give different values. I'm investigating whether or not this is a bug as we speak, just gotta manually step through both the correlation and the dot product code which is a pain in the, as they say in the medical field, patootie.</del>

**UPDATE:** Comparing the preprocessed data using the dot product and correlation, it looks like the data being processed is in fact different for the boosting classifier i.e. I don't think that this is a bug.  Looking into it more, given that the correlation is the normalized dot product, it makes sense that we get different results for logistic regression but not the boosting ensemble.  Why? Well, logistic regression regularization term penalizes the magnitude of the weights, thus keeping the same regularization penalty but scaling the weights is effectively the same as keeping the same weights but modifying the regularization term.  However, boosting just creates decision stumps which will split the data regardless of whether or not the data are normalized.  Thus these results make sense: all is right with the world.  Kind of.

{% img /images/research/8_wake_subj_202ms_7hz_gentle_faceSCENE_DOTPROD.jpg 700 350 %}

{% img /images/research/log_reg_sleep_mcduff_best8_faceSCENEtogether_DOTPROD.jpg 700 350 %}


