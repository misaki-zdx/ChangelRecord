--60以下 增加20% 
--60-80  增加18%  不超过90
--80-90  增加15%  不超过100
select * from student


drop procedure pro_addScore

create procedure pro_addscore
as
begin
	declare cur_score cursor for select sno,avgscore from student order by avgscore 
	open cur_score
	declare @tempScore float,@sno char(8),@count int = 0,@j int = 0
	select @count=COUNT(*) from student
	print '============================================'
while(@j<@count)
begin
fetch next from cur_score into @sno , @tempScore
--print @tempScore
--print @@fetch_status
if(@tempScore<60)
	begin
	set @tempScore = @tempScore*1.2 
	end
	else if(@tempScore<80)
	begin
		set @tempScore = @tempScore*1.18
				if(@tempScore>=90) 
					begin
					set @tempScore = 90
					end

	end
else
	begin
		set @tempScore = @tempScore*1.15
						if(@tempScore>=100) 
							begin
							set @tempScore = 100
							end

	end
	set @j=@j+1
update student set avgscore = @tempScore where sno =@sno
end
print '============================================='
close cur_score
deallocate cur_score
end


alter procedure pro_addscore
as
begin
	declare cur_score cursor for select sno,avgscore from student order by avgscore 
	open cur_score
	declare @tempScore float,@sno char(8),@count int = 0,@j int = 0
	select @count=COUNT(*) from student
	print '============================================'
while(@j<@count)
begin
fetch next from cur_score into @sno , @tempScore
print @tempScore
set @j=@j+1
print @@fetch_status
end
print '============================================='
close cur_score
deallocate cur_score
end

 exec pro_addscore
 select * from student