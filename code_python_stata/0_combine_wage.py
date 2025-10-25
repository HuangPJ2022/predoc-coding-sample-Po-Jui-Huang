# Goal: combine all sectors and compute pay, wage, compensation, and RD
#--------------------#
import pandas as pd
import numpy as np
import os
import math

## cd my folder
os.chdir("my path")

## input company info data
company_info = pd.read_excel("./rawdata/company_basic.xlsx")

#-----banking-----#
## tranlate and rename
bank_sales = pd.read_excel("./rawdata/銀行業非合併損益表.xlsx")[['代號','名稱','年月','淨收益', '  營業費用－業務及管理費']].rename(columns = {'代號': 'code', '名稱': 'name', '年月':'time', '淨收益': 'sales', '  營業費用－業務及管理費': 'cost'})
bank_wage = pd.read_excel("./rawdata/銀行業非合併營業費用明細表.xlsx")[['代號','名稱','年月','人事成本薪資','薪資有關人事費用','研究發展費']].rename(columns = {'代號': 'code', '名稱': 'name', '年月':'time', '人事成本薪資': 'pay', '薪資有關人事費用': 'wage', '研究發展費': 'rd'})

## encode industry and compute pay, wage and rd
bank_industry_li = [7]*bank_sales.shape[0] 
bank_sales['industry'] = bank_industry_li
bank_sales[['pay', 'wage', 'rd']] = bank_wage[['pay', 'wage', 'rd']]

bank_sales = bank_sales.dropna().reset_index(drop=True) ## drop na

#-----security-----#
## tranlate and rename
secu_sales = pd.read_excel("./rawdata/證券業非合併損益表.xlsx")[['代號','名稱','年月','收益合計','cost']].rename(columns = {'代號': 'code', '名稱': 'name', '年月':'time', '收益合計': 'sales'})
secu_wage = pd.read_excel("./rawdata/證券業非合併營業費用明細表.xlsx")[['代號','名稱','年月','薪資有關人事費用','研究發展費']].rename(columns = {'代號': 'code', '名稱': 'name', '年月':'time', '薪資有關人事費用': 'wage', '研究發展費': 'rd'})

## encode industry and compute pay, wage and rd
secu_industry_li = [7]*secu_sales.shape[0]
seci_pay_li = [0]*secu_sales.shape[0]
secu_sales['industry'] = secu_industry_li
secu_sales['pay'] = seci_pay_li
secu_sales[['wage', 'rd']] = secu_wage[['wage', 'rd']]

secu_sales = secu_sales.dropna().reset_index(drop=True) ## drop na

#-----insurance-----#
## tranlate and rename
insur_sales = pd.read_excel("./rawdata/保險業非合併損益表.xlsx")[['代號','名稱','年月', '營業收入', '營業成本']].rename(columns = {'代號': 'code', '名稱': 'name', '年月':'time', '營業收入': 'sales', '營業成本': 'cost'})
insur_wage = pd.read_excel("./rawdata/保險業非合併營業費用明細表.xlsx")[['代號','名稱','年月','人事成本薪資','薪資有關人事費用','研究發展費']].rename(columns = {'代號': 'code', '名稱': 'name', '年月':'time', '人事成本薪資': 'pay', '薪資有關人事費用': 'wage', '研究發展費': 'rd'})

## encode industry and compute pay, wage and rd
insur_industry_li = [7]*insur_sales.shape[0]
insur_sales['industry'] = insur_industry_li
insur_sales[['pay', 'wage', 'rd']] = insur_wage[['pay', 'wage', 'rd']]

insur_sales = insur_sales.dropna().reset_index(drop=True) ## drop na

#-----finance-----#
## concat finance sector
finace_df = pd.concat([bank_sales, secu_sales, insur_sales], ignore_index=True)

## compute gross profit
finace_df.insert(5, "gross", (finace_df['sales']-finace_df['cost']))

## adjust time format
for i in range(finace_df.shape[0]):
    finace_df['time'][i] = finace_df['time'][i][0:4]

## save
finace_df.to_excel('./rawdata/finance.xlsx', index= False)

