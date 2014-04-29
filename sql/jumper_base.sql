	/* ******************************************************************* */
	/* *********************** DATA BASE - Jumper ************************ */
	/* ***********************          v1        ************************ */
	/* ******************************************************************* */

	/* ************* DROP TABLE ************* */
	DROP TABLE jpTag;
	DROP TABLE jpUrl;
	DROP TABLE jpUser;

	/* * TAG * */
	CREATE TABLE jpTag (
	tagId INT NOT NULL AUTO_INCREMENT,
	tagName VARCHAR(255) NOT NULL,
	tagUrl
	PRIMARY KEY (tagId)
	);

	/* * URL * */
	CREATE TABLE jpUrl (
	urlId INT NOT NULL AUTO_INCREMENT,
	urlUri VARCHAR(255) UNIQUE NOT NULL,
	PRIMARY KEY (urlId)
	);
	
	/* * COUPLE TAG - URL **/
	CREATE TABLE jpTagMap(
	tagMapId INT NOT NULL AUTO_INCREMENT,
	tagMapUrlId INT,
	tagMapTagId INT,
	PRIMARY KEY (tagMapId)
	)

	/* * USER * */
	CREATE TABLE jpUser (
	userId INT NOT NULL AUTO_INCREMENT,
	userMail VARCHAR(255) NOT NULL,
	userPassword VARCHAR(255) NOT NULL,
	PRIMARY KEY (userId)
	);


	/* * FOREIGN KEY * */
	ALTER TABLE jpTagMap ADD CONSTRAINT jpTagMapFkUrl FOREIGN KEY (tagMapUrlId) REFERENCES jpUrl(urlId);
	ALTER TABLE jpTagMap ADD CONSTRAINT jpTagMapFkTag FOREIGN KEY (tagMapTagId) REFERENCES jpTag(tagId);
