# Goal: compute markup and market share
#--------------------#
import pandas as pd
import numpy as np
import os

## cd my folder
os.chdir("my path")

## input all sector data
df = pd.read_excel("./rawdata/data.xlsx")

## compute markup
markup_li = []
for i in range(df.shape[0]):
    if df.iloc[i]['cost'] != 0:
        markup_li.append(df.iloc[i]['sales']/df.iloc[i]['cost'])
    else:
        markup_li.append(np.nan) ## add na so that it will be ignored when calculating later

## compute pay/sales ratio
s1_li = []
for i in range(df.shape[0]):
    if df.iloc[i]['sales'] != 0:
        s1_li.append(df.iloc[i]['pay']/df.iloc[i]['sales'])
    else:
        s1_li.append(np.nan) ## add na so that it will be ignored when calculating later

## compute wage/sales ratio
s2_li = []
for i in range(df.shape[0]):
    if (df.iloc[i]['sales'] != 0) and (df.iloc[i]['wage']):
        s2_li.append(df.iloc[i]['wage']/df.iloc[i]['sales'])
    else:
        s2_li.append(np.nan) ## add na so that it will be ignored when calculating later

## paste
df['mk'] = markup_li
df['s_i'] = s1_li
df['s_j'] = s2_li

## save
df.to_excel('./rawdata/data_mk_s.xlsx', index = False)
#--------------------#

df_m = pd.read_excel("./rawdata/data_mk_s.xlsx") ## just in case but totally unnecessary

## compute market share
con_va_li = [] ## using gross profit
con_sales_li = [] ## using sales
for i in range(df_m.shape[0]):
    va = df_m.iloc[i]['gross']
    sales = df_m.iloc[i]['sales']
    yr = df_m.iloc[i]['time']
    indus = df_m.iloc[i]['industry']
    indus_va = df_m.loc[(df_m['time'] == yr) & (df_m['industry'] == indus)]['gross'].sum() ## sum up indursty gross profit
    indus_sa = df_m.loc[(df_m['time'] == yr) & (df_m['industry'] == indus)]['sales'].sum() ## sum up indursty sales

    con_va_li.append(va/indus_va) ## ratio(gross)
    con_sales_li.append(sales/indus_sa) ## ratio(sales)

## paste
df_m['con_s'] = con_sales_li
df_m['con_va'] = con_va_li

## save
df_m.to_excel('./rawdata/data_mk_s.xlsx', index = False)