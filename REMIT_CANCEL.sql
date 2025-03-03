set ver off
SET LINES 80
SET PAGES 2000
COLUMN PER FORMAT 999.99
---COLUMN T_RMT_AMT FORMAT 999,999.99
COMPUTE SUM OF REASON_COUNT PER T_RMT_AMT  ON REPORT;
BREAK ON REPORT;



SPOOL ON 



SELECT SC_CD, RMT_NO, RMT_DT, FP_ID, RMT_AMT, FL_MVH, SR_ID, CANCL_REASON
FROM SCENT.REMIT_MAS 
WHERE SC_CD = '11' 
AND CANCL = 'C' 
AND RMT_DT BETWEEN '01JAN24' AND '31DEC24'
GROUP BY SC_CD, RMT_NO, RMT_DT, FP_ID, RMT_AMT, FL_MVH, SR_ID, CANCL_REASON
ORDER BY CANCL_REASON;




SELECT DISTINCT SC_CD, 
       CANCL_REASON, 
       SUM(RMT_AMT) AS T_RMT_AMT,
       COUNT(*) AS REASON_COUNT,
       SUM(COUNT(*)) OVER () AS T_COUNT,
       CAST(COUNT(*)* 100 AS FLOAT) / SUM(COUNT(*)) OVER () AS PER
FROM SCENT.REMIT_MAS
WHERE SC_CD = '11' 
AND CANCL = 'C'
AND RMT_DT BETWEEN '01JAN24' AND '31DEC24'
GROUP BY SC_CD, CANCL_REASON
ORDER BY CANCL_REASON;



-- Drop existing tables safely
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE JKL';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN 
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE CANCEL_REASONS';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create CANCEL_REASONS table
CREATE TABLE CANCEL_REASONS (
    CANCL_REASON NUMBER PRIMARY KEY,
    CANCEL_NM VARCHAR2(24)
);

-- Insert cancellation reasons
INSERT INTO CANCEL_REASONS (CANCL_REASON, CANCEL_NM) VALUES (1, 'Write wrong bill number');
INSERT INTO CANCEL_REASONS (CANCL_REASON, CANCEL_NM) VALUES (2, 'Wrong entry');
INSERT INTO CANCEL_REASONS (CANCL_REASON, CANCEL_NM) VALUES (3, 'False remittance');
INSERT INTO CANCEL_REASONS (CANCL_REASON, CANCEL_NM) VALUES (4, 'Amount mismatch');
INSERT INTO CANCEL_REASONS (CANCL_REASON, CANCEL_NM) VALUES (5, 'Advance collection');
INSERT INTO CANCEL_REASONS (CANCL_REASON, CANCEL_NM) VALUES (6, 'Product return');
INSERT INTO CANCEL_REASONS (CANCL_REASON, CANCEL_NM) VALUES (7, 'Blank remittance');
INSERT INTO CANCEL_REASONS (CANCL_REASON, CANCEL_NM) VALUES (8, 'Base change');

COMMIT;

-- Create JKL table with proper aggregation
CREATE TABLE JKL AS 
SELECT SC_CD, 
       CANCL_REASON, 
       SUM(RMT_AMT) AS T_RMT_AMT,
       COUNT(*) AS REASON_COUNT,
       SUM(COUNT(*)) OVER () AS T_COUNT,  -- Fixed T_COUNT using window function
       ROUND((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER (), 2) AS PER -- Percentage Calculation
FROM SCENT.REMIT_MAS
WHERE SC_CD = '11' 
AND CANCL = 'C'
AND RMT_DT BETWEEN TO_DATE('01-JAN-2024', 'DD-MON-YYYY') 
              AND TO_DATE('31-DEC-2024', 'DD-MON-YYYY')
GROUP BY SC_CD, CANCL_REASON
ORDER BY CANCL_REASON;

-- Retrieve results with proper JOIN
SELECT A.SC_CD, 
       A.CANCL_REASON, 
       B.CANCEL_NM, 
       A.T_RMT_AMT,
       A.REASON_COUNT,
       A.PER
FROM JKL A
INNER JOIN CANCEL_REASONS B ON A.CANCL_REASON = B.CANCL_REASON
ORDER BY A.CANCL_REASON;

DROP TABLE JKL;
DROP TABLE CANCEL_REASONS;




SPOOL OFF
ED ON.LST

