// Goal:
// 1. compute industry level TFP
// 2. industry level reg 
// Note: There are two industry classifications.
/*------------------------------------*/
cd "my path"

// import data
import excel "./data/hhi_a.xlsx", sheet("Sheet1") firstrow clear
cap drop if (industry == 1) | (industry == 7) // just in case

// panel format
egen n_industry = group(industry)
xtset n_industry year

/*------------------------------------*/
// create var
gen vaPw = total_va/total_l // va per employee
gen ls_va = total_pay / total_va // labor share
gen ls_t3 = top3_pay/ top3_va // top 3 labor share 
gen ls_t20 = top20_pay/ top20_va // top 20 labor share

gen top3_cons = top3_va/total_va // top 3 concentration
gen top20_cons = top20_va/total_va // top 20 concentration

gen ln_y = ln(total_va) // ln va
gen ln_y3 = ln(top3_va) // ln top 3 va
gen ln_y20 = ln(top20_va) // ln top 20 va

gen ln_k = ln(total_k) // ln capital
gen ln_k3 = ln(top3_k) // ln top 3 capital
gen ln_k20 = ln(top20_k) // ln top 20 capital

gen ln_l = ln(total_l) // ln Nemployee
gen ln_l3 = ln(top3_l) // ln top 3 Nemployee
gen ln_l20 = ln(top20_l) // ln top 20 Nemployee

gen ln_ppe = ln(total_ppe) // ln buyPPE
gen ln_ppe3 = ln(top3_ppe) // ln top 3 buyPPE
gen ln_ppe20 = ln(top20_ppe) // ln top 20 buyPPE

/*------------------------------------*/
// generate TFP
reg ln_y ln_k ln_l
predict ln_tfp , resid
gen tfp = exp(ln_tfp)

prodest ln_y, free(ln_l) state(ln_k) proxy(ln_ppe) va met(op) poly(3) reps(50) id(n_industry) t(year) fsresiduals(fs_op)
gen tfp_op = exp(fs_op)

// top 3 TFP
reg ln_y3 ln_k3 ln_l3
predict ln_tfp3 , resid
gen tfp3 = exp(ln_tfp3)

prodest ln_y3, free(ln_l3) state(ln_k3) proxy(ln_ppe3) va met(op) poly(3) reps(50) id(n_industry) t(year) fsresiduals(fs_op3)
gen tfp_op3 = exp(fs_op3)

// top 20 TFP
reg ln_y20 ln_k20 ln_l20
predict ln_tfp20 , resid
gen tfp20 = exp(ln_tfp20)

prodest ln_y20, free(ln_l20) state(ln_k20) proxy(ln_ppe20) va met(op) poly(3) reps(50) id(n_industry) t(year) fsresiduals(fs_op20)
gen tfp_op20 = exp(fs_op20)

/*------------------------------------*/
// check TFP of manufacturing
scatter top3_cons year if industry == 2
scatter top20_tfp_var year if industry == 2

// reg(OLS and panel FE OLS)
est clear
quietly eststo: reg ls_va hhi, r
quietly eststo: reg ls_va top3_cons, r
quietly eststo: reg ls_va top20_cons, r
quietly eststo: reg ls_va tfp, r
quietly eststo: reg ls_va vaPw, r
quietly eststo: reg ls_va tfp_var, r

quietly eststo: reghdfe ls_va hhi, absorb(n_industry year)
quietly eststo: reghdfe ls_va top3_cons, absorb(n_industry year)
quietly eststo: reghdfe ls_va top20_cons, absorb(n_industry year)
quietly eststo: reghdfe ls_va tfp, absorb(n_industry year)
quietly eststo: reghdfe ls_va vaPw, absorb(n_industry year)
quietly eststo: reghdfe ls_va tfp_var, absorb(n_industry year)

esttab using "./output/industry_a.tex", label title (table: labor share and concentration table\label{tab2}) 
est clear

/*------------------------------------*/
// import data
clear all
import excel "./data/hhi_b.xlsx", sheet("Sheet1") firstrow clear
cap drop if (industry == 1) | (industry == 7) // just in case
drop if n < 20 // because this classification is more nuanced, there are some small sized industries.

// panel format
egen n_industry = group(industry)
xtset n_industry year

/*------------------------------------*/
// create var
gen vaPw = total_va/total_l // va per employee
gen ls_va = total_pay / total_va // labor share
gen ls_t3 = top3_pay/ top3_va // top 3 labor share
gen ls_t20 = top20_pay/ top20_va // top 20 labor share

gen top3_cons = top3_va/total_va // top 3 concentration
gen top20_cons = top20_va/total_va // top 20 concentration

gen ln_y = ln(total_va) // ln va
gen ln_y3 = ln(top3_va) // ln top 3 va
gen ln_y20 = ln(top20_va) // ln top 20 va

gen ln_k = ln(total_k) // ln capital
gen ln_k3 = ln(top3_k) // ln top 3 capital
gen ln_k20 = ln(top20_k) // ln top 20 capital

gen ln_l = ln(total_l) // ln Nemployee
gen ln_l3 = ln(top3_l) // ln top 3 Nemployee
gen ln_l20 = ln(top20_l) // ln top 20 Nemployee

gen ln_ppe = ln(total_ppe) // ln buyPPE
gen ln_ppe3 = ln(top3_ppe) // ln top 3 buyPPE
gen ln_ppe20 = ln(top20_ppe) // ln top 20 buyPPE

/*------------------------------------*/
// generate TFP
reg ln_y ln_k ln_l
predict ln_tfp , resid
gen tfp = exp(ln_tfp)

prodest ln_y, free(ln_l) state(ln_k) proxy(ln_ppe) va met(op) poly(3) reps(50) id(n_industry) t(year) fsresiduals(fs_op)
gen tfp_op = exp(fs_op)

// top 3 TFP
reg ln_y3 ln_k3 ln_l3
predict ln_tfp3 , resid
gen tfp3 = exp(ln_tfp3)

prodest ln_y3, free(ln_l3) state(ln_k3) proxy(ln_ppe3) va met(op) poly(3) reps(50) id(n_industry) t(year) fsresiduals(fs_op3)
gen tfp_op3 = exp(fs_op3)

// top 20 TFP
reg ln_y20 ln_k20 ln_l20
predict ln_tfp20 , resid
gen tfp20 = exp(ln_tfp20)

prodest ln_y20, free(ln_l20) state(ln_k20) proxy(ln_ppe20) va met(op) poly(3) reps(50) id(n_industry) t(year) fsresiduals(fs_op20)
gen tfp_op20 = exp(fs_op20)

/*------------------------------------*/
// reg(OLS and panel FE OLS)
est clear
quietly eststo: reg ls_va hhi, r
quietly eststo: reg ls_va top3_cons, r
quietly eststo: reg ls_va top20_cons, r
quietly eststo: reg ls_va tfp, r
quietly eststo: reg ls_va vaPw, r
quietly eststo: reg ls_va tfp_var, r

quietly eststo: reghdfe ls_va hhi, absorb(n_industry year)
quietly eststo: reghdfe ls_va top3_cons, absorb(n_industry year)
quietly eststo: reghdfe ls_va top20_cons, absorb(n_industry year)
quietly eststo: reghdfe ls_va tfp, absorb(n_industry year)
quietly eststo: reghdfe ls_va vaPw, absorb(n_industry year)
quietly eststo: reghdfe ls_va tfp_var, absorb(n_industry year)

esttab using "./output/industry_b.tex", label title (table: labor share and concentration table\label{tab2}) 
est clear
