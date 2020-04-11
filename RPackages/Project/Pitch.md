DevelopingDataProducts
========================================================
author: Prateek Sarangi
date: "2020-04-07"
autosize: true

About the application
========================================================
This Shiny app allows a user to specify a distribution, and generates a histogram of this distribution. Additionally, a user can specify the number of observations in the distribution, the number of bins in which to split the observations into, the mean, and the standard deviation.

Working of the application
========================================================


Working of the application
========================================================
The mean and standard deviation are only used by the normal distribution. These values are ignored for the uniform and exponential distributions.

Sliders are used to take in user input, helping to reduce user input errors by strictly limiting the type of input which may be used.

This web app is contained within two files: server.R and ui.R, both included in this github repo.
