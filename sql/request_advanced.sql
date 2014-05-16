	/* ******************************************************************* */
	/* *******************  ADVENDED REQUEST - Jumper ******************** */
	/* *******************             v1             ******************** */
	/* ******************************************************************* */
	

/* Select all url for one tag */
Select urlUri from jpurl where urlId IN (
select tagmapurlid from jptagmap where tagmapUserid = (
select userid from jpuser where userMail='pcrouillere@gmail.com')
AND tagmaptagid = (select tagId from jptag where tagName='NF28'));

/* Select url with "OR" */
Select urlUri from jpurl where urlId IN (
Select tagMapUrlid from jptagmap where tagmapUserid = (
select userid from jpuser where userMail='pcrouillere@gmail.com')
AND (tagmaptagid = (select tagId from jptag where tagName='NF28') OR tagmaptagid = (select tagId from jptag where tagName='DIY')));

/* SELECT URL WITH NOT */
Select urlUri from jpurl where urlId IN (
Select tagMapUrlid from jptagmap where tagmapUserid = (
select userid from jpuser where userMail='pcrouillere@gmail.com')
AND tagmaptagid = (select tagId from jptag where tagName='NF28') AND NOT tagmaptagid = (select tagId from jptag where tagName='DIY'));

/* SELECT URL WITH NOT */
Select urlUri from jpurl where urlId IN (
Select tagMapUrlid from jptagmap where tagmapUserid = (
select userid from jpuser where userMail='pcrouillere@gmail.com')
AND tagmaptagid = (select tagId from jptag where tagName='NF28') AND tagmaptagid = (select tagId from jptag where tagName='DIY'));

/* Select URL with no tags for a user */
Select urlUri from jpurl where urlId NOT IN (
Select tagmapurlid from jptagmap where tagmapUserid = (select userid from jpuser where userMail='pcrouillere@gmail.com'));