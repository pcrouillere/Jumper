package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import sun.security.util.Length;
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
	
	public static User getInstance(){
		if (instance == null)
			instance = new User();
		return instance;
	}
	
	public static User getInstance(int id, String email, String pass){
		if (instance == null)
			instance = new User(id, email, pass);
		return instance;
	}
	
	public static User getInstance(String email, String pass) throws SQLException{
		boolean realUser = false;
		int id = 0;
		if (instance == null){
			Map<String, String> attr = new HashMap<String, String>();
			ResultSet result;
			attr.put("userMail", email);
			result = Dao.search("jpUser", attr);
			while (result.next()){
				System.out.println(result.getString("userPassword"));
				if(result.getString("userPassword").equals(pass)){
					realUser=true;
					id = result.getInt("userId");
				}
			}
			if (realUser){
			instance = new User(id, email, pass);
			return instance;
			}
		}
		return null;
	}
	

	
	/* Créer un nouveau user */
	private User() {
		uTags = new ArrayList<Tag>();
		uUrls = new ArrayList<Url>();
		uTagMap = new ArrayList<TagMap>();
		nbTag = 0;
		nbUrl = 0;
	}

	/* Créer un nouveau user */	
	private User(int id, String email, String pass){
		super();
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
	
	/* Fonction qui retourne le tag recherché en fonction de son ID */
	public Tag getTagById(int id) {
		for (int i=0; i<= uTags.size(); i++) {
			if(uTags.get(i).getTid()==id)
				return uTags.get(i);
		}
		return null;
	}
	
	public Url getUrlById(int id){
		for(int i=0; i<= uUrls.size(); i++){
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
	private void addOneTag(Tag tag) {
		uTags.add(tag);
		nbTag++;
	}
	
	/* Fonction pour ajouter une URL dans la liste d'URL de l'utilisateur */
	private void addOneUrl(Url url) {
		uUrls.add(url);
		nbUrl++;
	}
	
	private void addOneMap(TagMap tagMap){
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
	
	private void addAllUrl() {
		ResultSet resultat;
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("urlUserId", Integer.toString(this.uId));
		resultat = Dao.search("jpUrl", attr);
		try {
			while(resultat.next()){
				int urlId = resultat.getInt("urlId");
				String urlTitle = resultat.getString("urlTitle");
				String urlUri = resultat.getString("urlUri");
				Url url = new Url(urlId, this.uId, urlUri, urlTitle);
				addOneUrl(url);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void addAllMap() {
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
	 * sql_data		: Contient les informations sur le User **/
	
	static public boolean insert(String [] sql_data){
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
	
	public List<Url> getUntaggedUrl() {
		ResultSet result;
		List<Url> untaggedUrl = new ArrayList<Url>();
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("userMail", this.uEmail);
		result = Dao.freeRequest("Select * from jpurl where urlId NOT IN (Select tagmapurlid from jptagmap where tagmapUserid = (select userid from jpuser where userMail=?))", attr);
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
		return null;
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
