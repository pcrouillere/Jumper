package jump.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

public class Tag extends Dao {
	private String tName;
	private int tid;
	private int tUserId;

	
	Tag(String n, int id, int uid) {
		tName = n;
		tid = id;
		tUserId = id;
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