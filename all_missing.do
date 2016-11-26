* ************************************************************************
* https://github.com/evpu
* Identify and drop variables that have missing data across all observations
* Identify and drop observations that have missing data across all variables
* ************************************************************************

clear all
set seed 20161126

* Example dataset, create some random variables with missing data
set obs 20
gen year = 2016
gen cold = rpoisson(2)
gen hot = rpoisson(7)
gen lukewarm = rpoisson(5)
gen missing = .
replace cold = . in 1/3
replace hot = . in 1/5
replace lukewarm = . in 1/10


* Variables
* Select all variables except year
ds year, not
foreach v of varlist `r(varlist)' {
    qui sum `v'
    if `r(N)'==0 {
        drop `v'
        di "Dropped variable `v'"
    }
}


* Observations
ds year, not
egen num_nonmiss = rownonmiss(`r(varlist)'), strok
drop if num_nonmiss == 0
drop num_nonmiss
