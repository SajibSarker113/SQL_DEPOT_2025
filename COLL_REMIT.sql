
SET VER OFF
SET LINES 64
SET PAGES 2000
SET NUMFORMAT 99,99,99,999.99


ACCEPT SC CHAR PROMPT 'SALES CENTER : '

TTITLE CENTER 'DEPOT: '&&SC', Collection and Remit' SKIP2




DROP TABLE DD_CM
/

CREATE TABLE DD_CM AS
SELECT DISTINCT SC_CD, RMT_DT, SUM(RMT_AMT) AS PAID
FROM SCENT.REMIT_MAS 
WHERE SC_CD = '&&SC' 
AND RMT_DT >= '&FROM_DATE' 
AND CANCL IS NULL
GROUP BY SC_CD, RMT_DT
/

SPOOL ON 

SELECT R.SC_CD, 
       R.RMT_DT, 
       R.PAID, 
       (SELECT NVL(SUM(DOC_AMT), 0) 
        FROM DACC.DAY_COLLECT C 
        WHERE C.SC_CD = R.SC_CD 
        AND R.RMT_DT = C.COLL_DT 
        AND C.DOC_TYP NOT IN ('09')) AS COLLECT,
       R.PAID - (SELECT NVL(SUM(DOC_AMT), 0) 
                 FROM DACC.DAY_COLLECT C 
                 WHERE C.SC_CD = R.SC_CD 
                 AND R.RMT_DT = C.COLL_DT 
                 AND C.DOC_TYP NOT IN ('09')) AS DIFF
FROM DD_CM R
WHERE R.SC_CD = '&&SC' 
AND R.PAID - (SELECT NVL(SUM(DOC_AMT), 0) 
              FROM DACC.DAY_COLLECT C 
              WHERE C.SC_CD = R.SC_CD 
              AND R.RMT_DT = C.COLL_DT 
              AND C.DOC_TYP NOT IN ('09')) <> 0
ORDER BY DIFF, R.RMT_DT
/




SELECT 
    R.SC_CD, 
    TO_CHAR(R.RMT_DT, 'YYYY-MM') AS RMTDT, 
    SUM(R.PAID) AS PAID, 
    SUM((
        SELECT NVL(SUM(DOC_AMT), 0) 
        FROM DACC.DAY_COLLECT C 
        WHERE C.SC_CD = R.SC_CD 
          AND R.RMT_DT = C.COLL_DT 
          AND C.DOC_TYP NOT IN ('09')
    )) AS COLLECT,
    SUM(R.PAID) - SUM((
        SELECT NVL(SUM(DOC_AMT), 0) 
        FROM DACC.DAY_COLLECT C 
        WHERE C.SC_CD = R.SC_CD 
          AND R.RMT_DT = C.COLL_DT 
          AND C.DOC_TYP NOT IN ('09')
    )) AS DIFF
FROM DD_CM R
WHERE R.SC_CD = '&&SC'
GROUP BY R.SC_CD, TO_CHAR(R.RMT_DT, 'YYYY-MM')
ORDER BY DIFF, RMTDT;




DROP TABLE DD_CM
/


SPOOL OFF
ED ON.LST



























