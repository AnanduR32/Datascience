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
```
Var(X) = E[(X-mu)^2] = E[X^2] - E[X]^2
```  
Square root of variance is called standard deviation, which is done to express
the spread of the data in the same units as that of the sample distribution.    
Note: Population variance associated with the distribution given by the flip of 
a *biased* coin is **p(1-p)**  

Population mean being centre of mass of the population, sample mean centre of 
mass of the observed data. Population variance is the expected square distance 
of randome variable from the popuation around the population mean.Sample 
variance is the average square of distance of the observed observations minus 
the sample mean.

Sample variance is function of data, is also a random variable.

## Variability
Assume the average height of the people in a classroom and a playground to be
the same, In case we aren't aware these two samples represent two different 
populations we'd assume them to be of the same, but a class comprises of 
students of same age group whereas a playground consists of parents who are very
tall and children who are far shorter comparatively. Therefore we can say that
the variability of height in a classroom is very low compared to that of a 
playground, and this parameter can be used to distinguish the various 
populations.

If we were to sample variances of sample distributions, we get a distribution of
sample variances, this distribution's centre of mass will exactly be one 
variance from the original population we originally sampled from.  
The distribution of the sample variance gets more concentrated about the 
population variance, which it is trying to estimate and is centred around the 
population variance, signifies that the sample variance is a good unbiased 
estimator of the population variance.

When we divide by (n-1) when calculating the sample variance, then it turns out 
that the average of the sample variances for all possible samples is equal the
population variance, it is unbiased and can be considered a proper estimator of 
the population variance. If instead we were to divide by n then the average for 
all possible samples would NOT equal the population variance, since it is biased 
the variance of the sample and not that of the population.

The variance of a sample mean is sigma^2/n
- It's logical estimate is s^2/n
- The logical estimate of the standard error is S/sqrt(n)  
where, n is the number of samples drawn,
       sigma^2 is the variance of the population distribution
       s^2 is the variance of the sample distribution, and 
       N is the number of datapoints in the population distribution.
  S is simply an estimate of how variable the population is 

Variance,
```
  Var(X) = E( (X-mu)^2 ) = E( (X-E(X))^2 ) = E(X^2)-E(X)^2
```

Summary: 
  - Sample variance estimates the population variance 
  - The distribution of the sample variance is centered at what it is estimating
    which is desirable since it denotes that the estimator is unbiased. 
  - Sample variance gets more concentrated around the population variance with 
    larger sample sizes, which denotes that getting more data can create a
    better estimator 
  - Variance of the sample mean is that population variance divided by n, the 
    square root of it - sigma, divided by square root of n gives the standard 
    error, which represents how variable the averages are drawn from the 
    population.
  - The sample standard deviation, s, tells us how variable the population is, 
    and s/sqrt(n), the standard error, tells us how much averages of random 
    samples of size n from the population vary. Let's see this with some 
    simulations.

Note: Chebyshev's inequality helps interpret variances. It states that the
probability that a random variable X is atleast k standard deviations from its
mean is less than 1/(k^2), but this isn't applicable in case of normal 
distributions.

## Distributions
* ### Bernoulli distribution
  If p denotes the probability for a 'success' event, then  
  The mean is given by **p**, and variance by **p(1-p)**
  The binomial formula for bernoulli distribution is given by 
  ```
  nPr.(p)^r.(1-p)^(n-r)
  ```   
  The R code equivalent to this is
  ```
  choose(n,r)*p^n
  ```  
  R has function to perform this function - pbinom()
  ```
  pbinom($(r-1), size = $n, prob = $p, lower.tail = FALSE)
  ```  

