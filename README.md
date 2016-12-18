# Dropping all missing variables and observations
UPD: there is package "ssc install missings" that can handle all these cases.

The code allows to drop variables that are missing across all observations and to drop observations that are missing across all variables (from http://stackoverflow.com/questions/25165683/how-do-i-delete-observations-with-no-data-in-stata/25166183). For example, all the areas highlighted in the image below:

![Example](https://raw.githubusercontent.com/evpu/All-Missing-Variables-or-Observations-Stata/master/example.PNG)
s
