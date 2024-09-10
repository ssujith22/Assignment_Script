use classicmodels;

CREATE TABLE Student (
StdID INT(4) PRIMARY KEY, StdName VARCHAR(30) NOT NULL,
Sex VARCHAR(1), Percentage DECIMAL(5,2), SClass INT ,
Sec VARCHAR(1), Stream VARCHAR(10), DOB DATE );

truncate table Student;

INSERT INTO Student VALUES (1001,'AKSHRA AGARWAL','F', 70, 11 ,'A', 'Science', '1996-11-10');
INSERT INTO Student VALUES (1002, 'ANJANI SHARMA','F', 75, 11 ,'A','Commerce','1996-09-18');
INSERT INTO Student VALUES (1003, 'ANSHUL SAXENA','M', 78, 11 ,'A','Commerce','1996-11-19');
INSERT INTO Student VALUES (1004, 'AISHWARYA SINGH','F', 79, 11 ,'A','Commerce','1996-11-01');
INSERT INTO Student VALUES (1005, 'AKRITI SAXENA','F', 76, 11 ,'A','Commerce','1996-09-20');
INSERT INTO Student VALUES (1006, 'KHUSHI AGARWAL','F', 77, 11 ,'A','Commerce','2003-09-14');
INSERT INTO Student VALUES (1007, 'MAAHI AGARWAL','F', 74, 11 ,'A','Science','1997-04-21');
INSERT INTO Student VALUES (1008, 'MITALI GUPTA','F', 78, 12 ,'A','Science','1997-11-26');
INSERT INTO Student VALUES (1009, 'NIKUNJ AGARWAL','M', 58, 12 ,'A','Science','1997-07-12');
INSERT INTO Student VALUES (1010, 'PARKHI','F', 59, 12 ,'A','Commerce','1997-12-20');
INSERT INTO Student VALUES (1011, 'PRAKHAR TIWARI','M', 43, 12 ,'A','Science','1997-04-22');
INSERT INTO Student VALUES (1012, 'RAGHAV GANGWAR','M', 58, 12 ,'A','Commerce','1997-12-21');
INSERT INTO Student VALUES (1013, 'SAHIL SARASWAT','M', 57, 12 ,'A','Commerce','1997-08-13');
INSERT INTO Student VALUES (1014, 'SWATI MISHRA','F', 98, 11 ,'A','Science','1996-08-13');
INSERT INTO Student VALUES (1015, 'HARSH AGARWAL','M', 58, 11 ,'B','Science','2003-08-28');
INSERT INTO Student VALUES (1016, 'HARSHIT KUMAR','M', 98, 11 ,'B','Science','2003-05-22');
INSERT INTO Student VALUES (1017, 'JAHANVI KAPOOR','M', 65, 11 ,'B','Science','1997-01-10');
INSERT INTO Student VALUES (1018, 'STUTI MISHRA','M', 66, 11 ,'C','Commerce','1996-01-10');
INSERT INTO Student VALUES (1019, 'SURYANSH KUMAR AGARWAL','M', 85, 11 ,'C','Commerce','2007-08-22');
INSERT INTO Student VALUES (1020, 'TANI RASTOGI','F', 75, 12 ,'C','Commerce','1998-01-15');
INSERT INTO Student VALUES (1021, 'TANISHK GUPTA','M', 55, 12 ,'C','Science','1998-04-11');
INSERT INTO Student VALUES (1022, 'TANMAY AGARWAL','M', 57, 11 ,'C','Commerce','1998-06-28');
INSERT INTO Student VALUES (1023, 'YASH SAXENA','M', 79, 11 ,'C','Science','1998-03-13');
INSERT INTO Student VALUES (1024, 'YESH DUBEY','M', 85, 12 ,'C','Commerce','1998-04-03');

SELECT * FROM student ;
SELECT StdName, DOB FROM student ;
SELECT * FROM student WHERE percentage >= 80;
SELECT StdName, Stream, Percentage from student WHERE percentage > 80;
SELECT * from student WHERE  percentage > 75 and Stream = 'Science' ;

DESCRIBE Student;
ALTER TABLE Student ADD TeacherID VARCHAR(20);
DESC Student;
SELECT * FROM student;
ALTER TABLE Student MODIFY TeacherID INTEGER ;
DESC Student;
SELECT * FROM student;

ALTER TABLE Student DROP TeacherID;
SELECT stdname, percentage - 5 FROM Student;
SELECT StdName AS 'Student Name',DOB As 'Date of Birth' FROM Student;
SELECT StdName FROM student WHERE Stream<>'Science';
SELECT StdName, percentage FROM student WHERE percentage >=60 AND
percentage<=80 ;

UPDATE Student SET StdName = 'SWATI VERMA', percentage = 86 WHERE StdId = 1014;
DELETE FROM Student WHERE StdID = 1016;
SELECT * FROM Student WHERE StdName LIKE 'G_' ;
SELECT * FROM Student WHERE StdName='G';
SELECT * FROM Student WHERE StdName LIKE 'G%' ;
SELECT * FROM Student WHERE StdName = '%G%' ;
SELECT DISTINCT Stream FROM Student;
SELECT StdName, Sex, Stream FROM Student WHERE percentage BETWEEN 70 AND 80;



select * from student where stdname like '__A%'

