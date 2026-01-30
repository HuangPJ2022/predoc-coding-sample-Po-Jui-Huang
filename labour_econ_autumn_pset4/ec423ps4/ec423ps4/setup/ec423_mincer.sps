file handle pcdat/name='ec423_mincer.dat' /lrecl=314.
data list file pcdat free /
  A0002600 (F3)
  R0000100 (F5)
  R0000300 (F2)
  R0000500 (F2)
  R0006500 (F2)
  R0007900 (F2)
  R0009100 (F2)
  R0173600 (F2)
  R0214700 (F2)
  R0214800 (F2)
  R0410100 (F2)
  R0410300 (F2)
  R0618301 (F6)
  T4181500 (F2)
  T4188900 (F2)
  T4189900 (F2)
  T4193600 (F2)
  T4201000 (F2)
  T4201100 (F2)
  T4246600 (F2)
  T4246700 (F2)
  T4253500 (F3)
  T4253600 (F3)
  T4254500 (F3)
  T4254600 (F3)
  T4255000 (F3)
  T4255100 (F3)
  T4259000 (F2)
  T4259100 (F2)
  T4282300 (F4)
  T4282800 (F4)
  T4282900 (F4)
  T4283300 (F2)
  T4429600 (F2)
  T4434100 (F2)
  T4467000 (F4)
  T4478200 (F2)
  T4478300 (F3)
  T4876800 (F2)
  T4890700 (F2)
  T4890800 (F2)
  T4890900 (F2)
  T4891000 (F2)
  T4891300 (F2)
  T4892000 (F2)
  T4892200 (F2)
  T4892300 (F2)
  T4892400 (F3)
  T4892500 (F2)
  T4892600 (F3)
  T4892700 (F3)
  T4892800 (F2)
  T4892900 (F2)
  T4894200 (F2)
  T4894300 (F2)
  T4894400 (F2)
  T4897200 (F2)
  T4897800 (F2)
  T4897900 (F2)
  T4898000 (F2)
  T4915800 (F6)
  T5019200 (F4)
  T5019300 (F4)
  T5019700 (F6)
  T5019900 (F6)
  T5022100 (F7)
  T5022300 (F2)
  T5022500 (F2)
  T5022600 (F6)
  T5022800 (F2)
  T5023100 (F2)
  T5023200 (F2)
  T5023300 (F2)
  T5024700 (F4)
  T5024800 (F2)
  T5024900 (F2)
  T5025000 (F2)
  T5025100 (F3)
  T5025900 (F2)
  T5026000 (F2)
  T5026200 (F2)
  T5031400 (F2)
  T5031500 (F2)
  T5031600 (F2)
  T5054600 (F2)
  T5058900 (F2)
.
* The following code works with current versions of SPSS.
missing values all (-5 thru -1).
* older versions of SPSS may require this:
* recode all (-5,-3,-2,-1=-4).
* missing values all (-4).
variable labels
  A0002600  "VERSION_R26_1 2014"
  R0000100  "ID# (1-12686) 79"
  R0000300  "DATE OF BIRTH - MONTH 79"
  R0000500  "DATE OF BIRTH - YR 79"
  R0006500  "HGC BY RS MOTHER 79"
  R0007900  "HGC BY RS FATHER 79"
  R0009100  "# OF SIBS 79"
  R0173600  "SAMPLE ID  79 INT"
  R0214700  "RACL/ETHNIC COHORT /SCRNR 79"
  R0214800  "SEX OF R 79"
  R0410100  "DATE OF BIRTH - MONTH 81"
  R0410300  "DATE OF BIRTH - YR 81"
  R0618301  "PROFILES AFQT PRCTILE 2006 (REV) 81"
  T4181500  "TYPE OF RESIDENCE R IS LIVING IN 2014"
  T4188900  "PRESENT RELIGIOUS AFFILIATION 2014"
  T4189900  "FREQ OF RS RELIGIOUS ATTENDANCE 2014"
  T4193600  "LIVE W-A PARTNER AT LEAST 3 MOS 2014"
  T4201000  "HGHST GRADE OF REG SCH. R ATTENDED 2014"
  T4201100  "HGHST GRADE/YR COMPLTD & GOT CREDIT 2014"
  T4246600  "R CURR WORKING FOR EMP? L1 2014"
  T4246700  "R CURR WORKING FOR EMP? L2 2014"
  T4253500  "HRS WRKD WK - INCL HOME HRS L1 2014"
  T4253600  "HRS WRKD WK - INCL HOME HRS L2 2014"
  T4254500  "TTL HRS WRKD AT HOME OR BSNS L1 2014"
  T4254600  "TTL HRS WRKD AT HOME OR BSNS L2 2014"
  T4255000  "HRS PER WEEK WORKED AT HOME L1 2014"
  T4255100  "HRS PER WEEK WORKED AT HOME L2 2014"
  T4259000  "R WORK 10 HRS OR MORE A WEEK? L1 2014"
  T4259100  "R WORK 10 HRS OR MORE A WEEK? L2 2014"
  T4282300  "INDUSTRY (2000 CODES) ALL JOB L1 2014"
  T4282800  "OCCUPATION (2000 CODES) ALL JOB L1 2014"
  T4282900  "OCCUPATION (2000 CODES) ALL JOB L2 2014"
  T4283300  "RS EMPLOYMENT CATEGORY ALL JOB L1 2014"
  T4429600  "NUM TRNG PGMS ON INFO SHEET? L1 2014"
  T4434100  "ATTEND TRN OR OJT TRN SIN DLI 2014"
  T4467000  "RS SPOUSES OCCUPATION IN PCY? 2014"
  T4478200  "NUM OF WKS WRKD SP-PAR PCY 2014"
  T4478300  "HRS WK WRKD DURING WKS SP-PAR 2014"
  T4876800  "# BIO CHILDREN REPORTED 2014"
  T4890700  "WOULD HEALTH KEEP R FR WRKNG 2014"
  T4890800  "HEALTH LIMITS KIND OF WRK COULD DO 2014"
  T4890900  "HEALTH LIMITS AMT OF WRK R COULD DO 2014"
  T4891000  "R HAVE HEALTH LIMITATIONS? 2014"
  T4891300  "WHEN DID HEALTH LIMIT BEGIN 2014"
  T4892000  "ANYONE IN R HH DISABLED/CHRONICALLY ILL 2014"
  T4892200  "# IN R HH DISABLED OR CHRONICALLY ILL 2014"
  T4892300  "R REGULARLY CARE FOR DISABLED HH MEMBER 2014"
  T4892400  "# HRS CARING FOR DISABLED HH MEMBER 2014"
  T4892500  "R CARE FOR DISABLED REL/FRIEND OUT OF HH 2014"
  T4892600  "# HRS CARING DISABLED PERSON OUT OF HH 2014"
  T4892700  "HOW MUCH DOES R WEIGH 2014"
  T4892800  "R HEIGHT IN FEET 2014"
  T4892900  "R HEIGHT IN INCHES 2014"
  T4894200  "HEALTH CARE PROVIDER TO SEE/SEEK ADVICE 2014"
  T4894300  "PLACE R MOST OFTEN GOES FOR HEALTH CARE 2014"
  T4894400  "TIME SINCE LAST PHYSICAL EXAM 2014"
  T4897200  "R HAVE HEALTH/HOSP PLAN 2014"
  T4897800  "R COVERED BY MEDICAID 2014"
  T4897900  "HOW LONG SINCE R LAST HAD HEALTH CARE COVERAGE 2014"
  T4898000  "R INS THROUGH CUR/PREV EMPLOYER 2014"
  T4915800  "AMT OF RS WAGES/SALARY/TIPS (PCY) 2014"
  T5019200  "TOTAL TENURE JOB # 1 2014"
  T5019300  "TOTAL TENURE JOB # 2 2014"
  T5019700  "HRLY RATE OF PAY JOB# 1 2014"
  T5019900  "HRLY RATE OF PAY JOB# 2 2014"
  T5022100  "SAMPLING WEIGHT 2014"
  T5022300  "REASONS FOR NON-INT 2014"
  T5022500  "FAMILY SIZE 2014"
  T5022600  "TOTAL NET FAMILY INCOME 2014"
  T5022800  "POVERTY STATUS 2014"
  T5023100  "REGION OF RESIDENCE 2014"
  T5023200  "MARITAL STATUS (COLLAPSED) 2014"
  T5023300  "MARITAL STATUS 2014"
  T5024700  "HRS WRKD IN PAST CAL YR 2014"
  T5024800  "WKS WRKD IN PAST CAL YR 2014"
  T5024900  "WKS UNEMP IN PAST CAL YR 2014"
  T5025000  "WKS OLF IN PAST CAL YR 2014"
  T5025100  "WKS UNACCTD IN PAST CAL YR 2014"
  T5025900  "RS RESIDENCE URBAN OR RURAL 2014"
  T5026000  "RS RESIDENCE IN SMSA 2014"
  T5026200  "NUM JOBS EVER REPORTED 2014"
  T5031400  "NUMBER OF CHILDREN EVER BORN 2014"
  T5031500  "NUM BIO/STEP/ADPT CHILDREN IN HH 2014"
  T5031600  "AGE YNGST BIO/STEP/ADPT CHILD IN HH 2014"
  T5054600  "R CURRENTLY WORKING FOR EMPLOYER L1 2014"
  T5058900  "CPS FLAG L1 2014"
