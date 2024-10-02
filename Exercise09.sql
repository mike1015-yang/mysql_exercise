/* 01. 請新建 會員資料表MEMBER，欄位描述如下..
 *
 *	Column Name			Data Type	Length	Not Null	Default	PK?	auto_increment	Comment
 *	------------------------------------------------------------------------------------------
 *	ID					int						Y	 			 Y	      Y			編號
 *	USERNAME			varchar		    50											使用者名稱
 *	PASSWORD			varchar		    50											密碼
 *	PASS				bit			     1		Y			0						帳號啟用記號
 *  CREATOR				varchar		   100		Y		'SYSTEM'					建立者
 *	CREATED_DATE		datetime				Y		  NOW()						建立日期時間
 *  UPDATER				varchar		   100				'SYSTEM'					修改者
 *	LAST_UPDATED_DATE	datetime													
 *  SESSION_ID			char			32											
 *	------------------------------------------------------------------------------------------
 */
create table MEMBER(
	ID int not null auto_increment comment '編號',
    USERNAME varchar(50) comment '使用者名稱',
    PASSWORD varchar(50) comment '密碼',
    PASS bit(1) not null default 0  comment '帳號啟用記號',
    CREATOR varchar(100) not null default 'SYSTEM' comment '建立者',
    CREATED_DATE datetime not null default now() comment '建立日期時間',
    UPDATER varchar(100) default 'SYSTEM' comment '修改者',
    LAST_UPDATED_DATE datetime,
    SESSION_ID char(32),
    primary key(ID)
)comment = '會員資料表';
/* 02. 請替資料表MEMBER的欄位PASSWORD之後加入一欄位..
 *
 *	Column Name			Data Type	Length	Not Null	Default	PK?	auto_increment	Comment
 *	------------------------------------------------------------------------------------------
 *	NICKNAME			varchar		   100		Y									暱稱
 *	------------------------------------------------------------------------------------------
 */
alter table MEMBER
add column NICKNAME varchar(100) not null comment '暱稱' after PASSWORD;
 /* 03. 請修改資料表MEMBER的欄位
 * 	   USERNAME、PASSWORD: not null、長度100
 * 	   LAST_UPDATED_DATE: 預設值NOW()、註解"最後修改日期時間"
 */
alter table MEMBER
change column USERNAME USERNAME varchar(100) not null comment '使用者名稱',
change column PASSWORD PASSWORD varchar(100) not null comment '密碼',
change column LAST_UPDATED_DATE LAST_UPDATED_DATE datetime default now() comment '最後修改日期時間';
# 04. 請將資料表MEMBER的欄位USERNAME設為唯一鍵
alter table MEMBER
add constraint UK_MEM_USERNAME unique key(USERNAME);
# 05. 請將資料表MEMBER的欄位USERNAME的唯一鍵約束移除
alter table MEMBER
drop constraint UK_MEM_USERNAME;
# 06. 請將資料表MEMBER的欄位SESSION_ID移除
alter table MEMBER
drop column SESSION_ID;
# 07. 請新建資料表 MEMBER2、MEMBER3，2個資料表的結構跟資料須與資料表MEMBER一樣
create table MEMBER2
as
select *
from MEMBER;
create table MEMBER3
as
select *
from MEMBER;
# 08. 請將資料表MEMBER2改名為MEMBER_HIS
alter table MEMBER2
rename to MEMBER_HIS;
# 09. 請將資料表MEMBER3截斷(truncate)
truncate table MEMBER3;
# 10. 請將資料表MEMBER3的儲存引擎改為MyISAM
alter table MEMBER3
engine MyISAM;
# 11. 請將資料表MEMBER3移除
drop table MEMBER3;
 
 
 
 
 
 
 
 