* ### Normal distribution
  Also known as a gaussian distribution, a distribution with mean mu and 
  variance sigma^2 is said to be gaussian iff it follows the function,
  ```
  exp((-(x-mu)^2)/(2*sigma^2))*(2*pi*sigma^2)^(-1/2)
  ```
  represented as,
  ```
  X~N(mu,sigma^2)
  ```
  for standard normal distribution, mu = 0 and sigma = 1  
  Normal density, z = (X - mu)/sigma ~  N(0,1)
  To get units of original data, X = mu + sigma*Z ~ N(mu,sigma^2)
  
  Properties:
  - Approximately 68%, 95%, 99% of the normal density lies within 1, 2 and 3 
    standard deviations from the mean, respectively
  - -1.28, -1.645, -1.96, and -2.33 are the 10th, 5th, 2.5th and 1th percentiles 
    of the standard normal distribution respectively 
  - By symmetry, 1.28, 1.645, 1.96, and 2.33 are the 90th, 95th, 97.5th and 99th
    percentiles of the standard normal distribution respectively
  
  Note: If X is a normal random variable with mean mu and variance sigma^2, 
  i.e., X ~ N(mu,sigma^2), then the random variable Z defined as
  Z = (X -mu)/sigma is normally distributed with mean 0 and variance 1, i.e., 
  Z ~ N(0, 1). (Z is standard normal.)  
  The converse is also true. If Z is standard normal, i.e., Z ~ N(0,1), then the
  random variable X defined as X = mu + sigma*Z is normally distributed with 
  mean mu and variance sigma^2, i.e., X ~ N(mu, sigma^2)
    
  **Calculations**:  
  - To find the nth percentile of a normal distribution
    Quick R function avail. - qnorm()
    ```
    qnorm(n, mean = mu, sd = sd) # where n in 0:1
    ```
    Mathematical method:   
    Consider having to find the 95th percentile/quantile of a distribution, having 
    previous knowledge on standard deviations from the mean, we know that 
    1.645*sigma gives the 95th percentile of a standard normal distribution. Which 
    gives us the answer:
    ```
    mu + sigma*1.645
    ```
  - To calculate the probability that a random variable ~N(mu, sigma^2) is 
    larger than x.  
    Quick method:
    ```
    1 - qnorm(n, mean = mu, sd = sd)
    ```
    or,  
    ```
    qnorm(n, mean = mu, sd = sd, lower.tail = F)
    ```
    
    Note: R functions pnorm and qnorm are inverses  
    
    Methematically,
    Calculate how many standard deviations from the mean, the value of X is, ie.
    the value of z.
    
* ### Poisson Distribution
  It is defined as "a discrete probability distribution that expresses the 
  probability of a given number of events occurring in a fixed interval of time 
  and/or space if these events occur with a known average rate and independently
  of the time since the last event."
  ```
  P(X = x; lambda) = (lambda^x.exp(-lambda))/x!
  ```
  mean and variance of this distribution are both lambda.
  
  Uses: 
    - Used to model counts 
    - Modelling event-time or survival data
    - Modelling contingency tables
    - Approximating binomials when n is large and p is small 
  
  Note: Contingency Table: A table showing the distribution of one variable in
  rows and another in columns, used to study the correlation between the two 
  variables.
  
  Instance of usage: 
  The number of people that show up at a bus stop is a poisson with mean of 2.5 
  per hour. If watching the bus for 4 hours, what is the probability that 3 or 
  fewer people show up for the whole time? 
  
  Calculation:
  ```
  ppois(3, lambda = 2.5*4)
  ```  
  
## Asymptotics  
Asymptotics are an important topics in statistics. Asymptotics refers to the 
behavior of estimators as the sample size goes to infinity. Our very notion of
probability depends on the idea of asymptotics.   
We can use asymptotics to help is figure out things about distributions without 
knowing much about them to begin with. 

  An estimator is consitent if it converges to what you want to estimate

**Law of large numbers(LLN)**: It states that the mean of iid samples is 
consistent for the population mean.
  
**Central Limit Theorem(CLT)**: It states that the distribution of averages is
oftennormal, even if the distribution that the data is being sampled from is 
very non-normal.

