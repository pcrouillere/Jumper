package jump.model;

public class Tag {
	private String tName;
	private int tid;
	private int tUserId;
	private Url[] urlTag;
	private int nbUrl;
	private int maxnbUrl;
	
	Tag(String n, int id, int uid) {
		tName = n;
		tid = id;
		tUserId = id;
		nbUrl = 0;
		maxnbUrl = 50;
		urlTag = new Url[maxnbUrl];
	}
	
	public void addUrl(Url url){
		if (nbUrl == maxnbUrl - 1){
			Url[] newUrlTag = new Url[maxnbUrl + 50];
			for (int i=0; i <= maxnbUrl; i++) {
				newUrlTag = urlTag;
			}
			maxnbUrl += 50;
			urlTag = newUrlTag;
		}
		urlTag[nbUrl] = url;
		nbUrl++;
	}
	
	public void deleteUrl(Url url){
		int j = 0;
		for (int i=0; i <= nbUrl; i++){
			if (urlTag[i] == url) {
				j = i;
			}
		for (int k=0; k <= nbUrl - j; k++){
			urlTag[j+k] = urlTag[j+k+1];
		}
		urlTag[nbUrl] = null;
		nbUrl--;
		}
	}
	
	public findUrl(){
		
	}
	
}