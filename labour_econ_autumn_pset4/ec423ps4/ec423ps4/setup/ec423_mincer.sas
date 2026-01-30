options nocenter validvarname=any;

*---Read in space-delimited ascii file;

data new_data;


infile 'ec423_mincer.dat' lrecl=314 missover DSD DLM=' ' print;
input
  A0002600
  R0000100
  R0000300
  R0000500
  R0006500
  R0007900
  R0009100
  R0173600
  R0214700
  R0214800
  R0410100
  R0410300
  R0618301
  T4181500
  T4188900
  T4189900
  T4193600
  T4201000
  T4201100
  T4246600
  T4246700
  T4253500
  T4253600
  T4254500
  T4254600
  T4255000
  T4255100
  T4259000
  T4259100
  T4282300
  T4282800
  T4282900
  T4283300
  T4429600
  T4434100
  T4467000
  T4478200
  T4478300
  T4876800
  T4890700
  T4890800
  T4890900
  T4891000
  T4891300
  T4892000
  T4892200
  T4892300
  T4892400
  T4892500
  T4892600
  T4892700
  T4892800
  T4892900
  T4894200
  T4894300
  T4894400
  T4897200
  T4897800
  T4897900
  T4898000
  T4915800
  T5019200
  T5019300
  T5019700
  T5019900
  T5022100
  T5022300
  T5022500
  T5022600
  T5022800
  T5023100
  T5023200
  T5023300
  T5024700
  T5024800
  T5024900
  T5025000
  T5025100
  T5025900
  T5026000
  T5026200
  T5031400
  T5031500
  T5031600
  T5054600
  T5058900
;
array nvarlist _numeric_;


*---Recode missing values to SAS custom system missing. See SAS
      documentation for use of MISSING option in procedures, e.g. PROC FREQ;

do over nvarlist;
  if nvarlist = -1 then nvarlist = .R;  /* Refused */
  if nvarlist = -2 then nvarlist = .D;  /* Dont know */
  if nvarlist = -3 then nvarlist = .I;  /* Invalid missing */
  if nvarlist = -4 then nvarlist = .V;  /* Valid missing */
  if nvarlist = -5 then nvarlist = .N;  /* Non-interview */
end;

  label A0002600 = "VERSION_R26_1 2014";
  label R0000100 = "ID# (1-12686) 79";
  label R0000300 = "DATE OF BIRTH - MONTH 79";
  label R0000500 = "DATE OF BIRTH - YR 79";
  label R0006500 = "HGC BY RS MOTHER 79";
  label R0007900 = "HGC BY RS FATHER 79";
  label R0009100 = "# OF SIBS 79";
  label R0173600 = "SAMPLE ID  79 INT";
  label R0214700 = "RACL/ETHNIC COHORT /SCRNR 79";
  label R0214800 = "SEX OF R 79";
  label R0410100 = "DATE OF BIRTH - MONTH 81";
  label R0410300 = "DATE OF BIRTH - YR 81";
  label R0618301 = "PROFILES AFQT PRCTILE 2006 (REV) 81";
  label T4181500 = "TYPE OF RESIDENCE R IS LIVING IN 2014";
  label T4188900 = "PRESENT RELIGIOUS AFFILIATION 2014";
  label T4189900 = "FREQ OF RS RELIGIOUS ATTENDANCE 2014";
  label T4193600 = "LIVE W-A PARTNER AT LEAST 3 MOS 2014";
  label T4201000 = "HGHST GRADE OF REG SCH. R ATTENDED 2014";
  label T4201100 = "HGHST GRADE/YR COMPLTD & GOT CREDIT 2014";
  label T4246600 = "R CURR WORKING FOR EMP? L1 2014";
  label T4246700 = "R CURR WORKING FOR EMP? L2 2014";
  label T4253500 = "HRS WRKD WK - INCL HOME HRS L1 2014";
  label T4253600 = "HRS WRKD WK - INCL HOME HRS L2 2014";
  label T4254500 = "TTL HRS WRKD AT HOME OR BSNS L1 2014";
  label T4254600 = "TTL HRS WRKD AT HOME OR BSNS L2 2014";
  label T4255000 = "HRS PER WEEK WORKED AT HOME L1 2014";
  label T4255100 = "HRS PER WEEK WORKED AT HOME L2 2014";
  label T4259000 = "R WORK 10 HRS OR MORE A WEEK? L1 2014";
  label T4259100 = "R WORK 10 HRS OR MORE A WEEK? L2 2014";
  label T4282300 = "INDUSTRY (2000 CODES) ALL JOB L1 2014";
  label T4282800 = "OCCUPATION (2000 CODES) ALL JOB L1 2014";
  label T4282900 = "OCCUPATION (2000 CODES) ALL JOB L2 2014";
  label T4283300 = "RS EMPLOYMENT CATEGORY ALL JOB L1 2014";
  label T4429600 = "NUM TRNG PGMS ON INFO SHEET? L1 2014";
  label T4434100 = "ATTEND TRN OR OJT TRN SIN DLI 2014";
  label T4467000 = "RS SPOUSES OCCUPATION IN PCY? 2014";
  label T4478200 = "NUM OF WKS WRKD SP-PAR PCY 2014";
  label T4478300 = "HRS WK WRKD DURING WKS SP-PAR 2014";
  label T4876800 = "# BIO CHILDREN REPORTED 2014";
  label T4890700 = "WOULD HEALTH KEEP R FR WRKNG 2014";
  label T4890800 = "HEALTH LIMITS KIND OF WRK COULD DO 2014";
  label T4890900 = "HEALTH LIMITS AMT OF WRK R COULD DO 2014";
  label T4891000 = "R HAVE HEALTH LIMITATIONS? 2014";
  label T4891300 = "WHEN DID HEALTH LIMIT BEGIN 2014";
  label T4892000 = "ANYONE IN R HH DISABLED/CHRONICALLY ILL 2014";
  label T4892200 = "# IN R HH DISABLED OR CHRONICALLY ILL 2014";
  label T4892300 = "R REGULARLY CARE FOR DISABLED HH MEMBER 2014";
  label T4892400 = "# HRS CARING FOR DISABLED HH MEMBER 2014";
  label T4892500 = "R CARE FOR DISABLED REL/FRIEND OUT OF HH 2014";
  label T4892600 = "# HRS CARING DISABLED PERSON OUT OF HH 2014";
  label T4892700 = "HOW MUCH DOES R WEIGH 2014";
  label T4892800 = "R HEIGHT IN FEET 2014";
  label T4892900 = "R HEIGHT IN INCHES 2014";
  label T4894200 = "HEALTH CARE PROVIDER TO SEE/SEEK ADVICE 2014";
  label T4894300 = "PLACE R MOST OFTEN GOES FOR HEALTH CARE 2014";
  label T4894400 = "TIME SINCE LAST PHYSICAL EXAM 2014";
  label T4897200 = "R HAVE HEALTH/HOSP PLAN 2014";
  label T4897800 = "R COVERED BY MEDICAID 2014";
  label T4897900 = "HOW LONG SINCE R LAST HAD HEALTH CARE COVERAGE 2014";
  label T4898000 = "R INS THROUGH CUR/PREV EMPLOYER 2014";
  label T4915800 = "AMT OF RS WAGES/SALARY/TIPS (PCY) 2014";
  label T5019200 = "TOTAL TENURE JOB # 1 2014";
  label T5019300 = "TOTAL TENURE JOB # 2 2014";
  label T5019700 = "HRLY RATE OF PAY JOB# 1 2014";
  label T5019900 = "HRLY RATE OF PAY JOB# 2 2014";
  label T5022100 = "SAMPLING WEIGHT 2014";
  label T5022300 = "REASONS FOR NON-INT 2014";
  label T5022500 = "FAMILY SIZE 2014";
  label T5022600 = "TOTAL NET FAMILY INCOME 2014";
  label T5022800 = "POVERTY STATUS 2014";
  label T5023100 = "REGION OF RESIDENCE 2014";
  label T5023200 = "MARITAL STATUS (COLLAPSED) 2014";
  label T5023300 = "MARITAL STATUS 2014";
  label T5024700 = "HRS WRKD IN PAST CAL YR 2014";
  label T5024800 = "WKS WRKD IN PAST CAL YR 2014";
  label T5024900 = "WKS UNEMP IN PAST CAL YR 2014";
  label T5025000 = "WKS OLF IN PAST CAL YR 2014";
  label T5025100 = "WKS UNACCTD IN PAST CAL YR 2014";
  label T5025900 = "RS RESIDENCE URBAN OR RURAL 2014";
  label T5026000 = "RS RESIDENCE IN SMSA 2014";
  label T5026200 = "NUM JOBS EVER REPORTED 2014";
  label T5031400 = "NUMBER OF CHILDREN EVER BORN 2014";
  label T5031500 = "NUM BIO/STEP/ADPT CHILDREN IN HH 2014";
  label T5031600 = "AGE YNGST BIO/STEP/ADPT CHILD IN HH 2014";
  label T5054600 = "R CURRENTLY WORKING FOR EMPLOYER L1 2014";
  label T5058900 = "CPS FLAG L1 2014";

