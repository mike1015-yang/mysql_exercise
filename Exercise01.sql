# 01. 請撰寫一select敘述，查詢Table: DEPT，列出所有資料列
select * 
from dept;
/* 02. 請撰寫一select敘述，查詢Table: EMP，列出所有員工的姓名(ENAME)、職稱(JOB)、到職日(HIREDATE)、
   及員工編號(EMPNO)，員工編號須顯示在第一欄
*/
select 
	EMPNO,
    ENAME,
    JOB,
    HIREDATE
from emp;
# 03. 請撰寫一select敘述，查詢Table: EMP，列出不同的到職日(HIREDATE) (去除重複的到職日)
select 
	distinct HIREDATE
from emp;
/* 04. 續第02題，請將select敘述加上別名..
 * 		ENAME → EmployeeName
 * 		JOB → Title
 * 		HIREDATE → HireDate
 * 		EMPNO → EmployeeNo
 */
select 
	empno as EmployeeName,
    ename as Title,
    job as HireDate,
    hiredate as EmployeeNo
from emp;
/* 05. 請撰寫一select敘述，查詢Table: EMP，列出員工姓名(ENAME) 串接 職稱(JOB)，
   中間用逗號和空白隔開(', ')，並加上別名 NAMEandTITLE
*/   
select 
	concat(ename, ', ', job) as NAMEandTITLE
from emp;