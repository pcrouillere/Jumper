package jump.model;

public class User {
	private String uEmail;
	private String uPassword;
	private int uId;
	private Connexion uCon;
	private Tag[] uTags;
	private int nbTag;
	private int nbMaxTag;
	private Url[] uUrls;
	private int nbUrl;
	private int nbMaxUrl;
	
	public User() {
		uTags = new Tag[150];
		uUrls = new Url[150];
		nbTag = 0;
		nbUrl = 0;
	}
	
	public User(int id, String email, String pass){
		uCon = new Connexion(id);
		uTags = new Tag[150];
		uUrls = new Url[150];
		uEmail = email;
		uPassword = pass;
		nbTag = 0;
		nbUrl = 0;
		nbMaxTag = 50;
		nbMaxUrl = 50;
	}
	
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
	}
	
	
	
}
