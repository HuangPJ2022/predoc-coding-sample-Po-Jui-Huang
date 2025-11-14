# Goal: Prepare industry level reg panel
#--------------------#
import pandas as pd
import numpy as np
import os

## cd my folder
os.chdir("my path")

## import computed data
df = pd.read_excel("./data/pre_reg_data.xlsx")

## keep non na value
df = df.loc[(df['rank_a'] != 0)]
df = df.loc[(df['rank_b'] != 0)]
df = df.loc[(df['industry'] != 0)]

## compute individual firm hhi index(sum up in the later loop) 
## based on two industry classifications
df['hhi_a'] = (df['cons_a']*100)**2
df['hhi_b'] = (df['cons_b']*100)**2

#--------------------#
## prepare industry level panel(government classification)
hhi_a = []
for yr in range(2002, 2024):
    for indus in range(1, 9):
        
        n = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)].shape[0]

        pay = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)]['pay'].sum()
        three_pay = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 4)]['pay'].sum()
        twenty_pay = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 21)]['pay'].sum()

        total_va = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)]['gross'].sum()
        three_va = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 4)]['gross'].sum()
        twenty_va = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 21)]['gross'].sum()
        
        total_k = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)]['K'].sum()
        three_k = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 4)]['K'].sum()
        twenty_k = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 21)]['K'].sum()

        total_l = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)]['numL'].sum()
        three_l = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 4)]['numL'].sum()
        twenty_l = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 21)]['numL'].sum()

        total_ppe = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)]['buyPPE'].sum()
        three_ppe = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 4)]['buyPPE'].sum()
        twenty_ppe = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 21)]['buyPPE'].sum()

        total_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)]['revPer'].var()
        three_va_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 4)]['revPer'].var()
        twenty_va_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 21)]['revPer'].var()

        total_tfp_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)]['tfp'].var()
        three_tfp_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 4)]['tfp'].var()
        twenty_tfp_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus) & (df['rank_a'] < 21)]['tfp'].var()

        hhi = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)]['hhi_a'].sum()

        dict_a = {'year': yr, 'industry': indus, 'n': n, 'total_pay': pay, 'top3_pay': three_pay, 'top20_pay': twenty_pay,'total_va': total_va, \
                  'total_k': total_k, 'top3_k': three_k, 'top20_k': twenty_k, 'total_l': total_l, 'top3_l': three_l, 'top20_l': twenty_l, \
                  'top3_va': three_va, 'top20_va': twenty_va, 'total_ppe': total_ppe, 'top3_ppe': three_ppe, 'top20_ppe': twenty_ppe, 'hhi': hhi, \
                    'total_var': total_var, 'top3_var': three_va_var, 'top20_var': twenty_va_var, 'tfp_var': total_tfp_var, 'top3_tfp_var': three_tfp_var, 'top20_tfp_var':twenty_tfp_var}
        hhi_a.append(dict_a)

df_a = pd.DataFrame(hhi_a)

## prepare industry level panel(TEJ database classification)
hhi_b = []
for yr in range(2002, 2024):

    for indus in df['industry_tse'].unique():

        n = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))].shape[0]

        pay = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))]['pay'].sum()
        three_pay = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 4)]['pay'].sum()
        twenty_pay = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 21)]['pay'].sum()

        total_va = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))]['gross'].sum()
        three_va = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 4)]['gross'].sum()
        twenty_va = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 21)]['gross'].sum()
        
        total_k = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))]['K'].sum()
        three_k = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 4)]['K'].sum()
        twenty_k = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 21)]['K'].sum()

        total_l = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))]['numL'].sum()
        three_l = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 4)]['numL'].sum()
        twenty_l = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 21)]['numL'].sum()

        total_ppe = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))]['buyPPE'].sum()
        three_ppe = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 4)]['buyPPE'].sum()
        twenty_ppe = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 21)]['buyPPE'].sum()

        total_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))]['revPer'].var()
        three_va_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 4)]['revPer'].var()
        twenty_va_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 21)]['revPer'].var()

        total_tfp_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))]['tfp'].var()
        three_tfp_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 4)]['tfp'].var()
        twenty_tfp_var = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus)) & (df['rank_b'] < 21)]['tfp'].var()

        

        hhi = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))]['hhi_b'].sum()

        dict_b = {'year': yr, 'industry': str(indus), 'n': n, 'total_pay': pay, 'top3_pay': three_pay, 'top20_pay': twenty_pay,'total_va': total_va, \
                  'total_k': total_k, 'top3_k': three_k, 'top20_k': twenty_k, 'total_l': total_l, 'top3_l': three_l, 'top20_l': twenty_l, \
                  'top3_va': three_va, 'top20_va': twenty_va, 'total_ppe': total_ppe, 'top3_ppe': three_ppe, 'top20_ppe': twenty_ppe, 'hhi': hhi, \
                    'total_var': total_var, 'Top3_var': three_va_var, 'Top20_var': twenty_va_var, 'tfp_var': total_tfp_var, 'top3_tfp_var': three_tfp_var, 'top20_tfp_var':twenty_tfp_var}
        
        hhi_b.append(dict_b)

df_b = pd.DataFrame(hhi_b)

#--------------------#
## save
df_a.to_excel('./data/hhi_a.xlsx', index = False)
df_b.to_excel('./data/hhi_b.xlsx', index = False)