/*---------------------------------------------------------------------*
 *  Crosswalk for Reference number & Question name                     *
 *---------------------------------------------------------------------*
 * Uncomment and edit this RENAME statement to rename variables
 * for ease of use.  You may need to use  name literal strings
 * e.g.  'variable-name'n   to create valid SAS variable names, or 
 * alter variables similarly named across years.
 * This command does not guarantee uniqueness

 * See SAS documentation for use of name literals and use of the
 * VALIDVARNAME=ANY option.     
 *---------------------------------------------------------------------*/
  /* *start* */

* RENAME
  A0002600 = 'VERSION_R26_2014'n
  R0000100 = 'CASEID_1979'n
  R0000300 = 'Q1-3_A~M_1979'n
  R0000500 = 'Q1-3_A~Y_1979'n
  R0006500 = 'HGC-MOTHER_1979'n
  R0007900 = 'HGC-FATHER_1979'n
  R0009100 = 'FAM-28A_1979'n
  R0173600 = 'SAMPLE_ID_1979'n
  R0214700 = 'SAMPLE_RACE_78SCRN'n
  R0214800 = 'SAMPLE_SEX_1979'n
  R0410100 = 'Q1-3_A~M_1981'n
  R0410300 = 'Q1-3_A~Y_1981'n
  R0618301 = 'AFQT-3_1981'n
  T4181500 = 'HH1-1_2014'n
  T4188900 = 'R_REL-2_2014'n
  T4189900 = 'R_REL-3_2014'n
  T4193600 = 'Q2-CH-2_2014'n
  T4201000 = 'Q3-3_2014'n
  T4201100 = 'Q3-4_2014'n
  T4246600 = 'QES-23.01_2014'n
  T4246700 = 'QES-23.02_2014'n
  T4253500 = 'HOURS_WORKED_WEEK_ALL.01_2014'n
  T4253600 = 'HOURS_WORKED_WEEK_ALL.02_2014'n
  T4254500 = 'QES-52D.01_2014'n
  T4254600 = 'QES-52D.02_2014'n
  T4255000 = 'QES-52B.01_2014'n
  T4255100 = 'QES-52B.02_2014'n
  T4259000 = 'QES-53B.01_2014'n
  T4259100 = 'QES-53B.02_2014'n
  T4282300 = 'INDALL-EMP.01_2014'n
  T4282800 = 'OCCALL-EMP.01_2014'n
  T4282900 = 'OCCALL-EMP.02_2014'n
  T4283300 = 'COWALL-EMP.01_2014'n
  T4429600 = 'Q8-2.01_2014'n
  T4434100 = 'Q8-18_2014'n
  T4467000 = 'OCCALL-SPOUSE_2014'n
  T4478200 = 'Q2-15A_2014'n
  T4478300 = 'Q2-15B_2014'n
  T4876800 = 'Q10-2_2014'n
  T4890700 = 'Q11-3_2014'n
  T4890800 = 'Q11-4_2014'n
  T4890900 = 'Q11-5_2014'n
  T4891000 = 'Q11-5A_2014'n
  T4891300 = 'Q11-7_2014'n
  T4892000 = 'Q11-CARE-1_2014'n
  T4892200 = 'Q11-CARE-2CNT_2014'n
  T4892300 = 'Q11-CARE-3_2014'n
  T4892400 = 'Q11-CARE-3B_2014'n
  T4892500 = 'Q11-CARE-4_2014'n
  T4892600 = 'Q11-CARE-4B_2014'n
  T4892700 = 'Q11-9_2014'n
  T4892800 = 'Q11-10_A_2014'n
  T4892900 = 'Q11-10_B_2014'n
  T4894200 = 'Q11-GENHLTH-PRV1_2014'n
  T4894300 = 'Q11-GENHLTH-PRV2_2014'n
  T4894400 = 'Q11-GENHLTH_4A_2014'n
  T4897200 = 'Q11-79_2014'n
  T4897800 = 'Q11-80G_2014'n
  T4897900 = 'Q11-81C_1_2014'n
  T4898000 = 'Q11-HLTHPLN-5CHK_2014'n
  T4915800 = 'Q13-5_TRUNC_2014'n
  T5019200 = 'TENURE1_2014'n
  T5019300 = 'TENURE2_2014'n
  T5019700 = 'HRP1_2014'n
  T5019900 = 'HRP2_2014'n
  T5022100 = 'SAMPWEIGHT_2014'n
  T5022300 = 'RNI_2014'n
  T5022500 = 'FAMSIZE_2014'n
  T5022600 = 'TNFI_TRUNC_2014'n
  T5022800 = 'POVSTATUS_2014'n
  T5023100 = 'REGION_2014'n
  T5023200 = 'MARSTAT-COL_2014'n
  T5023300 = 'MARSTAT-KEY_2014'n
  T5024700 = 'HRSWK-PCY_2014'n
  T5024800 = 'WKSWK-PCY_2014'n
  T5024900 = 'WKSUEMP-PCY_2014'n
  T5025000 = 'WKSOLF-PCY_2014'n
  T5025100 = 'WKSUNACCT-PCY_2014'n
  T5025900 = 'URBAN-RURAL_2014'n
  T5026000 = 'SMSARES_2014'n
  T5026200 = 'JOBSNUM_2014'n
  T5031400 = 'NUMKID14_2014'n
  T5031500 = 'NUMCH14_2014'n
  T5031600 = 'AGEYCH14_2014'n
  T5054600 = 'EMPLOYER_CURFLAG.01_2014'n
  T5058900 = 'EMPLOYER_CPSFLAG.01_2014'n