**Confidence Intervals(CI)**: If we were to repeatedly get samples of size n 
from a population and constuct the confidence interval in each case, about 95% 
of the interval would contain mu, the population mean(parameter we're trying to 
estimate).  
X is approximately normal with mu, the parameter we're to estimate, and standard
deviation sigma/sqrt(n), then probability X is bigger than mu+2sigma/sqrt(n) and 
smaller than mu-2sigma/sqrt(n) is 5% => X(+/-)2sigma/sqrt(n) is called a 95% 
interval for mu. 

## T confidence Intervals
Same as confidence intervals created using the central limit theory, but in this 
case instead of using the CLT we use a parameter called the "T-Quantile" to 
create the interval. The T-distribution have heavier tails compared to the 
normal distribution, so these intervals will be wider.  
Generally we use T-interval when there is ambiguity in which distribution is to
be used, because as we collect more data the T-interval will just become more 
and more like the Z-Interval. 
  
Unlike the normal, which is indexed by 2 parameters mean and the variance, the 
T-interval is indexed by one parameter - the degrees of freedom, as the degree
of freedom increase, it gets more like a standard normal.   
The T constructed confidence interval will always be wider than the normal 
interval, due to presence of extra parameter we're estimating - the standard
deviation.  
T interval is not used for skewed distributions and distributions having 
discrete data.

The **paired sample t-test**, sometimes called the **dependent sample t-test**, 
is a  statistical procedure used to determine whether the mean difference
between two sets of observations is zero. In a paired sample t-test, each 
subject or entity  is measured twice, resulting in pairs of observations.
eg: There are two groups of outcomes of effect of two drugs on the same set of 
patients, this forms pairs between the tests from each group for the same 
patient.

The **independent t-test**, also called the **two sample t-test**, 
**independent-samples t-test** or **student's t-test**, is an inferential 
statistical test that determines whether there is a statistically significant 
difference between the means in two unrelated groups.  
In case of an independent T-test, the standard confidence interval is given by  

<img src="https://render.githubusercontent.com/render/math?math=$\bar{Y} - \bar{X} \pm t_{n_{x}\%2Bn_{y}%2D 2, 1%2D \frac{\alpha}{2}}S_{p}(\frac{1}{n_{x}%2B} \frac{1}{n_{y}})^\frac{1}{2}$">
where,  
<table>
  <tr>
    <td><img src="https://render.githubusercontent.com/render/math?math=$\bar{Y} - \bar{X}$"></td>
    <td>: Average of one group minus that of the other  </td>
  <tr>
  <tr>
    <td><img src="https://render.githubusercontent.com/render/math?math=$t_{n_{x}\%2Bn_{y}%2D 2, 1%2D \frac{\alpha}{2}}$">:</td>
    <td>The relevant T quantile with degrees of freedom <img src="https://render.githubusercontent.com/render/math?math=$n_{x}\%2Bn_{y}%2D2$"></td>
  </tr>
  <tr>
    <td><img src="https://render.githubusercontent.com/render/math?math=$S_{p}(\frac{1}{n_{x}%2B} \frac{1}{n_{y}})^\frac{1}{2}$"></td>
    <td>The standard error of the difference</td>
  </tr>
  <tr>
    <td><img src="https://render.githubusercontent.com/render/math?math=$S_{p}$"></td>
    <td>The pooled standard deviation</td>
  </tr>
</table>

The pooled variance estimator is, 
  <img src="https://render.githubusercontent.com/render/math?math=$S^{2}_{p}$">
  It is defined as, 
  <img src="https://render.githubusercontent.com/render/math?math=$S^{2}_{p}%3D\frac{\{(n_{x}%2D1)S^{2}_{x}%2B(n_{y}%2D1)S^{2}_{y}\}}{(n_{x}%2Bn_{y}%2D2)}$">
  This accounts for difference in variance of the two groups and weighing the 
  confidence accordingly. 

Note: For this interval to hold true, the variance across the groups must be 
constant. Difference variance per group is assumed by default.