.

* Recode continuous values. 
* recode 
 A0002600 
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 10999 eq 10000)
    (11000 thru 11999 eq 11000)
    (12000 thru 12999 eq 12000)
    / 
 R0000300 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 15 eq 15)
    (16 thru 16 eq 16)
    (17 thru 99999 eq 17)
    / 
 R0000500 
    (0 thru 56 eq 0)
    (57 thru 57 eq 57)
    (58 thru 58 eq 58)
    (59 thru 59 eq 59)
    (60 thru 60 eq 60)
    (61 thru 61 eq 61)
    (62 thru 62 eq 62)
    (63 thru 63 eq 63)
    (64 thru 64 eq 64)
    (65 thru 65 eq 65)
    (66 thru 66 eq 66)
    (67 thru 67 eq 67)
    (68 thru 68 eq 68)
    (69 thru 69 eq 69)
    (70 thru 70 eq 70)
    (71 thru 71 eq 71)
    (72 thru 72 eq 72)
    (73 thru 99999 eq 73)
    / 
 R0009100 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 15 eq 15)
    (16 thru 99999 eq 16)
    / 
 R0410100 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 15 eq 15)
    (16 thru 16 eq 16)
    (17 thru 99999 eq 17)
    / 
 R0410300 
    (0 thru 54 eq 0)
    (55 thru 55 eq 55)
    (56 thru 56 eq 56)
    (57 thru 57 eq 57)
    (58 thru 58 eq 58)
    (59 thru 59 eq 59)
    (60 thru 60 eq 60)
    (61 thru 61 eq 61)
    (62 thru 62 eq 62)
    (63 thru 63 eq 63)
    (64 thru 64 eq 64)
    (65 thru 65 eq 65)
    (66 thru 66 eq 66)
    (67 thru 67 eq 67)
    (68 thru 68 eq 68)
    (69 thru 69 eq 69)
    (70 thru 70 eq 70)
    (71 thru 99999 eq 71)
    / 
 T4253500 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T4253600 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T4254500 
    (0 thru 0 eq 0)
    (1 thru 4 eq 1)
    (5 thru 9 eq 5)
    (10 thru 14 eq 10)
    (15 thru 19 eq 15)
    (20 thru 24 eq 20)
    (25 thru 29 eq 25)
    (30 thru 34 eq 30)
    (35 thru 39 eq 35)
    (40 thru 44 eq 40)
    (45 thru 49 eq 45)
    (50 thru 99999999 eq 50)
    / 
 T4254600 
    (0 thru 0 eq 0)
    (1 thru 4 eq 1)
    (5 thru 9 eq 5)
    (10 thru 14 eq 10)
    (15 thru 19 eq 15)
    (20 thru 24 eq 20)
    (25 thru 29 eq 25)
    (30 thru 34 eq 30)
    (35 thru 39 eq 35)
    (40 thru 44 eq 40)
    (45 thru 49 eq 45)
    (50 thru 99999999 eq 50)
    / 
 T4255000 
    (0 thru 0 eq 0)
    (1 thru 4 eq 1)
    (5 thru 9 eq 5)
    (10 thru 14 eq 10)
    (15 thru 19 eq 15)
    (20 thru 24 eq 20)
    (25 thru 29 eq 25)
    (30 thru 34 eq 30)
    (35 thru 39 eq 35)
    (40 thru 44 eq 40)
    (45 thru 49 eq 45)
    (50 thru 99999999 eq 50)
    / 
 T4255100 
    (0 thru 0 eq 0)
    (1 thru 4 eq 1)
    (5 thru 9 eq 5)
    (10 thru 14 eq 10)
    (15 thru 19 eq 15)
    (20 thru 24 eq 20)
    (25 thru 29 eq 25)
    (30 thru 34 eq 30)
    (35 thru 39 eq 35)
    (40 thru 44 eq 40)
    (45 thru 49 eq 45)
    (50 thru 99999999 eq 50)
    / 
 T4282300 
    (170 thru 290 eq 170)
    (370 thru 490 eq 370)
    (570 thru 690 eq 570)
    (770 thru 770 eq 770)
    (1070 thru 3990 eq 1070)
    (4070 thru 4590 eq 4070)
    (4670 thru 5790 eq 4670)
    (6070 thru 6390 eq 6070)
    (6470 thru 6780 eq 6470)
    (6870 thru 6990 eq 6870)
    (7070 thru 7190 eq 7070)
    (7270 thru 7490 eq 7270)
    (7570 thru 7790 eq 7570)
    (7860 thru 7890 eq 7860)
    (7970 thru 8470 eq 7970)
    (8560 thru 8590 eq 8560)
    (8660 thru 8690 eq 8660)
    (8770 thru 9290 eq 8770)
    (9370 thru 9870 eq 9370)
    (9890 thru 9890 eq 9890)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4282800 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4282900 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4467000 
    (10 thru 430 eq 10)
    (500 thru 950 eq 500)
    (1000 thru 1240 eq 1000)
    (1300 thru 1560 eq 1300)
    (1600 thru 1760 eq 1600)
    (1800 thru 1860 eq 1800)
    (1900 thru 1960 eq 1900)
    (2000 thru 2060 eq 2000)
    (2100 thru 2150 eq 2100)
    (2200 thru 2340 eq 2200)
    (2400 thru 2550 eq 2400)
    (2600 thru 2760 eq 2600)
    (2800 thru 2960 eq 2800)
    (3000 thru 3260 eq 3000)
    (3300 thru 3650 eq 3300)
    (3700 thru 3950 eq 3700)
    (4000 thru 4160 eq 4000)
    (4200 thru 4250 eq 4200)
    (4300 thru 4430 eq 4300)
    (4460 thru 4460 eq 4460)
    (4500 thru 4650 eq 4500)
    (4700 thru 4960 eq 4700)
    (5000 thru 5930 eq 5000)
    (6000 thru 6130 eq 6000)
    (6200 thru 6940 eq 6200)
    (7000 thru 7620 eq 7000)
    (7700 thru 7750 eq 7700)
    (7800 thru 7850 eq 7800)
    (7900 thru 8960 eq 7900)
    (9000 thru 9750 eq 9000)
    (9800 thru 9830 eq 9800)
    (9840 thru 9840 eq 9840)
    (9950 thru 9950 eq 9950)
    (9990 thru 9990 eq 9990)
    / 
 T4478200 
    (0 thru 0 eq 0)
    (1 thru 13 eq 1)
    (14 thru 26 eq 14)
    (27 thru 39 eq 27)
    (40 thru 48 eq 40)
    (49 thru 51 eq 49)
    (52 thru 52 eq 52)
    (53 thru 99999999 eq 53)
    / 
 T4478300 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T4876800 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T4892200 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T4892400 
    (0 thru 0 eq 0)
    (1 thru 99 eq 1)
    (100 thru 199 eq 100)
    (200 thru 299 eq 200)
    (300 thru 399 eq 300)
    (400 thru 499 eq 400)
    (500 thru 599 eq 500)
    (600 thru 699 eq 600)
    (700 thru 799 eq 700)
    (800 thru 899 eq 800)
    (900 thru 999 eq 900)
    (1000 thru 99999999 eq 1000)
    / 
 T4892600 
    (0 thru 0 eq 0)
    (1 thru 99 eq 1)
    (100 thru 199 eq 100)
    (200 thru 299 eq 200)
    (300 thru 399 eq 300)
    (400 thru 499 eq 400)
    (500 thru 599 eq 500)
    (600 thru 699 eq 600)
    (700 thru 799 eq 700)
    (800 thru 899 eq 800)
    (900 thru 999 eq 900)
    (1000 thru 99999999 eq 1000)
    / 
 T4892700 
    (0 thru 0 eq 0)
    (1 thru 24 eq 1)
    (25 thru 49 eq 25)
    (50 thru 74 eq 50)
    (75 thru 99 eq 75)
    (100 thru 124 eq 100)
    (125 thru 149 eq 125)
    (150 thru 174 eq 150)
    (175 thru 199 eq 175)
    (200 thru 224 eq 200)
    (225 thru 249 eq 225)
    (250 thru 99999999 eq 250)
    / 
 T4892800 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T4892900 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 10 eq 10)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 99 eq 15)
    / 
 T4915800 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T5019200 
    (0 thru 0 eq 0)
    (1 thru 49 eq 1)
    (50 thru 99 eq 50)
    (100 thru 149 eq 100)
    (150 thru 199 eq 150)
    (200 thru 249 eq 200)
    (250 thru 299 eq 250)
    (300 thru 349 eq 300)
    (350 thru 399 eq 350)
    (400 thru 449 eq 400)
    (450 thru 499 eq 450)
    (500 thru 99999999 eq 500)
    / 
 T5019300 
    (0 thru 0 eq 0)
    (1 thru 49 eq 1)
    (50 thru 99 eq 50)
    (100 thru 149 eq 100)
    (150 thru 199 eq 150)
    (200 thru 249 eq 200)
    (250 thru 299 eq 250)
    (300 thru 349 eq 300)
    (350 thru 399 eq 350)
    (400 thru 449 eq 400)
    (450 thru 499 eq 450)
    (500 thru 99999999 eq 500)
    / 
 T5019700 
    (0 thru 0 eq 0)
    (1 thru 499 eq 1)
    (500 thru 999 eq 500)
    (1000 thru 1499 eq 1000)
    (1500 thru 1999 eq 1500)
    (2000 thru 2499 eq 2000)
    (2500 thru 2999 eq 2500)
    (3000 thru 3499 eq 3000)
    (3500 thru 3999 eq 3500)
    (4000 thru 4499 eq 4000)
    (4500 thru 4999 eq 4500)
    (5000 thru 99999999 eq 5000)
    / 
 T5019900 
    (0 thru 0 eq 0)
    (1 thru 499 eq 1)
    (500 thru 999 eq 500)
    (1000 thru 1499 eq 1000)
    (1500 thru 1999 eq 1500)
    (2000 thru 2499 eq 2000)
    (2500 thru 2999 eq 2500)
    (3000 thru 3499 eq 3000)
    (3500 thru 3999 eq 3500)
    (4000 thru 4499 eq 4000)
    (4500 thru 4999 eq 4500)
    (5000 thru 99999999 eq 5000)
    / 
 T5022100 
    (0 thru 0 eq 0)
    (1 thru 49999 eq 1)
    (50000 thru 99999 eq 50000)
    (100000 thru 149999 eq 100000)
    (150000 thru 199999 eq 150000)
    (200000 thru 249999 eq 200000)
    (250000 thru 299999 eq 250000)
    (300000 thru 399999 eq 300000)
    (400000 thru 499999 eq 400000)
    (500000 thru 599999 eq 500000)
    (600000 thru 699999 eq 600000)
    (700000 thru 799999 eq 700000)
    (800000 thru 899999 eq 800000)
    (900000 thru 999999 eq 900000)
    (1000000 thru 1999999 eq 1000000)
    (2000000 thru 2999999 eq 2000000)
    (3000000 thru 3999999 eq 3000000)
    (4000000 thru 4999999 eq 4000000)
    (5000000 thru 5999999 eq 5000000)
    (6000000 thru 6999999 eq 6000000)
    (7000000 thru 7999999 eq 7000000)
    (8000000 thru 8999999 eq 8000000)
    (9000000 thru 9999999 eq 9000000)
    (10000000 thru 9999999999 eq 10000000)
    / 
 T5022500 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T5022600 
    (0 thru 0 eq 0)
    (1 thru 999 eq 1)
    (1000 thru 1999 eq 1000)
    (2000 thru 2999 eq 2000)
    (3000 thru 3999 eq 3000)
    (4000 thru 4999 eq 4000)
    (5000 thru 5999 eq 5000)
    (6000 thru 6999 eq 6000)
    (7000 thru 7999 eq 7000)
    (8000 thru 8999 eq 8000)
    (9000 thru 9999 eq 9000)
    (10000 thru 14999 eq 10000)
    (15000 thru 19999 eq 15000)
    (20000 thru 24999 eq 20000)
    (25000 thru 49999 eq 25000)
    (50000 thru 99999999 eq 50000)
    / 
 T5024700 
    (0 thru 0 eq 0)
    (1 thru 499 eq 1)
    (500 thru 999 eq 500)
    (1000 thru 1499 eq 1000)
    (1500 thru 1999 eq 1500)
    (2000 thru 2499 eq 2000)
    (2500 thru 2999 eq 2500)
    (3000 thru 3499 eq 3000)
    (3500 thru 3999 eq 3500)
    (4000 thru 4499 eq 4000)
    (4500 thru 4999 eq 4500)
    (5000 thru 99999999 eq 5000)
    / 
 T5024800 
    (0 thru 0 eq 0)
    (1 thru 13 eq 1)
    (14 thru 26 eq 14)
    (27 thru 39 eq 27)
    (40 thru 48 eq 40)
    (49 thru 51 eq 49)
    (52 thru 52 eq 52)
    (53 thru 99999999 eq 53)
    / 
 T5024900 
    (0 thru 0 eq 0)
    (1 thru 13 eq 1)
    (14 thru 26 eq 14)
    (27 thru 39 eq 27)
    (40 thru 48 eq 40)
    (49 thru 51 eq 49)
    (52 thru 52 eq 52)
    (53 thru 99999999 eq 53)
    / 
 T5025000 
    (0 thru 0 eq 0)
    (1 thru 13 eq 1)
    (14 thru 26 eq 14)
    (27 thru 39 eq 27)
    (40 thru 48 eq 40)
    (49 thru 51 eq 49)
    (52 thru 52 eq 52)
    (53 thru 99999999 eq 53)
    / 
 T5025100 
    (0 thru 0 eq 0)
    (1 thru 9 eq 1)
    (10 thru 19 eq 10)
    (20 thru 29 eq 20)
    (30 thru 39 eq 30)
    (40 thru 49 eq 40)
    (50 thru 59 eq 50)
    (60 thru 69 eq 60)
    (70 thru 79 eq 70)
    (80 thru 89 eq 80)
    (90 thru 99 eq 90)
    (100 thru 99999999 eq 100)
    / 
 T5026200 
    (0 thru 0 eq 0)
    (1 thru 4 eq 1)
    (5 thru 9 eq 5)
    (10 thru 14 eq 10)
    (15 thru 19 eq 15)
    (20 thru 24 eq 20)
    (25 thru 29 eq 25)
    (30 thru 34 eq 30)
    (35 thru 39 eq 35)
    (40 thru 44 eq 40)
    (45 thru 49 eq 45)
    (50 thru 99999999 eq 50)
    / 
 T5031400 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T5031500 
    (0 thru 0 eq 0)
    (1 thru 1 eq 1)
    (2 thru 2 eq 2)
    (3 thru 3 eq 3)
    (4 thru 4 eq 4)
    (5 thru 5 eq 5)
    (6 thru 6 eq 6)
    (7 thru 7 eq 7)
    (8 thru 8 eq 8)
    (9 thru 9 eq 9)
    (10 thru 999 eq 10)
    / 
 T5031600 
    (0 thru 10 eq 0)
    (11 thru 11 eq 11)
    (12 thru 12 eq 12)
    (13 thru 13 eq 13)
    (14 thru 14 eq 14)
    (15 thru 15 eq 15)
    (16 thru 16 eq 16)
    (17 thru 17 eq 17)
    (18 thru 18 eq 18)
    (19 thru 19 eq 19)
    (20 thru 20 eq 20)
    (21 thru 21 eq 21)
    (22 thru 22 eq 22)
    (23 thru 23 eq 23)
    (24 thru 24 eq 24)
    (25 thru 25 eq 25)
    (26 thru 26 eq 26)
    (27 thru 27 eq 27)
    (28 thru 28 eq 28)
    (29 thru 29 eq 29)
    (30 thru 99 eq 30)
