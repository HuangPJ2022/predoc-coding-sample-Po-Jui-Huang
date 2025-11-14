// Goal:
// 1. compute TFP
// 2. firm level reg 
/*------------------------*/
cd "my path"

// import data
import excel "./data/pre_reg_data.xlsx", sheet("Sheet1") firstrow clear

// encode, adjust time format, and set up panel
egen new_code = group(code)
gen yr = date(time, "YM")
format yr %td
xtset new_code yr

// adjust var and type
replace buyPPE = -buyPPE
replace invest = -invest
replace inventory_change = - inventory_change
destring mk, replace force

/*------------------------*/
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

/*----------------------*/
// firm level labor share and market share(OLS, reghdfe with time FE, reghdfe with time and entity FE)
forv i = 2/8{
	if `i' != 7{
		eststo: quietly reg ls_va cons_a if industry == `i', r
	}
}
esttab using "./output/marketShare.tex", replace label title (Regression table: labor share and market share table\label{tab2}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va cons_a if industry == `i', absorb(yr)
    }
}
esttab using "./output/marketShareTFE.tex", replace label title (Regression table: labor share and market share table\label{tab2}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va cons_a if (industry == `i'), absorb(new_code yr)
    }
}
esttab using "./output/marketShareFE.tex", replace label title (Regression table: labor share and market share table\label{tab2}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

// top 20 firm level labor share and market share(OLS, reghdfe with time FE, reghdfe with time and entity FE)
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reg ls_va cons_a if (industry == `i') & (rank_a <= 20) & (rank_a != 0), r
    }
}
esttab using "./output/top20.tex", replace label title (Regression table: labor share and market share table\label{tab2}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va cons_a if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(yr)
    }
}
esttab using "./output/top20TFE.tex", replace label title (Regression table: labor share and market share table\label{tab2}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va cons_a if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(new_code yr)
    }
}
esttab using "./output/top20FE.tex", replace label title (Regression table: labor share and market share table\label{tab2}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

// firm level labor share and TFP(OLS, reghdfe with time FE, reghdfe with time and entity FE)
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reg ls_va tfp if industry == `i', r
    }
}
esttab using "./output/tfp.tex", replace label title (Regression table: labor share and TFP table\label{tab3}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va tfp if (industry == `i'), absorb(yr)
    }
}
esttab using "./output/tfpTFE.tex", replace label title (Regression table: labor share and TFP table\label{tab3}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va tfp  if (industry == 2) , absorb(new_code yr)
    }
}
esttab using "./output/tfpFE.tex", replace label title (Regression table: labor share and TFP table\label{tab3}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

// top 20 firm level labor share and TFP(OLS, reghdfe with time FE, reghdfe with time and entity FE)
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reg ls_va tfp if (industry == `i') & (rank_a <= 20) & (rank_a != 0), r
    }
}
esttab using "./output/top20TFP.tex", replace label title (Regression table: labor share and TFP table\label{tab3}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va tfp if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(yr)
    }
}
esttab using "./output/top20TFPTFE.tex", replace label title (Regression table: labor share and TFP table\label{tab3}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va tfp if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(new_code yr)
    }
}
esttab using "./output/top20TFPFE.tex", replace label title (Regression table: labor share and TFP table\label{tab3}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

// firm level labor share and TFP quadratic_TFP
forv i = 2/8{
    if `i' != 7{
        eststo: reg ls_va tfp tfp_2 if industry == `i', r
    }
}
esttab using "./output/TFPsec.tex", replace label title (Regression table: labor share and TFP table\label{tab3}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

/*----------------------*/
// robustness check
// firm level labor share and HHI(OLS, reghdfe with time FE, reghdfe with time and entity FE)
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reg ls_va hhi_a if industry == `i', r
    }
}
esttab using "./output/hhi_a.tex", replace label title (Labor share and HHI \label{tab6}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va hhi_a if industry == `i', absorb(yr)
    }
}
esttab using "./output/hhi_aTFE.tex", replace label title (Labor share and HHI \label{tab6}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va hhi_a if (industry == `i'), absorb(new_code yr)
    }
}
esttab using "./output/hhi_aFE.tex", replace label title (Labor share and HHI \label{tab6}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

// top 20 firm level labor share and HHI(OLS, reghdfe with time FE, reghdfe with time and entity FE)
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reg ls_va hhi_a if (industry == `i') & (rank_a <= 20) & (rank_a != 0), r
    }
}
esttab using "./output/top20hhi.tex", replace label title (Labor share and HHI \label{tab6}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va hhi_a if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(yr)
    }
}
esttab using "./output/top20hhiTFE.tex", replace label title (Labor share and HHI \label{tab6}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va hhi_a if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(new_code yr)
    }
}
esttab using "./output/top20hhiFE.tex", replace label title (Labor share and HHI \label{tab6}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

// firm level labor share and TFP OP(OLS, reghdfe with time FE, reghdfe with time and entity FE)
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reg ls_va tfp_op if industry == `i', r
    }
}
esttab using "./output/tfpopols.tex", replace label title (Labor share and TFP\_OP  table\label{tab7}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va tfp_op if (industry == `i'), absorb(yr)
    }
}
esttab using "./output/tfpopTFE.tex", replace label title (Labor share and TFP\_OP  table\label{tab7}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va tfp_op if (industry == `i') , absorb(new_code yr)
    }
}
esttab using "./output/tfpopFE.tex", replace label title (Labor share and TFP\_OP  table\label{tab7}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear

// top 20 firm level labor share and TFP OP(OLS, reghdfe with time FE, reghdfe with time and entity FE)
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reg ls_va tfp_op if (industry == `i') & (rank_a <= 20) & (rank_a != 0), r
    }
}
esttab using "./output/top20TFPop.tex", replace label title (Labor share and TFP\_OP  table\label{tab7}) nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va tfp_op if (industry == `i') & (rank_a <= 20) & (rank_a != 0), absorb(yr)
    }
}
esttab using "./output/top20TFPopTFE.tex", replace label title (Labor share and TFP\_OP  table\label{tab7})  nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
forv i = 2/8{
    if `i' != 7{
        eststo: quietly reghdfe ls_va tfp_op if (industry == 2) & (rank_a <= 20) & (rank_a != 0), absorb(new_code yr)
    }
}
esttab using "./output/top20TFPopFE.tex", replace label title (Labor share and TFP\_OP  table\label{tab7})  nonumbers mtitles("Manufacture" "Utilities&Communication" "Construction" "Retail" "Transaction" "Service")
est clear
/*----------------------*/
