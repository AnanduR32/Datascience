## Practical Machine Learning using R

A predictor in machine learning is modelling in the following order:   
<img src="https://render.githubusercontent.com/render/math?math=$\mathrm{question}\to\mathrm{input%20data}\to\mathrm{features}\to\mathrm{algorithm}\to\mathrm{parameters}\to\mathrm{evaluation}$">   

Properties of a good machine learning model:  
- Interpretable  
- Simple  
- Accurate  
- Fast  
- Scalable  

**In sample error**: Error we get when using the train dataset to measure the 
accuracy of the model. a.k.a resubstitution error  
**Out of sample error**: Error we get when using the test dataset to measure the 
accuracy of the model. a.k.a generalization error  

<table>
  <thead>
    <tr>
      <td>
         Size of dataset 
      </td>
      <td>
         Split methodology 
      </td>
    </tr>
  </thead>
  <tr>
    <td>
      Large
    </td>
    <td>
      <ul>
        <li>train - 60%</li>
        <li>validation - 20%</li>
        <li>test - 20%</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>
      Medium
    </td>
    <td>
      <ul>
        <li>train - 60%</li>
        <li>test - 40%</li>
      </ul>
    </td>
  </tr>
  <tr>
    <td>
      Small
    </td>
    <td>
      Use cross validation
    </td>
  </tr>
</table>  

- Generally the train/test split is done randomly.  
- When splitting the dataset into various test, train and validation sets, the 
datasets must reflect on the structure of the problem, for instance, if 
predictions evolve with time then split the train/test in time chunks
(backtesting)  
- All subsets should reflect as much diversity as possible. Eliminating any 
class imbalances.  

## Types of errors  
- True positives: Correctly classifying a true result as true.  
- True negatives: Correctly classifying a false result as false.  
- False positives: Incorrectly classifying a false result as true.  
- False negatives: Incorrectly classifying a true result as false.  

Based on which, with context of medical diagnosting, we derive:  
- Sensitivity: Pr(positive test|disease)  
    <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{TP}}{\mathrm{(TP%2BFN)}}$">  
- Specificity: Pr(negative test|no disease)  
    <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{TN}}{\mathrm{(TN%2BFP)}}$">  
- Positive predicted value: Pr(disease|positive test)   
    What fraction of the positively tested individuals actually have the disease  
    <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{TP}}{\mathrm{(TP%2BFP)}}$">  
- Negative predicted value: Pr(no disease|negative test)  
    What fraction of the negatively tested individuals actually don't have the
    disease  
    <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{TN}}{\mathrm{(TN%2BFN)}}$">
- Accuracy: Pr(correct outcome)  
    <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{(TN%2BTP)}}{\mathrm{(TN%2BTP%2BFP%2BFN)}}$">  
    
In continous data  
Mean Squared Error(MSE): <img src="https://render.githubusercontent.com/render/math?math=$\frac{1}{n}\sum_{i=1}^{n}(Prediction_{i}%2DTruth_{i})^{2}$">  
Root Mean Squared Error(RMSE): <img src="https://render.githubusercontent.com/render/math?math=$\sqrt{\frac{1}{n}\sum_{i=1}^{n}(Prediction_{i}%2DTruth_{i})^{2}}$">  
Median absolute deviation: Median of the distance between the observed and 
predicted value and take absolute instead of square.  

## ROC Curves
Receiver Operating characteristic(ROC) curves are commonly used to measure the 
quality prediction algorithm.
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/36/Roc-draft-xkcd-style.svg/250px-Roc-draft-xkcd-style.svg.png" height="200"/>  
In the graph, the x-axis represents (1-specificity) and the y-axis represents 
the sensitivity.  
The area under the curve(AUC) is used to quantify the quality of the algorithm.   
- if AUC = 0.5, it is equivalent ot a classifier that randomly guesses the outcome
similar to outcome of flipping of a fair coin.  
- AUC = 1, it then represents a perfect classifier which has 100% specificity 
and 100% sensitivity.
- Generally, AUC <img src="https://render.githubusercontent.com/render/math?math=$\ge$"> 0.8 is considered optimal.  

