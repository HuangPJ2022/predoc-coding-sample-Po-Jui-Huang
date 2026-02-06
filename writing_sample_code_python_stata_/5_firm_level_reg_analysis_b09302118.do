// Goal:
// 1. compute TFP
// 2. firm level reg 
/*------------------------*/
cd "my path"

// import data
import excel "./data/pre_reg_data.xlsx", sheet("Sheet1") firstrow clear

// encode, adjust time format, and set up panel
egen new_code = group(code)
egen ind_2d = group(industry_tse)
egen ind_4d = group(industry_gov)
gen yr = date(time, "YM")
format yr %ty
drop if yr < 2002

/*------------------------*/
// generate industry crosswalk
preserve
keep industry industry_gov ind_4d
duplicates drop
save "./industry_gov_crosswalk", replace
restore

/*------------------------*/
// plot nFirm for each industry over years
bys industry yr: gen number = _N
forvalues i = 1/8{
	dis `i'
	egen tag_ind_`i'_yr = tag(industry yr) if industry ==`i'
}

twoway (line number yr if tag_ind_1_yr) ///
       (connected number yr if tag_ind_2_yr) ///
	   (connected number yr if tag_ind_3_yr) ///
	   (connected number yr if tag_ind_4_yr) ///
	   (connected number yr if tag_ind_5_yr) ///
	   (connected number yr if tag_ind_6_yr) ///
	   (connected number yr if tag_ind_7_yr) ///
	   (connected number yr if tag_ind_8_yr), ///
    ytitle("Number of Firms") xtitle("Year") ///
    title("Number of Firms") ///
    subtitle("2002-2023") ///
    legend(order(1 "Agriculture" 2 "Manufacturing" 3 "Utilities&Communication" 4 "Construction" 5 "Retail" 6 "Transportation" 7 "Finance" 8 "Service") position(6) rows(2))
	
drop tag_ind_*

/*------------------------*/
// adjust var and type
xtset new_code yr

replace buyPPE = -buyPPE
replace invest = -invest
replace inventory_change = - inventory_change
destring mk, replace force

// compute lahor share based on different value added estimates
gen va = sales - COGS
gen va_1 = sales + other_rev + tax + inventory_change - COGS - expense + pay
gen va_2 = sales - COGS - expense + pay
gen ls_va = pay/va
gen ls_va_1 = pay / va_1
gen ls_va_2 = pay / va_2

// examine correlation of different labor share estimates
eststo: reg ls_va ls_va_1 ls_va_2
esttab using "./output/vamearsurement.tex", replace label title (Different Measurements of Value Added\label{tab1})
est clear

/*------------------------*/
// plot avg va ranking from 2002 - 2023
preserve
collapse (mean) va, by(code)
egen rank = rank(va), f
drop if rank > 50
twoway (bar va rank), ///
	ytitle("Avg. Value-Added") xtitle("Rank") ///
    title("Average Value-Added Ranking") ///
    subtitle("2002-2023")
restore

/*------------------------*/
// plot overall concentration over years
bysort yr: egen tot_va = sum(va)
foreach i in 3 5 10 20 30 40 50 {
    bys yr: gen top_`i' = (rank_a <= `i')&(rank_a != 0)
	bys yr : egen top_`i'_va = sum(va) if top_`i' == 1
	gen cons_top_`i' = top_`i'_va / tot_va if top_`i' == 1
	replace top_`i' = 0 if (rank_a < `i')
	egen tag_top_`i' = tag(yr) if top_`i' == 1
}

twoway (line cons_top_3 yr if tag_top_3) ///
       (connected cons_top_5 yr if tag_top_5) ///
	   (connected cons_top_10 yr if tag_top_10) ///
	   (connected cons_top_20 yr if tag_top_20) ///
	   (connected cons_top_30 yr if tag_top_30) ///
	   (connected cons_top_40 yr if tag_top_40) ///
	   (connected cons_top_50 yr if tag_top_50), ///
    yscale(range(0 1)) ///
    ylabel(0(0.1)1, angle(0) grid) ///
    ytitle("Concentration") xtitle("Year") ///
    title("Concentration by Top Firms") ///
    subtitle("2002-2023") ///
    legend(order(1 "Top 3" 2 "Top 5" 3 "Top 10" 4 "Top 20" 5 "Top 30" 6 "Top 40" 7 "Top 50") position(6) rows(1))

drop top_* cons_top_* tag_top_*

// plot concentration in manufacturing sector over years
bys yr industry: egen ind_pay = sum(pay)
bys yr industry: egen ind_va = sum(va)
gen ls_mfg = ind_pay / ind_va if industry == 2

bys yr: egen tot_pay = sum(pay)
gen ls_total = tot_pay / tot_va

egen tag_total = tag(yr)
egen tag_mfg = tag(yr industry) if industry == 2
	
foreach i in 25 50 75 100{
    bys industry yr: gen top_`i' = (rank_a <= `i')&(rank_a != 0)
	bys yr industry: egen ind_top_`i'_pay = sum(pay) if top_`i' == 1
	gen ls_top_`i'_mfg = ind_top_`i'_pay / ind_va if (industry == 2) & ( top_`i' == 1)
	replace top_`i' = 0 if (rank_a < `i')
	egen tag_top_`i'_mfg = tag(yr industry top_`i') if (industry == 2)  & ( top_`i' == 1)
}

