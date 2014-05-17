package jump.model;

public class TagMap extends Dao {
	private int tmId;
	private Tag tmTag;
	private Url tmUrl;
	
	public TagMap(int id, Tag tag, Url url) {
		tmId = id;
		tmTag = tag;
		tmUrl = url;		
	}

	public int getTmId() {
		return tmId;
	}

	public void setTmId(int tmId) {
		this.tmId = tmId;
	}

	public Tag getTmTag() {
		return tmTag;
	}

	public void setTmTag(Tag tmTag) {
		this.tmTag = tmTag;
	}

	public Url getTmUrl() {
		return tmUrl;
	}

	public void setTmUrl(Url tmUrl) {
		this.tmUrl = tmUrl;
	}
	
}
