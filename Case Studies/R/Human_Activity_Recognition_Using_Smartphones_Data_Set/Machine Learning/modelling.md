# Human Activity Prediction 

### Libraries 


```R
## Modelling
library(caret); library(rattle); library(randomForest); library(e1071); library(forecast)
## Data processing/visualization
library(dplyr); library(ggplot2); library(rattle)
```

#### Getting the data
Downloading


```R
train_URL = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-training.csv"
test_URL = "https://d396qusza40orc.cloudfront.net/predmachlearn/pml-testing.csv"
download.file(train_URL, destfile = "./data/train.csv")
download.file(test_URL, destfile = "./data/test.csv")
```

Loading


```R
train_raw = read.csv("./data/train.csv")
test_raw = read.csv("./data/test.csv")
head(train_raw)
```


<table>
<thead><tr><th scope=col>X</th><th scope=col>user_name</th><th scope=col>raw_timestamp_part_1</th><th scope=col>raw_timestamp_part_2</th><th scope=col>cvtd_timestamp</th><th scope=col>new_window</th><th scope=col>num_window</th><th scope=col>roll_belt</th><th scope=col>pitch_belt</th><th scope=col>yaw_belt</th><th scope=col>...</th><th scope=col>gyros_forearm_x</th><th scope=col>gyros_forearm_y</th><th scope=col>gyros_forearm_z</th><th scope=col>accel_forearm_x</th><th scope=col>accel_forearm_y</th><th scope=col>accel_forearm_z</th><th scope=col>magnet_forearm_x</th><th scope=col>magnet_forearm_y</th><th scope=col>magnet_forearm_z</th><th scope=col>classe</th></tr></thead>
<tbody>
	<tr><td>1               </td><td>carlitos        </td><td>1323084231      </td><td>788290          </td><td>05/12/2011 11:23</td><td>no              </td><td>11              </td><td>1.41            </td><td>8.07            </td><td>-94.4           </td><td>...             </td><td>0.03            </td><td> 0.00           </td><td>-0.02           </td><td>192             </td><td>203             </td><td>-215            </td><td>-17             </td><td>654             </td><td>476             </td><td>A               </td></tr>
	<tr><td>2               </td><td>carlitos        </td><td>1323084231      </td><td>808298          </td><td>05/12/2011 11:23</td><td>no              </td><td>11              </td><td>1.41            </td><td>8.07            </td><td>-94.4           </td><td>...             </td><td>0.02            </td><td> 0.00           </td><td>-0.02           </td><td>192             </td><td>203             </td><td>-216            </td><td>-18             </td><td>661             </td><td>473             </td><td>A               </td></tr>
	<tr><td>3               </td><td>carlitos        </td><td>1323084231      </td><td>820366          </td><td>05/12/2011 11:23</td><td>no              </td><td>11              </td><td>1.42            </td><td>8.07            </td><td>-94.4           </td><td>...             </td><td>0.03            </td><td>-0.02           </td><td> 0.00           </td><td>196             </td><td>204             </td><td>-213            </td><td>-18             </td><td>658             </td><td>469             </td><td>A               </td></tr>
	<tr><td>4               </td><td>carlitos        </td><td>1323084232      </td><td>120339          </td><td>05/12/2011 11:23</td><td>no              </td><td>12              </td><td>1.48            </td><td>8.05            </td><td>-94.4           </td><td>...             </td><td>0.02            </td><td>-0.02           </td><td> 0.00           </td><td>189             </td><td>206             </td><td>-214            </td><td>-16             </td><td>658             </td><td>469             </td><td>A               </td></tr>
	<tr><td>5               </td><td>carlitos        </td><td>1323084232      </td><td>196328          </td><td>05/12/2011 11:23</td><td>no              </td><td>12              </td><td>1.48            </td><td>8.07            </td><td>-94.4           </td><td>...             </td><td>0.02            </td><td> 0.00           </td><td>-0.02           </td><td>189             </td><td>206             </td><td>-214            </td><td>-17             </td><td>655             </td><td>473             </td><td>A               </td></tr>
	<tr><td>6               </td><td>carlitos        </td><td>1323084232      </td><td>304277          </td><td>05/12/2011 11:23</td><td>no              </td><td>12              </td><td>1.45            </td><td>8.06            </td><td>-94.4           </td><td>...             </td><td>0.02            </td><td>-0.02           </td><td>-0.03           </td><td>193             </td><td>203             </td><td>-215            </td><td> -9             </td><td>660             </td><td>478             </td><td>A               </td></tr>
</tbody>
</table>




```R
dim(train_raw); dim(test_raw)
```


<ol class=list-inline>
	<li>19622</li>
	<li>160</li>
</ol>




<ol class=list-inline>
	<li>20</li>
	<li>160</li>
</ol>



## Data cleaning
There are lot of unnecessary variables, some of which are highly correlated.  
The 'raw_timestamp' is used to derive converted timestamp - 'cvtd_timestamp'  

I remove X, user_name, new_window, num_window to simplify the model further, and
raw_timestamp_part_1, raw_timestamp_part_2, cvtd_timestamp because our goal is to identify the class of activity and timeseries information has no significant role in assessing this. 

