﻿create database m2
use m2
go
CREATE PROCEDURE createAllTables   
AS
create table SystemUser(
username varchar(20) ,
password varchar(20),
Primary Key(username)

)

create table Stadium(
ID int IDENTITY,
Name varchar(20),
Status BIT DEFAULT '1',
Location varchar(20),
Capacity int,
Primary Key(ID)
)

create table Club(
ID int IDENTITY,
Name varchar(20),
Location varchar(20),
Primary Key(ID)
)

create table StadiumManager(
username varchar(20), 
ID int IDENTITY,
Name varchar(20),
Stadium int UNIQUE,
Primary Key(ID),
Foreign Key(username) references SystemUser(username) on DELETE  Cascade on UPDATE  Cascade,
Foreign Key(Stadium) references Stadium(ID) on DELETE Cascade on UPDATE Cascade
)

create table ClubRepresentative(
username varchar(20), 
ID int IDENTITY,
Name varchar(20),
Primary Key(ID),
Club int UNIQUE,
Foreign Key(username) references SystemUser(username) on DELETE Cascade on UPDATE Cascade,
Foreign Key(Club) references Club(ID) on DELETE Cascade on UPDATE Cascade 

)


create table Fan(
username varchar(20),
NationalID varchar(20),
Phone int,
Name varchar(20),
Address varchar(20),
Status BIT DEFAULT '1',
BirthDate datetime,
Primary Key(NationalID),
Foreign Key(username) references SystemUser(username) on DELETE Cascade on UPDATE Cascade

)

create table SportsAssociationManager(
username varchar(20), 
ID int IDENTITY,
Name varchar(20),
Primary Key(ID),
Foreign Key(username) references SystemUser(username)on DELETE Cascade on UPDATE Cascade
 
)


create table SystemAdmin(
username varchar(20), 
ID int IDENTITY,
Name varchar(20),
Primary Key(ID),
Foreign Key(username) references SystemUser(username) on DELETE Cascade on UPDATE Cascade

)

create table Match(
ID int IDENTITY,
StartTime datetime,
EndTime datetime,
HostClub int,
GuestClub int,
Stadium int,
Primary Key(ID),
Foreign Key(HostClub) references Club(ID) on DELETE Cascade on UPDATE  NO ACTION ,	 
Foreign Key(GuestClub) references Club(ID) on DELETE NO ACTION on UPDATE NO ACTION, 
Foreign Key(Stadium) references Stadium(ID) on DELETE Cascade on UPDATE Cascade


)



create table Ticket(
ID int IDENTITY,
Status BIT DEFAULT '1',
NationalID varchar(20),
Match int,
Primary Key(ID),
Foreign Key(NationalID) references Fan(NationalID) on DELETE Cascade on UPDATE Cascade,
Foreign Key(Match) references Match(ID) on DELETE Cascade on UPDATE Cascade

)

create table HostRequest(
ID int IDENTITY,
Match_ID int,
Status varchar(20) DEFAULT 'unhandled' , CHECK (Status IN ('unhandled' , 'accepted' , 'rejected')),
ClubRepresentative int,
StadiumManager int,
Primary Key(ID),
Foreign Key(ClubRepresentative) references ClubRepresentative(ID) on DELETE Cascade on UPDATE Cascade, 
Foreign Key(StadiumManager) references StadiumManager(ID) on DELETE NO ACTION on UPDATE NO ACTION,
Foreign Key(Match_ID) references Match(ID) on DELETE NO ACTION on UPDATE NO ACTION
)
GO
EXEC createAllTables
go
CREATE PROCEDURE dropAllTables
AS
drop table HostRequest , Ticket , Match , ClubRepresentative , StadiumManager, Club , Stadium , SystemAdmin , SportsAssociationManager , Fan , SystemUser
GO

