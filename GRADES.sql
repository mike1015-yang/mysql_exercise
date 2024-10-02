CREATE TABLE `GRADES` (
  `CLASSID` char(1) NOT NULL,
  `CATEGORY` varchar(45) NOT NULL,
  `STUDENTID` char(4) NOT NULL,
  `GRADE` int NOT NULL,
  PRIMARY KEY (`CLASSID`,`CATEGORY`,`STUDENTID`)
);

INSERT INTO `GRADES` VALUES ('A','國文','A001',86),('A','國文','A002',33),('A','國文','A003',100),('A','數學','A001',97),('A','數學','A002',50),('A','數學','A003',30),('A','英文','A001',100),('A','英文','A002',77),('A','英文','A003',99),('B','國文','B001',50),('B','國文','B002',55),('B','國文','B003',1),('B','數學','B001',60),('B','數學','B002',100),('B','數學','B003',50),('B','英文','B001',70),('B','英文','B002',98),('B','英文','B003',99);