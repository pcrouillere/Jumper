package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

//import sun.security.util.Length;
import framework.Base;
import framework.Dao;

public class User extends Dao {
	
	private static User instance = null;
	private String uEmail;
	private String uPassword;
	private int uId;
	private Base uCon;
	private List<Tag> uTags;
	private int nbTag;
	private List<Url> uUrls;
	private int nbUrl;
	private List<TagMap> uTagMap;
	private int nbTagMap;
	private String uName;
	
	public void deleteUser() {
		instance = null;
	}
	public static User getInstance(){
		if (instance == null) {
			return null;
			}
		return instance;
	}
	
	public String getuName() {
		return uName;
	}

	public void setuName(String uName) {
		this.uName = uName;
	}

	public static User getInstance(int id, String email, String pass, String name){
		if (instance == null)
			instance = new User(id, email, pass, name);
		return instance;
	}
	
	public static User getInstance(String email, String pass) throws SQLException{
		boolean realUser = false;
		int id = 0;
		String name = "";
		if (instance == null){
			Map<String, String> attr = new HashMap<String, String>();
			ResultSet result;
			attr.put("userMail", email);
			result = Dao.search("jpUser", attr);
			while (result.next()){
				if(result.getString("userPassword").equals(pass)){
					realUser=true;
					id = result.getInt("userId");
					name = result.getString("userName");
				}
			}
			if (realUser){
			instance = new User(id, email, pass, name);
			return instance;
			}
		}
		return null;
	}
	