CREATE PROCEDURE dropAllProceduresFunctionsViews
AS
drop procedure createAllTables
drop procedure dropAllTables
drop procedure clearAllTables
drop procedure addAssociationManager
drop procedure addNewMatch
drop procedure deleteMatch
drop procedure deleteMatchesOnStadium
drop procedure addClub
drop procedure addTicket
drop procedure deleteClub
drop procedure addStadium
drop procedure deleteStadium
drop procedure blockFan
drop procedure unblockFan
drop procedure addRepresentative
drop procedure addHostRequest
drop procedure addStadiumManager
drop procedure acceptRequest
drop procedure rejectRequest
drop procedure addFan
drop procedure purchaseTicket
drop procedure updateMatchHost
drop view allAssocManagers
drop view allClubRepresentatives
drop view allStadiumManagers
drop view allFans
drop view allMatches
drop view allTickets
drop view allCLubs
drop view allStadiums
drop view allRequests
drop view clubsWithNoMatches
drop view matchesPerTeam
drop view clubsNeverMatched
drop function viewAvailableStadiumsOn
drop function allUnassignedMatches
drop function allPendingRequests
drop function upcomingMatchesOfClub
drop function availableMatchesToAttend
drop function clubsNeverPlayed
drop function matchWithHighestAttendance
drop function matchesRankedByAttendance
drop function requestsFromClub
GO

CREATE PROCEDURE clearAllTables
AS 
delete from HostRequest 
delete from Ticket 
delete from ClubRepresentative
delete from ClubRepresentative 
delete from StadiumManager 
delete from Match 
delete from Club 
delete from Stadium 
delete from SystemAdmin 
delete from SportsAssociationManager 
delete from Fan 
delete from SystemUser
GO

CREATE VIEW allAssocManagers
AS 
SELECT sm.username ,su.password,  sm.name 
FROM SportsAssociationManager sm INNER JOIN SystemUser su ON sm.username = su.username
GO

CREATE VIEW allClubRepresentatives 
AS
SELECT cr.username, su.password , cr.Name , c.Name AS Club
FROM ClubRepresentative cr INNER JOIN Club c ON cr.Club = c.ID INNER JOIN SystemUser su ON cr.username = su.username
GO

CREATE VIEW allStadiumManagers
AS 
SELECT sm.username ,su.password, sm.Name , s.Name AS Stadium
FROM StadiumManager sm INNER JOIN Stadium s ON sm.Stadium = s.ID INNER JOIN SystemUser su ON sm.username = su.username
GO

CREATE VIEW allFans	
AS
SELECT f.username , su.password, f.name , f.NationalID , f.BirthDate , f.Status 
FROM Fan f INNER JOIN SystemUser su ON f.username = su.username
GO

CREATE VIEW allMatches
AS
SELECT hc.Name as HostClub , gc.Name as GuestClub , StartTime , EndTime
FROM Match m inner join Club hc on m.HostClub = hc.ID inner join Club gc on gc.ID = m.GuestClub
GO

CREATE VIEW allTickets
AS
SELECT hc.Name as HostClub , gc.Name as GuestClub , s.Name as Stadium , StartTime
FROM Ticket t INNER JOIN Match m ON T.Match = m.ID INNER JOIN Stadium s ON m.Stadium = s.ID
inner join Club hc on m.HostClub = hc.ID inner join Club gc on m.GuestClub = gc.ID
GO

CREATE VIEW allCLubs
AS 
SELECT Name, Location
FROM Club
GO


CREATE VIEW allStadiums
AS
SELECT Name , Location , Capacity , Status
FROM Stadium
GO


CREATE VIEW allRequests
AS 
SELECT cr.username AS ClubRepresentative , sm.username AS StadiumManager , hr.Status
FROM HostRequest hr INNER JOIN ClubRepresentative cr ON hr.ClubRepresentative = cr.ID
INNER JOIN StadiumManager sm ON sm.ID = hr.StadiumManager 
GO

CREATE PROCEDURE addAssociationManager 
@name varchar(20),
@username varchar(20),
@password varchar(20)
AS
insert into SystemUser Values (@username, @password);
insert into SportsAssociationManager VALUES (@username, @name);
GO

CREATE PROCEDURE addNewMatch
@hostclub varchar(20),
@guestclub varchar(20),
@starttime datetime,
@endtime datetime
AS
BEGIN
DECLARE @idhost int
DECLARE @idguest int
select @idhost = id from club where name = @hostclub
select @idguest = id from club where name = @guestclub
insert into match (StartTime, EndTime ,HostClub, GuestClub) values (@starttime , @endtime, @idhost, @idguest);
END;
GO

CREATE VIEW clubsWithNoMatches
AS
Select Name from Club EXCEPT ((select c.name from Match m INNER JOIN Club c ON m.HostClub = c.ID) UNION (select c.name from Match m INNER JOIN Club c ON m.GuestClub = c.ID))
go

