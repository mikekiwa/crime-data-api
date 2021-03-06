set colsep ,     
set pagesize 0   
set trimspool on 
set headsep on  
set linesize 4096   
set numw 10     
SET TERMOUT OFF 
SET ECHO OFF 

SPOOL ASRM.csv

select AM.ASR_MONTH_ID, AM.AGENCY_ID, AM.DATA_YEAR, AM.MONTH_NUM, AM.SOURCE_FLAG, AM.REPORTED_FLAG, AM.ORIG_FORMAT, AM.UPDATE_FLAG, AM.FF_LINE_NUMBER, AM.DDOCNAME, AM.DID, AM.DATA_HOME, AM.MONTH_PUB_STATUS from ASR_MONTH AM WHERE AM.DATA_YEAR = 2016;

SPOOL OFF


SPOOL ASRASS.csv

select AASS.ASR_MONTH_ID,  AASS.OFFENSE_SUBCAT_ID, AASS.AGE_RANGE_ID,  AASS.ARREST_COUNT,  AASS.ARREST_STATUS, AASS.ACTIVE_FLAG, AASS.PREPARED_DATE, AASS.REPORT_DATE, AASS.FF_LINE_NUMBER from ASR_AGE_SEX_SUBCAT AASS JOIN ASR_MONTH AM ON AM.ASR_MONTH_ID = AASS.ASR_MONTH_ID WHERE AM.DATA_YEAR = 2016;

SPOOL OFF


SPOOL ASRROS.csv

select AROS.ASR_MONTH_ID, AROS.OFFENSE_SUBCAT_ID, AROS.RACE_ID, AROS.JUVENILE_FLAG, AROS.ARREST_COUNT, AROS.ARREST_STATUS, AROS.ACTIVE_FLAG, AROS.PREPARED_DATE, AROS.REPORT_DATE, AROS.FF_LINE_NUMBER from ASR_RACE_OFFENSE_SUBCAT AROS JOIN ASR_MONTH AM ON AM.ASR_MONTH_ID = AROS.ASR_MONTH_ID WHERE AM.DATA_YEAR = 2016;

SPOOL OFF

END_SQL
EXIT
