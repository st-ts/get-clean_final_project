# Codebook for the resulting dataset

Dataset has 71 variables, the names of which can be decomposed into several elements to specify the type of data

## First letter
_Applies to every variable in the set except for __gravityMean__._

__t__ - represents time domain, captured at a constant rate of 50 Hz; hen they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise.

__f__ - represents frequency domain (after apptication of Fast Fourier Transform)

## Core variables
### Spatial variable followed by X, Y, Z:
_For each of the spatial variable there are 3 values for different dimentions: __X__, __Y__, __Z__._

__BodyAcc__ - data from accelerometer separated into Body and Gravity (this is a Body part) by using low pass Butterworth filter with a corner frequency of 0.3 Hz

__GravityAcc__ - data from accelerometer separated into Body and Gravity (this is a Gravity part) by using low pass Butterworth filter with a corner frequency of 0.3 Hz

__BodyAccJerk__ - data computed from the body linear acceleration to derive Jerk signal

__BodyGyro__ - data from gyroscope (angular velocity)

__BodyGyroJerk__ - Jerk computed form angular velocity (data from gyroscope)


### Non-spatial variables
__BodyAccMag__ - Magnitude computed from the X, Y and Z values of __BodyAcc__ using the Euclidean norm

__GravityAccMag__ - Magnitude computed from the X, Y and Z values of __GravityAcc__ using the Euclidean norm

__BodyAccJerkMag__ - Magnitude computed from the X, Y and Z values of __BodyAccJerk__ using the Euclidean norm

__BodyGyroMag__ - Magnitude computed from the X, Y and Z values of  __BodyGyro__ using the Euclidean norm

__BodyGyroJerkMag__ - Magnitude computed from the X, Y and Z values of __BodyGyroJerk__ using the Euclidean norm


### Specification of the core variable type (last word):
__mean()__ - represents the mean value

__std()__ - represents the standard deviation


## Additional variables
_Vectors obtained by averaging the signals in a signal window  based on an angle between two vectors_
__gravityMean__ - for gravity

__BodyAccMean__ - for __BodyAcc__

__BodyAccJerkMean__ - for __BodyAccJerk__

__BodyGyroMean__ - for __BodyGyro__

__BodyGyroJerkMean__ - for __BodyGyroJerk__


