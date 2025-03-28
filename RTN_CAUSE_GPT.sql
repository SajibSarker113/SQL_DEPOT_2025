
SET LINE 55
SET PAGES 30000
COLUMN RTN_NET FORMAT 99,99,999.99

COMPUTE COUNT OF RTN_NO ON REPORT
---COMPUTE SUM OF RTN_NET ON REPORT
COMPUTE MAX OF RTN_NET ON FL_MVH
COMPUTE COUNT OF RTN_NO ON FL_MVH
BREAK ON REPORT ON FL_MVH

COLUMN PER FORMAT 999.99
COMPUTE SUM OF RSN_COUNT PER ON REPORT;



SPOOL ON

SELECT SC_CD, FL_MVH, FP_ID, BILL_NO, RTN_NO, RTN_DT, RSN_NO, SALE_CD, RTN_NET 
FROM SCENT.RTN_MAS 
WHERE SC_CD = '&&SC_CD' 
AND RTN_DT BETWEEN '&&DATE1' AND '&&DATE2'
AND CANCL IS NULL 
ORDER BY FL_MVH, RTN_NO
/

-- Drop existing tables safely
BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE RETURN_NO PURGE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN 
            RAISE;
        END IF;
END;
/

BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE RETURN_REASONS PURGE';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;
/

-- Create RETURN_REASONS table
CREATE TABLE RETURN_REASONS (
    RETURN_REASON VARCHAR2(2) PRIMARY KEY, -- Changed from NUMBER
    RETURN_NM VARCHAR2(27)
);

-- Insert cancellation reasons
INSERT INTO RETURN_REASONS VALUES ('1', 'Broken and Damage');
INSERT INTO RETURN_REASONS VALUES ('2', 'Date Expired');
INSERT INTO RETURN_REASONS VALUES ('3', 'Shop Closed/Owner Absent');
INSERT INTO RETURN_REASONS VALUES ('4', 'False Order');
INSERT INTO RETURN_REASONS VALUES ('5', 'Short/Excess Product');
INSERT INTO RETURN_REASONS VALUES ('6', 'Late Delivery');
INSERT INTO RETURN_REASONS VALUES ('7', 'Cash Short');
INSERT INTO RETURN_REASONS VALUES ('8', 'Request Time');
INSERT INTO RETURN_REASONS VALUES ('9', 'Not Approved Payment Time');
INSERT INTO RETURN_REASONS VALUES ('0', 'Undelivered');
INSERT INTO RETURN_REASONS VALUES ('$', 'Cash Short COD');
INSERT INTO RETURN_REASONS VALUES ('A', 'Refurbish');
INSERT INTO RETURN_REASONS VALUES ('B', 'Excess Order');
INSERT INTO RETURN_REASONS VALUES ('C', 'Short Dated Product');
INSERT INTO RETURN_REASONS VALUES ('D', 'Return Others');
INSERT INTO RETURN_REASONS VALUES ('O', 'Bonus Return');

COMMIT;

-- Create RETURN_NO table with proper aggregation
CREATE TABLE RETURN_NO AS 
SELECT SC_CD, 
       RSN_NO, 
       COUNT(*) AS RSN_COUNT,
       SUM(COUNT(*)) OVER () AS T_COUNT,  -- Fixed using window function
       ROUND((COUNT(*) * 100.0) / SUM(COUNT(*)) OVER (), 2) AS PER -- Percentage Calculation
FROM SCENT.RTN_MAS
WHERE SC_CD = '&&SC_CD' 
AND RTN_DT BETWEEN '&&DATE1' AND '&&DATE2'
AND CANCL IS NULL 
GROUP BY SC_CD, RSN_NO
ORDER BY RSN_NO;

-- Retrieve results with proper JOIN
SELECT A.SC_CD, 
       A.RSN_NO, 
       B.RETURN_NM, 
       A.RSN_COUNT,
       A.PER
FROM RETURN_NO A
INNER JOIN RETURN_REASONS B ON A.RSN_NO = B.RETURN_REASON
ORDER BY A.RSN_COUNT DESC;

DROP TABLE RETURN_REASONS;
DROP TABLE RETURN_NO;

SPOOL OFF

ED ON.LST
