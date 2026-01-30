// use "D:\DATA\GitHub\EC423 labour econ\Price_Wolfers_2010.dta", clear

cd C:\Users\user0522\Documents\GitHub\predoc-coding-sample-Po-Jui-Huang\labour_econ_winter_pset

//replace fouls_rate = 48 * fouls_rate

egen game_id = group(edate year home_team opp_team)
encode player_id, gen(player)
destring team home_team opp_team , replace
//egen ref_gp = group(ref1_id ref2_id ref3_id)

gen black = 0
replace black = 1 if blackplayer == "Black"

global controls age all_star starter home attend out_cont coach_black
global player_fe height weight center // no forward
global referee_fe ref1_id ref2_id ref3_id
global player_perf p_min p_assists p_blocks p_rbd p_rbo p_steals p_turnover ///
                  p_fta p_fg2a p_fg3a p_fouls p_fg2per p_fg3per p_ftper
global indicator p_zerofg2per p_zerofg3per p_zeroftper

/*model 1*/
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls  [aw=min], ///
    absorb(player year $referee_fe $player_fe) vce(cluster game_id)

/*
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], absorb($player_fe $referee_fe year) 

eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], absorb($player_fe ref_gp player_id year) 

eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], absorb($player_fe ref_gp year) 

	
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe $referee_fe player year) vce(cluster game_id)

eststo: reghdfe fouls_rate c.fracwhite##i.black $player_fe $referee_fe player year $controls [aw=min], vce(cluster game_id)
*/

/*model 2*/
foreach v of global controls{
    gen fracwhite_`v' = `v' * fracwhite
}

foreach v of global player_fe{
    gen fracwhite_`v' = `v' * fracwhite
}

foreach v of global referee_fe{
    gen fracwhite_`v' = `v' * fracwhite
}

// gen ref_gp_interaction = ref_gp * fracwhite

foreach v of global player_perf{
    gen fracwhite_`v' = `v' * fracwhite
}

foreach v of global indicator{
	gen fracwhite_`v' = `v' * fracwhite
}

global indicator_interaction fracwhite_p_zeroftper fracwhite_p_zerofg3per fracwhite_p_zerofg2per

global perf_interaction fracwhite_p_ftper fracwhite_p_fg3per fracwhite_p_fg2per fracwhite_p_fouls fracwhite_p_fg3a ///
 fracwhite_p_fg2a fracwhite_p_fta fracwhite_p_turnover fracwhite_p_steals fracwhite_p_rbo ///
 fracwhite_p_rbd fracwhite_p_blocks fracwhite_p_assists fracwhite_p_min 
 
global ref_interaction fracwhite_ref3_id fracwhite_ref2_id fracwhite_ref1_id 
 
global player_interaction fracwhite_center fracwhite_weight fracwhite_height 
 
global control_interaction fracwhite_coach_black fracwhite_out_cont fracwhite_attend fracwhite_starter fracwhite_all_star fracwhite_age fracwhite_home

/*
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe ref_gp player_id year $player_perf $indicator $indicator_interaction $perf_interaction ref_gp_interaction $player_interaction $control_interaction) 

eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe ref_gp player_id year $player_perf $indicator $indicator_interaction $perf_interaction ref_gp_interaction $player_interaction)
	
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe ref_gp player_id year $player_perf $indicator $indicator_interaction $perf_interaction ref_gp_interaction) 


eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe $referee_fe player_id year $player_perf $indicator $indicator_interaction $perf_interaction $ref_interaction $player_interaction $control_interaction) 

eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe $referee_fe player_id year $player_perf $indicator $indicator_interaction $perf_interaction $ref_interaction $player_interaction)
	
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe $referee_fe player_id year $player_perf $indicator $indicator_interaction $perf_interaction $ref_interaction)
	
eststo: reghdfe fouls_rate c.fracwhite##i.black $controls $indicator_interaction $perf_interaction $ref_interaction $player_interaction $control_interaction [aw=min], ///
    absorb($player_fe $referee_fe player_id year $player_perf $indicator) 

eststo: reghdfe fouls_rate c.fracwhite##i.black $controls $player_perf [aw=min], ///
    absorb($player_fe $referee_fe player_id year $indicator $indicator_interaction $perf_interaction $ref_interaction $player_interaction $control_interaction) 
	
*/

eststo: reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe $referee_fe player year $player_perf $indicator $indicator_interaction $perf_interaction $ref_interaction $player_interaction $control_interaction) 

eststo: reghdfe fouls_rate c.fracwhite##i.black $controls $player_perf $indicator $indicator_interaction $perf_interaction $ref_interaction $player_interaction $control_interaction [aw=min], ///
    absorb($player_fe $referee_fe player year) 
	

/*model 3*/
gen player_year = player * year
gen home_black = home * black
gen team_game = team * game_id


eststo: reghdfe fouls_rate c.fracwhite##i.black $controls $player_perf $indicator $indicator_interaction $perf_interaction $ref_interaction $player_interaction $control_interaction player_year home_black team_game team game_id [aw=min], ///
    absorb($player_fe $referee_fe player year) 
	
esttab using "./replicate_table.tex", replace label title (table\label{tab1}) 
est clear

