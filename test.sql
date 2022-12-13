EXEC createAllTables;

EXEC dropAllTables;

--EXEC dropAllProceduresFunctionsViews;
drop procedure createAllTables;
EXEC clearAllTables;

SELECT * from allAssocManagers;
SELECT * from allClubRepresentatives;
SELECT * from allStadiumManagers;
SELECT * from allFans;
SELECT * from allMatches;
SELECT * from allTickets;
SELECT * from allCLubs;
SELECT * from allStadiums;
SELECT * from allRequests;

EXEC addAssociationManager Association_M1 , associationM1 , assocPass123;
EXEC addAssociationManager Association_M2 , associationM2 , assocPass1232;
EXEC addAssociationManager Association_M3 , associationM3 , assocPass1233;
EXEC addAssociationManager Association_M4 , associationM4 , assocPass1234;

EXEC addNewMatch ahly, zamalek, ahly, '2022/12/1 20:00:00';
EXEC addNewMatch zamalek, ahly, ahly, '2023/12/1 20:00:00';
EXEC addNewMatch liverpool, milan, milan, '2021/12/1 20:00:00';
EXEC addNewMatch liverpool, milan, liverpool, '2021/11/24 18:30:00';
EXEC addNewMatch arsenal, real_madrid, arsenal, '2022/5/1 21:00:00';

SELECT * from clubsWithNoMatches;

EXEC deleteMatch ahly, zamalek, ahly;

EXEC deleteMatchesOnStadium elahly;

EXEC addClub ahly, egypt;
EXEC addClub zamalek, egypt;
EXEC addClub liverpool, england;
EXEC addClub milan, italy;
EXEC addClub arsenal, england;
EXEC addClub real_madrid, spain;
EXEC addClub barcelona, spain;

EXEC addTicket ahly, zamalek, '2022/12/1 20:00:00';
EXEC addTicket ahly, zamalek, '2022/12/1 20:00:00';
EXEC addTicket arsenal, real_madrid, '2022/5/1 21:00:00';
EXEC addTicket liverpool, milan, '2021/11/24 18:30:00';
EXEC addTicket milan, liverpool, '2021/12/1 20:00:00';


EXEC deleteClub ahly;
EXEC deleteClub liverpool;

EXEC addStadium elahly, egypt, 10000;
EXEC addStadium cairo, egypt, 20000;
EXEC addStadium Camp_Nou, spain, 30000;
EXEC addStadium Borg_El_Arab, egypt, 15000;
EXEC addStadium Tottenham, england, 30000;

EXEC deleteStadium elahly;

EXEC blockFan 1234567890;
EXEC unblockFan 1234567890;

EXEC addRepresentative ahly_rep, ahly, ahlyrep, ahlyrep123;
EXEC addRepresentative zamalek_rep, zamalek, zamalekrep, zamalekrep123;
EXEC addRepresentative liverpool_rep, liverpool, liverpoolrep, liverpoolrep123;


SELECT * FROM viewAvailableStadiumsOn('2022/12/1 21:00:00');

EXEC addHostRequest ahly, elahly, '2022/12/1 20:00:00';

SELECT * FROM allUnassignedMatches('liverpool');

EXEC addStadiumManager ahly_stadium_man, elahly, ahlystadiummanager, ahlystadiummanager123;
EXEC addStadiumManager cairo_stadium_man, cairo, cairostadiummanager, cairostadiummanager123;
EXEC addStadiumManager Camp_Nou_stadium_man, Camp_Nou, Camp_Noustadiummanager, Camp_Noustadiummanager123;
EXEC addStadiumManager Tottenham_stadium_man, Tottenham, Tottenhamstadiummanager, Tottenhamstadiummanager123;


SELECT * FROM allPendingRequests('ahly_stadium_man');
SELECT * FROM allPendingRequests('cairo_stadium_man');
SELECT * FROM allPendingRequests('Camp_Nou_stadium_man');

EXEC acceptRequest 'ahly_stadium_man', 'ahly', 'zamalek', '2022/12/1 20:00:00';

EXEC acceptRequest 'ahly_stadium_man', 'ahly', 'zamalek', '2023/12/1 20:00:00';
EXEC rejectRequest 'ahly_stadium_man', 'ahly', 'zamalek', '2022/12/1 20:00:00';

EXEC addFan helen, 1234567890, '2001/03/19 07:00:00', heliopolis, 01277262923 , helen_mo , helen123;
EXEC addFan helen, 123456789, '2001/03/19 07:00:00', heliopolis, 01277262923 , helen_mo2 , helen123;

SELECT * from upcomingMatchesOfClub('ahly');

SELECT * from availableMatchesToAttend('2022/12/2 20:00:00');

EXEC purchaseTicket 1234567890, zamalek, ahly, '2023/12/1 20:00:00';
EXEC purchaseTicket 123456789, zamalek, ahly, '2023/12/1 20:00:00';

EXEC updateMatchHost zamalek , ahly , '2022/12/1 20:00:00';

SELECT * from matchesPerTeam;
SELECT * from clubsNeverMatched;

Select * from clubsNeverPlayed('milan');

select * from matchWithHighestAttendance();
