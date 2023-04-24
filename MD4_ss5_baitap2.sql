
create table Students(
StudentID int auto_increment primary key,
studentName varchar(255),
Age varchar(2),
Email varchar(20)
);

create table Classes (
ClassID int auto_increment primary key,
ClassName varchar(255)
);

create table ClassStudent(
StudentID int ,foreign key(StudentId)references Students(StudentID),
ClassID int, foreign key(ClassID)references Classes(ClassID)
);

create table Subject(
SubjectID int auto_increment primary key,
SubjectName varchar(250)
);

create table Marks(
Mark int,
SubjectID int, foreign key(SubjectID) references Subject(SubjectID),
StudentID int ,foreign key(StudentId)references Students(StudentID)
);

insert into students(StudentName,Age,Email) values
("Nguyen Quang An",18,"an@yahoo.com"),
("Cong Vinh",20,"bitcoin@yahoo.com"),
("Nguyen QUAN",13,"card@yahoo.com"),
("Nguyen Quang HOa",19,"2060@yahoo.com"),
("Nguyen Quang ADU",19,"3060@yahoo.com");

insert into classes(ClassName) value
("C0706L"),
("C0708G");

insert into classstudent(StudentID,ClassID)values
(1,1),
(2,1),
(3,2),
(4,2),
(5,2);

insert into subject(SubjectName) value
("SQL"),
("JAVA"),
("C"),
("Visual Basic");

insert into marks(Mark,subjectID,StudentId) values
(8,1,1),
(9,2,1),
(7,1,1),
(10,1,4),
(0,1,3),
(1,3,5),
(7,2,3),
(6,2,2);

-- 1.	Hien thi danh sach tat ca cac hoc vien 
select * from students;
-- 2.	Hien thi danh sach tat ca cac mon hoc
select * from subject;
-- 3.	Tinh diem trung binh 
select avg(mark) from marks;
-- 4.	Hien thi mon hoc nao co hoc sinh thi duoc diem cao nhat
select subjectName , Mark from marks join `subject` on marks.SubjectID = `subject`.SubjectID where Mark=(select max(Mark) from marks);
-- 5.	Danh so thu tu cua diem theo chieu giam
select Mark from marks order by Mark desc;
-- 6.	Thay doi kieu du lieu cua cot SubjectName trong bang Subjects thanh nvarchar(max)
alter table `subject`
modify SubjectName varchar(255);
-- 7.	Cap nhat them dong chu « Day la mon hoc «  vao truoc cac ban ghi tren cot SubjectName trong bang Subjects
update subject set SubjectName = concat("day la mon hoc ",SubjectName) ;
-- 8 8.	Viet Check Constraint de kiem tra do tuoi nhap vao trong bang Student yeu cau Age >15 va Age < 50
alter table students
add constraint check_tuoi check(Age>15 and Age<50);
-- 9.	Loai bo tat ca quan he giua cac bang
alter table marks drop foreign key marks_ibfk_1;
alter table marks drop foreign key marks_ibfk_2;
alter table classstudent drop foreign key classstudent_ibfk_1;
alter table classstudent drop foreign key classstudent_ibfk_2;
-- 10.	Xoa hoc vien co StudentID la 1
delete from students where StudentID = 1;
-- 11.	Trong bang Student them mot column Status co kieu du lieu la Bit va co gia tri Default la 1
alter table students
add column `Status` bit default 1 after email;
-- 12.	Cap nhap gia tri Status trong bang Student thanh 0
update students set `Status` = 0;
