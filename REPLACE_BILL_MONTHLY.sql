

SET LINE 45
SET PAGES 20000
COLUMN SALE_NET FORMAT 99,99,999.99



TTITLE center 'Depot:'&&SC_CD', Replace bill Month wise' SKIP2



SPOOL ON

SELECT SC_CD, 
    TO_CHAR(DELI_DT, 'YYYY-MM') AS MONTH_YEAR, SALE_CD,
    --FL_MVH, 
    SUM(SALE_NET) AS SALE_NET
FROM 
    scent.bill_replace1
WHERE 
    DELI_DT BETWEEN '&DATE1' AND '&DATE2'
    AND SC_CD = '&&SC_CD'
    AND SALE_CD = 'RS'  
GROUP BY 
    SC_CD,
    TO_CHAR(DELI_DT, 'YYYY-MM'), SALE_CD
    --FL_MVH 
ORDER BY 
    MONTH_YEAR;


 
SPOOL OFF

ED ON.LST

