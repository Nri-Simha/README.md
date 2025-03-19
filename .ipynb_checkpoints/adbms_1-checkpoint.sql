


create table teaches2 as select * from teaches;
alter table teaches2
add constraint check_semester
check(semester In ('Fall', 'Winter', 'Spring', 'Summer'));

create index ID on teaches2;
drop index on teaches2;
