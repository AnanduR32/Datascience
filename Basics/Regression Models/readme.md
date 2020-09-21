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
Galton in the paper “Regression towards mediocrity in hereditary stature”.  









      