Looking for **missing** data 


```R
missing = union(as.numeric(which(sapply(train_raw, function(x){mean(is.na(x))})>0.80)),
                as.numeric(which(sapply(train_raw, function(x){mean(x=="", na.rm = T)})>0.80)))
missing = union(missing, c(1,2,3,4,5,6,7))
missing
```


<ol class=list-inline>
	<li>18</li>
	<li>19</li>
	<li>21</li>
	<li>22</li>
	<li>24</li>
	<li>25</li>
	<li>27</li>
	<li>28</li>
	<li>29</li>
	<li>30</li>
	<li>31</li>
	<li>32</li>
	<li>33</li>
	<li>34</li>
	<li>35</li>
	<li>36</li>
	<li>50</li>
	<li>51</li>
	<li>52</li>
	<li>53</li>
	<li>54</li>
	<li>55</li>
	<li>56</li>
	<li>57</li>
	<li>58</li>
	<li>59</li>
	<li>75</li>
	<li>76</li>
	<li>77</li>
	<li>78</li>
	<li>79</li>
	<li>80</li>
	<li>81</li>
	<li>82</li>
	<li>83</li>
	<li>93</li>
	<li>94</li>
	<li>96</li>
	<li>97</li>
	<li>99</li>
	<li>100</li>
	<li>103</li>
	<li>104</li>
	<li>105</li>
	<li>106</li>
	<li>107</li>
	<li>108</li>
	<li>109</li>
	<li>110</li>
	<li>111</li>
	<li>112</li>
	<li>131</li>
	<li>132</li>
	<li>134</li>
	<li>135</li>
	<li>137</li>
	<li>138</li>
	<li>141</li>
	<li>142</li>
	<li>143</li>
	<li>144</li>
	<li>145</li>
	<li>146</li>
	<li>147</li>
	<li>148</li>
	<li>149</li>
	<li>150</li>
	<li>12</li>
	<li>13</li>
	<li>14</li>
	<li>15</li>
	<li>16</li>
	<li>17</li>
	<li>20</li>
	<li>23</li>
	<li>26</li>
	<li>69</li>
	<li>70</li>
	<li>71</li>
	<li>72</li>
	<li>73</li>
	<li>74</li>
	<li>87</li>
	<li>88</li>
	<li>89</li>
	<li>90</li>
	<li>91</li>
	<li>92</li>
	<li>95</li>
	<li>98</li>
	<li>101</li>
	<li>125</li>
	<li>126</li>
	<li>127</li>
	<li>128</li>
	<li>129</li>
	<li>130</li>
	<li>133</li>
	<li>136</li>
	<li>139</li>
	<li>1</li>
	<li>2</li>
	<li>3</li>
	<li>4</li>
	<li>5</li>
	<li>6</li>
	<li>7</li>
</ol>



Removing **zero** or **near-zero covariates**


```R
nzv = nearZeroVar(train_pre_clean)
nzv
```





No output suggests all of the remaining covariates contribute significant information to modelling a predictve model.

**Cleaned** dataset


```R
train_clean = train_raw[,-missing]
test_clean = test_raw[,-missing]
dim(train_clean); dim(test_clean)
```


<ol class=list-inline>
	<li>19622</li>
	<li>53</li>
</ol>




<ol class=list-inline>
	<li>20</li>
	<li>53</li>
</ol>




```R
head(train_clean)
```


