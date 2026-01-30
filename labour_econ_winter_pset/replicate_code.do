// Author: Po-Jui(Louie) Huang
// Date: 30th Jan. 2026
// Goal: solve EC423 winter problem set 1
/*=================================*/
cd C:\Users\user0522\Documents\GitHub\predoc-coding-sample-Po-Jui-Huang\labour_econ_winter_pset

// import data

log using ".\labour_winter_pset1_Po-Jui_Huang.log", replace name(labour_winter_pset1_Po_Jui_Huang)

/*===== generate variables & declare varlist =====*/
gen away = home_team == opp_team
gen away_team = away * team
replace away_team = opp_team if away_team == ""

encode home_team, generate(home_team_code)
encode away_team, generate(away_team_code)
encode team, gen(team_code)

egen game_id = group(edate year home_team_code away_team_code)
encode player_id, gen(player)

gen black = 0
replace black = 1 if blackplayer == "Black"

/*===== balance test =====*/
// generate daily game level data
preserve

gen blackstarter = black * starter
gen blackstarter_away = blackstarter * away
gen blackstarter_home = blackstarter * home

gen out_cont_away = out_cont * away
gen out_cont_home = out_cont * home

collapse (mean) fracwhite (mean) year (mean) home_team_code (sum) out_cont_home (sum) blackstarter_home (mean) away_team_code (sum) out_cont_away (sum) blackstarter_away (mean) attend, by(game_id)

replace out_cont_home = 1 if out_cont_home > 1
replace out_cont_away = 1 if out_cont_away > 1

gen home_team_year = home_team_code * year
gen away_team_year = away_team_code * year

global blackstarter_li blackstarter_home blackstarter_away
global out_cont_li out_cont_home out_cont_away
global team_fe home_team_code away_team_code
global team_year_fe home_team_year away_team_year

// balance test
eststo: reg fracwhite year
eststo: reg fracwhite year $blackstarter_li
test $blackstarter_li
estadd scalar col_2_1 = r(p)
test $blackstarter_li
estadd scalar col_2_2 = r(p)
eststo: reg fracwhite year $blackstarter_li $out_cont_li
test $out_cont_li
estadd scalar col_3_1 = r(p)
test $blackstarter_li $out_cont_li
estadd scalar col_3_2 = r(p)
eststo: reg fracwhite year $blackstarter_li $out_cont_li $team_fe
test $team_fe
estadd scalar col_4_1 = r(p)
test $blackstarter_li $out_cont_li $team_fe
estadd scalar col_4_2 = r(p)
eststo: reg fracwhite year $blackstarter_li $out_cont_li $team_fe $team_year_fe
test $team_year_fe
estadd scalar col_5_1 = r(p)
test $blackstarter_li $out_cont_li $team_fe $team_year_fe
estadd scalar col_5_2 = r(p)

esttab using "./replicate_table.tex", replace label title (Balance Test Table \label{tab1}) cells("p(fmt(2))") drop(_cons) ar2 stats(col_2_1 col_2_2 col_3_1 col_3_2 col_4_1 col_4_2 col_5_1 col_5_2)

est clear

restore

/*===== question 5: replicate regression table =====*/
// necesary variables for model 1
global controls age all_star starter home attend out_cont coach_black
global player_fe height weight center 
global referee_fe ref1_id ref2_id ref3_id
global player_perf p_min p_assists p_blocks p_rbd p_rbo p_steals p_turnover ///
                  p_fta p_fg2a p_fg3a p_fouls p_fg2per p_fg3per p_ftper
global indicator p_zerofg2per p_zerofg3per p_zeroftper

// generate interaction terms
foreach v of global controls{
    gen fracwhite_`v' = `v' * fracwhite
}

foreach v of global player_fe{
    gen fracwhite_`v' = `v' * fracwhite
}

foreach v of global referee_fe{
    gen fracwhite_`v' = `v' * fracwhite
}

foreach v of global player_perf{
    gen fracwhite_`v' = `v' * fracwhite
}

foreach v of global indicator{
	gen fracwhite_`v' = `v' * fracwhite
}

// additional variables for model 2
global indicator_interaction fracwhite_p_zeroftper fracwhite_p_zerofg3per fracwhite_p_zerofg2per

global perf_interaction fracwhite_p_ftper fracwhite_p_fg3per fracwhite_p_fg2per fracwhite_p_fouls fracwhite_p_fg3a ///
 fracwhite_p_fg2a fracwhite_p_fta fracwhite_p_turnover fracwhite_p_steals fracwhite_p_rbo ///
 fracwhite_p_rbd fracwhite_p_blocks fracwhite_p_assists fracwhite_p_min 
 
global ref_interaction fracwhite_ref3_id fracwhite_ref2_id fracwhite_ref1_id 
 
global player_interaction fracwhite_center fracwhite_weight fracwhite_height 
 
global control_interaction fracwhite_coach_black fracwhite_out_cont fracwhite_attend fracwhite_starter fracwhite_all_star fracwhite_age fracwhite_home

// additional variables for model 3
gen player_year = player * year
gen home_black = home * black
gen team_game = team_code * game_id

/*===== estimation =====*/
// model 1
eststo: reghdfe fouls_rate i.black##c.fracwhite $controls $player_fe  [aw=min], ///
    absorb(player year $referee_fe) vce(cluster game_id)

// model 2
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls $player_fe $player_perf $indicator $indicator_interaction $perf_interaction $ref_interaction $player_interaction $control_interaction [aw=min], absorb($referee_fe player year) 
	
// model 3
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls $player_fe  $player_perf $indicator $indicator_interaction $perf_interaction $ref_interaction $player_interaction $control_interaction player_year home_black team_game team_code game_id [aw=min], absorb($referee_fe player year) 

// export result
esttab using "./replicate_table.tex", append label title (Replicated Regression Table \label{tab2})  keep("1.black#c.fracwhite" "age" "all_star" "starter" "home" "attend" "out_cont" "coach_black")

est clear

/*=================================*/
log close labour_winter_pset1_Po_Jui_Huang