## Cross Validation  
Split the training set into train and validation set to reduce the bias of the 
model.   
Sampling is done without replacement, if with replacement then it is 
boostrap which underestimates the error - which can be fixed using 0.632 
bootstrap algorithm.  
- Random subsampling(Monte Carlo crossvalidation): Randomly split the training set into train and validation 
on each iteration of model fitting.  
<img src="https://www.researchgate.net/profile/Alejandro_Gomez_Montoya/publication/311428042/figure/fig1/AS:522223791415296@1501519262399/Figure-Cross-Validation-Holdout-with-random-subsampling-6.png" height="200"/>  

- K-Fold: Divide the training set into K equal datasets and then in each 
iteration consider the next dataset as the validation set.  
<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcSJJDgKO23CMExcfazJlOxWdPHYPKBa3kzcLA&usqp=CAU" height="200"/>  

    - If k is large => Less bias, More variance  
    - if k is small => More bias, Less variance  
  
- Leave on out: Leave exactly one sample out of the training set and validate on
that sample.  
<img src="https://miro.medium.com/max/1682/1*Oz6Hopj7ipJh0vtA2FE-FQ.png" height="200"/>

## Using the right data
When creating a predictive model use like data to predict like response, when 
using unrelated data be careful interpreting why the prediction algorithm works 
or doesn't work - understanding correlations.  

## The caret package
The caret package is a tool designed to implement practical machine learning 
models in R.  
Some of it's basic functionalities are:  
- Basic preprocessing(cleaning)
  - preProcess
- Data splitting
  - createDataPartition
  - createResample
  - createTimeSlices
  - createFolds
- Training/Testing function
  - train
  - predict
- Model Comparison
  - confusionMatrix
 
Metric options  
- Continous outcome
  - RMSE
  - RSquared
- Categorical outcome
  - Accuracy
  - Kappa

The trainControl() function parameter of the train() in caret package allows us 
to specify various parameters for when we train the model.   
It allows us to set resampling methos, whether to save in-sample predictions, 
initialWindow - the length of timeframe in case of time-series data, the seed, 
whether to allowParallel processing in case of multicore workloads and so on.  

trainControl resampling  
- method
  - boot = bootstrapping
  - boot632 = bootstrapping with adjustment accounting for overestimation of coefficients.  
  - cv = cross-validation  
  - repeatedcv = repeated cross-validation  
  - LOOCV = Leave one out cross validation  
- number  
  - For boost/cross-validation  
  - number of subsamples to take  
- repeats  
  - number of times to repeat subsampling  
  - if big can slow things down.  

Continous predictors can be plotted as categorical by cutting the data into 
bins using the cut2(series,g=) from the Hmisc package.  

## Covariate creation  

Taking the **raw unstructured data** and converting it into **tidy covariates** which 
could be used for the modelling of predictive models.  
eg: Converting unstructured emails into frequency columns of for each word (The 
faction of time a word appears within the mail). These are variables that 
describe the raw data.   

In case of modelling algorithms that depends on the distribution of the data 
such as regression and SVMs **feature transformations** are important, but not so
much in case of classification trees.   

**Dummifying covariates**: Turning covariates which are qualitative into dummy variables is
common when training predictive models, since the models don't generally use
those qualitative information to do something productive.  

**Removing zero or near-zero covariates**: Removing the covariates that give no 
significant information that can be used in modelling a predictve model, they 
have very little to no variability and hence doesn't serve any purpose to the 
model creation. eg: In case of mails the column "any_letters" will certainly 
always be "True" since every mail will have atleast one letter in it.  

## Principal component analyis
To observe correlation among the covariates and flag those that are highly 
correlated - which means those variables that are almost identical to each other.  
To exclude unnecessary or too much information from a model while retaining a 
summarization of the covariates which captures most of the information we use
PCA.   
The idea is to take weighted combination of predictors which explains the change
in the data. PCA reduced the number of predictors we need to use while also 
reducing the noise since weighted averaging is done to identify the components.  

- PCA allows us to find new set of variables that aren't correlated with each 
other and explains as much of the variance as possible.   
- PCA is mathematically finding the lowest rank of matrix that explains the 
original data. This allows for data compression.  

The prcomp() function can be used to obtain the pricipal componenets of given 
data, 

