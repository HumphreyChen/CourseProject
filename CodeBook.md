## Human Activity Recognition Using Smartphones Data Set
### Before Processing:
#### Training data include:
- X_train.txt: each row contains 561 features (variables), and there are 7352 samples in total </br>
  The features are composed of spatial and frequency measurements (e.g. mean, std, entropy, and so on) based on 3-axis acceleration from the accelerometer (total acceleration) and the estimated body acceleration, 3-axis angular velocity from the gyroscope. </br>
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

#### A summarized data frame can be outputted at the end.
- ddply function was applied to compute the column-wise mean for each group (specified by activity and subject). In other words, the statistics of the features can be assessed more easily through group-wise analysis. </br>
- The names of features were slightly modified ("average 'FEATURE NAME'") because the values were all averaged according to the groups.
