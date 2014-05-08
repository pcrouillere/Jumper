	/* ******************************************************************* */
	/* ***********************  REQUEST - Jumper  ************************ */
	/* ***********************          v1        ************************ */
	/* ******************************************************************* */
	
/* Requête simple */

/* AJOUT */
/* Ajouter un tag */
Insert into jpTag(tagUserId, tagName) values(1, 'Musique');

/* Ajouter un utilisateur */
insert into jpUser (userMail, userPassword) values ('pcrouillere@gmail.com','123456789');

/* Ajotuer une URL */
Insert into jpUrl(urlUri) values(1, 'http://grooveshark.com/#!/masterofsoundtrack/broadcast');

/* Retrouver l'ID du compte */
/* Exemple with pcrouillere@gmail.com */
Select userId from jpUser where userMail = 'pcrouillere@gmail.com';

/* Retrouver l'ensemble des tags  (name et id) d'un utilisateur */
/* Exemple avec le user 1 */
select * from jpTag where tagUserId=1;

/* Retrouver l'ensemble des url pour un tag donné */
/* Exemple avec le tag n°1 */
select tagMapUrlId from jpTagMap where tagMapTagId=1;