**SVD** breaks down the matrix into three components - the set of left singular 
vectors, the diagonal matrix and corresponding sets of right singular vectors.  
The principal components are equal to the right singular values if you first 
scale the variables.  

### Exploratory analysis on the fitted model
Plotting the fit and coloring the variables on some factor parameter can reveal 
important characteristics and help identify and understand outliers better.   
Any trends observed when plotting the residuals against index could suggest 
missing values.

## Decision Trees
Classification trees are non-linear models.  
**Basic Algorithm**  
- Start with all variables in one group   
- Find the variable/split that best separates the outcomes 
- Divide the data into two groups ("Leaves") on that split ("Node")  
- With each split, find the best variable/split that separates the outcomes  
- continue unitl the groups are too small or sufficiently homogeneous ("pure")  

### Measure of impurity
Entropy: It is the measure of disorder, or the measure of impurity which 
accounts for the randomness in the datapoints.  
<img src="https://render.githubusercontent.com/render/math?math=$\hat{P}_{mk}=\frac{1}{N_{m}}\sum_{x_{i} in Leaf m}(y_{i}=k)$">  
<img src="https://render.githubusercontent.com/render/math?math=$(y_{i}=k)$">: The number of times class k appears on the leaf m.  

Misclassification error: <img src="https://render.githubusercontent.com/render/math?math=$1%2D\hat{P}_{mk}$">  
- 0: Perfect purity  
- 0.5: No purity  

**Gini index**:  
Gini Index, also known as Gini impurity, calculates the amount of probability of
a specific feature that is classified incorrectly when selected randomly. If all
the elements are linked with a single class then it can be called pure.  
<img src="https://render.githubusercontent.com/render/math?math=$\sum_{k\ne{k'}}\hat{P}_{mk}\times\hat{P}_{mk'}=\sum_{k=1}^{K}\hat{P}_{mk}(1%2D\hat{P}_{mk})=1%2D\sum_{k=1}^{K}P^{2}_{mk}$">  

**Deviance/Information gain**:  
Information Gain is applied to quantify which feature provides maximal 
information about the classification based on the notion of entropy.  
<img src="https://render.githubusercontent.com/render/math?math=$%2D\sum_{k=1}^{K}\hat{P}_{mk}\mathrm{log}_{2}\hat{P}_{mk}$">  
Where <img src="https://render.githubusercontent.com/render/math?math=$P_{mk}$"> denotes the probability of an element being classified for a distinct class.  
- 0: Perfect purity  
- 1: no purity  

## Bagging 
Similar to bootstrapping, where data is resampled with replacement. In bagging 
models are built on various subsamples and the predictions from all the models 
are either averaged or majority vote is used to select the best model.  
Bagging reduces variance while delivering similar bias.  

## Random forests 
It is an extension to bagging in decision trees, where each tree is generated 
from a random subsample at each split only a subset of the variables is
considered at each potential split (bootstrap variables). A large number of
trees are created making the analoge of it being randomly subsampled forests - 
random forests, and then finally the averaged or majority voted prediction is
taken.    
Random forests are highly accurate, but they are slow, complicated to understand
and also can be overfitted.  
**Ensemble model**:   
Forest output probability <img src="https://render.githubusercontent.com/render/math?math=$p(c|v)=\frac{1}{T}\sum_{t}^{T}p_{t}(c|v)$">  


## Boosting
Training a bunch of individual models in a sequential way. Each individual model 
learns from mistakes made by the previous model.  
- Taking weak predictors and adding them up gives us a stronger predictor.  

Basic idea:  
- Take a set of classifiers <img src="https://render.githubusercontent.com/render/math?math=$h_{1},h_{2},...,h_{k}$">  
    - Examples: All possible trees, all possible regression models, all possible
    cutoffs.  
- Create a classifier that combines classification functions: <img src="https://render.githubusercontent.com/render/math?math=$f(x)=\mathrm{sgn}\left(\sum_{t=1}^{T}\alpha_{t}h_{t}(x)\right)$">  
    - Goal is to minimize classification error.  
    - Iterative select one h at each step  
    - Calculate weights based on errors.  
    - Upweight missed classifications and select next h  
    
