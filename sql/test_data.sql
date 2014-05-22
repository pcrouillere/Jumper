	/* ******************************************************************* */
	/* *********************** TEST DATA - Jumper ************************ */
	/* ***********************          v1        ************************ */
	/* ******************************************************************* */
	
	
insert into jpUser (userMail, userPassword, userName) values ('pcrouillere@gmail.com','123456789', 'Pauline');
insert into jpUser (userMail, userPassword, userName) values ('pauline.cuche@gmail.com','azertyuiop', 'Pauline');
insert into jpUser (userMail, userPassword, userName) values ('metachenyiyan@gmail.com', 'qsdfghjklm', 'Yiyan');
insert into jpUser (userMail, userPassword, userName) values ('blackstronedrummer@gmail.com', 'wxcvbn', 'Mourad');
	
Insert into jpTag(tagUserId, tagName) values(1, 'Musique');
Insert into jpTag(tagUserId, tagName) values(1, 'Sport');
Insert into jpTag(tagUserId, tagName) values(1, 'Jeux');
Insert into jpTag(tagUserId, tagName) values(1, 'IHM');
Insert into jpTag(tagUserId, tagName) values(1, 'NF28');
Insert into jpTag(tagUserId, tagName) values(1, 'DIY');
Insert into jpTag(tagUserId, tagName) values(1, 'Cinema');


Insert into jpUrl(urlUserId, urlUri, urlTitle, urlNbVisited) values(1, 'http://grooveshark.com/#!/masterofsoundtrack/broadcast', 'Groov', 10);
Insert into jpUrl(urlUserId, urlUri, urlTitle, urlNbVisited) values(1, 'http://lifehacker.com/5540019/five-best-bookmark-management-tools/all', 'LifeHacker', 10);
Insert into jpUrl(urlUserId, urlUri, urlTitle, urlNbVisited) values(1, 'https://docs.google.com/forms/d/1Q8u2oobP1PhWBgsmvrDp61WWnKp9NF39qibDe0MmVv4/viewanalytics', 'Google', 8);
Insert into jpUrl(urlUserId, urlUri, urlTitle, urlNbVisited) values(1, 'http://www.noomuseum.net/', 'Noom', 6);
Insert into jpUrl(urlUserId, urlUri, urlTitle, urlNbVisited) values(1, 'http://www.unclegram.fr/categories#photogram', 'UncleGram', 2);
Insert into jpUrl(urlUserId,urlUri, urlTitle, urlNbVisited) values(1, 'http://ecrans.liberation.fr/', 'Ecrans', 4);
Insert into jpUrl(urlUserId,urlUri, urlTitle, urlNbVisited) values(1, 'http://www.vertcerise.com/', 'VertCerise', 4);
Insert into jpUrl(urlUserId,urlUri, urlTitle, urlNbVisited) values(1, 'http://www.madmoizelle.com/films-2014-218292', 'Madz', 0);


insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 1, 1);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 2, 5);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 2, 4);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 3, 5);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 4, 6);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 4, 7);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 3, 5);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 4, 6);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 4, 7);


