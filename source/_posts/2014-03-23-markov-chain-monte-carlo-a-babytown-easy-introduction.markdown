---
layout: post
title: "Markov Chain Monte Carlo: A babytown easy introduction Pt. 1: Markov Chains"
date: 2014-03-23 14:23
comments: true
categories: 
- mcmc
- approximate inference
published: true
---

You know what's great? Ice cream, bourbon, and babies riding (safely) on the backs of puppies are some obvious answers.  Here's a subtler one: *Markov chains*! 

They serve as the basis of many approximate inference techniques and today we're going to take a preparatory step towards learning about Markov Chain Monte Carlo methods. 
    
 <ins>Expository note:</ins> sometimes I find it beneficial to motivate and situate terms and objects after introducting them, so if something comes out of the blue, just trust me that it will get explained.  And if it doesn't get explained, feel free to email me and I will provide you with my address with which you can setup a fiery protest outside of my residence with signs like "We trusted you" and "Betrayal is a four-letter word: luis"
   
---


##### Markov Chain Definition
A Markov chain can be defined via the following\:<br><br>
1. $$t$$, a set of $$N$$ __indices__ (you can think of this as time for the ...time being)  
2. $$S$$, a set of $$K$$ __states__: $$s_1, s_2 ... s_K$$  
3. $$T$$, a __transition matrix__ specifying the probability of transitioning from state $$s_i$$ to $$s_j$$, for all possible pairs of states.  
4. $$P_0$$, a __probability distribution__ over starting states


Let's unpack this by using a toy example.  We can define a Markov chain over the sites I visit at any point in time.  For simplicity's sake, let's keep it to two sites I use: reddit and facebook.  

<div align="center"><img src="/images/latex/mc.svg"></div>

In this scenario, $$S$$, our state space, contains only two states ( i.e. $$K = 2$$): $$s_1 = reddit$$, $$s_2 = facebook$$, depicted as the vertices in the graph above.  

You'll also notice that our graph has some directed edges with numbers on them.  This is one way of representing our transition matrix: the number on each edge indicates the transition probability of going from one state to the next.  For instance, the probability of going from reddit to facebook is $$0.2$$  Below we explicitly show the transition matrix $$T$$, where $$T_{ij}$$ indicates the probability of transitioning to $$s_i$$ from $$s_j$$:  

$$T = \begin{bmatrix} 0.8 & 0.75\\0.2 & 0.25\end{bmatrix}$$


Alright, let's give ourselves a round of applause: we defined two out of the four components of a Markov chain.  
   
__Now what are these indices I was talking about?__  Indices tell us when we are observing our state. At 8:02 PM, I could either be on reddit or facebook, at 8:03 PM might be on either reddit or facebook, etc.  My example is slightly encumbered by the fact that we usually think of time as continuous, but let's pretend that we live in a world of discrete time, where I can only change webpages on the change of the minute.  Futhermore, just to make it easy, let's say we're going to start at 8:00 PM exactly and continue up until 8:59 PM.  

With these assumptions, we can observe our state (reddit or facebook) exactly 60 times: at time $$t_1 = 8:00 PM $$ I can be on either reddit or facebook, at time $$t_2 = 8:01 PM$$, I can be on either reddit or facebook, etc. all the way up to our last index, time $$t_{60} = 8:59 PM$$  
  
So for this weird, chop-suey-time-into-discrete-chunks-and-the-universe-only-exists-for-60-minutes example, our set of indices would have 60 ordered values ( $$ N = 60 $$) because we started this section by saying that our indices tell us when we are observing out state and we only have 60 time points.  

Now let's bust out the old google translate on this to make it a bit more rigorous.  
  
Let's consider some arbitrary time $$t_{n}$$ a.k.a. our $$n^{th}$$ index, we observe one of two possible values from our state space (reddit or facebook) with some as yet undefined probability (recall: our transition matrix $$T$$ defines the probability of transitioning from one state to another, but this is not the same as the probability of being in that state).  If this sounds like a random variable, that's because it is a random variable.

<code>Informal proof: if it looks like a random variable, swims like a random variable,<br>and quacks like a random variable, then it's probably a duck.</code>
  
So, we can use the notation $$X_{t_n}$$ to denote the random variable over states at index $$n$$.  Considering that we have $$N$$ time points or indices, then we actually have $$N$$ random variables - each of which operate over the same state space.  Let's call these random variables $$X_{t_n}$$ for $${t_n} = 1 ... N$$, remembering that our indices or times are a sequence - that is they are ordered.  
  
Finally! We have some sense of what these indices are: our Markov chain defines $$N$$ copies of a random variable $$X$$ - our index tells us which copy.  

I found this concept of indices to be slightly tricky when looking at other types of random processes.  It's tempting to think of the index as time and quite appropriate in this context of Markov chains, but I find the much more useful interpretation is that of having a bunch of copies of a random variable and the index telling you to which copy you are referring.  I will continue to use time and index interchangeably to reinforce this.

