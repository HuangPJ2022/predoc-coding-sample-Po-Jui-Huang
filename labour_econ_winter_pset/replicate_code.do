// Author: Po-Jui(Louie) Huang
// Date: 30th Jan. 2026
// Goal: solve EC423 winter problem set 1
/*=================================*/
cd C:\Users\user0522\Documents\GitHub\predoc-coding-sample-Po-Jui-Huang\labour_econ_winter_pset

// import data

log using ".\labour_winter_pset1_Po-Jui_Huang.log", replace name(labour_winter_pset1_Po_Jui_Huang)

/*===== generate variables & declare varlist =====*/
egen game_id = group(edate year home_team opp_team)
encode player_id, gen(player)
encode team, gen(team_code)

gen black = 0
replace black = 1 if blackplayer == "Black"

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
esttab using "./replicate_table.tex", replace label title (table\label{tab1})  keep("1.black#c.fracwhite" "age" "all_star" "starter" "home" "attend" "out_cont" "coach_black")

est clear

/*=================================*/
log close labour_winter_pset1_Po_Jui_Huang

