// Author: Po-Jui(Louie) Huang
// Date: 13th Nov. 2025
// Goal: solve EC423 problem set 4
/*=================================*/
cd "C:\Users\user0522\Documents\GitHub\predoc-coding-sample-Po-Jui-Huang\labour_econ_pset4"

/*use log*/
log using ".\labour_pset4_Po-Jui_Huang.log", replace name(labour_pset4_Po_Jui_Huang)

/*import data*/
use ".\ec423ps4\ec423ps4\nlsy_2014_data.dta", clear

/*3*/
// a, b
sum hrp1 if hrp1 > 0, detail
sum hrp2 if hrp2 > 0, detail
// c
gen ln_hr_wage = ln(hrp1)
histogram ln_hr_wage, xtitle("log of the hourly pay of job #1") title("Distribution of the log of the hourly pay of job #1.")
//graph export ".\hist_ln_hrpay.png", as(png) name("hist_ln_hrpay") replace


/*4*/
// a
sum sampweight, detail
replace sampweight = sampweight/100
// b
tabstat sampweight, by(id)

/*5*/
// a
tab q3_4, label
tab q3_4, nolabel
// b
gen yschl = q3_4 if q3_4 > 0
replace yschl = 0 if yschl == 95
tab yschl

/*6*/
// a
gen age = 114 - dob_year //(2014 - birth year)
tab age
// b
gen agesq = age^2
// c
gen mom_schl = hgc_mother
gen pop_schl = hgc_father
svyset [pw = sampweight]
svy: mean mom_schl pop_schl
mean mom_schl pop_schl [pweight=sampweight ]
// d
tab sex
tab sex, nolabel
gen female = sex == 2
svy: mean yschl , over(female)
mean yschl  [pweight=sampweight ], over(female)
// e
//(1) use correlate with aweights for point estimates of the correlation.
//(2) use svy: regress for p-values. Do svy: regress y x and svy: regress x y and take the biggest p-value, which is the conservative thing to do.
corr yschl mom_schl pop_schl [aw = sampweight]
quietly svy: reg yschl mom_schl
eststo kid_mom
quietly svy: reg mom_schl yschl
eststo mom_kid
quietly svy: reg yschl pop_schl
eststo kid_pop
quietly svy: reg pop_schl yschl
eststo pop_kid
esttab
est clear
// f
gen afqt = afqt_3/1000 if afqt_3 > 0
// g
tab q11_5a
gen health_problem = q11_5a == 1
tab health_problem

/*7*/
// a
eststo: quietly regress ln_hr_wage yschl [pweight = sampweight], r
// b
eststo: quietly regress ln_hr_wage yschl female age agesq mom_schl pop_schl [pweight = sampweight], r
// c
eststo: quietly regress ln_hr_wage yschl female age agesq afqt [pweight = sampweight], r
// d
eststo: quietly regress ln_hr_wage yschl female age agesq afqt health_problem [pweight = sampweight], r
// e
eststo: quietly regress ln_hr_wage i.yschl female age agesq afqt [pweight = sampweight], r
eststo: quietly regress ln_hr_wage i.yschl female age agesq afqt if yschl >= 8 [pweight = sampweight], r
xi i.yschl
eststo: quietly regress ln_hr_wage ib12.yschl female age agesq afqt if yschl >= 8 [pweight = sampweight], r
// f
esttab using ".\reg_result.tex", replace noomit star(* 0.10 ** 0.05 *** 0.01) longtable  nobase title("Returns on Years of Schooling: Regression Results")
est clear

/*=================================*/
log close labour_pset4_Po_Jui_Huang