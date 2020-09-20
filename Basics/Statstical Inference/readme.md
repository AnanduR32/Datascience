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

### Paired t-test
The **paired sample t-test**, sometimes called the **dependent sample t-test**, 
is a  statistical procedure used to determine whether the mean difference
between two sets of observations is zero. In a paired sample t-test, each 
subject or entity  is measured twice, resulting in pairs of observations.
eg: There are two groups of outcomes of effect of two drugs on the same set of 
patients, this forms pairs between the tests from each group for the same 
patient.

### student's t-test(equal variance)
The **independent t-test**, also called the **two sample t-test**, 
**independent-samples t-test** or **student's t-test**, is an inferential 
statistical test that determines whether there is a statistically significant 
difference between the means in two unrelated groups.  
In case of an independent T-test, the standard confidence interval is given by  

<img src="https://render.githubusercontent.com/render/math?math=$\bar{Y} - \bar{X} \pm t_{n_{x}\%2Bn_{y}%2D 2, 1%2D \frac{\alpha}{2}}S_{p}\left(\frac{1}{n_{x}}%2B\frac{1}{n_{y}}\right)^\frac{1}{2}$">
where,  
<table>
  <tr>
    <td><img src="https://render.githubusercontent.com/render/math?math=$\bar{Y} - \bar{X}$"></td>
    <td>Average of one group minus that of the other  </td>
  <tr>
  <tr>
    <td><img src="https://render.githubusercontent.com/render/math?math=$t_{n_{x}\%2Bn_{y}%2D 2, 1%2D \frac{\alpha}{2}}$">:</td>
    <td>The relevant T quantile with degrees of freedom <img src="https://render.githubusercontent.com/render/math?math=$n_{x}\%2Bn_{y}%2D2$"></td>
  </tr>
  <tr>
    <td><img src="https://render.githubusercontent.com/render/math?math=$S_{p}\left(\frac{1}{n_{x}}%2B\frac{1}{n_{y}}\right)^\frac{1}{2}$"></td>
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
  <img src="https://render.githubusercontent.com/render/math?math=$S^{2}_{p}%3D\frac{(n_{x}%2D1)S^{2}_{x}%2B(n_{y}%2D1)S^{2}_{y}}{(n_{x}%2Bn_{y}%2D2)}$">  
  This term accounts for difference in variance of the two groups and weighing the 
  confidence accordingly. 

Note: For this interval to hold true, the variance across the groups must be 
constant. Difference variance per group is assumed by default.

### Welch t-test(unequal variances)

<img src="https://render.githubusercontent.com/render/math?math=$\bar{Y} - \bar{X} \pm t_{df}\times\left(\frac{s^{2}_{x}}{n_{x}}%2B\frac{s^{2}_{y}}{n_{y}}\right)^\frac{1}{2}$">  
where,  
<img src="https://render.githubusercontent.com/render/math?math=$df = \frac{\left(\frac{s^{2}_{x}}{n_{x}}%2B\frac{s^{2}_{y}}{n_{y}}\right)^{2}}{\frac{\left(\frac{s^{2}_{x}}{n_{x}}\right)^{2}}{(n_{x}%2D1)}%2B\frac{\left(\frac{s^{2}_{y}}{n_{y}}\right)^{2}}{(n_{y}%2D1)}}$">

## Hypothesis Testing
It is concerened with making decisions with data.    
Hypothesis tests take all of the sample data and convert it to a single value, 
which is known as a test statistic   
A null hypothesis is a type of hypothesis used in statistics that proposes that 
there is no difference between certain characteristics of a population <img src="https://render.githubusercontent.com/render/math?math=$H_{o}$">  
The null hypothesis is assumed true and statistical evidence is required to 
reject it in favor of a research or alternative hypothesis, <img src="https://render.githubusercontent.com/render/math?math=$H_{a}$">
There are 4 possible outcomes for a statistical decision process:
<table>
  <tr>
    <td>
      TRUTH  
    </td>
    <td>
      DECISION
    </td>
    <td>
      RESULT
    </td>
  </tr>
  <tr>
    <td>
      <img src="https://render.githubusercontent.com/render/math?math=$H_{o}$"> 
    </td>
    <td>
      <img src="https://render.githubusercontent.com/render/math?math=$H_{o}$"> 
    </td>
    <td>
      Correctly accepted null
    </td>
  </tr>
  <tr>
    <td>
      <img src="https://render.githubusercontent.com/render/math?math=$H_{o}$"> 
    </td>
    <td>
      <img src="https://render.githubusercontent.com/render/math?math=$H_{a}$">
    </td>
    <td>
      Type I Error 
    </td>
  </tr>
  <tr>
    <td>
      <img src="https://render.githubusercontent.com/render/math?math=$H_{a}$">
    </td>
    <td>
      <img src="https://render.githubusercontent.com/render/math?math=$H_{a}$">
    </td>
    <td>
      Correctly reject null 
    </td>
  </tr>
  <tr>
    <td>
      <img src="https://render.githubusercontent.com/render/math?math=$H_{a}$">
    </td>
    <td>
      <img src="https://render.githubusercontent.com/render/math?math=$H_{o}$">
    </td>
    <td>
      Type II Error 
    </td>
  </tr>