__Status:__ we've acquired knowledge of three out of the four components of a Markov chain and still have a ways to go to really understand what a Markov chain is.  
  
---

So let's backtrack a little bit to the transition matrix now that we're viewing our Markov chain as a sequence of random variables..  Our transition matrix $$T$$, specifically $$T_{i,j}$$, tells us the probability of transitioning to some state $$s_i$$ given that we're at some state $$s_j$$.  That last bit implies that at some time, let's call it $$t_n$$, we're at $$s_j$$ and the transition matrix gives us the probability over states for the next time, $$t_{n+1}$$:   
<center> $$P(X_{t_{n+1}} = s_i | X_{t_n} = s_j) = T_{i,j}$$ </center>  
  
Well that's convenient: if I know which state I'm currently in, then all I need to do to predict the next state is look at this transition matrix.  

Let's consider the inconvenient alternative.  The inconvenient alternative would be a case where to figure out the next state, I have to consider not just the state at time $$t_n$$, but the one before that $$t_{n-1}$$, and the one before that, and the one before that, all the way to some initial state.  Well that would be a serious pain in the ass.

  Let's get a better feeling for why.  I want to learn the probability of being on reddit at $$t_3$$, $$X_{t_3} = reddit$$  If we lived in inconvenient land, we would have to consider all possible histories, $$X_{n-1} ... X_{1}$$, of length 2:
     
$$
\begin{align}
P(X_{t_3} = reddit &|\ X_2 = reddit, X_1 = reddit)  \\
P(X_{t_3} = reddit &|\ X_2 = reddit, X_1 = facebook)  \\
P(X_{t_3} = reddit &|\ X_2 = facebook, X_1 = reddit)  \\
P(X_{t_3} = reddit &|\ X_2 = facebook, X_1 = facebook) 
\end{align}
$$  

You could see how this blows up if we wanted to look at $$X_4$$ or $$X_40$$.  For $$X_n$$, we'd have $$K^{n-1}$$ possible histories we'd have to consider (recall $$K$$ is the number of states).  So in our toy case, for $$n = 3$$ and $$K = 2$$ possible states, we have $$2^{2} = 4 $$ possible histories, which is exactly what we see above.   
  
So I have an idea: let's _not_ do the inconvenient thing (go America), let's embrace the Markov property. Markov chains restrict the set of all possible probabilities over sequences to only those which can be explained in terms of "local dynamics".  Essentially, they say, "the past doesn't matter, the only thing that affects my future is the present" - it sounds like some new-age, positive-thinking, crispy-hippie mantra like "the past is in the past" (except that Markov chains are actually useful to society :P).   More formally, the __Markov property__ says:  
  <center>$$ P(X_{t+1} | X_{t}) = P(X_{t+1} | X_t, X_{t-1}, X_{t-2}... X_{1}) $$ </center>
      
Now we can get to the last component.  We have our convenient transition matrix (thanks Markov - you da man) which tells us the probability of a next state given our current state, but what about the first state i.e. $$X_{t_1}$$?  By definition the first state never comes after another state, thus we can't use our transition matrix for $$X_{t_1}$$.  That's where $$P_0$$ comes in - all it does is provide a probability over starting states!  For instance, we can define $$P_0$$ for our starting state as:  
  
<center>$$P_0(X_{t_1} = reddit) = 0.5, P_0(X_{t_1} = facebook) $$ </center>

  __Congratulations:__ we've just defined the last component of the Markov chain.  Celebrate in your preferred fashion, but please don't get too rowdy - Markov chain riots are predictably bad.  Personally, I'd like to celebrate with a nice recap.

A Markov chain is a probability distribution over a sequence of outcomes indexed by a discrete set $$t$$.  We can think of the outcome for index $$t_{n}$$ as a random variable: $$X_{t_n}$$.  Thus, given $$N$$ indices, we have $$N$$ random variables:  $$X_{t_1}, X_{t_2} ... X_{t_N}$$.  The Markov assumptiom allows us to represent this distribution over sequence using just the transition matrix $$T$$, where $$T_{i,j}$$ represents the probability of transitioning from state $$s_j$$ at time $$t_n$$ to state $$s_i$$ at time $$t_{n+1}$$ and a probability distribution over starting states, $$P_0$$.
  
For our toy example, we had N = 60, but __you need to know__ that the index set, $$t$$ could be infinite i.e. $$ N = \infty $$  We'll use this later. As a bonus, it's worth mentioning we can even have an index set which is continuous, these are called continuous-time Markov chains.

<!--
Now we need some way to actually specify the probability of websites I'll be on over the course of the hour - sounds like a [nightmare](http://www.youtube.com/watch?v=sok_KbPG6iw).  This is where the *Markov property* comes in saying that the probability over next states only depends on my current state: $$ P(X_{t+1} | P(X_{t}) = P(X_{t+1} | P(X_{0}, X_{1}, X_{2} ... X_{t}) $$
-->
