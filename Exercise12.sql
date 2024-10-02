-- 01.請替資料表DEPT的欄位DNAME，新建唯一索引，並給予適當的Index名稱
create unique index IDX_DEPT_DNAME
on dept(dname);
-- 02.請替資料表EMP的欄位(DEPTNO,ENAME)，新建複合索引，Index名稱為
-- IDX_EMP_DEPTNO&ENAME
create index `IDX_EMP_DEPTNO&ENAME`
on EMP(deptno,ename);

-- 03.請新建一個資料表PERSON，欄位描述如下..
create table PERSON(
ID int not null,
NAME varchar(50) not null,
primary key(ID),
index IDX_PERSON_NAME(name)
);
-- 04.請使用altertable敘述，替資料表DEPT的欄位(DNAME,LOC)加入複合索引
alter table dept
add index `IDX_DEPT_DNAME&LOC`(dname,loc); 
-- 05.請移除第04題建立的索引
drop index `IDX_DEPT_DNAME&LOC` on dept;