</table>  
The Type I error and the type II errors are inversely related.
eg: In the court of law, the null hypothesis would generally be that the 
defendant is innocent unless proven guilty, whereas the arguments used to prove
the null hypothesis wrong.  
If we were to not require much evidence(the confidence interval large) then we'd 
have more of the type I errors through increase in % of innocent people 
convicted however we will also be increasing the % of guilty people convicted by 
dissapproving/rejecting the null hypothesis.  
Similarly if we were to raise the standard to convict a suspected criminal, it 
would increase the type II error, in which case even most guilty people will be 
let free.

Consider <img src="https://render.githubusercontent.com/render/math?math=$\alpha$"> to be type I error rate which in other words can 
be defined as the probability of Type I error occuring, i.e, the probability of
rejecting a null hypothesis when in fact it is true.  
Universally accepted standard value, <img src="https://render.githubusercontent.com/render/math?math=$\alpha=0.05$">  

A general strategy to reject the null hypothesis would be to see if <img src="https://render.githubusercontent.com/render/math?math=$\bar{x}$"> is
greater than some constant <img src="https://render.githubusercontent.com/render/math?math=$C$">

**Problem statment**: A respiratory disturbance index (RDI) of more than 30 
events/hour is considered evidence of severe sleep disordered breathing (SDB).
Suppose that in a sample of 100 overweight subjects with other risk factors for
SDB at a sleep clinic, the mean RDI (X') was 32 events/hour with a standard 
deviation (s) of 10 events/hour.

Consider sample distribution of mean <img src="https://render.githubusercontent.com/render/math?math=$\bar{X} = 30$">, and standard error, **s = 1**  
If we take <img src="https://render.githubusercontent.com/render/math?math=$\alpha = 0.05$">, then we want to choose <img src="https://render.githubusercontent.com/render/math?math=$C$"> so that 
<img src="https://render.githubusercontent.com/render/math?math=$P(\bar{X}>C:H_{o})$"> is 5%  
For understanding - The upper tail of the pnorm for the <img src="https://render.githubusercontent.com/render/math?math=$95^{th}$"> percentile.
The <img src="https://render.githubusercontent.com/render/math?math=$95^{th}$"> percentile of a normal distribution is 1.645 standard
deviations from the mean  
If <img src="https://render.githubusercontent.com/render/math?math=$C = 30 %2B 1 \times 1.645 = 31.645$">
  - Then the probability that a <img src="https://render.githubusercontent.com/render/math?math=$N(30,1)$"> is larger than 5%
  - So the rule "Reject <img src="https://render.githubusercontent.com/render/math?math=$H_{o}$"> when <img src="https://render.githubusercontent.com/render/math?math=$\bar{X} \geqq 31.645$">" has the property that the probability of rejection is 5% when <img src="https://render.githubusercontent.com/render/math?math=$H_{o}$"> is true (for the <img src="https://render.githubusercontent.com/render/math?math=$\mu,\sigma, n)$">   
This means that if our OBSERVED (sample) mean X' >= C, then it's only a 5% 
chance that a random draw from this N(30,1) distribution is larger than C

Because we generally convert the constant ***C*** back to the original scale for
different distributions, we generally calculate the z-score - which tells us how 
many standard deviations the value is away from the hypothesised mean, if this 
value is greater than the quantile for the required confidence, then we reject 
the hypothesis.  
We illustrate this using the estimated mean and standard error from above, 
wherein we have a data to be of value 32,  
Then the number of standard deviations this value is away from the mean is 
calculated by,  
<img src="https://render.githubusercontent.com/render/math?math=$\frac{32-30}{\frac{10}{\sqrt{100}}} = 2$">  
which gives us 2, and this is greater than 1.645 therefore we reject the 
hypothesis.  
We can generalize this rejection critereon to be such that we reject a 
hypothesis whenever <img src="https://render.githubusercontent.com/render/math?math=$\frac{\sqrt{n}(\bar{X}-\mu_{o})}{s}>\mathrm{Z}_{1%2D\alpha}$">

### Two sided tests
Suppose instead of just rejecting the hypothesis if only the given estimate is 
too large we now reject the null hypothesis if the mean is too large or too 
small as well, where the null hypothesis being the mean is sample 30 is within 
95% of confidence interval of the population mean, given the standard error.
Given the argument hypothesis to be that the given sample mean is not a proper
estimate of the population mean. <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{a}:\ne30$"> 
ie. alternative hypothesis <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{a}$"> that mu is simply not equal to mu_0, the mean hypothesized by the null hypothesis <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{o}$">.  We
would reject <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{o}$"> when our sample mean is significantly different than <img src="https://render.githubusercontent.com/render/math?math=$\mu_{o}$">, that is, either less than OR greater than <img src="https://render.githubusercontent.com/render/math?math=$\mu_{o}$">.
Then we want the probability of rejecting under the null to be 5%, split equally
as 2.5% in the upper tail and 2.5% in the lower tail.
Thus we reject if our test statistic is larger than qt(0.975,15) or smaller than 
qt(0.025,15)
 - This is the same as saying: reject if the absolute value of our statistic is 
 larger than qt(0.975,15) = 2.1314
 - So we fail to reject the two sided test as well.
 - (if you fail to reject the one sided test, then we would fail to reject the
 two sided test as well - having moved further into the tails of the bell-curve)
 
## P Value 
The p value is the evidence against a null hypothesis. The smaller the p-value, 
the stronger the evidence that you should reject the null hypothesis. 

**Idea**: Suppose nothing is going on - how unusual is it to see the estimate
we got?  
**Approach**: 
1.Define the hypothetical distribution of a data summary (statistic) when 
"nothin is going on"(null hypothesis)  
2.Calculate the summary/statistic with the data we have (test statistic)  
3.Compare what we calculated to our hypothetical distribution and see if the 
value is "extreme"(p-value)    

Your comparison tells you how "extreme" the test value is toward the alternative
hypothesis. The p-value is the probability under the null hypothesis of 
obtaining evidence as or more extreme than your test statistic (obtained from 
your observed data) in the direction of the alternative hypothesis.

For understanding: p-value is the percent increase in the t-statistic than the 
extreme of the confidence interval, therefore for some <img src="https://render.githubusercontent.com/render/math?math=$\alpha = 0.05$"> for the 95% confidence interval, we reject the hypothesis if p-value is less than it, 
otherwise if p-value is greater then we fail to reject the null hypothesis.  
Generally the p value is calculated for two sided test, unless specified 
otherwise.  
By reporting a p-value, instead of an alpha level and whether or not you reject 
H_0, reviewers of your work can hypothesis test at any alpha level they choose. 
The general rule is that if the p-value is less than the specified alpha you 
reject the null hypothesis and if it's greater you fail to reject.

## Power 
The other kind of error we could make is to fail to reject when the alternative
is true (Type II error). It is the probability of rejecting the null hypothesis 
when it is indeed false. 
We don't have as much control over this probability, since we've spent all of
our flexibility guaranteeing that the Type I error rate is small. Power is the
probability of rejecting the null hypothesis when it is falsePower is used to 
evaluate the product during it's design phase.  
Power comes more into play when we fail to reject the null hypothesis.  
The type II error rate is called <img src="https://render.githubusercontent.com/render/math?math=$\beta$"> and then, Power = 1 - <img src="https://render.githubusercontent.com/render/math?math=$\beta$">  

The two hypotheses, <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{0}$"> and <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{a}$">, actually represent two distributions since 
they're talking about means or centers of distributions. <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{0}$"> says that the mean 
is <img src="https://render.githubusercontent.com/render/math?math=$\mu_{0}$">  (30 in our example) and H_a says that the mean is <img src="https://render.githubusercontent.com/render/math?math=$\mu_{a}$">.  

In general we reject a hypothesis if, <img src="https://render.githubusercontent.com/render/math?math=$\bar{\mathrm{X}}>30%2B\mathrm{Z}_{1%2D\alpha}\frac{\sigma}{\sqrt{n}}$">  
Under <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{0}:\bar{\mathrm{X}}\sim\mathrm{N}\left(\mu_{0}%2C\frac{\sigma^{2}}{n}\right)$">  
Under <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{H}_{a}:\bar{\mathrm{X}}\sim\mathrm{N}\left(\mu_{a}%2C\frac{\sigma^{2}}{n}\right)$">  
<img src="https://render.githubusercontent.com/render/math?math=$1%2D\beta = P\left(\bar{X}>\mu_{0}%2Bz_{1%2D\alpha}\left(\frac{\sigma}{\sqrt{n}}\right)%3B\mu = \mu_{a}\right)$">  
Unknowns: <img src="https://render.githubusercontent.com/render/math?math=$\mu_{a}%2C \sigma%2C n%2C \beta$">  
Knowns: <img src="https://render.githubusercontent.com/render/math?math=$\mu_{0}%2C \alpha$">  
Specify any 3 of the unknowns and you can solve for the remainder. Usually we 
want to figure out for particular power that is required what should be the 
value of n or, When we can only conduct test for a particular size, n, what is 
the power we have, so is conducting the test even valid. But it can indeed be 
used finding the other variables.

We are more likely to detect a difference if the difference we want to detect is 
very big, therefore as the sample size increases the power to reject the null 
hypothesis increases. Generally you should have an 80% or greater chance of 
finding a statistically significant difference when there is one.  
Basic rules about power:
- As <img src="https://render.githubusercontent.com/render/math?math=$\alpha$"> gets larger, the power goes up.<img src="https://render.githubusercontent.com/render/math?math=$\therefore$">power 
  of one sided test is greater than the power of the associated two sided test.
- Power goes up as n goes goes up
- Power goes up as <img src="https://render.githubusercontent.com/render/math?math=$\mu_{1}$"> gets further away from <img src="https://render.githubusercontent.com/render/math?math=$\mu_{0}$">  
Pwer usually doesn't depend on these parameters individually, but instead on a 
function of these parameters <img src="https://render.githubusercontent.com/render/math?math=$\frac{\sqrt{n}(\mu_{a}%2D\mu_{0})}{\sigma}$">  
And the quantity <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mu_{a}%2D\mu_{0}}{\sigma}$"> is known as the effect size.  
Effect size has no units, being unit free it can be interpreted across problems.  
Commonly used method to find power is by using the t-distribution where power is  
<img src="https://render.githubusercontent.com/render/math?math=$P\left(\frac{\bar{X}%2D\mu_{0}}{\frac{\mathrm{S}}{\sqrt{n}}}>t_{1%2D\alpha%2Cn%2D1}%3B\mu = \mu_{a}\right)$">  
Since the statistic is centred at <img src="https://render.githubusercontent.com/render/math?math=$\mu_{a}"> instead of <img src="https://render.githubusercontent.com/render/math?math=$\mu_{0}">, calculating it requires non-central t-distribution.
  
