CREATE TABLE SAJIB AS 
SELECT A.FL_MVH,A.RM_ID,A.FM_ID,A.FP_ID,A.SC_CD,a.dist_cd,a.tha_cd,a.un_cd,a.cl_id,A.PAY_MODE,a.sale_cd,a.bill_no,A.SALE_NET,A.BILL_DT,A.DELI_DT,SUM(B.OUT_AMNT) out,TO_DATE('&&LAST_DELI_DATE')-a.deli_dt days FROM 
SCENT.bill_MAS A,SCENT.OUT_DET B 
WHERE A.BILL_NO=B.BILL_NO AND A.SC_CD=B.SC_CD AND 
	B.SEQ IN (SELECT MAX(SEQ) FROM SCENT.OUT_DET WHERE BILL_NO=A.BILL_NO AND SC_CD=A.SC_CD and out_dt<='&LAST_DELI_DATE') AND 
A.DELI_DT<='&LAST_DELI_DATE' AND A.SC_CD='&&SC_CD' AND A.SC_CD=B.SC_CD 
GROUP BY A.FL_MVH,A.FP_ID,A.RM_ID,A.FM_ID,A.SC_CD,a.dist_cd,a.tha_cd,a.un_cd,a.cl_id,a.bill_no,A.BILL_DT,a.deli_dt,A.PAY_MODE,a.sale_cd,a.sale_net,A.DELI_DT,A.BILL_DT,A.SALE_NET
/
commit;


SET LINES 125
set pages 5000
column out format 9,99,99,999.99

compute sum of out on report
compute COUNT of bill_no on report
break on report skip-2

SPOOL ON

select distinct A.FP_ID,substr(d.emp_nm,1,20) fp_name,substr(c.cl_nm,1,20) client_name,a.sale_cd,a.bill_no,a.deli_dt,a.sale_net BILL_AMT,a.out out,a.days,C.OUT_DAY 
from
SAJIB a, SCENT.FP_MGR B, SCENT.cl_info c,pims.emp_mast d, SCENT.FP_BASE E where
a.fp_id=d.emp_id and
a.dist_cd=c.dist_cd and
a.tha_cd=c.tha_cd and
a.un_cd=c.un_cd and
a.cl_id=c.cl_id and
B.BS_CD=E.FPBS_CD AND
A.SC_CD=E.SC_CD AND
A.FP_ID=B.FP_ID AND
A.FL_MVH=E.FL_MVH AND 
a.out>'0' and
a.days >31 and
A.PAY_MODE='0' AND
A.fl_mvh='&DIV_CD' AND A.SALE_CD IN('WM','WO','RC','WS') AND A.SC_CD='&SC_CD' AND A.SC_CD=B.SC_CD AND A.SC_CD=C.SC_CD AND A.SC_CD=E.SC_CD AND B.SC_CD=E.SC_CD 
order by a.days
/
SPOOL OFF

ED ON.LST

DROP TABLE SAJIB
/

