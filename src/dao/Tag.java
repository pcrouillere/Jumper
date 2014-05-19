package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import framework.Dao;

public class Tag extends Dao {
	private String tName;
	private int tid;
	private int tUserId;
	
	Tag(String n, int id, int uid) {
		tName = n;
		tid = id;
		tUserId = id;
	}

	/** getUrls() : fonction qui retourne l'ensemble des urls taggees avec le tag 
	 * @return List<Url>
	 * **/
	public List<Url> getUrls() throws SQLException{
		List<Url> allUrls = new ArrayList<Url>();
		User u = User.getInstance();
		ResultSet resultId;
		Map<String, String> attr = new HashMap<String, String>();
		attr.put("tagMapTagId", Integer.toString(this.tid));
		attr.put("tagMapUserId", Integer.toString(u.getuId()));
		resultId = Dao.search("jpTagMap", attr);
		
		while(resultId.next()){
			allUrls.add(u.getUrlById(resultId.getInt("tagMapUrlId")));
		}
		return allUrls;
	}

	public String gettName() {
		return tName;
	}


	public void settName(String tName) {
		this.tName = tName;
	}


	public int getTid() {
		return tid;
	}


	public void setTid(int tid) {
		this.tid = tid;
	}


	public int gettUserId() {
		return tUserId;
	}


	public void settUserId(int tUserId) {
		this.tUserId = tUserId;
	}
	
}