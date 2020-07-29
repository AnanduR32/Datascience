## Actions performed on data:

* Navigate to project directory `Case Studies\Human_Activity_Recognition_Using_Smartphones_Data_Set`
* downloading zip file: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* extracting zip file: `./data/data.zip` to `./data/UCI HAR Dataset`
* merging all *_test.txt and *_train.txt files into one dataset: `mergedDT`
* `mergedDT` loaded in memory, dimensions: 10299 x 563
* subsetted `mergedData` into `subSetMergedData` keeping only the key columns and features containing `std` or `mean`, dimensions : 10299 x 68
* merged `./UCI HAR Dataset/activity_labels.txt` contents with correct `activity_num` column, effectivly appending `activity_name` to `reqData` created from the `MergedDT`
* melt `reqData` into `baseData`, based on key columns
* cast `baseData` into **`secondDataSet`** with the mean of each variable for each activity and each subject.
* write `secondDataSet` to file  `./tidy_data.txt`


## `tidyData` variable

### key columns

Variable name       | Description
--------------------|------------
`activity`    | Label of activity, Factor w/ 6 levels
`subject`           | ID of subject, int (1-30)
### non-key columns

Variable name       | Description
--------------------|------------
`TimeDomain_BodyAccelerometer_Mean_X`  | the mean value for this feature
`TimeDomain_BodyAccelerometer_Mean_Y`     | the mean value for this feature
`TimeDomain_BodyAccelerometer_Mean_Z`     | the mean value for this feature
`TimeDomain_BodyAccelerometer_StandardDeviation_X`     | the standard deviation value for this feature
`TimeDomain_BodyAccelerometer_correlation_X,Z`     | the correlation value for this feature
`TimeDomain_BodyAccelerometer_correlation_Y,Z`     | the correlation value for this feature
`TimeDomain_GravityAccelerometer_Mean_X`     | the mean value for this feature
`TimeDomain_GravityAccelerometer_Mean_Y`     | the mean value for this feature
`TimeDomain_GravityAccelerometer_Mean_Z`     | the mean value for this feature
`TimeDomain_GravityAccelerometer_StandardDeviation_X`     | the standard deviation value for this feature
`TimeDomain_GravityAccelerometer_correlation_X,Z`     | the correlation value for this feature
`TimeDomain_GravityAccelerometer_correlation_Y,Z`     | the mean value for this feature
`TimeDomain_BodyAccelerometerJerk_Mean_X`     | the mean value for this feature
`TimeDomain_BodyAccelerometerJerk_Mean_Y`     | the mean value for this feature
`TimeDomain_BodyAccelerometerJerk_Mean_Z`     | the mean value for this feature
`TimeDomain_BodyAccelerometerJerk_StandardDeviation_X`     | the standard deviation value for this feature
`TimeDomain_BodyAccelerometerJerk_correlation_X,Z`     | the correlation value for this feature
`TimeDomain_BodyAccelerometerJerk_correlation_Y,Z`     | the correlation value for this feature
`TimeDomain_BodyGyroscope_Mean_X`     | the mean value for this feature
`TimeDomain_BodyGyroscope_Mean_Y`     | the mean value for this feature
`TimeDomain_BodyGyroscope_Mean_Z`     | the mean value for this feature
`TimeDomain_BodyGyroscope_StandardDeviation_X`     | the standard deviation value for this feature
`TimeDomain_BodyGyroscope_correlation_X,Z`     | the correlation value for this feature
`TimeDomain_BodyGyroscope_correlation_Y,Z`     | the correlation value for this feature
`TimeDomain_BodyGyroscopeJerk_Mean_X`     | the Gyroscope Jerk value for this feature
`TimeDomain_BodyGyroscopeJerk_Mean_Y`     | the Gyroscope Jerk value for this feature
`TimeDomain_BodyGyroscopeJerk_Mean_Z`     | the Gyroscope Jerk value for this feature
`TimeDomain_BodyGyroscopeJerk_StandardDeviation_X`     | the standard deviation value for this feature
`TimeDomain_BodyGyroscopeJerk_correlation_X,Z`     | the correlation value for this feature
`TimeDomain_BodyGyroscopeJerk_correlation_Y,Z`     | the correlation value for this feature
`TimeDomain_BodyAccelerometerMagnitude_arCoeff3`     | the mean value for this feature
`TimeDomain_BodyAccelerometerMagnitude_arCoeff4`     | the mean value for this feature
`TimeDomain_GravityAccelerometerMagnitude_arCoeff3`     | the mean value for this feature
`TimeDomain_GravityAccelerometerMagnitude_arCoeff4`     | the mean value for this feature
`TimeDomain_BodyAccelerometerJerkMagnitude_arCoeff3`     | the mean value for this feature
`TimeDomain_BodyAccelerometerJerkMagnitude_arCoeff4`     | the mean value for this feature
`TimeDomain_BodyGyroscopeMagnitude_arCoeff3`     | the mean value for this feature
`TimeDomain_BodyGyroscopeMagnitude_arCoeff4`     | the mean value for this feature
`TimeDomain_BodyGyroscopeJerkMagnitude_arCoeff3`     | the mean value for this feature
`TimeDomain_BodyGyroscopeJerkMagnitude_arCoeff4`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_Mean_X`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_Mean_Y`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_Mean_Z`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_StandardDeviation_X`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_maxInds_Y`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_maxInds_Z`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_meanFreq_X`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_bandsEnergy_1,24`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometer_bandsEnergy_25,48`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_Mean_X`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_Mean_Y`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_Mean_Z`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_StandardDeviation_X`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_maxInds_Y`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_maxInds_Z`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_meanFreq_X`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_bandsEnergy_1,24`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerJerk_bandsEnergy_25,48`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_Mean_X`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_Mean_Y`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_Mean_Z`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_StandardDeviation_X`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_maxInds_Y`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_maxInds_Z`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_meanFreq_X`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_bandsEnergy_1,24`     | the mean value for this feature
`FrequencyDomain_BodyGyroscope_bandsEnergy_25,48`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerMagnitude_entropy`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerMagnitude_skewness`     | the mean value for this feature
`FrequencyDomain_BodyAccelerometerMagnitude_kurtosis`     | the mean value for this feature
`FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_entropy`     | the mean value for this feature
`FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_skewness`     | the mean value for this feature
`FrequencyDomain_BodyBodyAccelerometerJerkMagnitude_kurtosis`     | the mean value for this feature
`FrequencyDomain_BodyBodyGyroscopeMagnitude_entropy`     | the mean value for this feature
`FrequencyDomain_BodyBodyGyroscopeMagnitude_skewness`     | the mean value for this feature
`FrequencyDomain_BodyBodyGyroscopeMagnitude_kurtosis`     | the mean value for this feature
`FrequencyDomain_BodyBodyGyroscopeJerkMagnitude_entropy`     | the mean value for this feature