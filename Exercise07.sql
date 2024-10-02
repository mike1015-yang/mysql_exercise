# 01.請新增以下資料至資料表DEPT
insert into dept
values(50,'Software','Taipei');
# 02.請新增以下資料至資料表EMP的欄位EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO
insert into emp(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,DEPTNO)
values(9999,'William','PG',null,NOW(),2500,50),
      (8888,'Lee','PM',null,NOW(),3500,50);
# 03.請修改資料表EMP的資料.. 
update 
	emp
set 
	mgr = 7839
where empno = 8888;
update 
	emp
set 
	mgr = 8888
where empno = 9999;
# 04.請刪除員工編號為8888的員工之資料
delete from emp
where empno = 8888;
# 05.請修改資料表EMP的資料..將員工9999的主管改為7839，薪水改為4000
update emp
set 
	mgr = 7839,
    sal = 4000
where empno = 9999;