In R we 
can find power using the function ***power.t.test***  
Usage:
```
  power.t.test(n = 16. delta = 2, sd = 4, type = "one.sample", alt = "one.sided")$power
```

## Multiple Testing/Comparisons
We often perform multiple tests to correctly evalutae our hypothesis, generating
multiple p-values from the same dataset and report only the smallest p-value or 
record all p-values and say that all p-values less than 0.05 are significant. 
This can lead to lot of problems.  
Our object is correcting for multiple testing avoids false positives or 
discoveries.  
Two key components:   
- Error measure
- Correction  
If we allow for 5% chance of error in every hypothesis test we performed, and we
performed atleast 20 hypothesis tests we expect to find atleast one error - 0.2
times 5 is 1. (The false positive rate)

Types of errors:
- Type I: False Positives
- Type II: False Negatives   

Error rates: 
- False positive rate: The rate at which the false results are called 
significant
- Family-wise error rate: The probability of atleast one false positive, i.e, 
the probability of making any Type 1 errors at all.
- False discovery rate: The rate at which claims of significance are false, i.e, 
the expected proportion of false rejections out of all rejections.

The false positive rate is not a good enough measure when it comes to multiple 
comparisons since for large number of tests (say, 10000) and we call all values 
p < 0.05 significant, then the expected number of false positives is 500. Which 
means if we perform this many hypothesis tests and we get 500 significant 
results then it's pretty likely that they are most likely made up of false 
positives.

