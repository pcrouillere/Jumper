	/* ******************************************************************* */
	/* *********************** DATA BASE - Jumper ************************ */
	/* ***********************          v1        ************************ */
	/* ******************************************************************* */

	/* ************* DROP TABLE ************* */
	DROP TABLE jpTagMap;
	DROP TABLE jpTag;
	DROP TABLE jpUrl;
	DROP TABLE jpUser;

	/* * USER * */
	CREATE TABLE jpUser (
	userId INT NOT NULL AUTO_INCREMENT,
	userMail VARCHAR(255) NOT NULL,
	userPassword VARCHAR(255) NOT NULL,
	userName VARCHAR(255) NOT NULL,
	PRIMARY KEY (userId)
	);
	
	
	/* * TAG * */
	CREATE TABLE jpTag (
	tagId INT NOT NULL AUTO_INCREMENT,
	tagUserId INT,
	tagName VARCHAR(255) NOT NULL,
	PRIMARY KEY (tagId)
	);

	/* * URL * */
	CREATE TABLE jpUrl (
	urlId INT NOT NULL AUTO_INCREMENT,
	urlUserId INT,
	urlUri VARCHAR(255) NOT NULL,
	urlTitle VARCHAR(255),
	urlNbVisited INTEGER NOT NULL,
	PRIMARY KEY (urlId)
	);
	
	
	/* * COUPLE TAG - URL **/
	CREATE TABLE jpTagMap(
	tagMapId INT NOT NULL AUTO_INCREMENT,
	tagMapUserId INT,
	tagMapUrlId INT,
	tagMapTagId INT,
	PRIMARY KEY (tagMapId)
	);


	/* * FOREIGN KEY * */
	ALTER TABLE jpTag ADD CONSTRAINT jpTagfkUser FOREIGN KEY (tagUserId) REFERENCES jpUser(userId);
	ALTER TABLE jpUrl ADD CONSTRAINT jpUrlfkUser FOREIGN KEY (urlUserId) REFERENCES jpUser(userId);
	ALTER TABLE jpTagMap ADD CONSTRAINT jpTagMapFkUrl FOREIGN KEY (tagMapUrlId) REFERENCES jpUrl(urlId);
	ALTER TABLE jpTagMap ADD CONSTRAINT jpTagMapFkTag FOREIGN KEY (tagMapTagId) REFERENCES jpTag(tagId);
	ALTER TABLE jpTagMap ADD CONSTRAINT jpTagMapFkUser FOREIGN KEY (tagMapUserId) REFERENCES jpUser(userId);
