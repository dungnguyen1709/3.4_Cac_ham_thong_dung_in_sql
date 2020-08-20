use baitap;

create table student(
    id int  ,
    ten varchar(20),
    tuoi tinyint,
    khoahoc varchar(10),
    sotien int
);

insert into student
values (1,'Hoang',21,'CNTT',400000),
       (2,'Viet',19,'DTVT',320000),
       (3,'Thanh',18,'KTDN',400000),
       (4,'Nhan',19,'CK',450000),
       (5,'Huong',20,'TCNH',500000),
       (5,'Huong',20,'TCNH',200000);

select * from student where ten = 'Huong' group by sotien;
select
select * from  student  group by ten;