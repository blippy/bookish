Basyesian Billiards
===================

Mark Carter

6 July 2015

**Abstract** This page is my attempt at solving the Bayesian Billiards Problem stated by
[Allen Downey](http://allendowney.blogspot.co.uk/2015/06/bayesian-billiards.html) using Haskell.

Problem Statement
-----------------

Quoting from Downey's blog:

<blockquote>
Alice and Bob are playing a game in which the first person to get 6 points wins. The way each point is decided is a little strange. The Casino has a pool table that Alice and Bob can't see. Before the game begins, the Casino rolls an initial ball onto the table, which comes to rest at a completely random position, which the Casino marks. Then, each point is decided by the Casino rolling another ball onto the table randomly. If it comes to rest to the left of the initial mark, Alice wins the point; to the right of the mark, Bob wins the point. The Casino reveals nothing to Alice and Bob except who won each point. 

Clearly, the probability that Alice wins a point is the fraction of the table to the left of the mark-call this probability p; and Bob's probability of winning a point is 1 - p. Because the Casino rolled the initial ball to a random position, before any points were decided every value of p was equally probable. The mark is only set once per game, so p is the same for every point. 

Imagine Alice is already winning 5 points to 3, and now she bets Bob that she's going to win. What are fair betting odds for Alice to offer Bob? That is, what is the expected probability that Alice will win?
</blockquote>


Downey also references his blog post on [reddit](https://www.reddit.com/r/statistics/comments/3b3ol8/the_bayesian_billiards_problem/), which is useful for follow-up comments.

Solution using Haskell
----------------------

Here is my approach to the problem. I will use a PMF (Probability Mass Function), which is a discrete function, rather than try to attack the problem as a continuous case.

This allows us to print floats nicely:

>import Numeric (showFFloat)

Function to normalise the likelihoods so that the probabilities add to 1:

>norm xs = map (\x -> x / sum xs ) xs

Define a couple of convenience functions for the probabilities associated with each "bucket"
in our PMF:

>pbuck :: Int -> Int -> Double
>pbuck nbuckets i = fromIntegral (i-1) / fromIntegral (nbuckets-1)
>
>pbucks :: Int -> [Double]
>pbucks nbuckets = [ pbuck nbuckets i | i <- [1..nbuckets]]

Define the beta distribution:

>beta alpha beta nbuckets =  
>  norm [ p ** (alpha-1.0) * (1.0-p) ** (beta-1.0) | p <- pbucks nbuckets]

I will use the same number of buckets as Downey:

>nbuckets = 101

I take as my initial prior probability distribution Beta(1,1). We are told that Alice has scored 5, and Bob has scored 3. So the distribution that incorporates this extra information is:

>pmf1 = beta 6 4 nbuckets

Alice only has to score 1 point to win the game. If the probability of winning any game is `p`, then the probability that she will win is the same as 1 minus the probability that Bob will lose the next 3 games:

>prob p = 1.0 - (1.0-p)**3.0

Downey presents a more generalised discussion on probabilities for more complicated cases. For this discussion, I have simplified the problem given the known information.

Now weight the probabilities of Alice winning:

>wgts = [ (prob x) * y | (x, y) <- zip (pbucks nbuckets) pmf1]

The probability, or `expected value` of Alice winning is just the sum of this weights:

>eva = sum wgts

whilst for Bob it is simply:

>evb = 1.0 - eva

Here is a simple main driver routine for the above calculations:

>main = do
>   putStrLn $ "Prob of Alice winning: " ++ showFFloat (Just 8) eva ""
>   putStrLn $ "Prob of Bob winning:   " ++ showFFloat (Just 8) evb ""


Output
------

Running `main` produces the following output:

    Prob of Alice winning: 0.90909091
    Prob of Bob winning:   0.09090909

This agrees with the answer given by Downey.
