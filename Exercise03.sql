# 01. 請列出公司一年需發出薪資總和 (不含獎金)
select 
	sum(sal)*12 as 一年薪資總和
from emp;
# 02. 請列出公司平均月薪
select
	avg(sal) as 平均月薪
from emp;
# 03. 請列出各部門編號、部門每月發出薪資總和，並依部門編號遞增排序
select 
	deptno,
    sum(sal) as 月薪總和
from emp
group by deptno
order by deptno;
# 04. 請列出職稱、職稱平均薪資、職稱人數
select 
	job,
    avg(sal) as 職稱平均薪資,
    count(*) as 職稱人數
from emp
group by 
	job;
# 05. 請列出部門編號、部門最低薪資、部門最高薪資
select 
	deptno,
    min(sal) as 部門最低薪資,
    max(sal) as 部門最高薪資
from emp
group by deptno
order by deptno;
# 06. 請列出到職年、該年到職人數
select 
	year(hiredate) as 到職年,
    count(*) as 該年到職人數
from emp
group by
	year(hiredate)