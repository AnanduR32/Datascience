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
 