;
  /* *finish* */

run;

proc means data=new_data n mean min max;
run;


/*---------------------------------------------------------------------*
 *  FORMATTED TABULATIONS                                              *
 *---------------------------------------------------------------------*
 * You can uncomment and edit the PROC FORMAT and PROC FREQ statements 
 * provided below to obtain formatted tabulations. The tabulations 
 * should reflect codebook values.
 * 
 * Please edit the formats below reflect any renaming of the variables
 * you may have done in the first data step. 
 *---------------------------------------------------------------------*/

/*
proc format; 
value vx0f
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-10999='10000 TO 10999'
  11000-11999='11000 TO 11999'
  12000-12999='12000 TO 12999'
;
value vx2f
  0='0: < 1'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15='15'
  16='16'
  17-99999='17 TO 99999: 17+'
;
value vx3f
  0-56='0 TO 56: < 57'
  57='57'
  58='58'
  59='59'
  60='60'
  61='61'
  62='62'
  63='63'
  64='64'
  65='65'
  66='66'
  67='67'
  68='68'
  69='69'
  70='70'
  71='71'
  72='72'
  73-99999='73 TO 99999: 73+'
;
value vx4f
  0='NONE'
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YR COL'
  14='2ND YR COL'
  15='3RD YR COL'
  16='4TH YR COL'
  17='5TH YR COL'
  18='6TH YR COL'
  19='7TH YR COL'
  20='8TH YR COL OR MORE'
  95='UNGRADED'
;
value vx5f
  0='NONE'
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YR COL'
  14='2ND YR COL'
  15='3RD YR COL'
  16='4TH YR COL'
  17='5TH YR COL'
  18='6TH YR COL'
  19='7TH YR COL'
  20='8TH YR COL OR MORE'
  95='UNGRADED'
;
value vx6f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15='15'
  16-99999='16 TO 99999: 16+'
;
value vx7f
  1='CROSS MALE WHITE'
  2='CROSS MALE WH. POOR'
  3='CROSS MALE BLACK'
  4='CROSS MALE HISPANIC'
  5='CROSS FEMALE WHITE'
  6='CROSS FEMALE WH POOR'
  7='CROSS FEMALE BLACK'
  8='CROSS FEMALE HISPANIC'
  9='SUP MALE WH POOR'
  10='SUP MALE BLACK'
  11='SUP MALE HISPANIC'
  12='SUP FEM WH POOR'
  13='SUP FEMALE BLACK'
  14='SUP FEMALE HISPANIC'
  15='MIL MALE WHITE'
  16='MIL MALE BLACK'
  17='MIL MALE HISPANIC'
  18='MIL FEMALE WHITE'
  19='MIL FEMALE BLACK'
  20='MIL FEMALE HISPANIC'
;
value vx8f
  1='HISPANIC'
  2='BLACK'
  3='NON-BLACK, NON-HISPANIC'
;
value vx9f
  1='MALE'
  2='FEMALE'
;
value vx10f
  0='0: < 1'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15='15'
  16='16'
  17-99999='17 TO 99999: 17+'
;
value vx11f
  0-54='0 TO 54: < 55'
  55='55'
  56='56'
  57='57'
  58='58'
  59='59'
  60='60'
  61='61'
  62='62'
  63='63'
  64='64'
  65='65'
  66='66'
  67='67'
  68='68'
  69='69'
  70='70'
  71-99999='71 TO 99999: 71+'
;
value vx13f
  11='OWN DWELLING UNIT'
  19='RESPONDENT IN PARENT HOUSEHOLD'
  15='CONVENT, MONASTERY, OTHER RELIGIOUS INSTITUTE'
  13='OFF-BASE MILITARY FAMILY HOUSING'
  12='ON-BASE MILITARY FAMILY HOUSING'
  16='OTHER INDIVIDUAL QUARTERS (SPECIFY)'
  1='OPEN BAY OR TROOP BARRACKS, ABOARD SHIP'
  2='BACHELOR ENLISTED OR OFFICER QUARTERS'
  3='DORMITORY, FRATERNITY OR SORORITY'
  5='JAIL'
  4='HOSPITAL'
  6='OTHER TEMPORARY INDIVIDUAL QUARTERS (SPECIFY)'
  17='LIVES WITH OTHER RELATIVES'
  18='LIVES AT FRIEND''S RESIDENCE'
  21='HOMELESS'
  25='MOTEL/HOTEL'
  26='GROUP HOME OR BOARDING HOUSE'
  32='NURSING HOME OR RETIREMENT FACILITY'
;
value vx14f
  1='PROTESTANT'
  11='CHRISTIAN, NO DENOMINATION GIVEN'
  12='NON-DENOMINATIONAL OR NO DENOMINATION KNOWN'
  2='BAPTIST'
  3='EPISCOPALIAN'
  4='LUTHERAN'
  5='METHODIST'
  6='PRESBYTERIAN'
  7='ROMAN CATHOLIC'
  8='JEWISH'
  9='OTHER (SPECIFY)'
  10='NONE, NO RELIGION'
;
value vx15f
  1='More than once a week'
  2='About once a week'
  3='Two or three times a month'
  4='About once a month'
  5='Several times a year or less'
  6='Not at all'
;
value vx16f
  1='Yes'
  0='No'
;
value vx17f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx18f
  1='1ST GRADE'
  2='2ND GRADE'
  3='3RD GRADE'
  4='4TH GRADE'
  5='5TH GRADE'
  6='6TH GRADE'
  7='7TH GRADE'
  8='8TH GRADE'
  9='9TH GRADE'
  10='10TH GRADE'
  11='11TH GRADE'
  12='12TH GRADE'
  13='1ST YEAR COLLEGE'
  14='2ND YEAR COLLEGE'
  15='3RD YEAR COLLEGE'
  16='4TH YEAR COLLEGE'
  17='5TH YEAR COLLEGE'
  18='6TH YEAR COLLEGE'
  19='7TH YEAR COLLEGE'
  20='8TH YEAR COLLEGE OR MORE'
  95='UNGRADED'
;
value vx19f
  0='0: 0  CONDITION DOES NOT APPLY'
  1='1: 1  CONDITION APPLIES'
;
value vx20f
  0='0: 0  CONDITION DOES NOT APPLY'
  1='1: 1  CONDITION APPLIES'
;
value vx21f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx22f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx23f
  0='0'
  1-4='1 TO 4'
  5-9='5 TO 9'
  10-14='10 TO 14'
  15-19='15 TO 19'
  20-24='20 TO 24'
  25-29='25 TO 29'
  30-34='30 TO 34'
  35-39='35 TO 39'
  40-44='40 TO 44'
  45-49='45 TO 49'
  50-99999999='50 TO 99999999: 50+'
;
value vx24f
  0='0'
  1-4='1 TO 4'
  5-9='5 TO 9'
  10-14='10 TO 14'
  15-19='15 TO 19'
  20-24='20 TO 24'
  25-29='25 TO 29'
  30-34='30 TO 34'
  35-39='35 TO 39'
  40-44='40 TO 44'
  45-49='45 TO 49'
  50-99999999='50 TO 99999999: 50+'
;
value vx25f
  0='0'
  1-4='1 TO 4'
  5-9='5 TO 9'
  10-14='10 TO 14'
  15-19='15 TO 19'
  20-24='20 TO 24'
  25-29='25 TO 29'
  30-34='30 TO 34'
  35-39='35 TO 39'
  40-44='40 TO 44'
  45-49='45 TO 49'
  50-99999999='50 TO 99999999: 50+'
;
value vx26f
  0='0'
  1-4='1 TO 4'
  5-9='5 TO 9'
  10-14='10 TO 14'
  15-19='15 TO 19'
  20-24='20 TO 24'
  25-29='25 TO 29'
  30-34='30 TO 34'
  35-39='35 TO 39'
  40-44='40 TO 44'
  45-49='45 TO 49'
  50-99999999='50 TO 99999999: 50+'
;
value vx27f
  0='0: 0  CONDITION DOES NOT APPLY'
  1='1: 1  CONDITION APPLIES'
;
value vx28f
  0='0: 0  CONDITION DOES NOT APPLY'
  1='1: 1  CONDITION APPLIES'
;
value vx29f
  170-290='170 TO 290: Agriculture, Forestry, Fishing, and Hunting'
  370-490='370 TO 490: Mining'
  570-690='570 TO 690: Utilities'
  770='770: Construction'
  1070-3990='1070 TO 3990: Manufacturing'
  4070-4590='4070 TO 4590: Wholesale Trade'
  4670-5790='4670 TO 5790: Retail Trade'
  6070-6390='6070 TO 6390: Transportation and Warehousing'
  6470-6780='6470 TO 6780: Information'
  6870-6990='6870 TO 6990: Finance and Insurance'
  7070-7190='7070 TO 7190: Real Estate and Rental and Leasing'
  7270-7490='7270 TO 7490: Professional, Scientific, and Technical Services'
  7570-7790='7570 TO 7790: Management, Administrative and Support, and Waste Management Services'
  7860-7890='7860 TO 7890: Educational Services'
  7970-8470='7970 TO 8470: Health Care and Social Assistance'
  8560-8590='8560 TO 8590: Arts, Entertainment, and Recreation'
  8660-8690='8660 TO 8690: Accomodations and Food Services'
  8770-9290='8770 TO 9290: Other Services (Except Public Administration)'
  9370-9870='9370 TO 9870: Public Administration and Active Duty Military'
  9890='9890: Armed Forces (for CPS)'
  9950='9950: Not in Labor Force (ACS code)'
  9990='9990: Uncodeable'
;
value vx30f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx31f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx32f
  1='1: 1  Government'
  2='2: 2  Private for profit company'
  3='3: 3  Non-profit organization (including tax exempt and charitable)'
  4='4: 4  Self employed'
  5='5: 5  Working in family business'
;
value vx33f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
;
value vx34f
  1='Yes'
  0='No'
;
value vx35f
  10-430='10 TO 430: Executive, Administrative and Managerial Occupations'
  500-950='500 TO 950: Management Related Occupations'
  1000-1240='1000 TO 1240: Mathematical and Computer Scientists'
  1300-1560='1300 TO 1560: Engineers, Architects, Surveyers, Engineering and Related Technicians'
  1600-1760='1600 TO 1760: Physical Scientists'
  1800-1860='1800 TO 1860: Social Scientists and Related Workers'
  1900-1960='1900 TO 1960: Life, Physical and Social Science Technicians'
  2000-2060='2000 TO 2060: Counselors, Sociala and Religious Workers'
  2100-2150='2100 TO 2150: Lawyers, Judges and Legal Support Workers'
  2200-2340='2200 TO 2340: Teachers'
  2400-2550='2400 TO 2550: Education, Training and Library Workers'
  2600-2760='2600 TO 2760: Entertainers and Performers, Sports and Related Workers'
  2800-2960='2800 TO 2960: Media and Communications Workers'
  3000-3260='3000 TO 3260: Health Diagnosing and Treating Practitioners'
  3300-3650='3300 TO 3650: Health Care Technical and Support Occupations'
  3700-3950='3700 TO 3950: Protective Service Occupations'
  4000-4160='4000 TO 4160: Food Preparation and Serving Related Occupations'
  4200-4250='4200 TO 4250: Cleaning and Building Service Occupations'
  4300-4430='4300 TO 4430: Entertainment Attendants and Related Workers'
  4460='4460: Funeral Related Occupations'
  4500-4650='4500 TO 4650: Personal Care and Service Workers'
  4700-4960='4700 TO 4960: Sales and Related Workers'
  5000-5930='5000 TO 5930: Office and Administrative Support Workers'
  6000-6130='6000 TO 6130: Farming, Fishing and Forestry Occupations'
  6200-6940='6200 TO 6940: Construction Trade and Extraction Workers'
  7000-7620='7000 TO 7620: Installation, Maintenance and Repairs Workers'
  7700-7750='7700 TO 7750: Production and Operating Workers'
  7800-7850='7800 TO 7850: Food Preparation Occupations'
  7900-8960='7900 TO 8960: Setters, Operators and Tenders'
  9000-9750='9000 TO 9750: Transportation and Material Moving Workers'
  9800-9830='9800 TO 9830: Military Specific Occupations'
  9840='9840: Armed Forces'
  9950='9950: Not in Labor Force (ACS Code)'
  9990='9990: Uncodeable'
;
value vx36f
  0='0'
  1-13='1 TO 13'
  14-26='14 TO 26'
  27-39='27 TO 39'
  40-48='40 TO 48'
  49-51='49 TO 51'
  52='52'
  53-99999999='53 TO 99999999: > 52'
;
value vx37f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx38f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx39f
  1='Yes'
  0='No'
;
value vx40f
  1='Yes'
  0='No'
;
value vx41f
  1='Yes'
  0='No'
;
value vx42f
  0='0: 0  CONDITION DOES NOT APPLY'
  1='1: 1  CONDITION APPLIES'
;
value vx43f
  1='SELECT TO ENTER DATE'
  0='IF VOLUNTEERED: ''ALL MY LIFE'''
;
value vx44f
  1='Yes'
  0='No'
;
value vx45f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx46f
  1='Yes'
  0='No'
;
value vx47f
  0='0'
  1-99='1 TO 99'
  100-199='100 TO 199'
  200-299='200 TO 299'
  300-399='300 TO 399'
  400-499='400 TO 499'
  500-599='500 TO 599'
  600-699='600 TO 699'
  700-799='700 TO 799'
  800-899='800 TO 899'
  900-999='900 TO 999'
  1000-99999999='1000 TO 99999999: 1000+'
;
value vx48f
  1='Yes'
  0='No'
;
value vx49f
  0='0'
  1-99='1 TO 99'
  100-199='100 TO 199'
  200-299='200 TO 299'
  300-399='300 TO 399'
  400-499='400 TO 499'
  500-599='500 TO 599'
  600-699='600 TO 699'
  700-799='700 TO 799'
  800-899='800 TO 899'
  900-999='900 TO 999'
  1000-99999999='1000 TO 99999999: 1000+'
;
value vx50f
  0='0'
  1-24='1 TO 24'
  25-49='25 TO 49'
  50-74='50 TO 74'
  75-99='75 TO 99'
  100-124='100 TO 124'
  125-149='125 TO 149'
  150-174='150 TO 174'
  175-199='175 TO 199'
  200-224='200 TO 224'
  225-249='225 TO 249'
  250-99999999='250 TO 99999999: 250+'
;
value vx51f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx52f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10='10'
  11='11'
  12='12'
  13='13'
  14='14'
  15-99='15 TO 99: 15+'
;
value vx53f
  1='Yes'
  0='No'
;
value vx54f
  1='Clinic or health center'
  2='Doctor’s office or HMO'
  3='Hospital emergency room'
  4='Some other place'
  5='Don’t go to one place most often'
;
value vx55f
  0='Never'
  1='A year ago or less'
  2='More than 1 year but not more than 2 years'
  3='More than 2 years but not more than 3 years'
  4='More than 3 years but not more than 5 years'
  5='Over 5 years ago'
;
value vx56f
  1='Yes'
  0='No'
;
value vx57f
  1='Yes'
  0='No'
;
value vx58f
  0='6 months or less'
  1='More than 6 months, but less than 1 year'
  2='More than 1 year, but not more than 3 years'
  3='More than 3 years'
  4='Never'
;
value vx59f
  0='0: 0  CONDITION DOES NOT APPLY'
  1='1: 1  CONDITION APPLIES'
;
value vx60f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx61f
  0='0'
  1-49='1 TO 49'
  50-99='50 TO 99'
  100-149='100 TO 149'
  150-199='150 TO 199'
  200-249='200 TO 249'
  250-299='250 TO 299'
  300-349='300 TO 349'
  350-399='350 TO 399'
  400-449='400 TO 449'
  450-499='450 TO 499'
  500-99999999='500 TO 99999999: 500+'
;
value vx62f
  0='0'
  1-49='1 TO 49'
  50-99='50 TO 99'
  100-149='100 TO 149'
  150-199='150 TO 199'
  200-249='200 TO 249'
  250-299='250 TO 299'
  300-349='300 TO 349'
  350-399='350 TO 399'
  400-449='400 TO 449'
  450-499='450 TO 499'
  500-99999999='500 TO 99999999: 500+'
;
value vx63f
  0='0'
  1-499='1 TO 499'
  500-999='500 TO 999'
  1000-1499='1000 TO 1499'
  1500-1999='1500 TO 1999'
  2000-2499='2000 TO 2499'
  2500-2999='2500 TO 2999'
  3000-3499='3000 TO 3499'
  3500-3999='3500 TO 3999'
  4000-4499='4000 TO 4499'
  4500-4999='4500 TO 4999'
  5000-99999999='5000 TO 99999999: 5000+'
;
value vx64f
  0='0'
  1-499='1 TO 499'
  500-999='500 TO 999'
  1000-1499='1000 TO 1499'
  1500-1999='1500 TO 1999'
  2000-2499='2000 TO 2499'
  2500-2999='2500 TO 2999'
  3000-3499='3000 TO 3499'
  3500-3999='3500 TO 3999'
  4000-4499='4000 TO 4499'
  4500-4999='4500 TO 4999'
  5000-99999999='5000 TO 99999999: 5000+'
;
value vx65f
  0='0'
  1-49999='1 TO 49999'
  50000-99999='50000 TO 99999'
  100000-149999='100000 TO 149999'
  150000-199999='150000 TO 199999'
  200000-249999='200000 TO 249999'
  250000-299999='250000 TO 299999'
  300000-399999='300000 TO 399999'
  400000-499999='400000 TO 499999'
  500000-599999='500000 TO 599999'
  600000-699999='600000 TO 699999'
  700000-799999='700000 TO 799999'
  800000-899999='800000 TO 899999'
  900000-999999='900000 TO 999999'
  1000000-1999999='1000000 TO 1999999'
  2000000-2999999='2000000 TO 2999999'
  3000000-3999999='3000000 TO 3999999'
  4000000-4999999='4000000 TO 4999999'
  5000000-5999999='5000000 TO 5999999'
  6000000-6999999='6000000 TO 6999999'
  7000000-7999999='7000000 TO 7999999'
  8000000-8999999='8000000 TO 8999999'
  9000000-9999999='9000000 TO 9999999'
  10000000-9999999999='10000000 TO 9999999999: 10000000+'
;
value vx66f
  60='60: 60  PARENT REFUSAL/BREAKOFF'
  61='61: 61  YOUTH REFUSAL/BREAKOFF'
  62='62: 62  PARENT & YOUTH REFUSAL/BREAKOFF'
  63='63: 63  UNABLE TO LOCATE FAMILY UNIT & YOUTH'
  64='64: 64  UNABLE TO LOCATE YOUTH'
  65='65: 65  DECEASED'
  66='66: 66  OTHER'
  67='67: 67  DO NOT REFIELD (VERY DIFFICULT CASE)'
  68='68: 68  MILITARY SAMPLE DROPPED'
  69='69: 69  SUPPLEMENTAL MALE POOR WHITE SAMPLE DROPPED'
  70='70: 70  SUPPLEMENTAL FEMALE POOR WHITE SAMPLE DROPPED'
  71='71: 71  YOUTH REFUSAL - VERY DIFFICULT CASE'
  72='72: 72  NOT FIELDED IN CURRENT SURVEY YEAR - VERY DIFFICULT CASE'
  73='73: 73  NOT INTERVIEWED - INCARCERATED'
  74='74: 74  NOT INTERVIEWED - IN MILITARY'
;
value vx67f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx68f
  0='0'
  1-999='1 TO 999'
  1000-1999='1000 TO 1999'
  2000-2999='2000 TO 2999'
  3000-3999='3000 TO 3999'
  4000-4999='4000 TO 4999'
  5000-5999='5000 TO 5999'
  6000-6999='6000 TO 6999'
  7000-7999='7000 TO 7999'
  8000-8999='8000 TO 8999'
  9000-9999='9000 TO 9999'
  10000-14999='10000 TO 14999'
  15000-19999='15000 TO 19999'
  20000-24999='20000 TO 24999'
  25000-49999='25000 TO 49999'
  50000-99999999='50000 TO 99999999: 50000+'
;
value vx69f
  0='0: NOT IN POVERTY'
  1='1: IN POVERTY'
;
value vx70f
  1='1: NORTHEAST'
  2='2: NORTH CENTRAL'
  3='3: SOUTH'
  4='4: WEST'
;
value vx71f
  1='1: NEVER MARRIED'
  2='2: MARRIED, SPOUSE PRESENT'
  3='3: OTHER'
;
value vx72f
  0='0: 0  NEVER MARRIED'
  1='1: 1  MARRIED'
  2='2: 2  SEPARATED'
  3='3: 3  DIVORCED'
  6='6: 6  WIDOWED'
;
value vx73f
  0='0'
  1-499='1 TO 499'
  500-999='500 TO 999'
  1000-1499='1000 TO 1499'
  1500-1999='1500 TO 1999'
  2000-2499='2000 TO 2499'
  2500-2999='2500 TO 2999'
  3000-3499='3000 TO 3499'
  3500-3999='3500 TO 3999'
  4000-4499='4000 TO 4499'
  4500-4999='4500 TO 4999'
  5000-99999999='5000 TO 99999999: 5000+'
;
value vx74f
  0='0'
  1-13='1 TO 13'
  14-26='14 TO 26'
  27-39='27 TO 39'
  40-48='40 TO 48'
  49-51='49 TO 51'
  52='52'
  53-99999999='53 TO 99999999: > 52'
;
value vx75f
  0='0'
  1-13='1 TO 13'
  14-26='14 TO 26'
  27-39='27 TO 39'
  40-48='40 TO 48'
  49-51='49 TO 51'
  52='52'
  53-99999999='53 TO 99999999: > 52'
;
value vx76f
  0='0'
  1-13='1 TO 13'
  14-26='14 TO 26'
  27-39='27 TO 39'
  40-48='40 TO 48'
  49-51='49 TO 51'
  52='52'
  53-99999999='53 TO 99999999: > 52'
;
value vx77f
  0='0'
  1-9='1 TO 9'
  10-19='10 TO 19'
  20-29='20 TO 29'
  30-39='30 TO 39'
  40-49='40 TO 49'
  50-59='50 TO 59'
  60-69='60 TO 69'
  70-79='70 TO 79'
  80-89='80 TO 89'
  90-99='90 TO 99'
  100-99999999='100 TO 99999999: 100+'
;
value vx78f
  0='0: RURAL'
  1='1: URBAN'
  2='2: UNKNOWN'
;
value vx79f
  1='1: NOT IN SMSA'
  2='2: SMSA, NOT CENTRAL CITY'
  3='3: SMSA, IN CENTRAL CITY'
  4='4: SMSA, CENTRAL CITY NOT KNOWN'
;
value vx80f
  0='0'
  1-4='1 TO 4'
  5-9='5 TO 9'
  10-14='10 TO 14'
  15-19='15 TO 19'
  20-24='20 TO 24'
  25-29='25 TO 29'
  30-34='30 TO 34'
  35-39='35 TO 39'
  40-44='40 TO 44'
  45-49='45 TO 49'
  50-99999999='50 TO 99999999: 50+'
;
value vx81f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx82f
  0='0'
  1='1'
  2='2'
  3='3'
  4='4'
  5='5'
  6='6'
  7='7'
  8='8'
  9='9'
  10-999='10 TO 999: 10+'
;
value vx83f
  0-10='0 TO 10: <= 10'
  11='11'
  12='12'
  13='13'
  14='14'
  15='15'
  16='16'
  17='17'
  18='18'
  19='19'
  20='20'
  21='21'
  22='22'
  23='23'
  24='24'
  25='25'
  26='26'
  27='27'
  28='28'
  29='29'
  30-99='30 TO 99: 30+'
;
value vx84f
  0='0: 0  CONDITION DOES NOT APPLY'
  1='1: 1  CONDITION APPLIES'
;
value vx85f
  0='0: 0  CONDITION DOES NOT APPLY'
  1='1: 1  CONDITION APPLIES'
;
*/

