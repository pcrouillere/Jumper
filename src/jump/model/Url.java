package jump.model;

public class Url extends Dao {
	private int uId;
	private int uUserId;
	private String uUri;
	private String uTitle;
	
	public Url(int id, int userid, String uri, String title){
		uId = id;
		uUserId = userid;
		uUri = uri;
		uTitle = title;
	}
	public int getuId() {
		return uId;
	}

	public void setuId(int uId) {
		this.uId = uId;
	}

	public int getuUserId() {
		return uUserId;
	}

	public void setuUserId(int uUserId) {
		this.uUserId = uUserId;
	}

	public String getuUri() {
		return uUri;
	}

	public void setuUri(String uUri) {
		this.uUri = uUri;
	}

	public String getuTitle() {
		return uTitle;
	}

	public void setuTitle(String uTitle) {
		this.uTitle = uTitle;
	}


	/* Table de String contenant tous les names des tags assignés à l'url */
	

}
