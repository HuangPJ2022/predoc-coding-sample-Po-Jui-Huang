# Goal: Consider two industry classifications
#--------------------#
import pandas as pd
import numpy as np
import os

## cd my folder
os.chdir("my path")

## import computed data
df = pd.read_excel('./rawdata/main_df_noFinance.xlsx')

## import company info
info = pd.read_excel('./rawdata/company_basic.xlsx')

## match industry for concordance
industry_li = []
for i in range(df.shape[0]):
    f_code = df.iloc[i]['code']
    if info.loc[info['code'] == str(f_code)].shape[0] == 1:
        industry_li.append(info.loc[info['code'] == str(f_code)].industry.values[0])
    else:
        industry_li.append(0)
df['industry'] = industry_li

## There are two classifications, government and TEJ database.
cons_a_li = [] ## government
cons_b_li = [] ## TEJ

## compute market share based on different classifications
for i in range(df.shape[0]):
    yr = df.iloc[i]['time']
    gross = df.iloc[i]['gross']
    a = df.iloc[i]['industry']
    b = df.iloc[i]['industry_tse']

    if df.loc[(df['time'] == yr) & (df['industry'] == a)]['gross'].sum() != 0:
        cons_a_li.append(gross / df.loc[(df['time'] == yr) & (df['industry'] == a)]['gross'].sum())
    else:
        cons_a_li.append(np.nan)

    if df.loc[(df['time'] == yr) & (df['industry_tse'] == b)]['gross'].sum() != 0:
        cons_b_li.append(gross / df.loc[(df['time'] == yr) & (df['industry_tse'] == b)]['gross'].sum())
    else:
        cons_b_li.append(np.nan)

## paste 
df['cons_a'] = cons_a_li
df['cons_b'] = cons_b_li

## save
df.to_excel("./rawdata/latest_df_0530.xlsx", index = False)
#--------------------#

## append some expense variables
expense = pd.read_excel('./rawdata/20240611232457DataExport.xlsx')

## merge new expense var and computed data 
df = df.merge(expense[['code','time','ebitda','other_rev','tax','inventory_change','expense']], on = ['code', 'time'], how = 'left')

## match industry(gov) to distinguish(helpful for analysis)
industry_li = []
for i in range(df.shape[0]):
    f_code = df.iloc[i]['code']
    if info.loc[info['code'] == str(f_code)].shape[0] == 1:
        industry_li.append(info.loc[info['code'] == str(f_code)].industry_gov.values[0])
    else:
        industry_li.append(0)
df['industry_gov'] = industry_li

## rank company within industry by its gross profit
df_a = pd.DataFrame()
for yr in range(2000, 2024):
    for indus in range(1, 9):
        temp_a = df.loc[(df['time'] == str(yr) + '/12') & (df['industry'] == indus)].sort_values(by = 'gross', na_position = 'last')
        temp_a['rank_a'] = np.argsort(-temp_a['gross']) + 1
        df_a = pd.concat([df_a, temp_a], ignore_index=True)

## rank company within industry by its gross profit
df_b = pd.DataFrame()
for yr in range(2000, 2024):
    for indus in df['industry_tse'].unique():
        temp_b = df.loc[(df['time'] == str(yr) + '/12') & (df['industry_tse'] == str(indus))].sort_values(by = 'gross', na_position = 'last')
        temp_b['rank_b'] = np.argsort(-temp_b['gross']) + 1
        df_b = pd.concat([df_b, temp_b], ignore_index=True)

## merhe ranking
df = df.merge(df_a[['code', 'time', 'rank_a']], on = ['code', 'time'], how = 'left')
df = df.merge(df_b[['code', 'time', 'rank_b']], on = ['code', 'time'], how = 'left')
df['mk'] = df['sales']/df['COGS']

## save
df.to_excel("./data/pre_reg_data.xlsx", index = False)