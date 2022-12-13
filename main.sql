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
Stadium int,
Primary Key(ID),
Foreign Key(username) references SystemUser(username) on DELETE  NO ACTION on UPDATE  NO ACTION,
Foreign Key(Stadium) references Stadium(ID) on DELETE NO ACTION on UPDATE NO ACTION
)

create table ClubRepresentative(
username varchar(20), 
ID int IDENTITY,
Name varchar(20),
Primary Key(ID),
Club int,
Foreign Key(username) references SystemUser(username) on DELETE  NO ACTION on UPDATE  NO ACTION,
Foreign Key(Club) references Club(ID)	 on DELETE NO ACTION  on UPDATE NO ACTION 

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
Foreign Key(username) references SystemUser(username) on DELETE  NO ACTION on UPDATE  NO ACTION

)

create table SportsAssociationManager(
username varchar(20), 
ID int IDENTITY,
Name varchar(20),
Primary Key(ID),
Foreign Key(username) references SystemUser(username)on DELETE  NO ACTION on UPDATE  NO ACTION
 
)


create table SystemAdmin(
username varchar(20), 
ID int IDENTITY,
Name varchar(20),
Primary Key(ID),
Foreign Key(username) references SystemUser(username) on DELETE  NO ACTION on UPDATE  NO ACTION

)

create table Match(
ID int IDENTITY,
StartTime datetime,
EndTime datetime,
HostClub int,
GuestClub int,
Stadium int,
Primary Key(ID),
Foreign Key(HostClub) references Club(ID) on DELETE  NO ACTION on UPDATE  NO ACTION ,	 
Foreign Key(GuestClub) references Club(ID) on DELETE NO ACTION on UPDATE NO ACTION, 
Foreign Key(Stadium) references Stadium(ID) on DELETE NO ACTION on UPDATE NO ACTION


)



create table Ticket(
ID int IDENTITY,
Status BIT DEFAULT '1',
NationalID int,
Match int,
Primary Key(ID),
Foreign Key(NationalID) references Fan(NationalID) on DELETE NO ACTION on UPDATE NO ACTION,
Foreign Key(Match) references Match(ID) on DELETE NO ACTION on UPDATE NO ACTION

)

create table HostRequest(
ID int IDENTITY,
Match_ID int,
Status varchar(20) DEFAULT 'unhandled' , CHECK (Status IN ('unhandled' , 'accepted' , 'rejected')),
ClubRepresentative int,
StadiumManager int,
Primary Key(ID),
Foreign Key(ClubRepresentative) references ClubRepresentative(ID) on DELETE NO ACTION on UPDATE NO ACTION, 
Foreign Key(StadiumManager) references StadiumManager(ID) on DELETE NO ACTION on UPDATE NO ACTION,
Foreign Key(Match_ID) references Match(ID) on DELETE NO ACTION on UPDATE NO ACTION
)
GO

CREATE PROCEDURE dropAllTables
AS
drop table HostRequest , Ticket , Match , ClubRepresentative , StadiumManager, Club , Stadium , SystemAdmin , SportsAssociationManager , Fan , SystemUser
GO

--CREATE PROCEDURE dropAllProceduresFunctionsViews
--drop procedure clearAllTables;
CREATE PROCEDURE clearAllTables
AS 
truncate table HostRequest 
truncate table Ticket 
--delete from ClubRepresentative
truncate table ClubRepresentative 
truncate table StadiumManager 
truncate table Match 
truncate table Club 
truncate table Stadium 
truncate table SystemAdmin 
truncate table SportsAssociationManager 
truncate table Fan 
truncate table SystemUser
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
SELECT HostClub , GuestClub , StartTime
FROM Match
GO


CREATE VIEW allTickets
AS
SELECT m.HostClub , m.GuestClub , s.Name as Stadium , StartTime
FROM Ticket t INNER JOIN Match m ON T.Match = m.ID INNER JOIN Stadium s ON m.Stadium = s.ID
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
@guestclub varchar(20)
AS
BEGIN
DECLARE @idhost int
DECLARE @idguest int
DECLARE @matchid int

set @idhost = (select id from club where name = @hostclub)
set @idguest = (select id from club where name = @guestclub)
set @matchid =(select id from match where HostClub = @idhost AND GuestClub = @idguest)
	
delete from match where HostClub = @idhost AND guestClub = @idguest;
delete from Ticket where Match = @matchid
END
Go


create procedure deleteMatchesOnStadium
@stadium_name varchar(20)
AS
begin
DECLARE @stid int
set @stid =(select id from Stadium where name = @stadium_name)
delete from Match where Stadium = @stid AND StartTime > CURRENT_TIMESTAMP
-- should this also delete tickets?
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
delete from club where name = @clubname
delete from Match where HostClub = @clubid OR GuestClub = @clubid
GO

create procedure addStadium
@name varchar(20),
@location varchar(20),
@capcity INTEGER
AS
insert into Stadium (Name,Location,Capacity) values (@name,@location,@capcity)
Go

create procedure deleteStadium
@name varchar(20)
AS
begin
DECLARE @stadiumId int
set @stadiumId = (select id from Stadium where Name = @Name)
delete from Match where Stadium = @stadiumId
delete from Stadium where Name = @name 
--should this also delete tickets?
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
		 where sm.Name = @stadiumManagerName and hr.Status = 'unhandled' )
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
insert into Fan(Name, NationalID, BirthDate, Address, Phone) VALUES (@name, @nationalId, @birthDate, @address, @phone)
GO

CREATE FUNCTION  upcomingMatchesOfClub(@clubName varchar(20))  
RETURNS TABLE  
AS  
RETURN (SELECT hc.Name as hostClub, gc.Name as guestClub, m.StartTime, s.Name as stadium
		from Club hc inner join Match m on hc.ID = m.HostClub 
		inner join Club gc on gc.ID = m.GuestClub
		inner join  Stadium s on m.Stadium = s.ID
		where (hc.Name = @clubName OR gc.Name = @clubName) AND m.StartTime > CURRENT_TIMESTAMP)
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
select c.Name , count(*) as NumberOfMatches 
from Club c LEFT OUTER JOIN Match m ON c.ID = m.HostClub OR c.ID = m.GuestClub WHERE m.StartTime < CURRENT_TIMESTAMP
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
RETURN (select TOP 1 m.HostClub , m.GuestClub , count(*) as count from Ticket t INNER JOIN Match m ON t.Match = m.ID WHERE t.Status = 0 group by m.HostClub , m.GuestClub order by count(*) DESC)
go

CREATE FUNCTION [matchesRankedByAttendance]()
RETURNS TABLE
AS
RETURN (select m.HostClub , m.GuestClub , count(*) as count , Rank() over(order by count desc) as attendancerank from Ticket t INNER JOIN Match m ON t.Match = m.ID WHERE t.Status = 0 group by m.HostClub , m.GuestClub order by attendancerank)
go


