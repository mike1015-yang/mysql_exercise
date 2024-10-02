# 01. 請列出部門編號、部門平均薪資，只顯示部門平均薪資大於2500的部門
select 
	deptno,
    avg(sal)
from emp
group by
	deptno
having avg(sal) > 2500;
# 02. 請列出到職年、該年到職人數，只顯示到職年當年人數等於1的資料
select 
	year(hiredate) as 到職年,
    count(*) as 該年到職人數
from emp
group by
	year(hiredate)
having
	count(*) = 1;
# 03. 請列出部門編號、部門每月發出薪資總和，只顯示部門每月發出薪資總和小於10000的部門，並依部門編號遞減排序
select 
	deptno,
    sum(sal) as 月薪總和
from emp
group by deptno
having
	sum(sal) < 10000
order by deptno desc;
# 04. 請列出職稱、職稱平均薪資、職稱人數，只顯示職稱平均薪資大於2000 且 職稱人數小於2的資料
select 
	job,
    avg(sal) as 職稱平均薪資,
    count(*) as 職稱人數
from emp
group by 
	job
having 
	avg(sal) > 2000 and
    count(*) < 2;
# 05. 請列出部門編號、部門最低薪資、部門最高薪資，且過濾掉最低薪資大於1200的資料
select 
	deptno,
    min(sal) as 部門最低薪資,
    max(sal) as 部門最高薪資
from emp
group by deptno
having 部門最低薪資 <= 1200;