#-----other sectors-----#
## import unconsolidated balance sheet
income_st_1 = pd.read_excel("./rawdata/一般產業非合併損益表90-99.xlsx")
income_st_1 = income_st_1[['代號', '名稱', '年月', '營業收入毛額', '營業成本' ,'營業毛利']].rename(columns = {'代號':'code', '名稱':'name', '年月':'time', '營業收入毛額':'sales', '營業成本':'cost','營業毛利':'gross'})
income_st_2 = pd.read_excel("./rawdata/一般產業非合併損益表00-09.xlsx")
income_st_2 = income_st_2[['代號', '名稱', '年月', '營業收入毛額', '營業成本' ,'營業毛利']].rename(columns = {'代號':'code', '名稱':'name', '年月':'time', '營業收入毛額':'sales', '營業成本':'cost','營業毛利':'gross'})
income_st_3 = pd.read_excel("./rawdata/一般產業非合併損益表10-19.xlsx")
income_st_3 = income_st_3[['代號', '名稱', '年月', '營業收入毛額', '營業成本' ,'營業毛利']].rename(columns = {'代號':'code', '名稱':'name', '年月':'time', '營業收入毛額':'sales', '營業成本':'cost','營業毛利':'gross'})
income_st_4 = pd.read_excel("./rawdata/一般產業非合併損益表20-23.xlsx")
income_st_4 = income_st_4[['代號', '名稱', '年月', '營業收入毛額', '營業成本' ,'營業毛利']].rename(columns = {'代號':'code', '名稱':'name', '年月':'time', '營業收入毛額':'sales', '營業成本':'cost','營業毛利':'gross'})

## concat 
income_df = pd.concat([income_st_4, income_st_3, income_st_2, income_st_1], ignore_index=True)

## adjust time format
for i in range(income_df.shape[0]):
    income_df['time'][i] = income_df['time'][i][0:4]

## encode industry
industry_li = []
for i in range(income_df.shape[0]):
    f_code = income_df.iloc[i]['code']
    if company_info.loc[company_info['code'] == str(f_code)].shape[0] == 1:
        industry_li.append(company_info.loc[company_info['code'] == str(f_code)].industry.values[0])
    else:
        industry_li.append(0)
income_df['industry'] = industry_li

## import data to compute pay
wage_st_2 = pd.read_excel("./rawdata/一般產業非合併營業費用明細表.xlsx")
wage_st_2 = wage_st_2[['代號', '名稱', '年/月', '薪資（有關人事費用）','推銷薪資支出（有關人事費用）', '管理薪資支出', '研發薪資支出', '研發費用合計','研究發展費用']]

## adjust time formate
for i in range(wage_st_2.shape[0]):
    wage_st_2['年/月'][i] = wage_st_2['年/月'][i][0:4]

## adujst na
wage_st_2.replace(math.nan, 0 ,inplace=True)

## compute pay
pay_li = []
for i in range(wage_st_2.shape[0]):
    if (wage_st_2.iloc[i]['薪資（有關人事費用）'] == 0):
        pay_li.append(wage_st_2.iloc[i]['推銷薪資支出（有關人事費用）'] + wage_st_2.iloc[i]['管理薪資支出'] + wage_st_2.iloc[i]['研發薪資支出'])
    else:
        pay_li.append(wage_st_2.iloc[i]['薪資（有關人事費用）'])
income_df['pay'] = pay_li

## import data to compute wage(pay + compensation) and RD
wage_st_1 = pd.read_excel("./rawdata/一般產業非合併認股權與用人費用.xlsx")
wage_st_1 = wage_st_1[['代號', '名稱', '年月', '股份基礎給付合計','勞健保合計','退休金合計','伙食費合計','職工福利合計','其他用人費合計']]

## adujst na
wage_st_1.replace(math.nan, 0 ,inplace=True)

## compute compensation
wage_st_1['compensation'] = wage_st_1['伙食費合計'] + wage_st_1['其他用人費合計'] + wage_st_1['勞健保合計'] + wage_st_1['職工福利合計'] + wage_st_1['股份基礎給付合計'] + wage_st_1['退休金合計']

## wage = pay + compensation
income_df['wage'] = income_df['pay'] + wage_st_1['compensation']

## RD
income_df['rd'] = wage_st_2['研發費用合計']- wage_st_2['研發薪資支出']

## concat all sectors and save
df = pd.concat([income_df, finace_df])
df.to_excel('./rawdata/data.xlsx', index = False)