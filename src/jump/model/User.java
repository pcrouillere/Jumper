package jump.model;

import java.util.List;

public class User {
	private String uEmail;
	private String uPassword;
	private int uId;
	private Base uCon;
	private Tag[] uTags;
	private int nbTag;
	private int nbMaxTag;
	private Url[] uUrls;
	private int nbUrl;
	private int nbMaxUrl;
	
	/* Créer un nouveau user */
	public User() {
		uTags = new Tag[150];
		uUrls = new Url[150];
		nbTag = 0;
		nbUrl = 0;
	}
	
	/* Créer un nouveau user */	
	public User(int id, String email, String pass){
		super();
		uCon = new Base();
		uTags = new Tag[150];
		uUrls = new Url[150];
		setuEmail(email);
		setuPassword(pass);
		nbTag = 0;
		nbUrl = 0;
		nbMaxTag = 50;
		nbMaxUrl = 50;
	}
	
	/* Fonction pour ajouter un tag dans le tableau des tags de l'utilisateur */
	private void AddTag(Tag tag) {
		int i;
		if (nbTag==nbMaxTag) {
			Tag[] uNewTags = new Tag[nbMaxTag + 50]; 
			for (i=0; i <= nbMaxTag; i++) {
				uNewTags[i] = uTags[i]; 
			}
			uTags = uNewTags;
			nbMaxTag += 50;
		}
		uTags[nbTag]=tag;
		nbTag++;
	}
	
	/* Fonction pour ajouter une URL dans le tableau d'URL de l'utilisateur */
	@SuppressWarnings("unused")
	private void AddUrl(Url url) {
		if (nbUrl==nbMaxUrl) {
			Url[] uNewUrls = new Url[nbMaxUrl + 50]; 
			for (int i=0; i <= nbMaxUrl; i++) {
				uNewUrls[i] = uUrls[i]; 
			}
			uUrls = uNewUrls;
			nbMaxUrl += 50;
		}
		uUrls[nbTag]=url;
		nbUrl++;
	}
	
	/* Fonction pour ajouter un user
	 * @param
	 * sql_data		: Contient les informations sur le User */
	
	static public boolean insert(String [] sql_data){
		return Dao.insert("jpuser", sql_data);
	}
	
	/* Fonction pour retrouver tous les tags d'un utilisateur
	 * @param
	 *  */
	
	public List<Tag> findAllTag() {
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
