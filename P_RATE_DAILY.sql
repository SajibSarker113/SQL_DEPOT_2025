SET LINE 62
SET PAGES 20000
--- Value TP and VAT

SPOOL ON


SELECT * FROM INV.DAY_BAL WHERE LOC_CD='&SC_NO' 
AND CL_DT>='01JAN19'
AND CAT_CD||PRD_CD='&CatCD_ProCD' 
AND TYP_CD IN('09')
ORDER BY CL_DT
/

 
SPOOL OFF

ED ON.LST