EXEC createAllTables;

EXEC dropAllTables;

EXEC dropAllProceduresFunctionsViews;

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
EXEC addAssociationManager Association_M5 , associationM5 , assocPass1235;
EXEC addAssociationManager Association_M6 , associationM6 , assocPass1236;
EXEC addAssociationManager Association_M7 , associationM7 , assocPass1237;
EXEC addAssociationManager Association_M8 , associationM8 , assocPass1238;

EXEC addNewMatch ahly, zamalek, '2022/12/1 20:00:00', '2022/12/1 22:00:00';
EXEC addNewMatch zamalek, ahly, '2023/12/1 20:00:00', '2023/12/1 23:00:00';
EXEC addNewMatch liverpool, milan, '2021/12/1 20:00:00', '2021/12/1 21:00:00';
EXEC addNewMatch liverpool, milan, '2021/11/24 18:30:00', '2021/11/24 20:00:00';
EXEC addNewMatch arsenal, real_madrid,'2022/5/1 21:00:00', '2022/5/1 23:00:00';
EXEC addNewMatch liverpool, arsenal, '2023/11/1 20:00:00', '2023/12/1 23:00:00';
EXEC addNewMatch egypt, brazil, '2023/8/1 20:00:00', '2023/12/1 23:00:00';
EXEC addNewMatch egypt, france, '2023/1/1 20:00:00', '2023/12/1 23:00:00';

SELECT * from clubsWithNoMatches;

EXEC deleteMatch ahly, zamalek;

EXEC deleteMatchesOnStadium elahly;

EXEC addClub ahly, egypt;
EXEC addClub zamalek, egypt;
EXEC addClub liverpool, england;
EXEC addClub milan, italy;
EXEC addClub arsenal, england;
EXEC addClub real_madrid, spain;
EXEC addClub barcelona, spain;
EXEC addClub egypt, egypt;
EXEC addClub brazil, brazil;
EXEC addClub argentine, argentine;
EXEC addClub france, france;
EXEC addClub spain, spain;
EXEC addClub england, england;

EXEC addTicket ahly, zamalek, '2022/12/1 20:00:00';
EXEC addTicket ahly, zamalek, '2022/12/1 20:00:00';
EXEC addTicket arsenal, real_madrid, '2022/5/1 21:00:00';
EXEC addTicket liverpool, milan, '2021/11/24 18:30:00';
EXEC addTicket milan, liverpool, '2021/12/1 20:00:00';


EXEC deleteClub ahly;
EXEC deleteClub liverpool;

EXEC addStadium elahly, egypt, 100;
EXEC addStadium cairo, egypt, 200;
EXEC addStadium Camp_Nou, spain, 300;
EXEC addStadium Borg_El_Arab, egypt, 150;
EXEC addStadium Tottenham, england, 300;

EXEC deleteStadium elahly;

EXEC blockFan 1234567890;
EXEC unblockFan 1234567890;

EXEC addRepresentative ahly_rep, ahly, ahlyrep, ahlyrep123;
EXEC addRepresentative zamalek_rep, zamalek, zamalekrep, zamalekrep123;
EXEC addRepresentative liverpool_rep, liverpool, liverpoolrep, liverpoolrep123;
EXEC addRepresentative egypt_rep, egypt, egyptrep, egyptrep123;
EXEC addRepresentative spain_rep, spain, spainrep, spainrep123;
EXEC addRepresentative brazil_rep, brazil, brazilrep, brazilrep123;


SELECT * FROM viewAvailableStadiumsOn('2022/12/1 21:00:00');

EXEC addHostRequest ahly, elahly, '2022/12/1 20:00:00';
EXEC addHostRequest zamalek, elahly, '2023/12/1 20:00:00';

SELECT * FROM allUnassignedMatches('liverpool');

EXEC addStadiumManager ahly_stadium_man, elahly, ahlystadiummanager, ahlystadiummanager123;
EXEC addStadiumManager cairo_stadium_man, cairo, cairostadiummanager, cairostadiummanager123;
EXEC addStadiumManager Camp_Nou_stadium_man, Camp_Nou, Camp_Noustadiummanager, Camp_Noustadiummanager123;
EXEC addStadiumManager Tottenham_stadium_man, Tottenham, Tottenhamstadiummanager, Tottenhamstadiummanager123;


SELECT * FROM allPendingRequests('ahlystadiummanager');
SELECT * FROM allPendingRequests('cairostadiummanager');
SELECT * FROM allPendingRequests('Camp_Noustadiummanager');

EXEC acceptRequest 'ahlystadiummanager', 'ahly', 'zamalek', '2022/12/1 20:00:00';
EXEC acceptRequest 'ahlystadiummanager', 'zamalek', 'ahly', '2023/12/1 20:00:00';
EXEC acceptRequest 'ahlystadiummanager', 'zamalek', 'ahly', '2022/12/1 20:00:00';

EXEC addFan helen,  helen_mo , helen123, 1234567890, '2001/03/19 07:00:00', heliopolis, 01277262923;
EXEC addFan mina, mina_mo2 , mina123, 123456789, '2002/03/19 07:00:00', heliopolis, 01277262923;

SELECT * from upcomingMatchesOfClub('ahly');

SELECT * from availableMatchesToAttend('2022/12/2 20:00:00');

EXEC purchaseTicket 1234567890, zamalek, ahly, '2022/12/1 20:00:00';
EXEC purchaseTicket 123456789, zamalek, ahly, '2023/12/1 20:00:00';

EXEC updateMatchHost zamalek , ahly , '2022/12/1 20:00:00';

SELECT * from matchesPerTeam;
SELECT * from clubsNeverMatched;

Select * from clubsNeverPlayed('egypt');

select * from matchWithHighestAttendance();
select * from matchesRankedByAttendance();

select * from requestsFromClub('elahly','zamalek');
