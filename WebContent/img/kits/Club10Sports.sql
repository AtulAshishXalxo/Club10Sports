create table category(Id NUMBER(12),Sports VARCHAR2(50) PRIMARY Key Not Null); 

create table Shorts(Sports varchar2(50) primary KEY Not null,type VARCHAR2(50),price number(5),sizes varchar2(50));

create table Jersy(Sports varchar2(50) primary KEY Not null,type VARCHAR2(50),price number(5),sizes varchar2(50));
create table Shoes(Sports varchar2(50) primary KEY Not null,type VARCHAR2(50),price number(5),sizes varchar2(50));
INSERT into shorts values('Football','Shorts','200','M');
insert into category values('001','Football');
SELECT sports FROM category  JOIN shorts ON category.sports = Shorts.sports;

desc category
desc Jersy
desc Shoes

select * from category;

select * from shorts;
insert into Account(Ac_no,Name,Balance) values(1234567890,'Atul',1100000);

select * from Jersy where sports in (select sports from category);

