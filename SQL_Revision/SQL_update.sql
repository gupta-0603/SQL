create database project_1
use project_1
select gender,count(*) from depression
group by gender
select *from depression
update depression
set gender= 'F' where gender= 'Female'
update depression
set gender= 'M' where gender= 'Male'
select * from depression
where gender is null
select age,count(*) from depression
group by age
order by age desc
alter table depression
add age_group varchar(200)
select * from depression
update depression
set age_group=
case when age between 18 and 24 then 'a1'
else case when age between 25 and 30 then 'a2'
else 'a3'
end end
select age_group,count(*) from depression
group by age_group
select * from depression
use 
alter table depression
add idno int primary key auto_increment first



