A better measure would be to use the **Family-wise error rate(FWER)**, which
relies on the Bonferroni correction. In this, if we perform m hypothesis tests 
with <img src="https://render.githubusercontent.com/render/math?math=$\alpha=0.05$">, then we calculate <img src="https://render.githubusercontent.com/render/math?math=$\alpha_{fwer}=\alpha/m$"> and we consider only those p-values that are less than
this metric as significant.  
The calculation here is easy, but it is very conservative.  

The False discovery rate is the most popular correction measure using in various
test such as in genomics, imaging, astrolonomy, or other signal processing
disciplines.  
In this method we calculate the p-values normally, and then arrange the p-values
in the ascending order  <img src="https://render.githubusercontent.com/render/math?math=$P_{(1)}%2C%2E%2E%2E%2CP_{(m)}$">. Then for any ***i*** in ***1:m***,  
we take, <img src="https://render.githubusercontent.com/render/math?math=$P_{(i)}\leqq\alpha\times\frac{i}{m}$"> as significant.  
Easy to calculate but might create more false positives.  
  
The above two methods, names FWER and FDR manipulate the <img src="https://render.githubusercontent.com/render/math?math=$\alpha$"> value, but another
method is to manipulate the p-value, which then become a metric to control the 
error, but having lost all previous properties of the classically defined 
p-values.  
In this we have <img src="https://render.githubusercontent.com/render/math?math=$P_{(1)}%2C%2E%2E%2E%2CP_{(m)}$">,  
We adjust them by calculating <img src="https://render.githubusercontent.com/render/math?math=$P^{fwer}_{i}=\mathrm{max}(m\timesP_{i}%2C 1)$"> for each p-value. Then we consider all <img src="https://render.githubusercontent.com/render/math?math=$P^{fwer}_{i}<\alpha$"> significant   

