# Regression Models

**Error minimization**:
- Basic Least Squares:
    Takes each points and calculates the verticle distance of the point <img src="https://render.githubusercontent.com/render/math?math=$(x_{i}%2Cy_{i})$">,in vector 
    space to the to a point on the regressor <img src="https://render.githubusercontent.com/render/math?math=$(x_{i}\beta%2Cy_{i})$">  
    i.e, <img src="https://render.githubusercontent.com/render/math?math=$y_{i}-x_{i}\beta$">  
    And the MSE can be defined as, <img src="https://render.githubusercontent.com/render/math?math=$(y_{i}%2Dx_{i}\beta)^{2}$"> we do
    this for each point in the dataset so each point contributes equally to the 
    error rate, tries to find the best slope.
    The **lm()** function in R can be used to fit a regression line 
    
  Ordinary least squares (OLS) is the workhorse of statistics. It gives a way of
  taking complicated outcomes and explaining behavior (such as trends) using 
  linearity. The simplest application of OLS is fitting a line through some data.
  
**Centering**: Taking all the datapoints and subtracting each minus the mean, 
the new vector will have a mean equal to zero  
<img src="https://render.githubusercontent.com/render/math?math=$\tilde{X}_{i}=X_{i}%2D\bar{X}$">  
where,  
<img src="https://render.githubusercontent.com/render/math?math=$\bar{X}=\sum_{i=1}^{n}X_{i}$">  

**Scaling**: Taking all the datapoint and dividing each by the standard deviation
gives a vector of datapoints which has standard deviation equal to 1  
<img src="https://render.githubusercontent.com/render/math?math=$\tilde{X}_{i}=\frac{X_{i}}{\mathrm{s}}$">  
where,  
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{s}^{2}=\frac{1}{n%2D1}\sum_{i=1}^{n}(X_{i}%2D\bar{X})^{2}=\frac{1}{n%2D1}\sum_{i=1}^{n}(X_{i}^{2}%2Dn\bar{X}^{2})$">  
and <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{s}=\sqrt{\mathrm{s}^{2}}$">  

**Normalization**: Subtract each datapoint with mean and then divide this 
quantity by the standard deviation(performing centering and scaling in that 
order) gives a vector of datapoints that is centered around 0 and with standard 
deviation 1.  
and <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{Z}_{i}=\frac{X_{i}%2D\bar{X}}{\mathrm{s}}$">  

Subtracting the means to eliminate the intercept is a special case of a general technique which is sometimes called Gaussian Elimination.  
  
**Covariance**: 
<img src="https://render.githubusercontent.com/render/math?math=$Cov(X,Y) = \frac{1}{n%2D1}\sum_{i=1}^{n}(X_{i}%2D\bar{X})(Y_{i}%2D\bar{Y})=\frac{1}{n%2D1}\sum_{i=1}^{n}(X_{i}Y_{i}%2Dn\bar{X}\bar{Y})$">  
Then the correlation is simply the covariance standardized into a unitless 
quantity.  
<img src="https://render.githubusercontent.com/render/math?math=$Cor(X,Y) = \frac{Cov(X,Y)}{s_{x}s_{y}}$">   

<img src="https://render.githubusercontent.com/render/math?math=$Cor(X,Y)=Cor(Y,X)$">  

### Regression model example
Fitting a model with y-intercept to find the height of the child given the 
parent's height.  
Then the line of best fit would be:  
Child's Height = <img src="https://render.githubusercontent.com/render/math?math=$\beta_{0}$"> + Parent's Height <img src="https://render.githubusercontent.com/render/math?math=$\beta_{1}$">  
which is of the general form of equation of a line: **y = mx + c**, where  
**y** is the quantity we want to estimate,  
**m** is the slope of the regressor,  
**c** is the y-intercept,  
**x** is the independent variable using which we determine the dependent variable y

We use least squares to estimate the value **y**
<img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{n}\left(Y_{i}-(\beta_{0}+\beta_{1}X_{i})\right)^{2}$">  

When we're fitting a linear model,  
<img src="https://render.githubusercontent.com/render/math?math=$Y = \hat{\beta}_{0}%2B\hat{\beta}_{1}X$">  

where,  

<img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta}_{1} = Cor(Y,X)\frac{s_{y}}{s_{x}}$">  
<img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta}_{0} = \bar{Y}%2B\hat{\beta}_{1}\bar{X}$">  

If the data were to be normalized then the slope of the line <img src="https://render.githubusercontent.com/render/math?math=$Y = \hat{\beta}_{0}%2B\hat{\beta}_{1}\tilde{X}$"> i.e <img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta}_{1}$"> would simply
be the correlation of X and y, <img src="https://render.githubusercontent.com/render/math?math=$Cor(X,Y)$">  