.

* value labels
 A0002600
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 10999"
    11000 "11000 TO 11999"
    12000 "12000 TO 12999"
    /
 R0000300
    0 "0: < 1"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15"
    16 "16"
    17 "17 TO 99999: 17+"
    /
 R0000500
    0 "0 TO 56: < 57"
    57 "57"
    58 "58"
    59 "59"
    60 "60"
    61 "61"
    62 "62"
    63 "63"
    64 "64"
    65 "65"
    66 "66"
    67 "67"
    68 "68"
    69 "69"
    70 "70"
    71 "71"
    72 "72"
    73 "73 TO 99999: 73+"
    /
 R0006500
    0 "NONE"
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YR COL"
    14 "2ND YR COL"
    15 "3RD YR COL"
    16 "4TH YR COL"
    17 "5TH YR COL"
    18 "6TH YR COL"
    19 "7TH YR COL"
    20 "8TH YR COL OR MORE"
    95 "UNGRADED"
    /
 R0007900
    0 "NONE"
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YR COL"
    14 "2ND YR COL"
    15 "3RD YR COL"
    16 "4TH YR COL"
    17 "5TH YR COL"
    18 "6TH YR COL"
    19 "7TH YR COL"
    20 "8TH YR COL OR MORE"
    95 "UNGRADED"
    /
 R0009100
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15"
    16 "16 TO 99999: 16+"
    /
 R0173600
    1 "CROSS MALE WHITE"
    2 "CROSS MALE WH. POOR"
    3 "CROSS MALE BLACK"
    4 "CROSS MALE HISPANIC"
    5 "CROSS FEMALE WHITE"
    6 "CROSS FEMALE WH POOR"
    7 "CROSS FEMALE BLACK"
    8 "CROSS FEMALE HISPANIC"
    9 "SUP MALE WH POOR"
    10 "SUP MALE BLACK"
    11 "SUP MALE HISPANIC"
    12 "SUP FEM WH POOR"
    13 "SUP FEMALE BLACK"
    14 "SUP FEMALE HISPANIC"
    15 "MIL MALE WHITE"
    16 "MIL MALE BLACK"
    17 "MIL MALE HISPANIC"
    18 "MIL FEMALE WHITE"
    19 "MIL FEMALE BLACK"
    20 "MIL FEMALE HISPANIC"
    /
 R0214700
    1 "HISPANIC"
    2 "BLACK"
    3 "NON-BLACK, NON-HISPANIC"
    /
 R0214800
    1 "MALE"
    2 "FEMALE"
    /
 R0410100
    0 "0: < 1"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15"
    16 "16"
    17 "17 TO 99999: 17+"
    /
 R0410300
    0 "0 TO 54: < 55"
    55 "55"
    56 "56"
    57 "57"
    58 "58"
    59 "59"
    60 "60"
    61 "61"
    62 "62"
    63 "63"
    64 "64"
    65 "65"
    66 "66"
    67 "67"
    68 "68"
    69 "69"
    70 "70"
    71 "71 TO 99999: 71+"
    /
 T4181500
    11 "OWN DWELLING UNIT"
    19 "RESPONDENT IN PARENT HOUSEHOLD"
    15 "CONVENT, MONASTERY, OTHER RELIGIOUS INSTITUTE"
    13 "OFF-BASE MILITARY FAMILY HOUSING"
    12 "ON-BASE MILITARY FAMILY HOUSING"
    16 "OTHER INDIVIDUAL QUARTERS (SPECIFY)"
    1 "OPEN BAY OR TROOP BARRACKS, ABOARD SHIP"
    2 "BACHELOR ENLISTED OR OFFICER QUARTERS"
    3 "DORMITORY, FRATERNITY OR SORORITY"
    5 "JAIL"
    4 "HOSPITAL"
    6 "OTHER TEMPORARY INDIVIDUAL QUARTERS (SPECIFY)"
    17 "LIVES WITH OTHER RELATIVES"
    18 "LIVES AT FRIEND'S RESIDENCE"
    21 "HOMELESS"
    25 "MOTEL/HOTEL"
    26 "GROUP HOME OR BOARDING HOUSE"
    32 "NURSING HOME OR RETIREMENT FACILITY"
    /
 T4188900
    1 "PROTESTANT"
    11 "CHRISTIAN, NO DENOMINATION GIVEN"
    12 "NON-DENOMINATIONAL OR NO DENOMINATION KNOWN"
    2 "BAPTIST"
    3 "EPISCOPALIAN"
    4 "LUTHERAN"
    5 "METHODIST"
    6 "PRESBYTERIAN"
    7 "ROMAN CATHOLIC"
    8 "JEWISH"
    9 "OTHER (SPECIFY)"
    10 "NONE, NO RELIGION"
    /
 T4189900
    1 "More than once a week"
    2 "About once a week"
    3 "Two or three times a month"
    4 "About once a month"
    5 "Several times a year or less"
    6 "Not at all"
    /
 T4193600
    1 "Yes"
    0 "No"
    /
 T4201000
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T4201100
    1 "1ST GRADE"
    2 "2ND GRADE"
    3 "3RD GRADE"
    4 "4TH GRADE"
    5 "5TH GRADE"
    6 "6TH GRADE"
    7 "7TH GRADE"
    8 "8TH GRADE"
    9 "9TH GRADE"
    10 "10TH GRADE"
    11 "11TH GRADE"
    12 "12TH GRADE"
    13 "1ST YEAR COLLEGE"
    14 "2ND YEAR COLLEGE"
    15 "3RD YEAR COLLEGE"
    16 "4TH YEAR COLLEGE"
    17 "5TH YEAR COLLEGE"
    18 "6TH YEAR COLLEGE"
    19 "7TH YEAR COLLEGE"
    20 "8TH YEAR COLLEGE OR MORE"
    95 "UNGRADED"
    /
 T4246600
    0 "0: 0  CONDITION DOES NOT APPLY"
    1 "1: 1  CONDITION APPLIES"
    /
 T4246700
    0 "0: 0  CONDITION DOES NOT APPLY"
    1 "1: 1  CONDITION APPLIES"
    /
 T4253500
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T4253600
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T4254500
    0 "0"
    1 "1 TO 4"
    5 "5 TO 9"
    10 "10 TO 14"
    15 "15 TO 19"
    20 "20 TO 24"
    25 "25 TO 29"
    30 "30 TO 34"
    35 "35 TO 39"
    40 "40 TO 44"
    45 "45 TO 49"
    50 "50 TO 99999999: 50+"
    /
 T4254600
    0 "0"
    1 "1 TO 4"
    5 "5 TO 9"
    10 "10 TO 14"
    15 "15 TO 19"
    20 "20 TO 24"
    25 "25 TO 29"
    30 "30 TO 34"
    35 "35 TO 39"
    40 "40 TO 44"
    45 "45 TO 49"
    50 "50 TO 99999999: 50+"
    /
 T4255000
    0 "0"
    1 "1 TO 4"
    5 "5 TO 9"
    10 "10 TO 14"
    15 "15 TO 19"
    20 "20 TO 24"
    25 "25 TO 29"
    30 "30 TO 34"
    35 "35 TO 39"
    40 "40 TO 44"
    45 "45 TO 49"
    50 "50 TO 99999999: 50+"
    /
 T4255100
    0 "0"
    1 "1 TO 4"
    5 "5 TO 9"
    10 "10 TO 14"
    15 "15 TO 19"
    20 "20 TO 24"
    25 "25 TO 29"
    30 "30 TO 34"
    35 "35 TO 39"
    40 "40 TO 44"
    45 "45 TO 49"
    50 "50 TO 99999999: 50+"
    /
 T4259000
    0 "0: 0  CONDITION DOES NOT APPLY"
    1 "1: 1  CONDITION APPLIES"
    /
 T4259100
    0 "0: 0  CONDITION DOES NOT APPLY"
    1 "1: 1  CONDITION APPLIES"
    /
 T4282300
    170 "170 TO 290: Agriculture, Forestry, Fishing, and Hunting"
    370 "370 TO 490: Mining"
    570 "570 TO 690: Utilities"
    770 "770: Construction"
    1070 "1070 TO 3990: Manufacturing"
    4070 "4070 TO 4590: Wholesale Trade"
    4670 "4670 TO 5790: Retail Trade"
    6070 "6070 TO 6390: Transportation and Warehousing"
    6470 "6470 TO 6780: Information"
    6870 "6870 TO 6990: Finance and Insurance"
    7070 "7070 TO 7190: Real Estate and Rental and Leasing"
    7270 "7270 TO 7490: Professional, Scientific, and Technical Services"
    7570 "7570 TO 7790: Management, Administrative and Support, and Waste Management Services"
    7860 "7860 TO 7890: Educational Services"
    7970 "7970 TO 8470: Health Care and Social Assistance"
    8560 "8560 TO 8590: Arts, Entertainment, and Recreation"
    8660 "8660 TO 8690: Accomodations and Food Services"
    8770 "8770 TO 9290: Other Services (Except Public Administration)"
    9370 "9370 TO 9870: Public Administration and Active Duty Military"
    9890 "9890: Armed Forces (for CPS)"
    9950 "9950: Not in Labor Force (ACS code)"
    9990 "9990: Uncodeable"
    /
 T4282800
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T4282900
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T4283300
    1 "1: 1  Government"
    2 "2: 2  Private for profit company"
    3 "3: 3  Non-profit organization (including tax exempt and charitable)"
    4 "4: 4  Self employed"
    5 "5: 5  Working in family business"
    /
 T4429600
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    /
 T4434100
    1 "Yes"
    0 "No"
    /
 T4467000
    10 "10 TO 430: Executive, Administrative and Managerial Occupations"
    500 "500 TO 950: Management Related Occupations"
    1000 "1000 TO 1240: Mathematical and Computer Scientists"
    1300 "1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians"
    1600 "1600 TO 1760: Physical Scientists"
    1800 "1800 TO 1860: Social Scientists and Related Workers"
    1900 "1900 TO 1960: Life, Physical and Social Science Technicians"
    2000 "2000 TO 2060: Counselors, Sociala and Religious Workers"
    2100 "2100 TO 2150: Lawyers, Judges and Legal Support Workers"
    2200 "2200 TO 2340: Teachers"
    2400 "2400 TO 2550: Education, Training and Library Workers"
    2600 "2600 TO 2760: Entertainers and Performers, Sports and Related Workers"
    2800 "2800 TO 2960: Media and Communications Workers"
    3000 "3000 TO 3260: Health Diagnosing and Treating Practitioners"
    3300 "3300 TO 3650: Health Care Technical and Support Occupations"
    3700 "3700 TO 3950: Protective Service Occupations"
    4000 "4000 TO 4160: Food Preparation and Serving Related Occupations"
    4200 "4200 TO 4250: Cleaning and Building Service Occupations"
    4300 "4300 TO 4430: Entertainment Attendants and Related Workers"
    4460 "4460: Funeral Related Occupations"
    4500 "4500 TO 4650: Personal Care and Service Workers"
    4700 "4700 TO 4960: Sales and Related Workers"
    5000 "5000 TO 5930: Office and Administrative Support Workers"
    6000 "6000 TO 6130: Farming, Fishing and Forestry Occupations"
    6200 "6200 TO 6940: Construction Trade and Extraction Workers"
    7000 "7000 TO 7620: Installation, Maintenance and Repairs Workers"
    7700 "7700 TO 7750: Production and Operating Workers"
    7800 "7800 TO 7850: Food Preparation Occupations"
    7900 "7900 TO 8960: Setters, Operators and Tenders"
    9000 "9000 TO 9750: Transportation and Material Moving Workers"
    9800 "9800 TO 9830: Military Specific Occupations"
    9840 "9840: Armed Forces"
    9950 "9950: Not in Labor Force (ACS Code)"
    9990 "9990: Uncodeable"
    /
 T4478200
    0 "0"
    1 "1 TO 13"
    14 "14 TO 26"
    27 "27 TO 39"
    40 "40 TO 48"
    49 "49 TO 51"
    52 "52"
    53 "53 TO 99999999: > 52"
    /
 T4478300
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T4876800
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T4890700
    1 "Yes"
    0 "No"
    /
 T4890800
    1 "Yes"
    0 "No"
    /
 T4890900
    1 "Yes"
    0 "No"
    /
 T4891000
    0 "0: 0  CONDITION DOES NOT APPLY"
    1 "1: 1  CONDITION APPLIES"
    /
 T4891300
    1 "SELECT TO ENTER DATE"
    0 "IF VOLUNTEERED: 'ALL MY LIFE'"
    /
 T4892000
    1 "Yes"
    0 "No"
    /
 T4892200
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T4892300
    1 "Yes"
    0 "No"
    /
 T4892400
    0 "0"
    1 "1 TO 99"
    100 "100 TO 199"
    200 "200 TO 299"
    300 "300 TO 399"
    400 "400 TO 499"
    500 "500 TO 599"
    600 "600 TO 699"
    700 "700 TO 799"
    800 "800 TO 899"
    900 "900 TO 999"
    1000 "1000 TO 99999999: 1000+"
    /
 T4892500
    1 "Yes"
    0 "No"
    /
 T4892600
    0 "0"
    1 "1 TO 99"
    100 "100 TO 199"
    200 "200 TO 299"
    300 "300 TO 399"
    400 "400 TO 499"
    500 "500 TO 599"
    600 "600 TO 699"
    700 "700 TO 799"
    800 "800 TO 899"
    900 "900 TO 999"
    1000 "1000 TO 99999999: 1000+"
    /
 T4892700
    0 "0"
    1 "1 TO 24"
    25 "25 TO 49"
    50 "50 TO 74"
    75 "75 TO 99"
    100 "100 TO 124"
    125 "125 TO 149"
    150 "150 TO 174"
    175 "175 TO 199"
    200 "200 TO 224"
    225 "225 TO 249"
    250 "250 TO 99999999: 250+"
    /
 T4892800
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T4892900
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15 TO 99: 15+"
    /
 T4894200
    1 "Yes"
    0 "No"
    /
 T4894300
    1 "Clinic or health center"
    2 "Doctor’s office or HMO"
    3 "Hospital emergency room"
    4 "Some other place"
    5 "Don’t go to one place most often"
    /
 T4894400
    0 "Never"
    1 "A year ago or less"
    2 "More than 1 year but not more than 2 years"
    3 "More than 2 years but not more than 3 years"
    4 "More than 3 years but not more than 5 years"
    5 "Over 5 years ago"
    /
 T4897200
    1 "Yes"
    0 "No"
    /
 T4897800
    1 "Yes"
    0 "No"
    /
 T4897900
    0 "6 months or less"
    1 "More than 6 months, but less than 1 year"
    2 "More than 1 year, but not more than 3 years"
    3 "More than 3 years"
    4 "Never"
    /
 T4898000
    0 "0: 0  CONDITION DOES NOT APPLY"
    1 "1: 1  CONDITION APPLIES"
    /
 T4915800
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T5019200
    0 "0"
    1 "1 TO 49"
    50 "50 TO 99"
    100 "100 TO 149"
    150 "150 TO 199"
    200 "200 TO 249"
    250 "250 TO 299"
    300 "300 TO 349"
    350 "350 TO 399"
    400 "400 TO 449"
    450 "450 TO 499"
    500 "500 TO 99999999: 500+"
    /
 T5019300
    0 "0"
    1 "1 TO 49"
    50 "50 TO 99"
    100 "100 TO 149"
    150 "150 TO 199"
    200 "200 TO 249"
    250 "250 TO 299"
    300 "300 TO 349"
    350 "350 TO 399"
    400 "400 TO 449"
    450 "450 TO 499"
    500 "500 TO 99999999: 500+"
    /
 T5019700
    0 "0"
    1 "1 TO 499"
    500 "500 TO 999"
    1000 "1000 TO 1499"
    1500 "1500 TO 1999"
    2000 "2000 TO 2499"
    2500 "2500 TO 2999"
    3000 "3000 TO 3499"
    3500 "3500 TO 3999"
    4000 "4000 TO 4499"
    4500 "4500 TO 4999"
    5000 "5000 TO 99999999: 5000+"
    /
 T5019900
    0 "0"
    1 "1 TO 499"
    500 "500 TO 999"
    1000 "1000 TO 1499"
    1500 "1500 TO 1999"
    2000 "2000 TO 2499"
    2500 "2500 TO 2999"
    3000 "3000 TO 3499"
    3500 "3500 TO 3999"
    4000 "4000 TO 4499"
    4500 "4500 TO 4999"
    5000 "5000 TO 99999999: 5000+"
    /
 T5022100
    0 "0"
    1 "1 TO 49999"
    50000 "50000 TO 99999"
    100000 "100000 TO 149999"
    150000 "150000 TO 199999"
    200000 "200000 TO 249999"
    250000 "250000 TO 299999"
    300000 "300000 TO 399999"
    400000 "400000 TO 499999"
    500000 "500000 TO 599999"
    600000 "600000 TO 699999"
    700000 "700000 TO 799999"
    800000 "800000 TO 899999"
    900000 "900000 TO 999999"
    1000000 "1000000 TO 1999999"
    2000000 "2000000 TO 2999999"
    3000000 "3000000 TO 3999999"
    4000000 "4000000 TO 4999999"
    5000000 "5000000 TO 5999999"
    6000000 "6000000 TO 6999999"
    7000000 "7000000 TO 7999999"
    8000000 "8000000 TO 8999999"
    9000000 "9000000 TO 9999999"
    10000000 "10000000 TO 9999999999: 10000000+"
    /
 T5022300
    60 "60: 60  PARENT REFUSAL/BREAKOFF"
    61 "61: 61  YOUTH REFUSAL/BREAKOFF"
    62 "62: 62  PARENT & YOUTH REFUSAL/BREAKOFF"
    63 "63: 63  UNABLE TO LOCATE FAMILY UNIT & YOUTH"
    64 "64: 64  UNABLE TO LOCATE YOUTH"
    65 "65: 65  DECEASED"
    66 "66: 66  OTHER"
    67 "67: 67  DO NOT REFIELD (VERY DIFFICULT CASE)"
    68 "68: 68  MILITARY SAMPLE DROPPED"
    69 "69: 69  SUPPLEMENTAL MALE POOR WHITE SAMPLE DROPPED"
    70 "70: 70  SUPPLEMENTAL FEMALE POOR WHITE SAMPLE DROPPED"
    71 "71: 71  YOUTH REFUSAL - VERY DIFFICULT CASE"
    72 "72: 72  NOT FIELDED IN CURRENT SURVEY YEAR - VERY DIFFICULT CASE"
    73 "73: 73  NOT INTERVIEWED - INCARCERATED"
    74 "74: 74  NOT INTERVIEWED - IN MILITARY"
    /
 T5022500
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T5022600
    0 "0"
    1 "1 TO 999"
    1000 "1000 TO 1999"
    2000 "2000 TO 2999"
    3000 "3000 TO 3999"
    4000 "4000 TO 4999"
    5000 "5000 TO 5999"
    6000 "6000 TO 6999"
    7000 "7000 TO 7999"
    8000 "8000 TO 8999"
    9000 "9000 TO 9999"
    10000 "10000 TO 14999"
    15000 "15000 TO 19999"
    20000 "20000 TO 24999"
    25000 "25000 TO 49999"
    50000 "50000 TO 99999999: 50000+"
    /
 T5022800
    0 "0: NOT IN POVERTY"
    1 "1: IN POVERTY"
    /
 T5023100
    1 "1: NORTHEAST"
    2 "2: NORTH CENTRAL"
    3 "3: SOUTH"
    4 "4: WEST"
    /
 T5023200
    1 "1: NEVER MARRIED"
    2 "2: MARRIED, SPOUSE PRESENT"
    3 "3: OTHER"
    /
 T5023300
    0 "0: 0  NEVER MARRIED"
    1 "1: 1  MARRIED"
    2 "2: 2  SEPARATED"
    3 "3: 3  DIVORCED"
    6 "6: 6  WIDOWED"
    /
 T5024700
    0 "0"
    1 "1 TO 499"
    500 "500 TO 999"
    1000 "1000 TO 1499"
    1500 "1500 TO 1999"
    2000 "2000 TO 2499"
    2500 "2500 TO 2999"
    3000 "3000 TO 3499"
    3500 "3500 TO 3999"
    4000 "4000 TO 4499"
    4500 "4500 TO 4999"
    5000 "5000 TO 99999999: 5000+"
    /
 T5024800
    0 "0"
    1 "1 TO 13"
    14 "14 TO 26"
    27 "27 TO 39"
    40 "40 TO 48"
    49 "49 TO 51"
    52 "52"
    53 "53 TO 99999999: > 52"
    /
 T5024900
    0 "0"
    1 "1 TO 13"
    14 "14 TO 26"
    27 "27 TO 39"
    40 "40 TO 48"
    49 "49 TO 51"
    52 "52"
    53 "53 TO 99999999: > 52"
    /
 T5025000
    0 "0"
    1 "1 TO 13"
    14 "14 TO 26"
    27 "27 TO 39"
    40 "40 TO 48"
    49 "49 TO 51"
    52 "52"
    53 "53 TO 99999999: > 52"
    /
 T5025100
    0 "0"
    1 "1 TO 9"
    10 "10 TO 19"
    20 "20 TO 29"
    30 "30 TO 39"
    40 "40 TO 49"
    50 "50 TO 59"
    60 "60 TO 69"
    70 "70 TO 79"
    80 "80 TO 89"
    90 "90 TO 99"
    100 "100 TO 99999999: 100+"
    /
 T5025900
    0 "0: RURAL"
    1 "1: URBAN"
    2 "2: UNKNOWN"
    /
 T5026000
    1 "1: NOT IN SMSA"
    2 "2: SMSA, NOT CENTRAL CITY"
    3 "3: SMSA, IN CENTRAL CITY"
    4 "4: SMSA, CENTRAL CITY NOT KNOWN"
    /
 T5026200
    0 "0"
    1 "1 TO 4"
    5 "5 TO 9"
    10 "10 TO 14"
    15 "15 TO 19"
    20 "20 TO 24"
    25 "25 TO 29"
    30 "30 TO 34"
    35 "35 TO 39"
    40 "40 TO 44"
    45 "45 TO 49"
    50 "50 TO 99999999: 50+"
    /
 T5031400
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T5031500
    0 "0"
    1 "1"
    2 "2"
    3 "3"
    4 "4"
    5 "5"
    6 "6"
    7 "7"
    8 "8"
    9 "9"
    10 "10 TO 999: 10+"
    /
 T5031600
    0 "0 TO 10: <= 10"
    11 "11"
    12 "12"
    13 "13"
    14 "14"
    15 "15"
    16 "16"
    17 "17"
    18 "18"
    19 "19"
    20 "20"
    21 "21"
    22 "22"
    23 "23"
    24 "24"
    25 "25"
    26 "26"
    27 "27"
    28 "28"
    29 "29"
    30 "30 TO 99: 30+"
    /
 T5054600
    0 "0: 0  CONDITION DOES NOT APPLY"
    1 "1: 1  CONDITION APPLIES"
    /
 T5058900
    0 "0: 0  CONDITION DOES NOT APPLY"
    1 "1: 1  CONDITION APPLIES"
    /
