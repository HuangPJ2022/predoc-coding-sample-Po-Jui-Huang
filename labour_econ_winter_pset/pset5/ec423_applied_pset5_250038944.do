cd "H:\"

global x_randomise_check F_higrade M_higrade logfaminc F_BMI M_BMI F_drink M_drink F_height M_height

foreach y in weightatinitialsocialhistorylbs heightatinitialsocialhistoryinch arrivalagechild malechild{
	quietly reg `y' $x_randomise_check i.admissionyear i.agechild
    eststo
}

esttab using "./ec423_applied_pset5_250038944.tex", replace ///
    stats(N r2 F, labels("Observations" "R-squared" "F-statistic")) ///
	star(* 0.10 ** 0.05 *** 0.01) ///
    mtitles("Weight at initial social history(lbs)" ///
            "Height at initial social history(lbs)" ///
            "Child's age at arrival" ///
            "Child is male") ///
	title("Replacted TABLE II") ///
	varlabels(F_higrade "Father's years of education"   ///
			  M_higrade "Mather's years of education"   ///
			  logfaminc "Log parent's household income" ///
			  F_BMI "Father's BMI" ///
			  M_BMI "Mother's BMI" ///
			  F_drink "Father drinks" ///
			  M_drink "Mother drinks" ///
			  F_height "Father's height" ///
			  M_height "Mother's height") ///
    keep($x_randomise_check)
	
est clear

preserve 

keep if agechild >= 25

// adoptee

local ylist higradechild child_college logincchild heightchild childobese childoverweight childBMI smokechild drinkchild
local xlist M_higrade mother_college loginc M_height M_obese M_overweight M_BMI M_smoke M_drink

local n : word count `ylist'

forvalues i = 1/`n' {
    local y : word `i' of `ylist'
    local x : word `i' of `xlist'
    quietly reg `y' `x' malechild i.agechild i.arrivalagechild if adopt == 1
    eststo
}
	
esttab using "./ec423_applied_pset5_250038944.tex", append ///
	title("Transmission: Adoptee") ///
	varlabels(M_higrade "Years of education (mother to child)" ///
			  mother_college "Has 4 years college (mother to child)" ///
			  loginc "Log household income(parents to child)" ///
			  M_height "Height inches (mother to child)" ///
			  M_obese "Is obese (mother to child)" ///
			  M_overweight "Is overweight (mother to child)" ///
			  M_BMI "BMI (mother to child)" ///
			  M_smoke "Smokes (0–1) (mother to child)" ///
			  M_drink "Drinks (0–1) (mother to child)") ///
	keep(`xlist') ///
    star(* 0.10 ** 0.05 *** 0.01)
	
est clear

local ylist higradechild child_college logincchild heightchild childobese childoverweight childBMI smokechild drinkchild
local xlist M_higrade mother_college loginc M_height M_obese M_overweight M_BMI M_smoke M_drink

forvalues i = 1/`n' {
    local y : word `i' of `ylist'
    local x : word `i' of `xlist'
    quietly reg `y' `x' malechild i.agechild if adopt == 0
    eststo
}

esttab using "./ec423_applied_pset5_250038944.tex", append ///
	title("Transmission: Non-Adoptee") ///
	varlabels(M_higrade "Years of education (mother to child)" ///
		  mother_college "Has 4 years college (mother to child)" ///
		  loginc "Log household income(parents to child)" ///
		  M_height "Height inches (mother to child)" ///
		  M_obese "Is obese (mother to child)" ///
		  M_overweight "Is overweight (mother to child)" ///
		  M_BMI "BMI (mother to child)" ///
		  M_smoke "Smokes (0–1) (mother to child)" ///
		  M_drink "Drinks (0–1) (mother to child)") ///
	keep(`xlist') ///
    star(* 0.10 ** 0.05 *** 0.01) ///
	addnotes("Practically, I found it hard to generate year dummies from the provided dataset.")
	
	
est clear

restore