We observe in general that the children of tall parent tend to be tall but not 
as tall as their parent, and the children of short parent tend to be short but 
taller than their parents. This can be explained by the phenomenon known as the
**regression to the mean**, Regression to the mean, was invented by Francis 
Galton in the paper - "Regression towards mediocrity in hereditary stature".

## Statistical regression models

* **Interpreting the regression coefficients**
For <img src="https://render.githubusercontent.com/render/math?math=$\beta_{0}$">  
We know that,  
<img src="https://render.githubusercontent.com/render/math?math=$E[Y_{i}|X_{i}=x_{i}] = \mu_{i} = \beta_{0}%2B\beta_{1}x_{i}$">  

<img src="https://render.githubusercontent.com/render/math?math=$Var(Y_{i}|X_{i}=x_{i}) = \sigma^{2}$">  

BUt unless the data is centered, this is of no interest because in most datasets 
there doesn't exist data with value 0 to estimate the intercept at **X** = **0**  
It can be impossible or far outside the range of the data. 
**It is the expected response when the predictor is equal to zero**

A fix for this would be to shift the regression variable by a constant "**a**",
<img src="https://render.githubusercontent.com/render/math?math=$Y_{i} = \beta{0}%2C\beta_{1}X_{i}%2B\varepsilon_{i} = \beta_{0}%2Ba\beta_{1}%2B\beta_{1}(X_{i}%2Da)%2B\varepsilon_{i} = \tilde{\beta}_{0}%2B\beta_{1}(X_{i}%2Da)%2B\varepsilon_{i}$">  
<img src="https://render.githubusercontent.com/render/math?math=$varepsilon_{i}$"> is the gaussian error where <img src="https://render.githubusercontent.com/render/math?math=$varepsilon_{i}\simN(0,\sigma^{2})$">  
The new intercept is,  
<img src="https://render.githubusercontent.com/render/math?math=$\beta{0} = \beta_{0}%2Ba\beta_{1}$">  

Changing the ***X*** values by a value a changes the intercept, but not the 
slope.  
Often **a** is set to <img src="https://render.githubusercontent.com/render/math?math=$\bar{X}$"> so that the intercept is interpretted as
the expected response to the average ***X*** value.

For <img src="https://render.githubusercontent.com/render/math?math=$\beta_{1}$">  
The regression coefficient <img src="https://render.githubusercontent.com/render/math?math=$\beta_{1}$"> is the slope of the line,
and generally slope is mapped as ratio of change in **Y** to the change in **X**.

**It is the expected change in reponse for 1 unit change in the predictor**   
<img src="https://render.githubusercontent.com/render/math?math=$\beta_{1} = E[Y_{i}|X_{i}=x_{i}%2B1]%2DE[Y_{i}|X_{i}=x_{i}] = \beta_{0}%2B\beta_{1}(x_{i}%2B1)%2D(\beta_{0}%2B\beta_{1}x_{i})$">  
Shifting the **X** variable doesn't change the slope much. But when we scale the 
**X** quantities,   
We scale the regression variable by multiplying and dividing by a constant **a**  

<img src="https://render.githubusercontent.com/render/math?math=$Y_{i} = \beta_{0}%2B\beta_{1}X_{i}%2B\varepsilon_{i} = \beta_{0}%2B\frac{\beta_{1}}{a}(X_{i}a)%2B\varepsilon_{i} = \beta_{0}%2B\tilde{\beta_{1}}(X_{i}a)%2B\varepsilon_{i}$">  
Multiplication of ***X*** by a factor **a** results in dividing the coefficient 
by a factor of **a**.

* **Residuals**: The variation left unexplained around the regression line, i.e,
the distance of each datapoint from the line is a vector of residuals for the 
observed data.
<img src="https://render.githubusercontent.com/render/math?math=$e_{i} = Y_{i}-\hat{Y}_{i}$">

Least squares minimizes <img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{n}e_{i}^{2}$">  
The <img src="https://render.githubusercontent.com/render/math?math=$e_{i}$"> can be thought of as the estimates of <img src="https://render.githubusercontent.com/render/math?math=$\varepsilon_{i}$">  

Properties of residuals: 
- <img src="https://render.githubusercontent.com/render/math?math=$E[e_{i}]=0$">  
- if you include an intercept, then <img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{n}e_{i}=0$">  
- The generalization of above two points, if a regressor variable <img src="https://render.githubusercontent.com/render/math?math=$X_{i}$"> is included, then <img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{n}e_{i}X_{i}=0$">  
- Residuals can be used to investigate the performance of a model.  
- Residuals can be thought of as outcome(***Y***) with the linear association of 
the predictor(***X***) removed(???).  
- Residual variation is the variation left unexplained by the regression model, 
whereas the systematic variation is the variation explained by the regression 
model.

### Residual plot
A residual plot is a graph that shows the residuals on the vertical axis and the
independent variable on the horizontal axis. If the points in a residual plot
are randomly dispersed around the horizontal axis, a linear regression model is 
appropriate for the data; otherwise, a nonlinear model is more appropriate.