<table>
<thead><tr><th scope=col>roll_belt</th><th scope=col>pitch_belt</th><th scope=col>yaw_belt</th><th scope=col>total_accel_belt</th><th scope=col>gyros_belt_x</th><th scope=col>gyros_belt_y</th><th scope=col>gyros_belt_z</th><th scope=col>accel_belt_x</th><th scope=col>accel_belt_y</th><th scope=col>accel_belt_z</th><th scope=col>...</th><th scope=col>gyros_forearm_x</th><th scope=col>gyros_forearm_y</th><th scope=col>gyros_forearm_z</th><th scope=col>accel_forearm_x</th><th scope=col>accel_forearm_y</th><th scope=col>accel_forearm_z</th><th scope=col>magnet_forearm_x</th><th scope=col>magnet_forearm_y</th><th scope=col>magnet_forearm_z</th><th scope=col>classe</th></tr></thead>
<tbody>
	<tr><td>1.41 </td><td>8.07 </td><td>-94.4</td><td>3    </td><td>0.00 </td><td>0.00 </td><td>-0.02</td><td>-21  </td><td>4    </td><td>22   </td><td>...  </td><td>0.03 </td><td> 0.00</td><td>-0.02</td><td>192  </td><td>203  </td><td>-215 </td><td>-17  </td><td>654  </td><td>476  </td><td>A    </td></tr>
	<tr><td>1.41 </td><td>8.07 </td><td>-94.4</td><td>3    </td><td>0.02 </td><td>0.00 </td><td>-0.02</td><td>-22  </td><td>4    </td><td>22   </td><td>...  </td><td>0.02 </td><td> 0.00</td><td>-0.02</td><td>192  </td><td>203  </td><td>-216 </td><td>-18  </td><td>661  </td><td>473  </td><td>A    </td></tr>
	<tr><td>1.42 </td><td>8.07 </td><td>-94.4</td><td>3    </td><td>0.00 </td><td>0.00 </td><td>-0.02</td><td>-20  </td><td>5    </td><td>23   </td><td>...  </td><td>0.03 </td><td>-0.02</td><td> 0.00</td><td>196  </td><td>204  </td><td>-213 </td><td>-18  </td><td>658  </td><td>469  </td><td>A    </td></tr>
	<tr><td>1.48 </td><td>8.05 </td><td>-94.4</td><td>3    </td><td>0.02 </td><td>0.00 </td><td>-0.03</td><td>-22  </td><td>3    </td><td>21   </td><td>...  </td><td>0.02 </td><td>-0.02</td><td> 0.00</td><td>189  </td><td>206  </td><td>-214 </td><td>-16  </td><td>658  </td><td>469  </td><td>A    </td></tr>
	<tr><td>1.48 </td><td>8.07 </td><td>-94.4</td><td>3    </td><td>0.02 </td><td>0.02 </td><td>-0.02</td><td>-21  </td><td>2    </td><td>24   </td><td>...  </td><td>0.02 </td><td> 0.00</td><td>-0.02</td><td>189  </td><td>206  </td><td>-214 </td><td>-17  </td><td>655  </td><td>473  </td><td>A    </td></tr>
	<tr><td>1.45 </td><td>8.06 </td><td>-94.4</td><td>3    </td><td>0.02 </td><td>0.00 </td><td>-0.02</td><td>-21  </td><td>4    </td><td>21   </td><td>...  </td><td>0.02 </td><td>-0.02</td><td>-0.03</td><td>193  </td><td>203  </td><td>-215 </td><td> -9  </td><td>660  </td><td>478  </td><td>A    </td></tr>
</tbody>
</table>



## Modelling Random Forests classifier

splitting the training dataset into train and validation sets


```R
inTrain = createDataPartition(train_clean$classe, p = 0.75, list = F)
training = train_clean[inTrain,]
validation = train_clean[-inTrain,]
```

#### Building classifier


```R
train_control_params = trainControl(method="repeatedcv", number=10, repeats= 5)
mdl_rf = train(classe~., method = "rf", trControl=train_control_params, ntree = 10, data = training)
```

#### Evaluating the model on validation set


```R
val_preds = predict(mdl_rf, newdata = validation) 
```


```R
confusionMatrix(val_preds, validation$classe)
```


    Confusion Matrix and Statistics
    
              Reference
    Prediction    A    B    C    D    E
             A 1394    8    0    0    0
             B    1  938    5    1    0
             C    0    2  845    7    3
             D    0    0    5  796    7
             E    0    1    0    0  891
    
    Overall Statistics
                                              
                   Accuracy : 0.9918          
                     95% CI : (0.9889, 0.9942)
        No Information Rate : 0.2845          
        P-Value [Acc > NIR] : < 2.2e-16       
                                              
                      Kappa : 0.9897          
                                              
     Mcnemar's Test P-Value : NA              
    
    Statistics by Class:
    
                         Class: A Class: B Class: C Class: D Class: E
    Sensitivity            0.9993   0.9884   0.9883   0.9900   0.9889
    Specificity            0.9977   0.9982   0.9970   0.9971   0.9998
    Pos Pred Value         0.9943   0.9926   0.9860   0.9851   0.9989
    Neg Pred Value         0.9997   0.9972   0.9975   0.9980   0.9975
    Prevalence             0.2845   0.1935   0.1743   0.1639   0.1837
    Detection Rate         0.2843   0.1913   0.1723   0.1623   0.1817
    Detection Prevalence   0.2859   0.1927   0.1748   0.1648   0.1819
    Balanced Accuracy      0.9985   0.9933   0.9927   0.9936   0.9943


### Predicting test set


```R
test_preds = predict(mdl_rf, test_clean)
test_preds
```


<ol class=list-inline>
	<li>B</li>
	<li>A</li>
	<li>B</li>
	<li>A</li>
	<li>A</li>
	<li>E</li>
	<li>D</li>
	<li>B</li>
	<li>A</li>
	<li>A</li>
	<li>B</li>
	<li>C</li>
	<li>B</li>
	<li>A</li>
	<li>E</li>
	<li>E</li>
	<li>A</li>
	<li>B</li>
	<li>B</li>
	<li>B</li>
</ol>

<details>
	<summary style=display:list-item;cursor:pointer>
		<strong>Levels</strong>:
	</summary>
	<ol class=list-inline>
		<li>'A'</li>
		<li>'B'</li>
		<li>'C'</li>
		<li>'D'</li>
		<li>'E'</li>
	</ol>
</details>


### Visualizing decision tree


```R
mdl_rpart = train(classe~., method = "rpart", data = training)
fancyRpartPlot(mdl_rpart$finalModel, sub="")
```


![png](output_25_0.png)

