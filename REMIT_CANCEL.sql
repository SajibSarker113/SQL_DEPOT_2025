set ver off 
SET LINES 49
SET PAGES 2000



SPOOL ON 

SELECT DISTINCT SC_CD, RMT_NO, RMT_DT, FP_ID, RMT_AMT, FL_MVH, SR_ID, CANCL_REASON FROM SCENT.REMIT_MAS WHERE SC_CD='&&SC_CD' AND CANCL='C' AND RMT_DT
BETWEEN '&&Date1' AND '&&Date2'
ORDER BY RMT_DT
/ 


SELECT SC_CD, CANCL_REASON, COUNT(*) AS REASON_COUNT
FROM SCENT.REMIT_MAS
WHERE SC_CD = '&&SC_CD' 
AND CANCL = 'C'
AND RMT_DT BETWEEN '&&Date1' AND '&&Date2'
GROUP BY SC_CD, CANCL_REASON
ORDER BY CANCL_REASON;



/*
Cancel	Cancel Reason
1	Write wrong bill number
2	Wrong entry
3	False remitance
4	Amount mismatch
5	Advance collection
6	Product return
7	Blank remitance
8	Base change
*/

SPOOL OFF
ED ON.LST

