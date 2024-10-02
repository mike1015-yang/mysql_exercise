# 01. 請列出所有員工的員工編號、姓名、職稱、部門編號及部門名稱
select
	e.empno,
	e.ename,
    e.job,
    e.deptno,
    d.dname
from 
	emp e
    join dept d
    on e.deptno = d.deptno;
# 02. 請列出所有部門編號為30 且 職稱為"SALESMAN"之部門名稱、員工姓名、獎金
select 
	d.dname,
    e.ename,
    e.comm
from 
	emp e
    join dept d
    on e.deptno = d.deptno
where e.deptno = 30 and e.job = 'SALESMAN';
# 03. 請列出薪水等級為"B"的員工之員工編號、員工姓名、薪資
select 
	e.empno,
    e.ename,
    e.sal
from 
	emp e
    join sal_level sl
    on e.sal between sl.sal_min and sl.sal_max
where sl.level = 'B';
# 04. 請列出部門編號、部門名稱及部門人數
select 
	d.deptno,
    d.dname,
    count(e.empno) as 部門人數
from 
	dept d
    left join emp e
	on e.deptno = d.deptno
group by 
		 d.deptno;
# 05. 請列出每個主管之姓名、直屬下屬人數、直屬下屬平均薪資，並依 直屬下屬人數遞減、主管姓名遞增 排序
select 
    e2.ename,
    count(*) as 直屬下屬人數,
    avg(e1.sal) as 直屬下屬平均薪資
from 
	emp e1
    join emp e2
    on e1.mgr = e2.empno
group by e2.ename
order by 直屬下屬人數 desc,
         e2.ename;