	public static void addNewUser(String email, String password, String name) throws SQLException{
		ResultSet result;
		result = Dao.freeRequest("Select * from jpuser WHERE userMail = '"+email+"'", null);
		try {
			if(result.next()) {
				
			}
			else {
				String req = "Insert into jpUser(userMail, userPassword, userName) values('"+email+"','"+password+"','"+name+"')";
		        Dao.freeRequestUpdate(req, null);
		        User.createUser(email);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public static void createUser(String mail) throws SQLException{
		int id = 0;
		Map<String, String> attr = new HashMap<String, String>();
		ResultSet result;
		attr.put("userMail", mail);
		result = Dao.search("jpUser", attr);
		while (result.next()){
				id = result.getInt("userId");
			}
		String req = "Insert into jpTag(tagUserId, tagName) values("+id+", 'Jumper')";
        Dao.freeRequestUpdate(req, null);
        Dao.freeRequestUpdate("Insert into jpUrl(urlUserId, urlUri, urlTitle, urlNbVisited) values("+id+", 'http://localhost:8080/Jump/?page=accueil', '#Jumper', 0)", null);
        Dao.freeRequestUpdate("Insert into jpUrl(urlUserId, urlUri, urlTitle, urlNbVisited) values("+id+", 'http://localhost:8080/Jump/?page=tableauBord', '#Jumper', 0)", null);
        Url url = new Url(id, "http://localhost:8080/Jump/?page=tableauBord", "#Jumper", 0);
        Tag tag = new Tag("Jumper", id);
        tag.setTid(tag.getTagIdFromBDD());
        url.setuId(url.getIdFromBDD());
        TagMap tagMap = new TagMap(tag, url);
        tagMap.addTagMaptoBDD(id);
        
	}
	
	/* Cr�er un nouveau user */
	private User() {
		uTags = new ArrayList<Tag>();
		uUrls = new ArrayList<Url>();
		uTagMap = new ArrayList<TagMap>();
		nbTag = 0;
		nbUrl = 0;
	}

	/* Cr�er un nouveau user */	
	private User(int id, String email, String pass, String name){
		super();
		uName = name;
		uCon = new Base();
		uTags = new ArrayList<Tag>();
		uUrls = new ArrayList<Url>();
		uTagMap = new ArrayList<TagMap>();
		setuEmail(email);
		setuPassword(pass);
		setuId(id);
		nbTag = 0;
		nbUrl = 0;
		nbTagMap = 0;
		addAllTag();
		addAllUrl();
		addAllMap();
		getUntaggedUrl();
	}
	
	public void setuUrls(List<Url> uUrls) {
		this.uUrls = uUrls;
	}
	/* Fonction qui retourne le tag recherch� en fonction de son ID */
	public Tag getTagById(int id) {
		for (int i=0; i< uTags.size(); i++) {
			if(uTags.get(i).getTid()==id)
				return uTags.get(i);
		}
		return null;
	}
	
	public Tag getTagByName(String name) {
		for (int i=0; i< uTags.size(); i++) {
			if(uTags.get(i).gettName().equals(name))
				return uTags.get(i);
		}
		return null;
	}
	
	public Url getUrlById(int id){
		for(int i=0; i< uUrls.size(); i++){
			if(uUrls.get(i).getuId()==id)
				return uUrls.get(i);
		}
		return null;
	}
	
	public List<TagMap> getuTagMap() {
		return uTagMap;
	}

	public void setuTagMap(List<TagMap> uTagMap) {
		this.uTagMap = uTagMap;
	}

	/* Fonction pour ajouter un tag dans la liste des tags de l'utilisateur */
	public void addOneTag(Tag tag) {
		uTags.add(tag);
		nbTag++;
	}
	
	/* Fonction pour ajouter une URL dans la liste d'URL de l'utilisateur */
	public void addOneUrl(Url url) {
		uUrls.add(url);
		nbUrl++;
	}
	
	public void addOneMap(TagMap tagMap){
		uTagMap.add(tagMap);
		nbTagMap++;
	}
	
	// TODO : Enlever les variables temporaires
	// TODO : Ajouter les commentaires expliquant les fonctions

	private void addAllTag() {
		ResultSet resultat;
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("tagUserId", Integer.toString(this.uId));
		resultat = Dao.search("jpTag", attr);
		try {
			while(resultat.next()){
				int tagId = resultat.getInt("tagId");
				String tagName = resultat.getString("tagName");
				Tag tag = new Tag(tagName, tagId, this.uId);
				addOneTag(tag);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void addAllUrl() {
		ResultSet resultat;
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("urlUserId", Integer.toString(this.uId));
		resultat = Dao.search("jpUrl", attr);
		try {
			while(resultat.next()){
				int urlId = resultat.getInt("urlId");
				String urlTitle = resultat.getString("urlTitle");
				String urlUri = resultat.getString("urlUri");
				int urlVisit = resultat.getInt("urlNbVisited");
				Url url = new Url(urlId, this.uId, urlUri, urlTitle, urlVisit);
				addOneUrl(url);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void addAllMap() {
		ResultSet resultat;
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("tagMapUserId", Integer.toString(this.uId));
		resultat = Dao.search("jpTagMap", attr);
		try {
			while(resultat.next()){
				TagMap tagMap = new TagMap(resultat.getInt("tagMapId"), getTagById(resultat.getInt("tagMapTagId")), getUrlById(resultat.getInt("tagMapUrlId")));
				addOneMap(tagMap);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/** Fonction pour ajouter un user
	 * @param
	 * sql_data		: Contient les informations sur le User 
	 * @throws SQLException **/
	
	static public boolean insert(String [] sql_data) throws SQLException{
		return Dao.insert("jpuser", sql_data);
	}
	
	/* Fonction qui retourne tous les tags de l'utilisateur  */
	
	public List<Tag> getAllTag() {
		return uTags;
	}

	/* Fonction qui retourne toutes les URLs de l'utilisateur  */
	public List<Url> getAllUrl(){
		return uUrls;
	}
	public List<Url> getAllUrlOrderBy(){
		ResultSet result;
		List<Url> urls = new ArrayList<Url>();
		result = Dao.freeRequest("Select DISTINCT * from jpurl WHERE urlUserId = "+this.uId+" ORDER BY urlNbVisited DESC;", null);
		try {
			while(result.next()){
				Url url = getUrlById(result.getInt("urlId"));
				urls.add(url);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return urls;
	}
	public List<Url> getUntaggedUrl() {
		ResultSet result;
		List<Url> untaggedUrl = new ArrayList<Url>();
		Map<String, String> attr = new HashMap<String, String>();
		attr = null;
		result = Dao.freeRequest("Select * from jpurl where urlId NOT IN (Select tagmapurlid from jptagmap where tagmapUserid ="+this.uId+") AND urluserId="+this.uId, attr);
		try {
			while(result.next()){
				Url url = getUrlById(result.getInt("urlId"));
				untaggedUrl.add(url);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(untaggedUrl.size());
		return untaggedUrl;
	}
	
	public List<Url> advancedsearch(String tagoper){
		ResultSet result;
		List<Url> urls = new ArrayList<Url>();
		Map<String, String> attr = null;
		
		result = Dao.freeRequest(tagoper, attr);
		try {
			while(result.next()){
				Url url = getUrlById(result.getInt("urlId"));
				urls.add(url);				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(urls.size());
			return urls;
	}
		
	
	
	public HashMap<Tag,ArrayList<Url>> getTagAutoCompletion(String part){
		HashMap<Tag,ArrayList<Url>> mapResult = new HashMap<Tag,ArrayList<Url>>();
		String requeteSql = "Select DISTINCT * from jptag WHERE tagUserId = "+this.uId+" AND tagName LIKE '%"+part+"%';";
		System.out.println(requeteSql);
		ResultSet result = Dao.freeRequest(requeteSql, null);
		
		try {
			
			while(result.next()){
				Tag tag = new Tag(result.getString("tagName"), result.getInt("tagId"), result.getInt("tagUserId"));
				String requeteSql2 = "Select tagMapUrlId from jptagmap WHERE tagMapUserId = "+this.uId+" AND tagMapTagId = "+tag.getTid();
				System.out.println(requeteSql2);
				ResultSet result2 = Dao.freeRequest(requeteSql2, null);
				ArrayList<Url> listResult = new ArrayList<Url>();
				while(result2.next()){
					Url url = getUrlById(result2.getInt("tagMapUrlId"));
					listResult.add(url);
				}
				mapResult.put(tag, listResult);
				
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		return mapResult;
	}
	
	
	public ArrayList<Url> getAutoCompletion(String part){
		ArrayList<Url> listResult = new ArrayList<Url>();
		String requeteSql = "Select DISTINCT * from jpurl WHERE urlUserId = "+this.uId+" AND urlTitle LIKE '%"+part+"%' ORDER BY urlNbVisited DESC;";
		System.out.println(requeteSql);
		ResultSet result = Dao.freeRequest(requeteSql, null);
		
		try {
			while(result.next()){
				Url url = new Url(result.getInt("urlId"),result.getInt("urlUserId"), result.getString("urlUri"), result.getString("urlTitle"), result.getInt("urlNbVisited") );
				listResult.add(url);
			}
		}
		catch(SQLException e){
			e.printStackTrace();
		}
		
		return listResult;
	}
	
	public void removeUrlFromTag(int urlId, int tagId){
		String requeteSql ="DELETE FROM jptagmap WHERE tagMapTagId="+tagId+" AND tagMapUrlId="+urlId+" AND tagMapUserId="+this.getuId();
		try {
			Dao.freeRequestUpdate(requeteSql, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
	public void removeUrlFromBdd(int urlId){
		String requeteSql ="DELETE FROM jptagmap WHERE tagMapUrlId="+urlId+" AND tagMapUserId="+this.getuId();
		try {
			Dao.freeRequestUpdate(requeteSql, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		String requeteSqlDelete="DELETE FROM jpUrl WHERE urlId="+urlId;
		try {
			Dao.freeRequestUpdate(requeteSqlDelete, null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	/* Getter & Setter */
	public Base getuCon() {
		return uCon;
	}

	public void setuCon(Base uCon) {
		this.uCon = uCon;
	}

	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public String getuEmail() {
		return uEmail;
	}

	public void setuEmail(String uEmail) {
		this.uEmail = uEmail;
	}
}