CREATE PROCEDURE deleteMatch 
@hostclub varchar(20),
@guestclub varchar(20),
@start datetime,
@end datetime
AS
BEGIN
DECLARE @idhost int
DECLARE @idguest int
DECLARE @matchid int

set @idhost = (select id from club where name = @hostclub)
set @idguest = (select id from club where name = @guestclub)
set @matchid =(select id from match where HostClub = @idhost AND GuestClub = @idguest and StartTime = @start and EndTime = @end)
	
delete from HostRequest where Match_ID = @matchid
delete from match where HostClub = @idhost AND guestClub = @idguest;
END
Go

create procedure deleteMatchesOnStadium
@stadium_name varchar(20)
AS
begin
DECLARE @stid int
set @stid =(select id from Stadium where name = @stadium_name)
delete from HostRequest where Match_ID in (SELECT id from Match where Stadium = @stid AND StartTime > CURRENT_TIMESTAMP)
delete from Match where Stadium = @stid AND StartTime > CURRENT_TIMESTAMP
END
Go

create procedure addClub
@name varchar(20),
@location varchar(20)
AS
insert into club (Name, Location) VALUES (@name, @location)
GO

create procedure addTicket
@hostname varchar(20),
@guestname varchar(20),
@starttime datetime 
AS
begin
DECLARE @hostid int
DECLARE @guestid int
DECLARE @matchid int

set @hostid = (select id from club where name = @hostname)
set @guestid = (select id from club where name = @guestname)
set @matchid = (select id from match where HostClub = @hostid AND GuestClub = @guestid AND StartTime = @starttime)

insert into Ticket (Match) values (@matchid)
end
GO


create procedure deleteClub
@clubname varchar(20)
AS
DECLARE @clubid int
set @clubid = (select id from Club where name = @clubname)
delete from Match where HostClub = @clubid OR GuestClub = @clubid
delete from club where name = @clubname
GO

create procedure addStadium
@name varchar(20),
@location varchar(20),
@capacity INTEGER
AS
insert into Stadium (Name,Location,Capacity) values (@name,@location,@capacity)
Go

create procedure deleteStadium
@name varchar(20)
AS
begin
DECLARE @stadiumId int
set @stadiumId = (select id from Stadium where Name = @name)
delete from Match where Stadium = @stadiumId
delete from Stadium where Name = @name 
end
Go


create procedure blockFan
@nationalid varchar(20)
AS
Update Fan set Status = 0 Where NationalID = @nationalid;
Go


create procedure  unblockFan
@nationalid varchar(20)
AS
Update Fan set Status = 1 Where NationalID = @nationalid;
Go


CREATE PROCEDURE  addRepresentative
@name varchar(20),
@clubname varchar(20),
@username varchar(20),
@password varchar(20)
AS
Declare @clubId int
set @clubId = (SELECT ID from Club where name = @clubname)
insert into SystemUser Values (@username, @password)
insert into ClubRepresentative(username, Name, Club) VALUES (@username, @name, @clubId)
GO


CREATE FUNCTION viewAvailableStadiumsOn(@datetime datetime)  
RETURNS TABLE  
AS  
 RETURN ((Select s.Name, s.Location, s.Capacity from Stadium s where S.Status = 1) Except (SELECT s2.Name, s2.Location, s2.Capacity from Match m inner join Stadium s2 on m.Stadium = s2.ID where @datetime >= m.StartTime and @datetime <= m.EndTime)) 
Go

CREATE PROCEDURE addHostRequest
@clubname varchar(20),
@stadiumname varchar(20),
@startingtime datetime
AS
begin
DECLARE @hostclubid int
DECLARE @guestclubid int
DECLARE @stadiumManagerid int
DECLARE @matchid int
DECLARE @hostClubRepresentetiveid int 
DECLARE @stadiumid int

set @stadiumid = (select ID from Stadium where Name= @stadiumname)
set @stadiumManagerid = (select ID from StadiumManager where Stadium = @stadiumid)
set @hostclubid = (select id from club where name = @clubname)
set @hostClubRepresentetiveid = (select ID from ClubRepresentative where Club = @hostclubid)
set @matchid = (select ID from Match where StartTime = @startingtime AND HostClub = @hostclubid)
insert into HostRequest (Match_ID, Status, ClubRepresentative, StadiumManager) values (@matchid, 'unhandled', @hostClubRepresentetiveid,@stadiumManagerid)
end
GO


