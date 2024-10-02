# 01. 請列出薪資不介於 1000 到 2000 的員工之 姓名 和 薪資
select 
	ENAME,
    SAL
from EMP
where 
	SAL not between 1000 and 2000;
# 02. 請列出到職年(到職日之年)為1981的員工之姓名、職稱、到職日，並依到職日遞減排序
select 
	ENAME,
    JOB,
    HIREDATE
from EMP
where 
	HIREDATE like '1981%'
order by
	HIREDATE desc;
# 03. 請列出薪資超過2000 且 部門編號為10或30 的員工之姓名、薪資，並依序取別名為 "EMPLOYEE_NAME"、"SALARY"
select
	ename as EMPLOYEE_NAME,
    sal as SALARY
from EMP
where 
	sal > 2000 and DEPTNO in (10, 30);
# 04. 請列出有獎金(獎金 不是null，也不是0)的員工之姓名、薪資、獎金，並排序，排序依據為薪資加上獎金
select 
	ENAME,
    SAL,
    COMM
from EMP
where
	COMM is not null and COMM != 0
order by
	SAL + COMM;
# 05. 請列出員工姓名最後一個字是"S"的員工之姓名、職稱
select 
	ENAME,
    JOB
from EMP
where ENAME like '%S';
# 06. 請列出職稱為CLERK、SALESMAN，且薪資不等於1100、1300、1500的員工之姓名、職稱、薪資
select
	ENAME,
    JOB,
    SAL
from EMP
where
	JOB in ('CLERK', 'SALESMAN') and
    SAL not in (1100, 1300, 1500);
# 07. 請列出獎金大於薪資1.05倍的員工之姓名、薪資、獎金
select 
	ENAME,
    SAL,
    COMM
from EMP
where
	COMM > SAL * 1.05;