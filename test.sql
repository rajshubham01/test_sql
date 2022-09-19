show databases;
create database airline;
create table passenger ( cust_id int PRIMARY KEY AUTO_INCREMENT,cust_name varchar(255), gender varchar(255), age int, cust_email varchar(255), cust_add varchar(255), destination varchar(255));

insert into passenger values(NULL, 'Vikrant Singh', 'M', 21, 'vikrant@mail', 'Unnao', 'Lucknow');
insert into passenger values(NULL, 'Ritu Raj', 'M', 21, 'ritu@mail', 'Patna', 'Patna');
insert into passenger values(NULL, 'Siddharth Singh ', 'M', 21, 'vikrant@mail', 'Arrah', 'Patna');
insert into passenger values(NULL, 'Satyam Singh', 'M', 21, 'satyam@mail', 'Baliya', 'Varanasi');
insert into passenger values(NULL, 'Shubham Raj', 'M', 21, 'shubh@mail', 'patna', 'Patana');
insert into passenger values(NULL, 'Rishi MK', 'M', 21, 'rish@mail', 'Mysore', 'Mysore');

select * from passenger;

create table flightinfo (f_id int NOT NULL , airline_name varchar(255), airline_id varchar(255), from_location varchar(20), to_location varchar(20), depart_time DATETIME, arrive_time DATETIME);

create table flightdetails ( f_id varchar(255), depart_time DATETIME, total_seats int,price int);

alter table flightdetails add constraint  primary key (f_id);

alter table flightinfo add foreign key(f_id) references flightdetails(f_id);

insert into flightdetails values ( 11, '2022-09-01 12:00:00', 250, 5000);
insert into flightdetails values ( 12, '2022-09-01 12:05:00', 250, 4500);
insert into flightdetails values ( 13, '2022-09-01 12:10:00', 250, 4800);
insert into flightdetails values ( 14, '2022-09-01 12:08:00', 250, 5000);
insert into flightdetails values ( 15, '2022-09-01 11:00:00', 250, 2500);
insert into flightinfo values (11, 'Indigo', 1, 'Bengaluru', 'Lucknow', '2022-09-01 12:00:00', '2022-09-01 02:00:00');
insert into flightinfo values (12, 'Indigo', 1, 'Bengaluru', 'Patna', '2022-09-01 12:05:00', '2022-09-01 02:00:00');
insert into flightinfo values (13, 'GoAir', 2, 'Bengaluru', 'Varanasi', '2022-09-01 12:10:00', '2022-09-01 02:00:00');
insert into flightinfo values (14, 'GoAir', 2, 'Bengaluru', 'Mysore', '2022-09-01 12:08:00', '2022-09-01 02:00:00');

select * from flightinfo;
select * from flightdetails;
select * from passenger;

create table boardingpass (cust_id int , f_id int);

alter table boardingpass add foreign key(cust_id) references passenger(cust_id);

alter table boardingpass add foreign key(f_id) references flightdetails(f_id);

insert into boardingpass values(1,11);
insert into boardingpass values(2,12);
insert into boardingpass values(3,12);
insert into boardingpass values(4,13);
insert into boardingpass values(5,12);
insert into boardingpass values(6,14);

select * from boardingpass;

select p.cust_id as CUSTOMER_ID, fd.f_id AS FLIGHT_ID, p.cust_name as CUSTOMER_NAME,fi.airline_id, fi.airline_name, fi.from_location, fi.to_location, fi.depart_time, fi.arrive_time, fd.price from passenger p, flightinfo fi, flightdetails fd , boardingpass b where b.cust_id=p.cust_id AND fi.f_id=fd.f_id AND b.f_id=fi.f_id;