

SET LINE 82
SET PAGES 2000


--COMPUTE COUNT OF PROD_NM ON REPORT

--COMPUTE COUNT OF PROD_NM ON CAT_CD
--BREAK ON REPORT ON CAT_CD



TTITLE center 'All product price of a depot' SKIP2



SPOOL ON

SELECT *
FROM (
    SELECT 
        B.DIV_CD,
        A.CAT_CD,
        A.PRD_CD,
        B.PROD_NM,
        A.TRADE_PR,
        ROW_NUMBER() OVER (
            PARTITION BY A.CAT_CD 
            ORDER BY A.TRADE_PR DESC
        ) AS rn
    FROM SCENT.PROD_RATE A
    JOIN SCENT.INV_PROD B
        ON A.TYP_CD = B.TYP_CD 
        AND A.CAT_CD = B.CAT_CD 
        AND A.PRD_CD = B.PRD_CD
    WHERE 
        A.TYP_CD = '09'
        AND A.CAT_CD || A.PRD_CD IN (
            SELECT CAT_CD || PRD_CD 
            FROM SCENT.FLAT_RATE 
            WHERE END_DT IN (
                SELECT MAX(END_DT) 
                FROM SCENT.FLAT_RATE 
                WHERE PRD_CD LIKE '1%'
            )
        )
)
WHERE rn <= 10
ORDER BY CAT_CD, TRADE_PR DESC;


 
SPOOL OFF

ED ON.LST