/* 
 *--- Tabulations using reference number variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format A0002600 vx0f.;
  format R0000300 vx2f.;
  format R0000500 vx3f.;
  format R0006500 vx4f.;
  format R0007900 vx5f.;
  format R0009100 vx6f.;
  format R0173600 vx7f.;
  format R0214700 vx8f.;
  format R0214800 vx9f.;
  format R0410100 vx10f.;
  format R0410300 vx11f.;
  format T4181500 vx13f.;
  format T4188900 vx14f.;
  format T4189900 vx15f.;
  format T4193600 vx16f.;
  format T4201000 vx17f.;
  format T4201100 vx18f.;
  format T4246600 vx19f.;
  format T4246700 vx20f.;
  format T4253500 vx21f.;
  format T4253600 vx22f.;
  format T4254500 vx23f.;
  format T4254600 vx24f.;
  format T4255000 vx25f.;
  format T4255100 vx26f.;
  format T4259000 vx27f.;
  format T4259100 vx28f.;
  format T4282300 vx29f.;
  format T4282800 vx30f.;
  format T4282900 vx31f.;
  format T4283300 vx32f.;
  format T4429600 vx33f.;
  format T4434100 vx34f.;
  format T4467000 vx35f.;
  format T4478200 vx36f.;
  format T4478300 vx37f.;
  format T4876800 vx38f.;
  format T4890700 vx39f.;
  format T4890800 vx40f.;
  format T4890900 vx41f.;
  format T4891000 vx42f.;
  format T4891300 vx43f.;
  format T4892000 vx44f.;
  format T4892200 vx45f.;
  format T4892300 vx46f.;
  format T4892400 vx47f.;
  format T4892500 vx48f.;
  format T4892600 vx49f.;
  format T4892700 vx50f.;
  format T4892800 vx51f.;
  format T4892900 vx52f.;
  format T4894200 vx53f.;
  format T4894300 vx54f.;
  format T4894400 vx55f.;
  format T4897200 vx56f.;
  format T4897800 vx57f.;
  format T4897900 vx58f.;
  format T4898000 vx59f.;
  format T4915800 vx60f.;
  format T5019200 vx61f.;
  format T5019300 vx62f.;
  format T5019700 vx63f.;
  format T5019900 vx64f.;
  format T5022100 vx65f.;
  format T5022300 vx66f.;
  format T5022500 vx67f.;
  format T5022600 vx68f.;
  format T5022800 vx69f.;
  format T5023100 vx70f.;
  format T5023200 vx71f.;
  format T5023300 vx72f.;
  format T5024700 vx73f.;
  format T5024800 vx74f.;
  format T5024900 vx75f.;
  format T5025000 vx76f.;
  format T5025100 vx77f.;
  format T5025900 vx78f.;
  format T5026000 vx79f.;
  format T5026200 vx80f.;
  format T5031400 vx81f.;
  format T5031500 vx82f.;
  format T5031600 vx83f.;
  format T5054600 vx84f.;
  format T5058900 vx85f.;
run;
*/