CREATE FUNCTION  allUnassignedMatches(@hostclubname varchar(20))  
RETURNS TABLE  
AS  
 RETURN (SELECT guestC.Name, m.StartTime FROM Club c inner join Match m on c.ID = m.HostClub inner join Club guestC on guestC.ID = m.GuestClub where c.Name = @hostclubname AND m.Stadium is null)
Go


CREATE PROCEDURE  addStadiumManager
@name varchar(20),
@staduimname varchar(20),
@username varchar(20),
@password varchar(20)
AS
DECLARE @stadiumId int
set @stadiumId = (SELECT ID from Stadium where Name = @staduimname)
insert into SystemUser Values (@username, @password)
insert into StadiumManager(username, Name, Stadium) VALUES (@username, @name, @stadiumId)
GO

CREATE FUNCTION  allPendingRequests(@stadiumManagerName varchar(20))  
RETURNS TABLE  
AS  
RETURN ( SELECT cr.Name as ClubRepresentative, c.Name as GuestClub, m.StartTime from HostRequest as hr
inner join StadiumManager as sm on hr.StadiumManager = sm.ID
inner join ClubRepresentative as cr on hr.ClubRepresentative = cr.ID
inner join Match as m on hr.Match_ID = m.ID
inner join Club as c on m.GuestClub = c.ID
where sm.username = @stadiumManagerName and hr.Status = 'unhandled' )
GO

CREATE PROCEDURE acceptRequest
@stadiumManagerUserName varchar(20),
@hostClubName varchar(20),
@guestClubName varchar(20),
@startTime datetime
AS
begin
DECLARE @capacity int
DECLARE @matchID int
Declare @i int = 1
set @matchID = (SELECT m.ID from Match as m inner join Club as hc on m.HostClub = hc.ID
inner join Club as gc on m.GuestClub = gc.ID
where m.StartTime = @startTime AND hc.Name = @hostClubName AND gc.Name = @guestClubName)
UPDATE HostRequest set Status = 'accepted' where Match_ID = @matchID 
AND StadiumManager = (SELECT id FROM StadiumManager where username = @stadiumManagerUserName)
UPDATE Match set Stadium = (SELECT s.id FROM Stadium s inner join StadiumManager sm on s.ID = sm.Stadium where sm.username = @stadiumManagerUserName) where ID = @matchID
set @capacity = (select s.Capacity from Match m INNER JOIN Stadium s ON m.Stadium = s.ID where m.ID = @matchID)
WHILE @i <= @capacity 
	BEGIN
		EXEC addTicket @hostClubName , @guestClubName, @startTime;
		set @i = @i +1
	END
end
GO

CREATE PROCEDURE rejectRequest
@stadiumManagerUserName varchar(20),
@hostClubName varchar(20),
@guestClubName varchar(20),
@startTime datetime
AS
begin
DECLARE @matchID int
set @matchID = (SELECT m.ID from Match as m inner join Club as hc on m.HostClub = hc.ID
inner join Club as gc on m.GuestClub = gc.ID
where m.StartTime = @startTime AND hc.Name = @hostClubName AND gc.Name = @guestClubName)
UPDATE HostRequest set Status = 'rejected' where Match_ID = @matchID 
AND StadiumManager = (SELECT id FROM StadiumManager where username = @stadiumManagerUserName)
end
GO
	
CREATE PROCEDURE addFan
@name varchar(20),
@username varchar(20),
@password varchar(20),
@nationalId varchar(20),
@birthDate datetime,
@address varchar(20),
@phone int

AS
insert into SystemUser Values (@username, @password)
insert into Fan(Name, NationalID, BirthDate, Address, Phone, username) VALUES (@name, @nationalId, @birthDate, @address, @phone, @username)
GO

CREATE FUNCTION  upcomingMatchesOfClub(@username varchar(20))  
RETURNS @res TABLE (hostClub varchar(20), guestClub varchar(20), startTime datetime, endTime datetime, stadium varchar(20)) 
AS  
begin
Declare @clubName varchar(20)
set @clubName = (Select c.Name from Club c inner join ClubRepresentative cr on c.ID = cr.Club where cr.username = @username)
insert into @res
SELECT hc.Name as hostClub, gc.Name as guestClub, m.StartTime, m.EndTime ,s.Name as stadium
from Club hc inner join Match m on hc.ID = m.HostClub 
inner join Club gc on gc.ID = m.GuestClub
left outer join  Stadium s on m.Stadium = s.ID
where (hc.Name = @clubName OR gc.Name = @clubName) AND m.StartTime > CURRENT_TIMESTAMP
return
end
GO

