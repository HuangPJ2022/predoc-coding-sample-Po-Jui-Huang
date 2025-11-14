# Goal: merge assets data 
#--------------------#
import pandas as pd
import numpy as np
import os

## cd my folder
os.chdir("my path")

## import computed data
df = pd.read_excel('./rawdata/data_mk_s.xlsx')

## import balance sheet
normal = pd.read_excel("./rawdata/一般產業非合併資產負債表.xlsx") ## not finance
bank = pd.read_excel("./rawdata/銀行業非合併資產負債表.xlsx") ## banking
insu = pd.read_excel("./rawdata/保險業非合併資產負債表.xlsx") ## insurance
secu = pd.read_excel("./rawdata/證券業非合併資產負債表.xlsx") ## security

## select variables and rename
normal_s = normal[['代號','名稱','年/月', '  不動產廠房及設備','資產總額', '負債總額', '股東權益總額']].rename(columns = {'代號': 'code', '名稱': 'name', '年/月': 'time', '  不動產廠房及設備': 'K', '資產總額': 'asset', '負債總額': 'debt', '股東權益總額': 'equity'})
bank_s = bank[['代號','名稱','年/月', '  不動產及設備淨額','資產總額', '負債總額', '股東權益總額']].rename(columns = {'代號': 'code', '名稱': 'name', '年/月': 'time', '  不動產及設備淨額': 'K', '資產總額': 'asset', '負債總額': 'debt', '股東權益總額': 'equity'})
insu_s = insu[['代號','名稱','年/月', '不動產及設備淨額','資產總額', '負債總額', '股東權益總額']].rename(columns = {'代號': 'code', '名稱': 'name', '年/月': 'time', '不動產及設備淨額': 'K', '資產總額': 'asset', '負債總額': 'debt', '股東權益總額': 'equity'})
secu_s = secu[['代號','名稱','年/月', '  不動產及設備淨額','資產總額', '負債總額', '股東權益總額']].rename(columns = {'代號': 'code', '名稱': 'name', '年/月': 'time', '  不動產及設備淨額': 'K', '資產總額': 'asset', '負債總額': 'debt', '股東權益總額': 'equity'})

## concat all sectors
merge = pd.concat([normal_s, bank_s, insu_s, secu_s], ignore_index = True)

## adjust time format
for i in range(merge.shape[0]):
    merge['time'].iloc[i] = merge['time'].iloc[i][0:4]

## merge computed data and assets data
## changing type just for convenience
df['time'] = df['time'].astype(str)
df['code'] = df['code'].astype(str)
merge['time'] = merge['time'].astype(str)
merge['code'] = merge['code'].astype(str)
df_m = df.merge(merge, on = ['code' , 'time'], how = 'left')
df_m = df_m.drop(columns='name_y')

## save
df_m.to_excel("./rawdata/data_mk_s_Asset.xlsx", index = False)