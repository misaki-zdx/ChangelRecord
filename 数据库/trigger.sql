-- DML 针对 insert,delete,update
-- DDL 针对 create,drop,alter

--触发器
alter trigger tr_test on teacher 
for insert 
as
begin
declare @tnos int
select @tnos =  count(*) from teacher
if(@tnos>=8)
begin
print '不招了'
rollback transaction
end
end

select * from teacher
select getdate()
insert into teacher values('0011','小华','男',1993-7-8,getdate(),'北京')
delete from teacher where tname='小华'