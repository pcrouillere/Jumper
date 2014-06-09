package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import framework.Dao;

public class Url extends Dao {
	private int uId;
	private int uUserId;
	private String uUri;
	private String uTitle;
	private int uVisited;
	
	public Url(int id, int userid, String uri, String title, int visit){
		uId = id;
		uUserId = userid;
		uUri = uri;
		uTitle = title;
		uVisited = visit;
	}
	
	public Url( int userid, String uri, String title, int visit){
		uUserId = userid;
		uUri = uri;
		uTitle = title;
		uVisited = visit;
	}
	
	public void addUrlToDBB() throws SQLException{		
		
        Dao.freeRequestUpdate("Insert into jpUrl(urlUserId, urlUri, urlTitle, urlNbVisited) values("+this.uUserId+",'"+this.uUri +"','"+this.uTitle +"',"+ this.uVisited +")", null);
	}
	
	public int getIdFromBDD(){
		ResultSet result;
		result = Dao.freeRequest("Select urlId from jpurl WHERE urlUserId="+Integer.toString(uUserId)+" AND urlUri='"+this.uUri+"';", null);
		try {
			if(result.next()){
				int id = result.getInt("urlId");
				return id;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public void addVisit(){
		Map<String, String> attr = new HashMap<String, String>();
		uVisited++;
		try {
			Dao.freeRequestUpdate("UPDATE jpUrl set UrlNbVisited="+Integer.toString(uVisited)+" WHERE urlId="+Integer.toString(this.uId)+";", null);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getuVisited() {
		return uVisited;
	}

	public void setuVisited(int uVisited) {
		this.uVisited = uVisited;
	}

	public List<Tag> getTags() throws SQLException{
		List<Tag> allTags = new ArrayList<Tag>();
		User u = User.getInstance();
		ResultSet resultId;
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("tagMapUrlId", Integer.toString(this.uId));
		attr.put("tagMapUserId", Integer.toString(u.getuId()));
		resultId = Dao.search("jpTagMap", attr);
		
		while(resultId.next()){
			allTags.add(u.getTagById(resultId.getInt("tagMapTagId")));
		}
		return allTags;
	}
	
	public boolean hasTag(Tag tag) throws SQLException{
		List<Tag> allTags = new ArrayList<Tag>();
		User u = User.getInstance();
		ResultSet resultId;
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("tagMapUrlId", Integer.toString(this.uId));
		attr.put("tagMapUserId", Integer.toString(u.getuId()));
		resultId = Dao.search("jpTagMap", attr);
		
		while(resultId.next()){
			if(resultId.getInt("tagMapTagId")==tag.getTid()){
				return true;
			}
		}
		return false;
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

}
