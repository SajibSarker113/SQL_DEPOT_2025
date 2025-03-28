DROP TABLE SS
/
CREATE TABLE SS AS
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, SUM(SALE_NET)SALE_NOV, COUNT(BILL_NO)BILL_NOV, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01JAN2024','DDMMYYYY') AND TO_DATE ('31JAN2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC, 0 BILL_DEC, SUM(B.RTN_NET)RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD 
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01JAN2024','DDMMYYYY') AND TO_DATE ('31JAN2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, SUM(SALE_NET) SALE_DEC, COUNT(BILL_NO)BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01FEB2024','DDMMYYYY') AND TO_DATE ('29FEB2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, SUM(B.RTN_NET) RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD 
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01FEB2024','DDMMYYYY') AND TO_DATE ('29FEB2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, SUM(SALE_NET) SALE_JAN, COUNT(BILL_NO)BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01MAR2024','DDMMYYYY') AND TO_DATE ('31MAR2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, SUM(B.RTN_NET) RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD 
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01MAR2024','DDMMYYYY') AND TO_DATE ('31MAR2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
SUM(SALE_NET) SALE_FEB, COUNT(BILL_NO) BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 
0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN, 0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01APR2024','DDMMYYYY') AND TO_DATE ('30APR2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, SUM(B.RTN_NET) RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01APR2024','DDMMYYYY') AND TO_DATE ('30APR2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, SUM(SALE_NET) SALE_MAR, COUNT(BILL_NO) BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 
0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN, 0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD' 
  AND DELI_DT BETWEEN TO_DATE ('01MAY2024','DDMMYYYY') AND TO_DATE ('31MAY2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, SUM(B.RTN_NET) RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01MAY2024','DDMMYYYY') AND TO_DATE ('31MAY2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, SUM(SALE_NET) SALE_APR, COUNT(BILL_NO) BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 
0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN, 0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD' 
  AND DELI_DT BETWEEN TO_DATE ('01JUN2024','DDMMYYYY') AND TO_DATE ('30JUN2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, SUM(B.RTN_NET) RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01JUN2024','DDMMYYYY') AND TO_DATE ('30JUN2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, SUM(SALE_NET) SALE_MAY, COUNT(BILL_NO) BILL_MAY, 0 RTN_MAY, 
0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN, 0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01JUL2024','DDMMYYYY') AND TO_DATE ('31JUL2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH,  A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, SUM(B.RTN_NET) RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01JUL2024','DDMMYYYY') AND TO_DATE ('31JUL2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, SUM(SALE_NET) SALE_JUN,
COUNT(BILL_NO) BILL_JUN, 0 RTN_JUN, 0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01AUG2024','DDMMYYYY') AND TO_DATE ('31AUG2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, SUM(B.RTN_NET) RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01AUG2024','DDMMYYYY') AND TO_DATE ('31AUG2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
SUM(SALE_NET) SALE_JUL, COUNT(BILL_NO) BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD' AND DELI_DT BETWEEN TO_DATE ('01SEP2024','DDMMYYYY') AND TO_DATE ('30SEP2024','DDMMYYYY')
 AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, SUM(B.RTN_NET) RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01SEP2024','DDMMYYYY') AND TO_DATE ('30SEP2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, SUM(SALE_NET) SALE_AUG, COUNT(BILL_NO) BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01OCT2024','DDMMYYYY') AND TO_DATE ('31OCT2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, SUM(B.RTN_NET) RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01OCT2024','DDMMYYYY') AND TO_DATE ('31OCT2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, SUM(SALE_NET) SALE_SEP, COUNT(BILL_NO) BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01NOV2024','DDMMYYYY') AND TO_DATE ('30NOV2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV, 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, SUM(B.RTN_NET) RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01NOV2024','DDMMYYYY') AND TO_DATE ('30NOV2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
UNION
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, 0 SALE_NOV, 0 BILL_NO, 0 SALE_DEC, 0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, SUM(SALE_NET) SALE_OCT, COUNT(BILL_NO) BILL_OCT, 0 RTN_OCT
FROM SCENT.BILL_MAS
WHERE SC_CD='&&SC_CD'
  AND DELI_DT BETWEEN TO_DATE ('01DEC2024','DDMMYYYY') AND TO_DATE ('31DEC2024','DDMMYYYY')
  AND SALE_CD IN ('IC','IM','IN') 
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
UNION
SELECT A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID, 0 SALE_NOV , 0 BILL_NOV, 0 SALE_DEC,  0 BILL_DEC, 0 RTN_NOV, 0 RTN_DEC, 0 SALE_JAN, 0 BILL_JAN, 0 RTN_JAN, 
0 SALE_FEB, 0 BILL_FEB, 0 RTN_FEB, 0 SALE_MAR, 0 BILL_MAR, 0 RTN_MAR, 0 SALE_APR, 0 BILL_APR, 0 RTN_APR, 0 SALE_MAY, 0 BILL_MAY, 0 RTN_MAY, 0 SALE_JUN, 0 BILL_JUN, 0 RTN_JUN,
0 SALE_JUL, 0 BILL_JUL, 0 RTN_JUL, 0 SALE_AUG, 0 BILL_AUG, 0 RTN_AUG, 0 SALE_SEP, 0 BILL_SEP, 0 RTN_SEP, 0 SALE_OCT, 0 BILL_OCT, SUM(B.RTN_NET) RTN_OCT
FROM SCENT.BILL_MAS A,
     SCENT.RTN_MAS B
WHERE A.SC_CD='&&SC_CD' 
  AND A.SC_CD=B.SC_CD
  AND A.BILL_NO=B.BILL_NO
  AND B.CANCL IS NULL
  AND B.RTN_DT BETWEEN TO_DATE ('01DEC2024','DDMMYYYY') AND TO_DATE ('31DEC2024','DDMMYYYY')
  AND A.SALE_CD IN ('IC','IM','IN') 
GROUP BY A.FL_MVH, A.DIST_CD, A.THA_CD, A.UN_CD, A.CL_ID
/


DROP TABLE S1
/
CREATE TABLE S1 AS
SELECT FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID, SUM(SALE_NOV-RTN_NOV)NOV, SUM(BILL_NOV)BILL_NOV, SUM(SALE_DEC-RTN_DEC)DEC, SUM(BILL_DEC)BILL_DEC, SUM(SALE_JAN-RTN_JAN)JAN,
       SUM(BILL_JAN)BILL_JAN, SUM(SALE_FEB-RTN_FEB)FEB, SUM(BILL_FEB)BILL_FEB, SUM(SALE_MAR-RTN_MAR)MAR, SUM(BILL_MAR)BILL_MAR, SUM(SALE_APR-RTN_APR)APR, SUM(BILL_APR)BILL_APR, 
       SUM(SALE_MAY-RTN_MAY)MAY, SUM(BILL_MAY)BILL_MAY, SUM(SALE_JUN-RTN_JUN)JUN, SUM(BILL_JUN)BILL_JUN, SUM(SALE_JUL-RTN_JUL)JUL, SUM(BILL_JUL)BILL_JUL,
       SUM(SALE_AUG-RTN_AUG)AUG, SUM(BILL_AUG)BILL_AUG, SUM(SALE_SEP-RTN_SEP)SEP, SUM(BILL_SEP)BILL_SEP, SUM(SALE_OCT-RTN_OCT)OCT, SUM(BILL_OCT)BILL_OCT
FROM SS
GROUP BY FL_MVH, DIST_CD, THA_CD, UN_CD, CL_ID
/

DROP TABLE S2
/
CREATE TABLE S2 AS
SELECT A.MKT_CD, B.FL_MVH, B.DIST_CD||B.THA_CD||B.UN_CD||B.CL_ID CLIENT, B.NOV, B.BILL_NOV NOV_QTY, B.DEC, B.BILL_DEC DEC_QTY, B.JAN, B.BILL_JAN JAN_QTY, B.FEB, B.BILL_FEB FEB_QTY, B.MAR, B.BILL_MAR MAR_QTY, B.APR, B.BILL_APR APR_QTY, B.MAY, B.BILL_MAY MAY_QTY, B.JUN, B.BILL_JUN JUN_QTY, B.JUL, B.BILL_JUL JUL_QTY, B.AUG, B.BILL_AUG AUG_QTY, B.SEP, B.BILL_SEP SEP_QTY, B.OCT, B.BILL_OCT OCT_QTY
FROM SCENT.EMP_AREA A,
     S1 B
WHERE A.SC_CD='&&SC_CD'
  AND A.DIST_CD||A.THA_CD||A.UN_CD=B.DIST_CD||B.THA_CD||B.UN_CD
  AND A.PERFORM='A'
  AND A.END_DT IS NULL
GROUP BY A.MKT_CD, B.FL_MVH, B.DIST_CD||B.THA_CD||B.UN_CD||B.CL_ID, B.NOV, B.BILL_NOV, B.DEC, B.BILL_DEC, B.JAN, B.BILL_JAN, B.FEB, B.BILL_FEB, B.MAR, B.BILL_MAR, B.APR, B.BILL_APR, B.MAY, B.BILL_MAY, B.JUN, B.BILL_JUN, B.JUL, B.BILL_JUL, B.AUG, B.BILL_AUG, B.SEP, B.BILL_SEP, B.OCT, B.BILL_OCT
/

DROP TABLE S3
/
CREATE TABLE S3 AS
SELECT B.FL_MVH, A.BS_CD, B.MKT_CD, B.CLIENT, B.NOV, B.NOV_QTY, B.DEC, B.DEC_QTY, B.JAN, B.JAN_QTY, B.FEB, B.FEB_QTY, B.MAR, B.MAR_QTY, B.APR, B.APR_QTY, B.MAY, B.MAY_QTY, B.JUN, B.JUN_QTY, B.JUL, B.JUL_QTY, B.AUG, B.AUG_QTY, B.SEP, B.SEP_QTY, B.OCT, B.OCT_QTY
FROM SCENT.FP_MGR A,
     S2 B
WHERE A.SC_CD='&&SC_CD'
  AND A.MKT_CD=B.MKT_CD
  AND A.FL_MVH='1'
  AND A.FL_MVH=B.FL_MVH
GROUP BY B.FL_MVH, A.BS_CD, B.MKT_CD, B.CLIENT, B.NOV, B.NOV_QTY, B.DEC, B.DEC_QTY, B.JAN, B.JAN_QTY, B.FEB, B.FEB_QTY, B.MAR, B.MAR_QTY, B.APR, B.APR_QTY, B.MAY, B.MAY_QTY, B.JUN, B.JUN_QTY, B.JUL, B.JUL_QTY, B.AUG, B.AUG_QTY, B.SEP, B.SEP_QTY, B.OCT, B.OCT_QTY
/

SET LINE 314
SET PAGES 1000

SPOOL ON

BREAK ON REPORT SKIP-2
COMPUTE SUM OF NOV ON REPORT
COMPUTE SUM OF DEC ON REPORT

---TTITLE CENTER 'CLIENT SALES REPORT FROM 01JAN2024 AND 01JAN2024' SKIP2
 
SELECT D.CLIENT CLIENT_CD, SUBSTR(RPAD(E.CL_NM,'25'),1,25)CL_NAME, D.NOV ONE_MS, D.NOV_QTY ONEQ, D.DEC TWO_MS, D.DEC_QTY TWOQ,
       D.JAN THR_MS, D.MAR_QTY THRQ, D.FEB FOU_MS, D.FEB_QTY FOUQ, D.MAR FIV_MS, D.MAR_QTY FIVQ, D.APR SIX_MS, D.APR_QTY SIXQ, D.MAY SEV_MS, D.MAY_QTY SEVQ, D.JUN EIG_MS,
       D.JUN_QTY EIGQ, D.JUL NIN_MS, D.JUL_QTY NINQ, D.AUG TEN_MS, D.AUG_QTY TENQ, D.SEP ELE_MS, D.SEP_QTY ELEQ, D.OCT TWE_MS, D.OCT_QTY TWEQ, E.CREDIT_LIMIT
FROM SCENT.FP_BASE A,
     SCENT.RM_BASE B,
     SCENT.FM_BASE C,
     S3 D,
     SCENT.CL_INFO E,
     SCENT.UN_AREA F
WHERE A.SC_CD='&&SC_CD'
  AND A.SC_CD=C.SC_CD
  AND A.SC_CD=E.SC_CD
  AND A.SC_CD=F.SC_CD
  AND E.DIST_CD=F.DIST_CD          
  AND E.THA_CD=F.THA_CD                 
  AND E.UN_CD=F.UN_CD                  
  AND A.FPBS_CD=D.BS_CD
  AND A.RMBS_CD=B.RMBS_CD
  AND A.FMBS_CD=C.FMBS_CD
  AND D.CLIENT=E.DIST_CD||E.THA_CD||E.UN_CD||E.CL_ID
  AND D.FL_MVH='1'
  AND E.STATUS IS NULL
  AND E.CREDIT_LIMIT>'0'
GROUP BY D.CLIENT, E.CL_NM, D.NOV, D.DEC, D.NOV_QTY, D.DEC_QTY, D.JAN, D.JAN_QTY, D.FEB, D.FEB_QTY, D.MAR, D.MAR_QTY,
         D.APR, D.APR_QTY, D.MAY, D.MAY_QTY, D.JUN, D.JUN_QTY, D.JUL, D.JUL_QTY, D.AUG, D.AUG_QTY, D.SEP, D.SEP_QTY, D.OCT, D.OCT_QTY, E.CREDIT_LIMIT
ORDER BY CL_NM, CLIENT_CD
/
   
SPOOL OFF

ED ON.LST