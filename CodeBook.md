## Human Activity Recognition Using Smartphones Data Set
- The original data set can be downloaded from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones  </br>

### Before Processing:
#### Training data include:
- X_train.txt: each row contains 561 features (variables), and there are 7352 samples in total </br>
  The features are composed of spatial and frequency measurements (e.g. mean, standard deviation, entropy, and so on) based on 3-axis (x, y, z) acceleration from the accelerometer (total acceleration) and the estimated body acceleration, 3-axis (x, y, z) angular velocity from the gyroscope. </br>
  Dimension: 7352 by 561 </br>

- y_train.txt: each row shows a value indicating an activity. </br>
  Dimension: 7352 by 1 </br>

- subject_train.txt: each row indicates a subject. </br>
  Dimension: 7352 by 1 </br>

#### Testing data include
- X_test.txt: similar to training data </br>
  Dimension: 2947 by 561 </br>

- y_test.txt: similar to training data </br>
  Dimension: 2947 by 1 </br>

- subject_test.txt: similar to training data </br>
  Dimension: 2947 by 1 </br>

### After Processing:
#### Combined training and testing data into a single data frame
- The testing data were row-binded after training data. </br>
- y (activity), subject, and X (features) were column-binded. </br>

#### Variables in X (features) data set are reduced to those related to mean() and std() of certain measurements.
- Dimension of features was reduced from 561 to 66 </br>
- The names of features were slighted modified by removing "-" and "()" which may cause troubles when serving as parameters or indices. </br>

#### A summarized data frame can be outputted at the end (average_features_in_groups.txt).
- ddply function was applied to compute the column-wise mean for each group (specified by activity and subject). In other words, the statistics of the features can be assessed more easily through group-wise analysis. </br>
- The detailed meanings of the features can also be found from http://www.cs.ubc.ca/~nando/540-2013/projects/p1.pdf: </br>
  1. tBodyAcc-XYZ: Time domain acceleration due to external force</br>
  2. tGravityAcc-XYZ: Time domain acceleration of gravity</br>
  3. tBodyAccJerk-XYZ: Time domain derivative of external force</br>
  4. tBodyGyro-XYZ: Time domain angular velocity</br>
  5. tBodyGyroJerk-XYZ: Time domain derivative of angular velocity</br>
  6. tBodyAccMag: Time domain magnitude of external force</br>
  7. tGravityAccMag: Time domain magnitude of gravity</br>
  8. tBodyAccJerkMag: Time domain magnitude of derivative of force</br>
  9. tBodyGyroMag: Time domain magnitude of angular velocity</br>
  10. tBodyGyroJerkMag: Time domain magnitude angular velocity derivative</br>
  11. fBodyAcc-XYZ: Frequency Domain of 1</br>
  12. fBodyAccJerk-XYZ: Frequency Domain of 3</br>
  13. fBodyGyro-XYZ: Frequency Domain of 4</br>
  14. fBodyAccMag: Frequency Domain of 6</br>
  15. fBodyAccJerkMag: Frequency Domain of 8</br>
  16. fBodyGyroMag: Frequency Domain of 9</br>
  17. fBodyGyroJerkMag: Frequency Domain of 10</br>
- The names of the features were slightly modified by adding "average" in front of the feature names because the values were all averaged according to the groups. </br>
