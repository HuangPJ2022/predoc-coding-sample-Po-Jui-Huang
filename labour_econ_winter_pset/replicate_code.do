egen game_id = group(edate year home_team opp_team)

gen black = 0
replace black = 1 if blackplayer == "Black"

global controls age all_star starter attend out_cont coach_black
global player_fe height weight center forward
global referee_fe ref1_id ref2_id ref3_id
global player_perf p_min p_assists p_blocks p_rbd p_rbo p_steals p_turnover ///
                  p_fta p_fg2a p_fg3a p_fouls p_fg2per p_fg3per p_ftper
global indicator p_zerofg2per p_zerofg3per p_zeroftper

/*model 1*/
reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe $referee_fe player_id year) 
eststo m1


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

foreach v of global player_perf{
    gen fracwhite_`v' = `v' * fracwhite
}

foreach v of global indicator{
	gen fracwhite_`v' = `v' * fracwhite
}

global fracwhite_interaction fracwhite_p_zeroftper fracwhite_p_zerofg3per fracwhite_p_zerofg2per ///
fracwhite_p_ftper fracwhite_p_fg3per fracwhite_p_fg2per fracwhite_p_fouls fracwhite_p_fg3a ///
 fracwhite_p_fg2a fracwhite_p_fta fracwhite_p_turnover fracwhite_p_steals fracwhite_p_rbo ///
 fracwhite_p_rbd fracwhite_p_blocks fracwhite_p_assists fracwhite_p_min fracwhite_ref3_id ///
 fracwhite_ref2_id fracwhite_ref1_id fracwhite_forward fracwhite_center fracwhite_weight ///
 fracwhite_height fracwhite_coach_black fracwhite_out_cont fracwhite_attend fracwhite_starter ///
 fracwhite_all_star fracwhite_age

reghdfe fouls_rate c.fracwhite##i.black $controls [aw=min], ///
    absorb($player_fe $referee_fe player_id year $player_perf $indicator $fracwhite_interaction) 
eststo m2

/*model 3*/
gen player_year = player_id * year
gen home_black = home * black
gen team_game = team * game_id

reghdfe fouls_rate c.fracwhite##i.black $controls, absorb($player_fe $player_id $referee_fe $year $player_performance $fracwhite_interaction player_year home_black team_game) weight(min)
eststo m3

esttab 

