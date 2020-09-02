# Statistical inferences

"Generating conclusions about a population from a noisy sample", with 
statistical inference we are trying to generate knowledge, to extend beyong our 
data to a population  to give answers.  

Statistical inference are estimators of things that we are actually trying to 
estimate. Frequency styling inference is the most widely used method of 
statistical inference in practice

## Probability 

Probability is the measure of the likelihood that an event will occur in a 
Random Experiment.
Probability is not something in the data that we have but it is a conceptual 
thing that is in the population that we'd like to estimate.

* Probabilty calculus works by collecting data that's going to be used to
estimate properties of the populations
* Random variable is numerical outcome of an experiment - discrete or continous.

### Probability mass function(pmf)
Associated with discrete random variables. The probability that a random 
variable takes that value. To be valid pmf, the function must satisfy:
- It must be greater than 0
- sum of probabilities of all possible values must be 1
eg: Binomial(Bernolli), Poisson

### Probability density function(pdf)
Associated with continous random variables. A function to be pdf, must satisfy:
- Must be greater than or equal to 0
- Total area under it must be 1

Areas under the pdfs correspond to probabilities for that random variable. 

### Cumulative density function(cdf)
returns the probability that the random variable X,is less than or equal to the 
value x.
```
  F(x) = P(X<=x)
```  
Can be applied for both discrete and continous random variables.

### Survial function 
For a random variable X, the survival function is defined as the probability 
that the random variable is greater than the value of x.
```
  s(x) = P(X>x)
```
It is 1 minus the distribution function- F(X).  

```
  S(X) = 1 - F(X)
```

### Quantiles   

They can be considered as cut points dividing the range of a probability 
distribution into continuous intervals with equal probabilities.
Finding datapoints such that some percentage of the remaining data lie below it.  

eg: The 95th percentile of a population distribution is the point such that the 
probability a random variable is drawn from that population is less than that 
value is 95% and the probability that the random variable drawn from the 
population is more is 5%

## Conditional probability  

The probability of a random variable, A, given an event, B has occured.
```
  P(A|B) = (P(AUB)P(B))/P(A)
```  

eg: The probability of a person being struck by lightning is very low, but that 
of getting  struck by lightning while in an open field during a lightning storm 
is much higher. Here the probability of gettign struck by lightning is
conditioned on the (probability of) event B, ie, whether the person is inside or 
in the open.

```
  P(A) = P(A|B)P(B) + P(A|B')P(B')
```  

### Diagnostic tests based on bayes's Rule 
Let + and - be the events that the result of a diagnostic test is positive or 
negative respectively. Let D and D' be that the subject of the test has or does 
not have the disease respectively. 
```
  - Sensitivity : P(+|D)
  - Specificity : P(-|D')
```
Positive predictive value : P(D|+)
Negative predictive value : P(D'|-)
Prevalance of disease : P(D) .. The probability of having the disease in the 
absense of the test

The probability of person having the discease given that the test is positive is 
```
  P(D|+) = P(+|D)P(D)/(P(+|D)P(D)+P(+|D')P(D'))
```  

The probability of person does not have the discease given that the test is 
positive is  
```
  P(D'|+) = P(+|D')P(D')/(P(+|D)P(D)+P(+|D')P(D'))
```  

The ratio of the above two probabilities gives us the likelihood ratio.
```
  P(D|+)/P(D'|+) = P(+|D)P(D)/P(+|D')P(D')  
```  

where **P(D|+)/P(D'|+)** represents the odds of the person having the diesase in
the presence of the test, **P(D)/P(D')** represents the odds of the person
having the disease in the absence of the test.  

And **P(+|D)/P(+|D')** is the diagnostic likelihood ratio for the positive test 
result.  

This tells us that the pretest odds of disease times the diagnostic likelihood 
ratio, equals the post-test odds of disease.

The diagnostic likelihood ratio for positive test, DLR+, is given by 
```
  DLR+ = sensitivity/(1-specificity)
```  

Irrespective of what the pre-test odds are, you multiply them times the DLR+ to 
obtain the post-test odds.  

In case of a negative test, DLR- is given by,   
```
  DLR- = (1-sensitivity)/specificity
```  

The hypothesis of the disease is supported DLR- times that of the hypothesis of 
the absence of disease given the negative test result.

### Independence 
If probability of A given B, P(A|B), is equal to probability of A, P(A), for 
P(B) > 0, we can say that the probability of A is independent of the event B.

Random variables are said to be iid if they are  independent and identically 
distributed, based on
- Independent : Statistically unrelated from one and another
- Identically distributed : All having been drawn from the same population 
distrubtion

iid random variables are the default model for random samples.

## Expected Values 

The process of making conclusions about populations from noisy data that was 
drawn from it. 
- **mean** is the center of the distribution.
- **variance** talks about how spread out the data is 