CREATE FUNCTION  availableMatchesToAttend(@date datetime)  
RETURNS TABLE  
AS  
RETURN (SELECT hc.Name as hostClub, gc.Name as guestClub, m.StartTime, s.Name as stadium
from Club hc inner join Match m on hc.ID = m.HostClub 
inner join Club gc on gc.ID = m.GuestClub
inner join  Stadium s on m.Stadium = s.ID
where m.StartTime >= @date AND 
(SELECT count(ID) from Ticket t where t.Match = m.ID and t.Status = 1) > 0)
GO

CREATE PROCEDURE purchaseTicket
@nationalId varchar(20),
@hostClubName varchar(20),
@guestClubName varchar(20),
@startTime datetime
AS
begin
DECLARE @matchID int
DECLARE @ticketID int
set @matchID = (SELECT m.ID from Match as m inner join Club as hc on m.HostClub = hc.ID
inner join Club as gc on m.GuestClub = gc.ID
where m.StartTime = @startTime AND hc.Name = @hostClubName AND gc.Name = @guestClubName)
set @ticketID = (SELECT Top(1) ID from Ticket where Match = @matchID and Status = 1)
UPDATE Ticket set Status = 0, NationalID = @nationalId where ID = @ticketID
end
GO


CREATE PROCEDURE updateMatchHost
@hostclub varchar(20),
@guestclub varchar(20),
@date datetime
AS 
Update Match Set HostClub = (select id from Club where Name = @guestclub) , GuestClub = (select id from Club where Name = @hostclub) 
WHERE HostClub = (select id from Club where Name = @hostclub) AND GuestClub = (select id from Club where Name = @guestclub) AND StartTime = @date
go

CREATE VIEW matchesPerTeam
AS
select c.Name , count(m.ID) as NumberOfMatches 
from Club c LEFT OUTER JOIN (SELECT * FROM Match WHERE StartTime < CURRENT_TIMESTAMP ) as m ON c.ID = m.HostClub OR c.ID = m.GuestClub 
group by c.Name
GO

CREATE VIEW clubsNeverMatched
AS 
(select c3.name as club1, c4.name as club2 FROM Club c3, Club c4 where c3.ID <> c4.ID and c3.ID < c4.ID)
EXCEPT 
((select c1.name as club1, c2.name as club2
FROM Club c1 INNER JOIN Match m ON c1.ID = m.HostClub INNER JOIN Club c2 ON m.GuestClub = c2.ID) 
UNION (select c1.name as club1 , c2.name as club2 from Club c1 INNER JOIN Match m ON c1.ID = m.GuestClub INNER JOIN Club c2 ON m.HostClub = c2.ID))
GO


CREATE FUNCTION clubsNeverPlayed(@clubname varchar(20))
RETURNS TABLE
AS
return ((select club2 from clubsNeverMatched where club1 = @clubname) UNION (select club1 from clubsNeverMatched where club2 = @clubname))
Go

CREATE FUNCTION matchWithHighestAttendance()
RETURNS TABLE
AS
RETURN (select TOP 1 hc.Name as HostName , gc.Name as GuestName from Ticket t 
INNER JOIN Match m ON t.Match = m.ID
INNER JOIN Club hc on m.HostClub = hc.ID
INNER JOIN Club gc on m.GuestClub = gc.ID
WHERE t.Status = 0 group by hc.Name , gc.Name order by count(*) DESC)
go

CREATE FUNCTION matchesRankedByAttendance()
RETURNS @res table (hostClub varchar(20), guestClub varchar(20))
AS
begin
DECLARE @temp table (hostClub varchar(20), guestClub varchar(20), count int,countrank int )
insert into @temp 
select hc.Name as HostName , gc.Name as GuestName, count(*) as count, Rank() over (ORDER BY count(*) DESC) as countrank from Ticket t 
INNER JOIN Match m ON t.Match = m.ID
INNER JOIN Club hc on m.HostClub = hc.ID
INNER JOIN Club gc on m.GuestClub = gc.ID
WHERE t.Status = 0 AND m.StartTime < CURRENT_TIMESTAMP group by hc.Name , gc.Name order by countrank desc

insert into @res 
select hostClub , guestClub from @temp

return
end
go

