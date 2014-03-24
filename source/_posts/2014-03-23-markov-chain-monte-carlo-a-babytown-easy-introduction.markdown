---
layout: post
title: "Markov Chain Monte Carlo: A babytown easy introduction"
date: 2014-03-23 14:23
comments: true
categories: 
- mcmc
- approximate inference
published: false
---

You know what's great? Ice cream, bourbon, and babies riding (safely) on the backs of puppies are some obvious answers.  Here's another one: markov chains! 

Markov chains allow seemingly complex sequences to be explained in terms of local dynamics.  Essentially, they say, "the past doesn't matter, the only thing that affects my future is the present" - it sounds like some new-age, positive-thinking, crispy-hippie mantra like "the past is in the past" (except that markov chains are actually useful). 

Let's dig into some details.  Markov chains describe a sequence of random variables $$ X_0, X_1 ... X_T $$.  That is, at any given time $$t \in 1...T$$, our chain can be in one of, let's say, $$N$$ states: $$X_t = s, s \in {S_1...S_N}$$.  For instance, let's work on a markov chain that specifies the probability over which website I'm browsing inbetween the hours of 6:00 PM and 7:00 PM, assuming I only visit one of the following three websites:  
1. facebook  
2. reddit  
3. themostamazingwebsiteontheinternet.com  

$$t$$ ranges from 6:00 PM to 7:00 PM in discrete intervals of a minute:  
$$t_0 = 6:00 PM, t_1 = 6:01 PM, t_2 = 6:02 PM, ... t_6 = 7:00 PM $$

Now we need some way to actually specify the probability of websites I'll be on over the course of the hour - sounds like a [nightmare](http://www.youtube.com/watch?v=sok_KbPG6iw).  This is where the *markov property* comes in saying that the probability over next states only depends on my current state: $$ P(X_{t+1} | P(X_{t}) = P(X_{t+1} | P(X_{0}, X_{1}, X_{2} ... X_{t}) $$

So imagine this:
