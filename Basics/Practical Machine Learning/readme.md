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
    <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{(TP%2BFN)}}{\mathrm{true%20positive}}$">  
- Negative predicted value: Pr(no disease|negative test)  
    What fraction of the negatively tested individuals actually don't have the
    disease  
    <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{(TN%2BFP)}}{\mathrm{TN}}$">
- Accuracy: Pr(correct outcome)  
    <img src="https://render.githubusercontent.com/render/math?math=$\frac{\mathrm{(TN%2BTP)}}{\mathrm{TN%2BTP%2BFP%2BFN}}$">  