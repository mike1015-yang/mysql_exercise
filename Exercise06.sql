# 01.請列出薪資比所有SALESMAN還低的員工
select *
from emp
where sal < (select min(sal)
               from emp
			  where job = 'SALESMAN');
# 02.請列出到職年(到職日之年)最早的兩年，那兩年到職的員工，並依到職日排序
select *
from emp
where year(hiredate) in (select *
                           from (select year(hiredate)
		                           from emp
                                  group by year(hiredate)
                                  limit 2) year_hire)
order by hiredate;
# 03.請列出主管的主管是KING的員工
select *
from emp
where mgr in (select distinct e2.empno
                from (select e2.*
                        from emp e1
                        left join emp e2
                          on e1.mgr = e2.empno) e2
				join emp e3
                  on e2.mgr = e3.empno
               where e3.ename = 'KING');
# 04.請列出部門內，員工薪資剛好有3種薪資等級之部門名稱、部門所在地
select dname,
	   loc
from dept
where deptno in (select distinct e.deptno
                   from emp e
                   join sal_level sl
                     on e.sal between sl.sal_min and sl.sal_max
                  group by e.deptno,
                           sl.level);
# 05.請列出跟員工姓名最後一字元是S的員工同部門，該部門薪資最低的員工之部門名稱、姓名、薪資
select d.dname,
       e.ename,
       e.sal
from emp e
join dept d
on e.deptno = d.deptno
where (e.sal, d.dname) in (select min(e.sal),
                                  d.dname
							 from emp e
                             join dept d
                               on e.deptno = d.deptno
                            where e.deptno in (select deptno
				                                 from emp
				                                where ename like '%S'
				                                group by deptno)
                            group by d.dname);


