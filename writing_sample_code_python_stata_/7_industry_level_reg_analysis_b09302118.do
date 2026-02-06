// Goal:
// 1. compute industry level TFP
// 2. industry level reg 
// Note: There are two industry classifications.
/*------------------------------------*/
cd "my path"

// import data
clear all
import excel "./data/hhi_c.xlsx", sheet("Sheet1") firstrow clear
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
global cons_var hhi top3_cons top20_cons

// baseline
foreach v of global cons_var{
    quietly eststo: reg d.ls_va d.`v', r
}
esttab using "./output/industry_reg_table.tex", replace label title (table\label{tab1}) 
est clear

// baseline + FE
foreach v of global cons_var{
	quietly eststo: reghdfe d.ls_va d.`v', absorb(year ind_4d) vce(robust) // + FE
	quietly eststo: reghdfe d.ls_va d.`v' if industry == 2, absorb(year ind_4d) vce(robust) //manufacturing only
}
esttab using "./output/industry_reg_table.tex", append label title (table\label{tab2}) 
est clear

// labour share & tfp
quietly eststo: reg d.ls_va d.tfp, r
quietly eststo: reghdfe d.ls_va d.tfp, absorb(year ind_4d) vce(robust) // + FE
quietly eststo: reghdfe d.ls_va d.tfp if industry == 2, absorb(year ind_4d) vce(robust) //manufacturing only
esttab using "./output/industry_reg_table.tex", append label title (table\label{tab3}) 
est clear

// concentration & tfp

foreach v of global cons_var{
	quietly eststo: reg d.`v' d.tfp, r
	quietly eststo: reghdfe d.hhi d.tfp, absorb(year ind_4d) vce(robust) // + FE
	quietly eststo: reghdfe d.hhi d.tfp if industry == 2, absorb(year ind_4d) vce(robust)//manufacturing only
}
esttab using "./output/industry_reg_table.tex", append label title (table\label{tab4}) 
est clear

// labour share & dispersion
global control k_y top3_cons
global dispersion vaPw tfp_var

foreach v of global dispersion{
	quietly eststo: reg d.ls_va d.`v' $control, r 
	quietly eststo: reghdfe d.ls_va d.`v' $control, absorb(year ind_4d) vce(robust) // + FE
	quietly eststo: reghdfe d.ls_va d.`v' $control if industry == 2, absorb(year ind_4d) vce(robust) // manufacturing only
}
esttab using "./output/industry_reg_table.tex", append label title (table\label{tab5}) keep(D.vaPw D.tfp_var)
est clear

/*Because I still need to adjust the format, I did not include much information except basic labeling for distinguishing purposes.*/