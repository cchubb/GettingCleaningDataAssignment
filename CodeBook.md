Getting and Cleaning Data Course Project Code Book
==================================================
Chris Chubb
cchubb@codegurus.com
Create Date: July 6, 2016

---

Notes
=====

  * This data is sourced from the README.txt file inside the [compressed archive](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). Please review that file for any additional information that is required.
  * The collection methodology and details for the measures are further discussed in the features_info.txt file in the same archive file.
  * All measurements are of acceleration, measured are in gravities (g), referenced to 1.0 as Earth Standard. 
  * The following word in each measure name signify:
    * time - The measure is in the time domain.
    * frequency - The measure is in the frequency domain, taken via a Fast Fourier Transform.
    * body - The measure is of the body's motion
    * gravity - The measure is of the force of gravity
    * acceleration - Acceleration as measured from the phone's accelerometer
    * gyro - Angular acceleration as measured from the phone's gyroscope
    * jerk - The derivation of the acceleration measure over time
    * mag - The magnitude of the jerk signal by Euclidian norm
    * mean - The geometric mean of the sampled values
    * std - Standard deviation of the sampled values
    * x, y, z - Indicates the dimension along which the measurement was taken. 

Measures
--------

subject 

  * *factor* 
  * The integer numeric factor of the test subject. 
  * There are 30 distinct subjects in this sample.

activity_label

  * *factor*
  * The activity performed by the test subject for this sample. 
  * Levels: 
    * LAYING 
    * SITTING 
    * STANDING 
    * WALKING 
    * WALKING_DOWNSTAIRS 
    * WALKING_UPSTAIRS
  
time.body.acceleration.mean.x

  * *numeric*
  * Mean of time domain measure of body acceleration along the x axis.

time.body.acceleration.mean.y

  * *numeric*
  * Mean of time domain measure of body acceleration along the z axis.

time.body.acceleration.mean.z

  * *numeric*
  * Mean of time domain measure of body acceleration along the z axis.

time.body.acceleration.std.x

  * ..., etc. See "Notes" above for explanation of further factors.

time.body.acceleration.std.y

time.body.acceleration.std.z

time.gravity.acceleration.mean.x

time.gravity.acceleration.mean.y

time.gravity.acceleration.mean.z

time.gravity.acceleration.std.x

time.gravity.acceleration.std.y

time.gravity.acceleration.std.z

time.body.acceleration.jerk.mean.x

time.body.acceleration.jerk.mean.y

time.body.acceleration.jerk.mean.z

time.body.acceleration.jerk.std.x

time.body.acceleration.jerk.std.y

time.body.acceleration.jerk.std.z

time.body.gyro.mean.x

time.body.gyro.mean.y

time.body.gyro.mean.z

time.body.gyro.std.x

time.body.gyro.std.y

time.body.gyro.std.z

time.body.gyro.jerk.mean.x

time.body.gyro.jerk.mean.y

time.body.gyro.jerk.mean.z

time.body.gyro.jerk.std.x

time.body.gyro.jerk.std.y

time.body.gyro.jerk.std.z

time.body.acceleration.mag.mean

time.body.acceleration.mag.std

time.gravity.acceleration.mag.mean

time.gravity.acceleration.mag.std

time.body.acceleration.jerk.mag.mean

time.body.acceleration.jerk.mag.std

time.body.gyro.mag.mean

time.body.gyro.mag.std

time.body.gyro.jerk.mag.mean

time.body.gyro.jerk.mag.std

frequency.body.acceleration.mean.x

frequency.body.acceleration.mean.y

frequency.body.acceleration.mean.z

frequency.body.acceleration.std.x

frequency.body.acceleration.std.y

frequency.body.acceleration.std.z

frequency.body.acceleration.jerk.mean.x

frequency.body.acceleration.jerk.mean.y

frequency.body.acceleration.jerk.mean.z

frequency.body.acceleration.jerk.std.x

frequency.body.acceleration.jerk.std.y

frequency.body.acceleration.jerk.std.z

frequency.body.gyro.mean.x

frequency.body.gyro.mean.y

frequency.body.gyro.mean.z

frequency.body.gyro.std.x

frequency.body.gyro.std.y

frequency.body.gyro.std.z

frequency.body.acceleration.mag.mean

frequency.body.acceleration.mag.std

frequency.body.body.acceleration.jerk.mag.mean

frequency.body.body.acceleration.jerk.mag.std

frequency.body.body.gyro.mag.mean

frequency.body.body.gyro.mag.std

frequency.body.body.gyro.jerk.mag.mean

frequency.body.body.gyro.jerk.mag.std

