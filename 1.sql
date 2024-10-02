# DELIMITER:改變分隔符號 ; ---> $$
DELIMITER $$ 
# function
create function FN_GET_CIRCLE_AREA(radius float) returns float
# deterministic: 優化器
deterministic no sql
begin
	declare area float;
	set area = PI() * radius * radius;
	return area;
end $$
DELIMITER ;
select FN_GET_CIRCLE_AREA(10);

# store procedure
# in:傳進去的參數, out:傳出去的參數
DELIMITER $$ 
create procedure SP_GET_CIRCLE_AREA(in radius float, out area float)
begin
	set area = PI() * radius * radius;
end $$
DELIMITER ;
# 呼叫store procedure
call SP_GET_CIRCLE_AREA(10, @area);
select @area;
# trigger
# 當執行某動作時(after insert on emp),會執行某段程式
DELIMITER $$ 
create trigger TG_TEST after insert on EMP for each row
begin
	insert into TEST(EMPNO, LOGTIME)
	values(NEW.EMPNO, NOW());
end $$
DELIMITER ;
# event(排程)
# 新建名為EV_TEST的event
create event EV_TEST
# 每秒執行一次
on schedule every 1 second
# 馬上執行
starts current_timestamp
# 新增資料至資料表TEST
do
	insert into TEST(TIME) values(NOW());
# 停用event
alter event EV_TEST
disable;

select 
	deptno,
    rank()over(
    partition by deptno
    order by sal desc
    ) as 組內排名,
    ename,
    sal
from emp;

with recursive test as (
select 1 as level, empno, ename
from emp
where mgr is null
union all
select t.level + 1, e.empno, ename
from emp e
join test t
on e.mgr = t.empno)
select *
from test