The 
```
  p.adjust(pValues, method = ...)
```
method can be used to adjust the p-values of the numberous hypothesis, where the 
method can be specified as "bonferroni" for FWER control, "BH" for FDR control 
and so on.  
In case there is strong dependence between tests there may be problems when 
using the "bonferroni" or the "BH" methods, we should consider using "BY" under
such circumstances.

## Resampling 
Estimating the precision of sample statistics (medians, variances, percentiles)
by using subsets of available data (jackknifing) or drawing randomly with 
replacement from a set of data points (bootstrapping)

**Bootstrapping** is any test or metric that uses random sampling with 
replacement, and falls under the broader class of resampling methods. 
Bootstrapping assigns measures of accuracy (bias, variance, confidence intervals,
prediction error, etc.) to sample estimates, liberating the datascientists from 
having to perform a lot of mathematics inorder to perform inferences.  

## Permutation tests
Aslo known as the randomization tests, is an increasingly common statistical 
tool for constructing sampling distributions is the permutation test (or 
sometimes called a randomization test). In which we are actually exchanging the
labels on data points when performing significance tests.  
A permutation test is used to determine the statistical significance of a model
by computing a test statistic on the dataset and then for many random 
permutations of that data. If the model is significant, the original test 
statistic value should lie at one of the tails of the null hypothesis 
distribution.
<table>
  <tr>
    <td>
      Datatype
    </td>
    <td>
      Statistic
    </td>
    <td>
      Test type
    </td>
  </tr>
  <tr>
    <td>
      Ranks
    </td>
    <td>
      rank sum
    </td>
    <td>
      rank sum test
    </td>
  </tr>
  <tr>
    <td>
      Binary
    </td>
    <td>
      hypergeometric prob.
    </td>
    <td>
      Fisher's exact test
    </td>
  </tr>
  <tr>
    <td>
      Raw data
    </td>
    <td>
      <!---->
    </td>
    <td>
      Ordinary permutation test
    </td>
  </tr>
</table>

