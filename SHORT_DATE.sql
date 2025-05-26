SET LINES 74
SET PAGES 5000
SET NUMFORMAT 999999.99




TTITLE CENTER 'DEPOT: '&&SC_CD', Short Date Medicine' SKIP2

SPOOL ON 

SELECT 
    A.DIV_CD, B.CAT_CD,A.DIV_CD || B.CAT_CD,
    TO_CHAR(A.DIV_CD || B.CAT_CD || B.PRD_CD) AS DCP_CD, 
    INITCAP(SUBSTR(C.PROD_NM, 1, 25)) AS MEDICINE_NAME, 
    ---NULL AS Blank_column, -- for creating a blank  row
    B.B_NO,  
    SUM(B.RV_BAL) AS STOK_QTY, 
    TO_CHAR(B.EXP_DT,'DD.MM.YY') EXP_DT
FROM 
    INV.FG_RV1 A, 
    INV.FG_RV2 B, 
    SCENT.INV_PROD C, 
    SCENT.PROD_RATE D 
WHERE 
    A.RV_NO = B.RV_NO 
    AND A.LOC_CD = '&&SC_CD' 
    AND (B.RV_BAL) > '0' 
    AND B.CAT_CD = C.CAT_CD 
    AND B.PRD_CD = C.PRD_CD 
    AND B.TYP_CD = C.TYP_CD 
    AND A.LOC_CD = B.LOC_CD 
    AND B.CAT_CD = D.CAT_CD 
    AND B.PRD_CD = D.PRD_CD 
    AND B.TYP_CD = D.TYP_CD 
    AND A.RV_DT BETWEEN '01-JAN-19' AND '31-DEC-26' 
    AND B.CAT_CD > '0'
    AND B.TYP_CD = '09' 
    AND A.RV_TYPE NOT IN ('0') 
    AND B.EXP_DT <= LAST_DAY(SYSDATE) + 184
GROUP BY
    A.DIV_CD, B.CAT_CD, 
    A.DIV_CD || B.CAT_CD || B.PRD_CD, 
    C.PROD_NM, 
    B.B_NO, 
    B.RV_BAL,
    B.EXP_DT
ORDER BY 
    A.DIV_CD, B.EXP_DT, A.DIV_CD || B.CAT_CD || B.PRD_CD 
/




SPOOL OFF
ED ON.LST