.
/* Crosswalk for Reference number & Question name
 * Uncomment and edit this RENAME VARIABLES statement to rename variables for ease of use.
 * This command does not guarantee uniqueness
 */  /* *start* */

* RENAME VARIABLES
  (A0002600 = VERSION_R26_2014) 
  (R0000100 = CASEID_1979) 
  (R0000300 = Q1_3_A_M_1979)   /* Q1-3_A~M */
  (R0000500 = Q1_3_A_Y_1979)   /* Q1-3_A~Y */
  (R0006500 = HGC_MOTHER_1979)   /* HGC-MOTHER */
  (R0007900 = HGC_FATHER_1979)   /* HGC-FATHER */
  (R0009100 = FAM_28A_1979)   /* FAM-28A */
  (R0173600 = SAMPLE_ID_1979) 
  (R0214700 = SAMPLE_RACE_78SCRN) 
  (R0214800 = SAMPLE_SEX_1979) 
  (R0410100 = Q1_3_A_M_1981)   /* Q1-3_A~M */
  (R0410300 = Q1_3_A_Y_1981)   /* Q1-3_A~Y */
  (R0618301 = AFQT_3_1981)   /* AFQT-3 */
  (T4181500 = HH1_1_2014)   /* HH1-1 */
  (T4188900 = R_REL_2_2014)   /* R_REL-2 */
  (T4189900 = R_REL_3_2014)   /* R_REL-3 */
  (T4193600 = Q2_CH_2_2014)   /* Q2-CH-2 */
  (T4201000 = Q3_3_2014)   /* Q3-3 */
  (T4201100 = Q3_4_2014)   /* Q3-4 */
  (T4246600 = QES_23_01_2014)   /* QES-23.01 */
  (T4246700 = QES_23_02_2014)   /* QES-23.02 */
  (T4253500 = HOURS_WORKED_WEEK_ALL_01_2014)   /* HOURS_WORKED_WEEK_ALL.01 */
  (T4253600 = HOURS_WORKED_WEEK_ALL_02_2014)   /* HOURS_WORKED_WEEK_ALL.02 */
  (T4254500 = QES_52D_01_2014)   /* QES-52D.01 */
  (T4254600 = QES_52D_02_2014)   /* QES-52D.02 */
  (T4255000 = QES_52B_01_2014)   /* QES-52B.01 */
  (T4255100 = QES_52B_02_2014)   /* QES-52B.02 */
  (T4259000 = QES_53B_01_2014)   /* QES-53B.01 */
  (T4259100 = QES_53B_02_2014)   /* QES-53B.02 */
  (T4282300 = INDALL_EMP_01_2014)   /* INDALL-EMP.01 */
  (T4282800 = OCCALL_EMP_01_2014)   /* OCCALL-EMP.01 */
  (T4282900 = OCCALL_EMP_02_2014)   /* OCCALL-EMP.02 */
  (T4283300 = COWALL_EMP_01_2014)   /* COWALL-EMP.01 */
  (T4429600 = Q8_2_01_2014)   /* Q8-2.01 */
  (T4434100 = Q8_18_2014)   /* Q8-18 */
  (T4467000 = OCCALL_SPOUSE_2014)   /* OCCALL-SPOUSE */
  (T4478200 = Q2_15A_2014)   /* Q2-15A */
  (T4478300 = Q2_15B_2014)   /* Q2-15B */
  (T4876800 = Q10_2_2014)   /* Q10-2 */
  (T4890700 = Q11_3_2014)   /* Q11-3 */
  (T4890800 = Q11_4_2014)   /* Q11-4 */
  (T4890900 = Q11_5_2014)   /* Q11-5 */
  (T4891000 = Q11_5A_2014)   /* Q11-5A */
  (T4891300 = Q11_7_2014)   /* Q11-7 */
  (T4892000 = Q11_CARE_1_2014)   /* Q11-CARE-1 */
  (T4892200 = Q11_CARE_2CNT_2014)   /* Q11-CARE-2CNT */
  (T4892300 = Q11_CARE_3_2014)   /* Q11-CARE-3 */
  (T4892400 = Q11_CARE_3B_2014)   /* Q11-CARE-3B */
  (T4892500 = Q11_CARE_4_2014)   /* Q11-CARE-4 */
  (T4892600 = Q11_CARE_4B_2014)   /* Q11-CARE-4B */
  (T4892700 = Q11_9_2014)   /* Q11-9 */
  (T4892800 = Q11_10_A_2014)   /* Q11-10_A */
  (T4892900 = Q11_10_B_2014)   /* Q11-10_B */
  (T4894200 = Q11_GENHLTH_PRV1_2014)   /* Q11-GENHLTH-PRV1 */
  (T4894300 = Q11_GENHLTH_PRV2_2014)   /* Q11-GENHLTH-PRV2 */
  (T4894400 = Q11_GENHLTH_4A_2014)   /* Q11-GENHLTH_4A */
  (T4897200 = Q11_79_2014)   /* Q11-79 */
  (T4897800 = Q11_80G_2014)   /* Q11-80G */
  (T4897900 = Q11_81C_1_2014)   /* Q11-81C_1 */
  (T4898000 = Q11_HLTHPLN_5CHK_2014)   /* Q11-HLTHPLN-5CHK */
  (T4915800 = Q13_5_TRUNC_2014)   /* Q13-5_TRUNC */
  (T5019200 = TENURE1_2014) 
  (T5019300 = TENURE2_2014) 
  (T5019700 = HRP1_2014) 
  (T5019900 = HRP2_2014) 
  (T5022100 = SAMPWEIGHT_2014) 
  (T5022300 = RNI_2014) 
  (T5022500 = FAMSIZE_2014) 
  (T5022600 = TNFI_TRUNC_2014) 
  (T5022800 = POVSTATUS_2014) 
  (T5023100 = REGION_2014) 
  (T5023200 = MARSTAT_COL_2014)   /* MARSTAT-COL */
  (T5023300 = MARSTAT_KEY_2014)   /* MARSTAT-KEY */
  (T5024700 = HRSWK_PCY_2014)   /* HRSWK-PCY */
  (T5024800 = WKSWK_PCY_2014)   /* WKSWK-PCY */
  (T5024900 = WKSUEMP_PCY_2014)   /* WKSUEMP-PCY */
  (T5025000 = WKSOLF_PCY_2014)   /* WKSOLF-PCY */
  (T5025100 = WKSUNACCT_PCY_2014)   /* WKSUNACCT-PCY */
  (T5025900 = URBAN_RURAL_2014)   /* URBAN-RURAL */
  (T5026000 = SMSARES_2014) 
  (T5026200 = JOBSNUM_2014) 
  (T5031400 = NUMKID14_2014) 
  (T5031500 = NUMCH14_2014) 
  (T5031600 = AGEYCH14_2014) 
  (T5054600 = EMPLOYER_CURFLAG_01_2014)   /* EMPLOYER_CURFLAG.01 */
  (T5058900 = EMPLOYER_CPSFLAG_01_2014)   /* EMPLOYER_CPSFLAG.01 */