CREATE FUNCTION requestsFromClub(@stadiumname varchar(20) , @clubname varchar(20))
RETURNS @res table (hostClub varchar(20), guestClub varchar(20))
AS
Begin
DECLARE @smId int

set @smId = (SELECT sm.ID from StadiumManager sm inner join Stadium s on sm.Stadium = s.ID where s.Name = @stadiumname) 
insert into @res 
SELECT hc.Name as HostName, gc.Name as GuestName from HostRequest h 
inner join ClubRepresentative cr on h.ClubRepresentative = cr.ID
inner join Club c on c.ID = cr.Club
inner join Match m on m.ID = h.Match_ID
inner join Club hc on hc.ID = m.HostClub
inner join Club gc on gc.ID = m.GuestClub
where c.Name = @clubname and h.StadiumManager = @smId and h.Status = 'unhandled'
return
end
go


go 
CREATE FUNCTION  managerStadiumInformation(@managerUsername varchar(20))  
RETURNS TABLE  
AS  
RETURN (SELECT s.ID , s.Name, s.Status , s.Location , s.Capacity From Stadium s INNER JOIN
StadiumManager sm ON sm.Stadium = s.ID WHERE sm.username = @managerUsername )
GO

go 
CREATE FUNCTION  managerReceivedRequests(@managerUsername varchar(20))  
RETURNS TABLE  
AS  
RETURN (SELECT cr.Name as ClubRepresentative,c2.Name as HostClub, c.Name as GuestClub, m.StartTime, m.EndTime, hr.status 
from HostRequest as hr 
inner join StadiumManager as sm on hr.StadiumManager = sm.ID 
inner join ClubRepresentative as cr on hr.ClubRepresentative = cr.ID 
inner join Match as m on hr.Match_ID = m.ID 
inner join Club as c on m.GuestClub = c.ID 
INNER JOIN Club as c2 on m.HostClub = c2.ID 
where sm.username = @managerUsername )
GO

CREATE FUNCTION  clubRepClubInformation(@clubRepUsername varchar(20))  
RETURNS TABLE  
AS  
RETURN (SELECT c.ID , c.Name, c.Location From Club c INNER JOIN
ClubRepresentative cr on cr.Club = c.ID WHERE cr.username = @clubRepUsername )
GO

CREATE FUNCTION  clubNameFromUsername(@clubRepUsername varchar(20))  
RETURNS TABLE  
AS  
RETURN (SELECT  c.Name From Club c INNER JOIN
ClubRepresentative cr on cr.Club = c.ID WHERE cr.username = @clubRepUsername )
GO

CREATE FUNCTION  nationalIdFromUsername(@fanUsername varchar(20))  
RETURNS TABLE  
AS  
RETURN (SELECT f.NationalId From Fan f WHERE f.username = @fanUsername )
GO

CREATE FUNCTION  getMatch(@host varchar(20), @guest varchar(20), @start datetime, @end datetime)  
RETURNS TABLE  
AS  
RETURN (SELECT m.ID From Match m inner join Club hc on m.HostClub = hc.ID inner join Club gc on gc.ID = m.GuestClub where m.StartTime = @start
and m.EndTime = @end and hc.Name = @host and gc.Name = @guest)
GO

CREATE FUNCTION  getMatch2(@host varchar(20), @start datetime)  
RETURNS TABLE  
AS  
RETURN (SELECT m.ID From Match m inner join Club hc on m.HostClub = hc.ID  where m.StartTime = @start and hc.Name = @host)
GO

CREATE FUNCTION  isAlreadyPlaying(@host varchar(20), @guest varchar(20), @start datetime, @end datetime)  
RETURNS TABLE  
AS  
RETURN (SELECT m.ID From Match m inner join Club hc on m.HostClub = hc.ID inner join Club gc on gc.ID = m.GuestClub
where ((@start >= m.StartTime and @start <= m.EndTime) or (@end >= m.StartTime and @end <= m.EndTime)) and ((hc.Name = @host or gc.Name = @host) or (hc.Name = @guest or gc.Name = @guest)))
GO

CREATE FUNCTION  getRequest(@host varchar(20),@guest varchar(20), @start datetime)  
RETURNS TABLE  
AS  
RETURN (SELECT h.ID From HostRequest h inner join Match m on m.ID = h.Match_ID inner join Club hc on m.HostClub = hc.ID inner join Club gc on m.GuestClub = gc.ID  where m.StartTime = @start and hc.Name = @host and gc.Name = @guest)
GO