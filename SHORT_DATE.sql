SET LINES 120
SET PAGES 5000
SET NUMFORMAT 999999.99

BREAK ON REPORT ON CAT_CD

TTITLE CENTER 'DEPOT: '&&SC_CD', Short Date Medicine' SKIP2

SPOOL ON 

SELECT 
    B.CAT_CD,
    TO_CHAR(B.CAT_CD || B.PRD_CD) AS CAT_PRD_CD, 
    SUBSTR(C.PROD_NM, 1, 30) AS NAME, 
    B.B_NO, 
    B.EXP_DT, 
    SUM(B.RV_QTY) AS RV_QTY1, 
    SUM(B.RV_BAL) AS STK_QTY, 
    SUM(B.RV_BAL / D.MST_PK) AS PETTY, 
    SUM(B.RV_QTY - B.RV_BAL) AS DIFF,
    A.ISS_FROM 
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
    AND A.RV_DT BETWEEN '01-JAN-19' AND '31-DEC-25' 
    AND B.CAT_CD > '0' 
    AND A.DIV_CD = '1' 
    AND B.TYP_CD = '09' 
    AND A.RV_TYPE NOT IN ('0')
    AND B.EXP_DT < '&&EXP_DATE'
GROUP BY
    B.CAT_CD, 
    B.CAT_CD || B.PRD_CD, 
    C.PROD_NM, 
    B.B_NO,
    B.EXP_DT, 
    B.RV_QTY, 
    B.RV_BAL,
    A.ISS_FROM 
--HAVING (B.RV_QTY - B.RV_BAL) > 0 
ORDER BY 
    B.CAT_CD, B.EXP_DT, B.CAT_CD || B.PRD_CD 
/

SELECT 
    B.CAT_CD,
    TO_CHAR(B.CAT_CD || B.PRD_CD) AS CAT_PRD_CD, 
    SUBSTR(C.PROD_NM, 1, 30) AS NAME, 
    B.B_NO, 
    B.EXP_DT, 
    SUM(B.RV_QTY) AS RV_QTY1, 
    SUM(B.RV_BAL) AS STK_QTY, 
    SUM(B.RV_BAL / D.MST_PK) AS PETTY, 
    SUM(B.RV_QTY - B.RV_BAL) AS DIFF,
    A.ISS_FROM 
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
    AND A.RV_DT BETWEEN '01-JAN-19' AND '31-DEC-25' 
    AND B.CAT_CD > '0' 
    AND A.DIV_CD = '2' 
    AND B.TYP_CD = '09' 
    AND A.RV_TYPE NOT IN ('0')
    AND B.EXP_DT < '&&EXP_DATE'
GROUP BY
    B.CAT_CD, 
    B.CAT_CD || B.PRD_CD, 
    C.PROD_NM, 
    B.B_NO,
    B.EXP_DT, 
    B.RV_QTY, 
    B.RV_BAL,
    A.ISS_FROM 
--HAVING (B.RV_QTY - B.RV_BAL) > 0 
ORDER BY 
    B.CAT_CD, B.EXP_DT, B.CAT_CD || B.PRD_CD 
/




SPOOL OFF
ED ON.LST
