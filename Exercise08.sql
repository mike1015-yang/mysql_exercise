-- 01.請啟動交易控制模式，執行以下動作..
--    刪除除了老闆以外的所有員工之資料列
--    查詢確認是否已刪除
--    還原
set autocommit = 0;
select @@autocommit;
delete from emp
where mgr is not null;
select *
from emp;
rollback;
set autocommit = 1;
-- 02.請開啟單一交易控制，執行以下動作..
--    修改除了老闆以外的所有員工，獎金+1000、薪水+15%
--    查詢確認是否已修改
--    送交
start transaction;
update emp
set comm = ifnull(comm, 0) + 1000,
    sal = sal * 1.15
where mgr is not null;
select *
from emp;
commit;
-- 03.今天公司空降了一位主管ERIC，員工編號:6666，職稱:MANAGER，主管:7839，薪資:
--    3500，部門編號:50。另外原本就在職的2位員工7499、7844調至部門編號50，且主管改為50
--  6666。請開啟單一交易控制，將上述動作在一個交易內完成
start transaction;
insert into emp(empno, ename, job, mgr, hiredate, sal, deptno)
	values (6666, 'ERIC', 'MANAGER', 7839, now(), 3500, 50);
update emp
set deptno = 50,
    mgr = 6666
where empno in (7499, 7844);
commit;
