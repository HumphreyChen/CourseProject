## 1. Files
- download the data set from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip </br>
- unzip the data folder (named "UCI HAR Dataset") </br>
- Put run_analysis.R and the unzipped folder in the same working directory </br>

## 2. Run run_analysis.R
- Two files will be produced as txt and csv formats. The csv can be opened easily using Excel just for visually checking the contents.</br>
- The entire data sets were loaded first, then processed individually, and then merged together.</br>
- gsub function was used to replace certain characters in a string. </br>
- grep function was used to find strings which partially match a given string (for extracting the desired feature sets). </br>
- The process of summarizing data for each group (activity vs. subject) was achieved via ddply.  </br>