twoway (line ls_total yr if tag_total) ///
       (connected ls_mfg yr if tag_mfg) ///
	   (connected ls_top_25_mfg yr if tag_top_25_mfg) ///
	   (connected ls_top_50_mfg yr if tag_top_50_mfg) ///
	   (connected ls_top_75_mfg yr if tag_top_75_mfg) ///	   
	   (connected ls_top_100_mfg yr if tag_top_100_mfg), ///
    yscale(range(0 1)) ///
    ylabel(0(0.1)1, angle(0) grid) ///
    ytitle("Labour Share") xtitle("Year") ///
    title("Labour Share: Total vs. Manufacturing") ///
    subtitle("2002-2023") ///
    legend(order(1 "Total" 2 "Manu All" 3 "Manu Top 25" ///
	4 "Manu Top 50" 5 "Manu Top 75" 6 "Manu Top 100") position(6) rows(2))
	
drop tag_top_* ls_top_* ind_top_* top_* ind_* tot_* ls_mfg ls_total tag_total tag_mfg

/*------------------------*/
// compute TFP
gen ln_y = ln(va)
gen ln_k = ln(K)
gen ln_l = ln(numL)
gen ln_material = ln(material)
gen ln_invest = ln(invest)
gen ln_ppe = ln(buyPPE)

// compute hhi 
gen hhi_a = (cons_a*100)^2

// tfp method 1
reg ln_y ln_k ln_l
predict ln_tfp , resid
gen tfp = exp(ln_tfp)
gen tfp_2 = tfp^2 // quadratic term

// tfp method 2
eststo: reg ln_y ln_k ln_l
eststo: prodest ln_y, free(ln_l) state(ln_k) proxy(ln_ppe) va met(op) poly(3) reps(50) id(new_code) t(yr) fsresiduals(fs_op)
esttab using "./output/coefTFPtfpop.tex", replace label title (The coefficients of TFP and TFP\_OP\label{tab6}) keep("ln_k" "ln_l")
est clear
gen tfp_op = exp(fs_op)

// export tfp estimates
export excel using "./data/pre_reg_data_tfp", replace firstrow(variables)

// descriptive_stats
outreg2 using "./output/descriptive_stats.tex", replace sum(log) keep(va pay ls_va tfp tfp_op) label title(Descriptive statistics table\label{tab1})

// examine correlation of different TFP estimates
eststo: reg tfp_op tfp
esttab using "./output/TFPop.tex", replace label title (TFP and TFP\_OP table\label{tab2}) r(2)
est clear

/*------------------------*/
// regression
local ind_list 2 3 4 5 6 8 // sector code 1: manu 2: utility 3: construction 4: retail 5: transaction 6: service 

// labour share & market share
est clear
foreach i of local ind_list {
    eststo: quietly reg d.ls_va d.cons_a if industry == `i', r
}
esttab using "./firm_level_reg.tex", replace label ///
    title(Regression table: Labor Share and Market Share table\label{tab1}) ///
    nonumbers ///
    mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transportation" "Service")

// labour share & market share + FE
est clear
foreach i of local ind_list {
    eststo: quietly reghdfe d.ls_va d.cons_a if industry == `i', absorb(yr) vce(robust)
}
esttab using "./firm_level_reg.tex", append label ///
    title(Regression table: Labour Share and Market Share with FE table\label{tab2}) ///
    nonumbers ///
    mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transportation" "Service")

// labour share & market share condition on top 20 firms
est clear
foreach i of local ind_list {
    eststo: quietly reg d.ls_va d.cons_a if (industry == `i') & (rank_a <= 20) & (rank_a != 0), r
}

esttab using "./firm_level_reg.tex", append label ///
    title(Regression table: Labour Share and Market Share: Top 20 table\label{tab3}) ///
    nonumbers ///
    mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transportation" "Service")

// labour share & market share condition on top 20 firms + FE
est clear
foreach i of local ind_list {
    eststo: quietly reghdfe d.ls_va d.cons_a if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(yr) vce(robust)
}
esttab using "./firm_level_reg.tex", append label ///
    title(Regression table: Labour Share and Market Share with FE: Top 20 table\label{tab4}) ///
    nonumbers ///
    mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transportation" "Service")

// labour share & tfp
est clear
foreach i of local ind_list {
    eststo: quietly reg d.ls_va d.tfp_op if (industry == `i'), r
}
esttab using "./firm_level_reg.tex", append label ///
    title(Regression table: Labour Share and TFP table\label{tab5}) ///
    nonumbers ///
    mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transportation" "Service")

// labour share & tfp + FE
est clear
foreach i of local ind_list {
    eststo: quietly reghdfe d.ls_va d.tfp_op if (industry == `i'), absorb(yr) vce(robust)
}
esttab using "./firm_level_reg.tex", append label ///
    title(Regression table: Labour Share and TFP with FE table\label{tab6}) ///
    nonumbers ///
    mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transportation" "Service")

// labour share & tfp  condition on top 20 firms
est clear
foreach i of local ind_list {
    eststo: quietly reg d.ls_va d.tfp_op if (industry == `i') & (rank_a <= 20) & (rank_a != 0), r
}
esttab using "./firm_level_reg.tex", append label ///
    title(Regression table: Labour Share and TFP: Top 20 table\label{tab7}) ///
    nonumbers ///
    mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transportation" "Service")

// labour share & tfp  condition on top 20 firms + FE
est clear
foreach i of local ind_list {
    eststo: quietly reghdfe d.ls_va d.tfp_op if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(yr) vce(robust)
}
esttab using "./firm_level_reg.tex", append label ///
    title(Regression table: Labour Share and TFP with FE: Top 20 table\label{tab8}) ///
    nonumbers ///
    mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transportation" "Service")
	
/* Combining multiple lines into a large loop would result in a table which might be too large, as each table contains estimates for six sectors. For the sake of readability, I chose not to do so. */