## Model based prediction  
Assuming that the data follows a probabilistic model, use Bayes' theorem to 
identify optimal classifiers.  

**Model based approach**:  
- The goal is to build a parametric model for conditional distribution <img src="https://render.githubusercontent.com/render/math?math=$P(Y=k|X=x)$">  
- The above parametric model can be built using bayes' theorem:  
    <img src="https://render.githubusercontent.com/render/math?math=$Pr(Y=k|X=x)=\frac{Pr(X=x|Y=k)Pr(Y=k)}{sum_{l=1}^{K}Pr(X=x|Y=l)Pr(Y=l)}$">  
    <img src="https://render.githubusercontent.com/render/math?math=$Pr(Y=k|X=x)=\frac{f_{k}(x)\pi_{k}}{\sum_{l=1}^{K}f_{l}(x)\pi_{l}}$">  
<img src="https://render.githubusercontent.com/render/math?math=$f_{k}(x)$"> is a gaussian distribution function on univariate or multivariate gaussian distribution.  
<img src="https://render.githubusercontent.com/render/math?math=$f_{k}(x)=\frac{1}{\sigma_{k}\sqrt{2\pi}}e^{%2D\frac{(x%2D\mu_{k})^{2}}{\sigma_{k}^{2}}}$"> where <img src="https://render.githubusercontent.com/render/math?math=$(\mu_{k},\sigma_{k}^{2})$"> are estimated from the data.  
The class is assigned based on whichever class probabilities is the highest.  

**Classifiers**  
- Linear discriminate analysis assumes <img src="https://render.githubusercontent.com/render/math?math=$f_{k}(x)$"> to be multivariate gaussian with same covariance - to which linear lines are fitted.  
- Quadratic discriminate analysis assumes <img src="https://render.githubusercontent.com/render/math?math=$f_{k}(x)$"> to be multivariate gaussian with different covariance - which allows for
quadratic curves to be used to fit the data.  
- Model based prediction assumes more complicated versions for the covariance 
matrix.  
- Naive Bayes classifier assumes independence between each of the classifying 
features. 

**Discriminate function**  
Decide on the class of the datapoint to a class k which has highest value for <img src="https://render.githubusercontent.com/render/math?math=$\hat{Y}(x)=argmax_{k}\delta_{k}(x)$">, where  
<img src="https://render.githubusercontent.com/render/math?math=$\delta_{k}(x)=x^{T}\sum^{-1}\mu_{k}%2D\frac{1}{2}\mu_{k}\sum^{-1}\mu_{k}%2Blog(\mu_{k})$">  
We usually estimate paramters using MLE.  

**Naive Bayes**  
Required model: <img src="https://render.githubusercontent.com/render/math?math=$Pr(Y=k|X_{1},X_{2},...,X_{m})$">  
Using Bayes theorem we can get:   
    <img src="https://render.githubusercontent.com/render/math?math=$Pr(Y=k|X_{1},X_{2},...,X_{m})=\frac{\pi_{k}P(X_{1},X_{2},...,X_{m}|Y=k)}{\sum_{l=1}^{K}\pi_{l}P(X_{1},X_{2},...,X_{m}|Y=l)}\propto\pi_{k}P(X_{1},X_{2},...,X_{m}|Y=k)$"> since the denominator is constant for each.  
This can be written as:  
    <img src="https://render.githubusercontent.com/render/math?math=$Pr(Y=k|X_{1},X_{2},...,X_{m})=\pi_{k}P(X_{1}|Y=k)P(X_{2}, X_{3},...,X_{m}|Y=k)$">  
    which can be further expanded to  
    <img src="https://render.githubusercontent.com/render/math?math=$Pr(Y=k|X_{1},X_{2},...,X_{m})=\pi_{k}P(X_{1}|Y=k)P(X_{2}|X_{1},Y=k)...P(X_{m}|X_{1},...,X_{m-1},Y=k)$">  
Thus we can approximate to the conclusion assuming all variables are indepent of
each other: 
    <img src="https://render.githubusercontent.com/render/math?math=$Pr(Y=k|X_{1},X_{2},...,X_{m})\approx\pi_{k}P(X_{1}|Y=k)P(X_{2}|Y=k)...P(X_{m}|Y=k)$">  
    
