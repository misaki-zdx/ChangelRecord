-- DML ��� insert,delete,update
-- DDL ��� create,drop,alter

--������
alter trigger tr_test on teacher 
for insert 
as
begin
declare @tnos int
select @tnos =  count(*) from teacher
if(@tnos>=8)
begin
print '������'
rollback transaction
end
end

select * from teacher
select getdate()
insert into teacher values('0011','С��','��',1993-7-8,getdate(),'����')
delete from teacher where tname='С��'