# Generating Random numbers 

### Functions for probabilty distrubutions in R
* rnorm : Generate random normal variates with given mean and standard distribution
    
  ```
  rnorm(n, mean = 0, sd = 1) 
  ```
* dnorm : Evaluate the Normal Probaility Density with given mean and sd at a given point or vector of points
    
  ```
  dnorm(x, mean = 0, sd = 1, log = FALSE)
  ```
    
* pnorm : Evaluates the cumulative distribution function for a normal distribution
    
  ```
  pnorm(q, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE) 
  ```

* rpois : Generate random Poisson distribution with given rate

  ```
  rpois(n, lambda) 
  ```

Probability distribution functions usually have four functions associated with them. The functions are prefixed with a
* d : for density
* p : for cumulative distribution
* r : for random number generation
* q : for quantile function

Generating same set of Random number can be important to reproduce the exact same result 

  For this purpose the 
  ```
  set.seed()
  ```
  function is used just before generating the random numbers using the above mentioned functions
  
### Generating a linear model 

```
y = Beta0 + Beta1 * x + e
```

set seed 
```
set.seed(20)
```

Generating the x co-efficient or predictor variable of the linear model
```
x = rnorm(100)
```

Generating the epsilon term with mean 0 and standard deviation 2
```
e = rnorm(100,0,2)
```

Linear model for Beta0 = 0.5, Beta1 = 2
```
y = 0.5 + 2 * x + e
```

Plotting the linear model 
```
plot(x,y)
```