The residual plot helps to diagnose Heteroscedasticity, which is the trend of 
greater variablility along the mass variable.

**Residual variation** is the variation around the regression line. This can be 
obtained by grabbing the sigma variable of the summary of the regression model 
i.e., 
```
  summary(fit)$sigma
```  
which is same as when we compute manually,
```
  sqrt((sum(resid(fit)^2))/(n-2))
```  
Note: The % of total variance - variability disregarding the independent 
variables, around the mean of the dependent variable - that is explained by the 
residual variability - the variability explained by the regression model needs 
to be high, the amount of variance left unexplained must be kept minimum. A 
metric that defines the variance explained by a regression model is called 
R-squared.  
<img src="https://render.githubusercontent.com/render/math?math=$R^{2}=\frac{\sum_{i=1}^{n}(\hat{Y}_{i}%2D\bar{Y})^{2}}{\sum_{i=1}^{n}(Y_{i}%2D\bar{Y})^{2}}$">   

### Inference in Regression
Variance of the estimator <img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta_{1}}$"> is given as,  
<img src="https://render.githubusercontent.com/render/math?math=$\sigma^{2}_{\hat{\beta_{1}}} = Var(\hat{\beta_{1}}) = \frac{\sigma^{2}}{\sum^{n}_{i=1}(X_{i}%2D\bar{X})^{2}}$">  
  
and, the variance of the intercept is given as,  
<img src="https://render.githubusercontent.com/render/math?math=$\sigma^{2}_{\hat{\beta_{0}}} = Var(\hat{\beta_{0}}) = \left(\frac{1}{n}%2B\frac{\bar{X}^{2}}{\sum_{i=1}^{n}(X_{i}%2D\bar{X})^{2}}\right)\sigma^{2}$">  

which is the standard deviation around the regression line divided by the sum of 
squares of the x variable around their mean.

In practice the <img src="https://render.githubusercontent.com/render/math?math=$\sigma^{2}$"> term is replaced by its estimate which is,  
<img src="https://render.githubusercontent.com/render/math?math=$\frac{1}{n%2D2}\left(\sum_{i=1}^{n}(X%2D\hat{X})^2\right)$">  

<img src="https://render.githubusercontent.com/render/math?math=$\frac{\hat{\beta_{j}}%2D\beta_{j}}{\sigma^{2}_{\hat{\beta_{j}}}}$"> follows a T-distribution with n-2 degrees of freedom.

The mean of a variable is the coefficient of its regression against the constant, 1. Thus, subtracting the mean is equivalent to replacing a variable by the residual of its regression against 1

### Prediction
Prediction estimate is given by   
  <img src="https://render.githubusercontent.com/render/math?math=$\hat{\beta}_{0}%2B\hat{\beta}_{1}x_{0}$">  

A standard error is required to create a prediction interval

The prediction interval for standard deviation in predicting the future value of 
y at any arbitrary point <img src="https://render.githubusercontent.com/render/math?math=$x_{0}$"> is distinctively broader 
than the confidence interval for a regression line.

The variability is narrowest at the centre of mass of the distribution.

Predicting <img src="https://render.githubusercontent.com/render/math?math=$\hat{Y}$">, value of y for any arbitrary x, ie line at <img src="https://render.githubusercontent.com/render/math?math=$x_{0}$"> se, <img src="https://render.githubusercontent.com/render/math?math=$\hat{\sigma}\sqrt{\frac{1}{n}%2B\frac{(x_{0}%2D\bar{X})^{2}}{\sum_{i=1}^{n}(X_{i}%2D\bar{X})^{2}}}$">  

and, for predicting a future interval, prediction interval se at <img src="https://render.githubusercontent.com/render/math?math=$x_{0}$"> is given by <img src="https://render.githubusercontent.com/render/math?math=$\hat{\sigma}\sqrt{1%2B\frac{1}{n}%2B\frac{(x_{0}%2D\bar{X})^{2}}{\sum_{i=1}^{n}(X_{i}%2D\bar{X})^{2}}}$">  

Deviance is the sum of the square of residuals.  
The square of correlation between two variables can also be used to compute the 
r-squared value.  


## Multivariable regression analysis
Multivariable regression is - looking at relationship of predictor on response
while at some level having accounted for other variables ie., Establishing the
right relationship between predictor and outcome in case of multiplicity - 
availability of multiple regressors.  

Components:  
- Model selection  
- Handling overfitting  
- 

eg: When considering the significance of regression relationship of a person's 
usage of breath mint and measure of forced expiratory volume. Logically dietary 
intake shouldn't be having such significance on pulmonary activity. Upon 
analysis we find the correlation between smokers and breath mint usage, smokers 
tend to use breath mint more, which shows that it is actually the parameter - "
whether a person smokes" which is actually signicant parameter to regression
and not "whether they consume breath mint".

      
