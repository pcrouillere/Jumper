	/* ******************************************************************* */
	/* *********************** TEST DATA - Jumper ************************ */
	/* ***********************          v1        ************************ */
	/* ******************************************************************* */
	
	
insert into jpUser (userMail, userPassword) values ('pcrouillere@gmail.com','123456789');
insert into jpUser (userMail, userPassword) values ('pauline.cuche@gmail.com','azertyuiop');
insert into jpUser (userMail, userPassword) values ('metachenyiyan@gmail.com', 'qsdfghjklm');
insert into jpUser (userMail, userPassword) values ('blackstronedrummer@gmail.com', 'wxcvbn');
	
Insert into jpTag(tagUserId, tagName) values(1, 'Musique');
Insert into jpTag(tagUserId, tagName) values(1, 'Sport');
Insert into jpTag(tagUserId, tagName) values(1, 'Jeux');
Insert into jpTag(tagUserId, tagName) values(1, 'IHM');
Insert into jpTag(tagUserId, tagName) values(1, 'NF28');
Insert into jpTag(tagUserId, tagName) values(1, 'DIY');
Insert into jpTag(tagUserId, tagName) values(1, 'Cinema');


Insert into jpUrl(urlUri) values(1, 'http://grooveshark.com/#!/masterofsoundtrack/broadcast');
Insert into jpUrl(urlUri) values(1, 'http://lifehacker.com/5540019/five-best-bookmark-management-tools/all');
Insert into jpUrl(urlUri) values(1, 'https://docs.google.com/forms/d/1Q8u2oobP1PhWBgsmvrDp61WWnKp9NF39qibDe0MmVv4/viewanalytics');
Insert into jpUrl(urlUri) values(1, 'http://www.noomuseum.net/');
Insert into jpUrl(urlUri) values(1, 'http://www.unclegram.fr/categories#photogram');
Insert into jpUrl(urlUri) values(1, 'http://ecrans.liberation.fr/');
Insert into jpUrl(urlUri) values(1, 'http://www.vertcerise.com/');
Insert into jpUrl(urlUri) values(1, 'http://www.madmoizelle.com/films-2014-218292');


insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 1, 1);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 2, 5);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 2, 4);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 3, 5);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 4, 6);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 4, 7);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 3, 5);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 4, 6);
insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values(1, 4, 7);