.
  /* *end* */

descriptives all.

*--- Tabulations using reference number variables.
*freq var=A0002600, 
  R0000100, 
  R0000300, 
  R0000500, 
  R0006500, 
  R0007900, 
  R0009100, 
  R0173600, 
  R0214700, 
  R0214800, 
  R0410100, 
  R0410300, 
  R0618301, 
  T4181500, 
  T4188900, 
  T4189900, 
  T4193600, 
  T4201000, 
  T4201100, 
  T4246600, 
  T4246700, 
  T4253500, 
  T4253600, 
  T4254500, 
  T4254600, 
  T4255000, 
  T4255100, 
  T4259000, 
  T4259100, 
  T4282300, 
  T4282800, 
  T4282900, 
  T4283300, 
  T4429600, 
  T4434100, 
  T4467000, 
  T4478200, 
  T4478300, 
  T4876800, 
  T4890700, 
  T4890800, 
  T4890900, 
  T4891000, 
  T4891300, 
  T4892000, 
  T4892200, 
  T4892300, 
  T4892400, 
  T4892500, 
  T4892600, 
  T4892700, 
  T4892800, 
  T4892900, 
  T4894200, 
  T4894300, 
  T4894400, 
  T4897200, 
  T4897800, 
  T4897900, 
  T4898000, 
  T4915800, 
  T5019200, 
  T5019300, 
  T5019700, 
  T5019900, 
  T5022100, 
  T5022300, 
  T5022500, 
  T5022600, 
  T5022800, 
  T5023100, 
  T5023200, 
  T5023300, 
  T5024700, 
  T5024800, 
  T5024900, 
  T5025000, 
  T5025100, 
  T5025900, 
  T5026000, 
  T5026200, 
  T5031400, 
  T5031500, 
  T5031600, 
  T5054600, 
  T5058900.

