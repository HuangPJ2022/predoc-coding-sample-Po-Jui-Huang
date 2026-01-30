use nlsy_2014_data, clear
su hrp1 hrp2
su hrp1 if hrp1>0
gen ln_hr_wage = ln(hrp1)
histogram ln_hr_wage
su sampweight
tabstat sampweight, by(race)
tab q3_4
tab q3_4, nol
gen yschl = q3_4 if q3_4>0
replace yschl = 0 if yschl==95
gen age = 114- dob_year if dob_year>0
gen agesq = age^2
gen mom_schl = hgc_mother if hgc_mother>=0
gen pop_schl = hgc_father if hgc_father>=0
su mom_sch pop_sch [w=samp]
gen female = sex-1
tabstat ysch [w=samp], by(sex)
corr *schl* [w=samp]
gen afqt = afqt_3/1000 if afqt_3>0
gen health_problems = q11_5a if q11_5a>=0
su health_problems [w=samp]
reg ln_hr_wage yschl [w=sampweight], r
reg ln_hr_wage yschl sex age agesq hgc_mother hgc_father [w=sampweight], r
reg ln_hr_wage yschl sex age agesq afqt [w=sampweight], r
reg ln_hr_wage yschl sex age agesq afqt health_problems [w=sampweight], r
reg ln_hr_wage i.yschl sex age agesq afqt [w=sampweight], r
reg ln_hr_wage i.yschl sex age agesq afqt [w=sampweight] if yschl>=8, r
xi i.yschl
reg ln_hr_wage _Iyschl_8- _Iyschl_11 _Iyschl_13- _Iyschl_20 sex age agesq afqt [w=sampweight] if yschl>=8, r

