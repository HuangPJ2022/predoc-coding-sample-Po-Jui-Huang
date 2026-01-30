/*******************************************************************************
STATA HOUSEKEEPING
	For the setup code to work, all the files need to be stored in the setup
	directory, stored within the folder you are setting as your main directory
	(the filepath in line 10). Update line 10 to the directory where the setup
	folder is stored.
*******************************************************************************/
	clear all 
	set more off
	cd "J:\ec423" // UPDATE THIS to the folder where this .do (and the setup folder) now live

*	net install tolower.pkg, from(http://fmwww.bc.edu/RePEc/bocode/t/)

/*******************************************************************************
INTRO TO THE DATA:
	Data come from the National Longitudinal Survey of Youth, 1979
	More information on fields can be found here: http://nlsinfo.org/content/cohorts/nlsy79/topical-guide
	You can also view more information about the variables on the 
	NLS Investigator site: https://www.nlsinfo.org/investigator
	
!!!	IMPORTANT NOTE: NLSY codes missing values as negative values, make sure
		you are treating these appropriately in your regressions
		
If you want to view the fields in the Investigator, login and follow the steps below:
	1. Select NLSY79 sample
	2. On the "Choose tagsets" tab, upload ec423_mincer.NLSY79
	3. The "Review Selected Variables will list all of the variables included, clicking
		on the Reference Number or Question Name will lead you to more information
		about the variables.

If you want to include more variables in the dataset, continuing in the Investigator
	4. Find the variables you'd like to add via variable search (Note that this dataset
		includes only values from 2014 (other than typically static demographic variables
		which were recorded at the beginning of the survey and not asked again) - you
		may want to restrict "Survey Year" to 2014 and use the "Browse index with search"
		feature of the investigator
	5. Use the "Basic Download" feature in the Investigator to download the data.
		If you name your download "ec423_mincer", you will not have to rename any files
		(just replace the files in this folder with your new version); otherwise, 
		update the references in this file to use the new filename.	
	6. In ec423_mincer-value-labels.do, uncomment (remove the /* and */) the code
		to rename the variables.
*******************************************************************************/	

/*******************************************************************************
Read in data and label variables
*******************************************************************************/
	clear all 
	infile using ./setup/ec423_mincer.dct
	do ./setup/ec423_mincer-value-labels

/*******************************************************************************
FIX BIRTH DATES
	The 1981 birth dates should be used to determine age with the 1979 dates used only as a backup.
	Source: https://www.nlsinfo.org/content/cohorts/nlsy79/topical-guide/household/age
*******************************************************************************/
	gen dob_year = q1_3_a_y_1981
	gen dob_month =  q1_3_a_m_1981
	replace dob_year = q1_3_a_y_1979 if dob_year == . | dob_year == -5
	replace dob_month = q1_3_a_m_1979 if dob_month == . | dob_month == -5
	label variable dob_year "BIRTH YEAR"
	label variable dob_month "BIRTH MONTH"
	drop q1_3_a_y* q1_3_a_m*


/*******************************************************************************
RENAME VARIABLES
*******************************************************************************/
	drop version_r26_2014
	rename *_1979 *
	rename *_1981 *
	rename *_2014 *
	rename sample_* *

	order caseid sampweight rni dob_year dob_month  sex race_78scrn id ///
	 q13_5_trunc tnfi_trunc q3_3 q3_4 afqt_3 ///
	 hrp1 hrp2 hrswk_pcy hours_worked_week_all_01 hours_worked_week_all_02 ///
	 qes_52d_01 qes_52d_02 qes_52b_01 qes_52b_02 qes_53b_01 qes_53b_02 q2_15b ///
	 numch14 numkid14 ageych14 urban_rural smsares region famsize fam_28a
	 
* List variables
	 ds, detail

/*******************************************************************************
Keep only those interviewed in 2014
*******************************************************************************/	 
	 keep if rni == -4
	 drop rni

/*******************************************************************************
Save the Stata dataset
*******************************************************************************/	
	 sa nlsy_2014_data, replace