/*
*--- Tabulations using default named variables;
proc freq data=new_data;
tables _ALL_ /MISSING;
  format 'VERSION_R26_2014'n vx0f.;
  format 'Q1-3_A~M_1979'n vx2f.;
  format 'Q1-3_A~Y_1979'n vx3f.;
  format 'HGC-MOTHER_1979'n vx4f.;
  format 'HGC-FATHER_1979'n vx5f.;
  format 'FAM-28A_1979'n vx6f.;
  format 'SAMPLE_ID_1979'n vx7f.;
  format 'SAMPLE_RACE_78SCRN'n vx8f.;
  format 'SAMPLE_SEX_1979'n vx9f.;
  format 'Q1-3_A~M_1981'n vx10f.;
  format 'Q1-3_A~Y_1981'n vx11f.;
  format 'HH1-1_2014'n vx13f.;
  format 'R_REL-2_2014'n vx14f.;
  format 'R_REL-3_2014'n vx15f.;
  format 'Q2-CH-2_2014'n vx16f.;
  format 'Q3-3_2014'n vx17f.;
  format 'Q3-4_2014'n vx18f.;
  format 'QES-23.01_2014'n vx19f.;
  format 'QES-23.02_2014'n vx20f.;
  format 'HOURS_WORKED_WEEK_ALL.01_2014'n vx21f.;
  format 'HOURS_WORKED_WEEK_ALL.02_2014'n vx22f.;
  format 'QES-52D.01_2014'n vx23f.;
  format 'QES-52D.02_2014'n vx24f.;
  format 'QES-52B.01_2014'n vx25f.;
  format 'QES-52B.02_2014'n vx26f.;
  format 'QES-53B.01_2014'n vx27f.;
  format 'QES-53B.02_2014'n vx28f.;
  format 'INDALL-EMP.01_2014'n vx29f.;
  format 'OCCALL-EMP.01_2014'n vx30f.;
  format 'OCCALL-EMP.02_2014'n vx31f.;
  format 'COWALL-EMP.01_2014'n vx32f.;
  format 'Q8-2.01_2014'n vx33f.;
  format 'Q8-18_2014'n vx34f.;
  format 'OCCALL-SPOUSE_2014'n vx35f.;
  format 'Q2-15A_2014'n vx36f.;
  format 'Q2-15B_2014'n vx37f.;
  format 'Q10-2_2014'n vx38f.;
  format 'Q11-3_2014'n vx39f.;
  format 'Q11-4_2014'n vx40f.;
  format 'Q11-5_2014'n vx41f.;
  format 'Q11-5A_2014'n vx42f.;
  format 'Q11-7_2014'n vx43f.;
  format 'Q11-CARE-1_2014'n vx44f.;
  format 'Q11-CARE-2CNT_2014'n vx45f.;
  format 'Q11-CARE-3_2014'n vx46f.;
  format 'Q11-CARE-3B_2014'n vx47f.;
  format 'Q11-CARE-4_2014'n vx48f.;
  format 'Q11-CARE-4B_2014'n vx49f.;
  format 'Q11-9_2014'n vx50f.;
  format 'Q11-10_A_2014'n vx51f.;
  format 'Q11-10_B_2014'n vx52f.;
  format 'Q11-GENHLTH-PRV1_2014'n vx53f.;
  format 'Q11-GENHLTH-PRV2_2014'n vx54f.;
  format 'Q11-GENHLTH_4A_2014'n vx55f.;
  format 'Q11-79_2014'n vx56f.;
  format 'Q11-80G_2014'n vx57f.;
  format 'Q11-81C_1_2014'n vx58f.;
  format 'Q11-HLTHPLN-5CHK_2014'n vx59f.;
  format 'Q13-5_TRUNC_2014'n vx60f.;
  format 'TENURE1_2014'n vx61f.;
  format 'TENURE2_2014'n vx62f.;
  format 'HRP1_2014'n vx63f.;
  format 'HRP2_2014'n vx64f.;
  format 'SAMPWEIGHT_2014'n vx65f.;
  format 'RNI_2014'n vx66f.;
  format 'FAMSIZE_2014'n vx67f.;
  format 'TNFI_TRUNC_2014'n vx68f.;
  format 'POVSTATUS_2014'n vx69f.;
  format 'REGION_2014'n vx70f.;
  format 'MARSTAT-COL_2014'n vx71f.;
  format 'MARSTAT-KEY_2014'n vx72f.;
  format 'HRSWK-PCY_2014'n vx73f.;
  format 'WKSWK-PCY_2014'n vx74f.;
  format 'WKSUEMP-PCY_2014'n vx75f.;
  format 'WKSOLF-PCY_2014'n vx76f.;
  format 'WKSUNACCT-PCY_2014'n vx77f.;
  format 'URBAN-RURAL_2014'n vx78f.;
  format 'SMSARES_2014'n vx79f.;
  format 'JOBSNUM_2014'n vx80f.;
  format 'NUMKID14_2014'n vx81f.;
  format 'NUMCH14_2014'n vx82f.;
  format 'AGEYCH14_2014'n vx83f.;
  format 'EMPLOYER_CURFLAG.01_2014'n vx84f.;
  format 'EMPLOYER_CPSFLAG.01_2014'n vx85f.;
run;
*/