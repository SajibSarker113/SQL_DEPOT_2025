SET LINE 300

select 'Mr. '||INITCAP(a.emp_nm)||' ('|| a.emp_id || ')' as Name_ID, INITCAP(b.desg_nm) DESIGNATION, A.WK_DT , A.GRD_CD
from pims.emp_mast a,pims.emp_desg b
where a.grd_cd=b.grd_cd and
a.desg_cd=b.desg_cd 
and a.emp_id in '&Employee_ID'
order by a.emp_id;