*--- Tabulations using qname variables.
*freq var=VERSION_R26_2014, 
  CASEID_1979, 
  Q1_3_A_M_1979, 
  Q1_3_A_Y_1979, 
  HGC_MOTHER_1979, 
  HGC_FATHER_1979, 
  FAM_28A_1979, 
  SAMPLE_ID_1979, 
  SAMPLE_RACE_78SCRN, 
  SAMPLE_SEX_1979, 
  Q1_3_A_M_1981, 
  Q1_3_A_Y_1981, 
  AFQT_3_1981, 
  HH1_1_2014, 
  R_REL_2_2014, 
  R_REL_3_2014, 
  Q2_CH_2_2014, 
  Q3_3_2014, 
  Q3_4_2014, 
  QES_23_01_2014, 
  QES_23_02_2014, 
  HOURS_WORKED_WEEK_ALL_01_2014, 
  HOURS_WORKED_WEEK_ALL_02_2014, 
  QES_52D_01_2014, 
  QES_52D_02_2014, 
  QES_52B_01_2014, 
  QES_52B_02_2014, 
  QES_53B_01_2014, 
  QES_53B_02_2014, 
  INDALL_EMP_01_2014, 
  OCCALL_EMP_01_2014, 
  OCCALL_EMP_02_2014, 
  COWALL_EMP_01_2014, 
  Q8_2_01_2014, 
  Q8_18_2014, 
  OCCALL_SPOUSE_2014, 
  Q2_15A_2014, 
  Q2_15B_2014, 
  Q10_2_2014, 
  Q11_3_2014, 
  Q11_4_2014, 
  Q11_5_2014, 
  Q11_5A_2014, 
  Q11_7_2014, 
  Q11_CARE_1_2014, 
  Q11_CARE_2CNT_2014, 
  Q11_CARE_3_2014, 
  Q11_CARE_3B_2014, 
  Q11_CARE_4_2014, 
  Q11_CARE_4B_2014, 
  Q11_9_2014, 
  Q11_10_A_2014, 
  Q11_10_B_2014, 
  Q11_GENHLTH_PRV1_2014, 
  Q11_GENHLTH_PRV2_2014, 
  Q11_GENHLTH_4A_2014, 
  Q11_79_2014, 
  Q11_80G_2014, 
  Q11_81C_1_2014, 
  Q11_HLTHPLN_5CHK_2014, 
  Q13_5_TRUNC_2014, 
  TENURE1_2014, 
  TENURE2_2014, 
  HRP1_2014, 
  HRP2_2014, 
  SAMPWEIGHT_2014, 
  RNI_2014, 
  FAMSIZE_2014, 
  TNFI_TRUNC_2014, 
  POVSTATUS_2014, 
  REGION_2014, 
  MARSTAT_COL_2014, 
  MARSTAT_KEY_2014, 
  HRSWK_PCY_2014, 
  WKSWK_PCY_2014, 
  WKSUEMP_PCY_2014, 
  WKSOLF_PCY_2014, 
  WKSUNACCT_PCY_2014, 
  URBAN_RURAL_2014, 
  SMSARES_2014, 
  JOBSNUM_2014, 
  NUMKID14_2014, 
  NUMCH14_2014, 
  AGEYCH14_2014, 
  EMPLOYER_CURFLAG_01_2014, 
  EMPLOYER_CPSFLAG_01_2014.
