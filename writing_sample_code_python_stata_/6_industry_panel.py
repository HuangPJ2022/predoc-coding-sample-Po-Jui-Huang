# Goal: Prepare industry level reg panel
#--------------------#
import pandas as pd
import numpy as np
import os

## cd my folder
os.chdir("my path")

## import computed data
df = pd.read_excel("./data/pre_reg_data.xlsx")

## compute sectoral concentration
total_va_4d_yr_series = df.groupby(['time', 'ind_4d'])['gross'].sum()
total_va_4d_yr_df = total_va_4d_yr_series.to_frame().reset_index()
cons_c = []
for row in range(df.shape[0]):
    target_time = df.iloc[row]['time']
    target_ind_4d = df.iloc[row]['ind_4d']
    total_va_4d_yr = total_va_4d_yr_df.loc[(total_va_4d_yr_df['time'] == target_time) & (total_va_4d_yr_df['ind_4d'] == target_ind_4d)]['gross'].item()
    cons_c.append(df.iloc[row]['gross'] / total_va_4d_yr)
df["cons_c"] = cons_c

## rank companies within their industries by their gross profit
df_c = pd.DataFrame()
for yr in range(2000, 2024):
    for indus in df['ind_4d'].unique():
        temp_c = df.loc[(df['time'] == str(yr) + '/12') & (df['ind_4d'] == indus)].sort_values(by = 'gross', na_position = 'last')
        temp_c['rank_c'] = np.argsort(-temp_c['gross']) + 1
        df_c = pd.concat([df_c, temp_c], ignore_index=True)

## merge ranking
df = df.merge(df_c[['code', 'time', 'rank_c']], on = ['code', 'time'], how = 'left')

## keep non na value
df_ind_c = df.loc[(df['rank_c'] != 0)]
df_ind_c = df_ind_c.dropna(subset = ['ind_4d'])

## compute individual firm hhi index(sum up in the later loop) 
## based on two industry classifications
df_ind_c['hhi_c'] = (df_ind_c['cons_c']*100)**2

#--------------------#
## prepare industry level panel(government classification)
hhi_c = []
for yr in range(2002, 2024):

    for indus in sorted(df_ind_c['ind_4d'].unique()):
        
        n = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)].shape[0]

        pay = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)]['pay'].sum()
        three_pay = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 4)]['pay'].sum()
        twenty_pay = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 21)]['pay'].sum()

        total_va = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)]['gross'].sum()
        three_va = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 4)]['gross'].sum()
        twenty_va = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 21)]['gross'].sum()
        
        total_k = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)]['K'].sum()
        three_k = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 4)]['K'].sum()
        twenty_k = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 21)]['K'].sum()

        total_l = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)]['numL'].sum()
        three_l = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 4)]['numL'].sum()
        twenty_l = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 21)]['numL'].sum()

        total_ppe = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)]['buyPPE'].sum()
        three_ppe = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 4)]['buyPPE'].sum()
        twenty_ppe = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 21)]['buyPPE'].sum()

        total_var = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)]['revPer'].var()
        three_va_var = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 4)]['revPer'].var()
        twenty_va_var = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 21)]['revPer'].var()

        total_tfp_var = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)]['tfp'].var()
        three_tfp_var = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 4)]['tfp'].var()
        twenty_tfp_var = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus) & (df_ind_c['rank_c'] < 21)]['tfp'].var()

        hhi = df_ind_c.loc[(df_ind_c['time'] == str(yr) + '/12') & (df_ind_c['ind_4d'] == indus)]['hhi_c'].sum()

        dict_c = {'year': yr, 'ind_4d': indus, 'n': n, 'total_pay': pay, 'top3_pay': three_pay, 'top20_pay': twenty_pay,'total_va': total_va, \
                  'total_k': total_k, 'top3_k': three_k, 'top20_k': twenty_k, 'total_l': total_l, 'top3_l': three_l, 'top20_l': twenty_l, \
                  'top3_va': three_va, 'top20_va': twenty_va, 'total_ppe': total_ppe, 'top3_ppe': three_ppe, 'top20_ppe': twenty_ppe, 'hhi': hhi, \
                    'total_var': total_var, 'top3_var': three_va_var, 'top20_var': twenty_va_var, 'tfp_var': total_tfp_var, 'top3_tfp_var': three_tfp_var, 'top20_tfp_var':twenty_tfp_var}
        hhi_c.append(dict_c)

df_c = pd.DataFrame(hhi_c)
#--------------------#
## save
df_c.to_excel('./data/hhi_c.xlsx', index = False)