# Goal: merge expense data
#--------------------#
import pandas as pd
import numpy as np
import os

## cd my folder
os.chdir("my path")

## import computed data
df = pd.read_excel('./rawdata/data_mk_s_Asset.xlsx')

## import reported wage data, rename, and select variables
## Some companies provide wage data, however, their reported value tends to be inconsistent with our prior estimates.
wage = pd.read_excel("./rawdata/一般產業非合併認股權與用人費用.xlsx")
wage = wage.rename(columns = {'代號':'code', '名稱':'name', '年月':'time', '薪資合計':'raw_pay', '用人費用合計': 'raw_wage'})
wage = wage[['code','name','time','raw_pay', 'raw_wage']]

## adjust time format and type(just for convenience)
for i in range(wage.shape[0]):
    wage['time'].iloc[i] = wage['time'].iloc[i][0:4]

df['time'] = df['time'].astype(str)
df['code'] = df['code'].astype(str)
wage['time'] = wage['time'].astype(str)
wage['code'] = wage['code'].astype(str)

## merge reported wage and our computed data
df_wage = df.merge(wage, on = ['code', 'time'], how = 'left').drop(columns=['name'])

## import expense and rename
material = pd.read_excel('./rawdata/intermediate more statistics.xlsx')
material = material.rename(columns={'代號':'code', '名稱': 'name', '年/月':'time', '每人營業利益':'opeProfitPer', '每人營收':'salesPer', '員工人數':'numL', '本期進貨':'purchase', '原料及物料':'material', '市場別':'market'})

## import company info
company_info = pd.read_excel("./rawdata/company_basic.xlsx")

## organize market listed firms and paste it into computed data
market_li = []
for i in range(df.shape[0]):
    f_code = df_wage.iloc[i]['code']
    if company_info.loc[company_info['code'] == str(f_code)].shape[0] == 1:
        market_li.append(company_info.loc[company_info['code'] == str(f_code)].market.values[0])
    else:
        market_li.append(0)
df_wage['market'] = market_li

## adjust time foramt adn type
for i in range(material.shape[0]):
    material['time'].iloc[i] = material['time'].iloc[i][0:4]

material['time'] = material['time'].astype(str)
material['code'] = material['code'].astype(str)

## merge computed data and expense
new_df = df_wage.merge(material, on = ['code', 'time'], how = 'left')

## filter out finance sector(I discussed with my supervisor)
new_df_2 = new_df.loc[new_df['industry'] != 7].reset_index(drop=True)
new_df_2 = new_df_2.drop(columns=['name', 'market_y', 's_i', 's_j']) # redundant var
new_df_2 = new_df_2.rename(columns={'name_x':'name'}) # rename column
new_df_2['gross'] = new_df_2['sales'] - new_df_2['cost'] ## compute gross
new_df_2['buyPPE'] = abs(new_df_2['buyPPE']) ## the expense of buying PPE. Positive value facilitates further estimation.
new_df_2['invest'] = abs(new_df_2['invest']) ## the expense of investing. Positive value facilitates further estimation.

## save
new_df_2.to_excel('./rawdata/main_df_noFinance.xlsx', index=False)