Naive Bayes works best when the dataset has a lot of binary or categorical 
features.  

## Regularization 
Overfitting can occur if the training data does not accurately represent the
distribution of test data. Overfitting can be fixed by reducing the number of 
features in the training data and reducing the complexity of the network through
various techniques.  
Regularization techniques reduce the possibility of overfitting by constraining 
the range of values that the coefficients can take to 0 or close to 0.   
Regularization does not perform well on boosting and random forests, It is also 
computationally demanding on large datasets.  

Consider a regression model: <img src="https://render.githubusercontent.com/render/math?math=$Y=\beta_{0}%2B\beta_{1}X_{1}%2B\beta_{2}X_{2}%2B\eta$">,  
if <img src="https://render.githubusercontent.com/render/math?math=$X_{1}$"> and <img src="https://render.githubusercontent.com/render/math?math=$X_{2}$"> are nearly perfectly correlated (colinear), then we could combine the 
variables as <img src="https://render.githubusercontent.com/render/math?math=$Y=\beta_{0}%2B\beta_{1}(X_{1}%2BX_{2})%2B\eta$">  
This may tend to increase the bias because we chose to leave a predictor out of 
the fit, but the variance will be lowered if the two variables are highly 
correlated with each other.  

### Decomposing the prediction error
If <img src="https://render.githubusercontent.com/render/math?math=$Y_{i}$"> is 
outcome of regression variable <img src="https://render.githubusercontent.com/render/math?math=$X_{i}$">, <img src="https://render.githubusercontent.com/render/math?math=$Y_{i}=f(X_{i})%2B\eta$">   
Then the estimated prediction error (EPE) = <img src="https://render.githubusercontent.com/render/math?math=$E\left[\{Y-\hat{f}_{\lambda}(X)\}^{2}\right]$">  
<img src="https://render.githubusercontent.com/render/math?math=$\hat{f}_{lambda}$"> is estimate from the training data, trained using particular set of tuning parameters <img src="https://render.githubusercontent.com/render/math?math=$\lambda$">  
The prediction error can be decomposed as: <img src="https://render.githubusercontent.com/render/math?math=$E\left[\{Y-\hat{f}_{\lambda}(X)\}^{2}\right]=\sigma^{2}%2B\{E[\hat{f}_{\lambda}(x^{*})]%2Df(x^{*})\}^{2}%2Bvar[\hat{f}_{\lambda}(x_{0})]$">  
    = Irreducible Error + <img src="https://render.githubusercontent.com/render/math?math=$\mathrm{Bias}^{2}$"> + Variance  

If variables are highly correlated, then the coefficients can be really high
leading to high variance leading to large prediction error. To constraint the 
variance term we add a regularization factor to the prediction <img src="https://render.githubusercontent.com/render/math?math=$\hat{Y}$"> such that 
we get the penalized residual sum of squares (PRSS)  
<img src="https://render.githubusercontent.com/render/math?math=$PRSS(\beta)$"> = <img src="https://render.githubusercontent.com/render/math?math=$\sum_{j=1}^{n}\left(Y_{j}%2D\sum_{i=1}^{m}\beta_{1i}X_{ij}\right)^{2}%2BP(\lambda:\beta)$">

**Ridge regression**: 
<img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{N}\left(y_{i}%2D\beta_{0}%2B\sum_{j=1}^{p}x_{ij}\beta_{j}\right)^{2}%2B\lambda\sum_{j=1}^{p}\beta_{j}^{2}$">  
Inclusion of <img src="https://render.githubusercontent.com/render/math?math=$\lambda$"> makes the problem non-singular even if <img src="https://render.githubusercontent.com/render/math?math=$X^{T}X$"> is not invertible.  
<img src="https://render.githubusercontent.com/render/math?math=$\lambda$"> controls the regularization. 

**Lasso regression**:
<img src="https://render.githubusercontent.com/render/math?math=$\sum_{i=1}^{N}\left(y_{i}%2D\beta_{0}%2B\sum_{j=1}^{p}x_{ij}\beta_{j}\right)^{2}%2B\lambda\sum_{j=1}^{p}|\beta_{j}|$">   

## Forecasting  
Used on data that are dependent on time.



