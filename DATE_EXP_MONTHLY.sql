

SET LINE 45
SET PAGES 20000
COLUMN VALUE FORMAT 99,99,999.99



TTITLE center 'Depot:'&&SC_CD', RV of Expired Medicine Month wise' SKIP2



SPOOL ON

SELECT 
    LOC_CD, 
    TO_CHAR(RV_DT, 'YYYY-MM') AS MONTH_YEAR, 
    --DIV_CD, 
    SUM(RV_QTY) AS TOTAL_RV_QTY, 
    SUM(T_VAT * RV_QTY) AS VALUE 
FROM 
    INV.RECV_SUB 
WHERE 
    RV_DT BETWEEN '&DATE1' AND '&DATE2'
    AND LOC_CD = '&&SC_CD' 
    --AND DIV_CD IN ('1', '2') 
    AND RV_TYP = '47' 
GROUP BY 
    LOC_CD,
    TO_CHAR(RV_DT, 'YYYY-MM')
    --DIV_CD 
ORDER BY 
    MONTH_YEAR;


 
SPOOL OFF

ED ON.LST

