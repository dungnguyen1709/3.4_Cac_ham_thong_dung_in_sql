use quanlihocvien;

create table test(
    testID int primary key ,
    name varchar(20)
);

create table student(
    RN int primary key ,
    name varchar(20),
    age tinyint
);

create table studentTest(
    RN int,
    testID int,
    dateTime date,
    mark float,
    foreign key (RN) references student(RN),
    foreign key (testID) references test(testID)
);

insert into student
values (1,'Nguyen Hong Ha',20),
       (2,'Truong Ngoc Anh',30),
       (3,'Tuan Minh',25),
       (4,'Dan Truong',22);

insert into test
values (1,'EPC'),
       (2,'DWMX'),
       (3,'SQL1'),
       (4,'SQL2');

insert into studentTest
values (1,1,'2006-07-17',8),
       (1,2,'2006-07-18',5),
       (1,3,'2006-07-19',7),
       (2,1,'2006-07-17',7),
       (2,2,'2006-07-19',4),
       (2,3,'2006-07-19',2),
       (3,1,'2006-07-17',10),
       (3,3,'2006-07-18',1);

alter table student
add constraint check_age check (age between 15 and 55);

alter table studentTest
alter mark set default (0);

alter table studentTest
add primary key (RN,testID);

alter table test
add constraint unique_name unique (name);

alter table test drop constraint  unique_name;
select student.name,
       test.name,
       studentTest.mark,
       studentTest.dateTime from student,test,studentTest;

select name, age from student
where RN not in (select RN from studentTest);

select student.name,
       test.name,
       studentTest.mark,
       studentTest.dateTime from student,test,studentTest
where studentTest.mark < 5;

select student.name,
       studentTest.mark from student,studentTest









