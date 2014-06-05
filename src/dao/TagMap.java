package dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import framework.Dao;

public class TagMap extends Dao {
	private int tmId;
	private Tag tmTag;
	private Url tmUrl;
	
	public TagMap(int id, Tag tag, Url url) {
		tmId = id;
		tmTag = tag;
		tmUrl = url;		
	}

	public TagMap(Tag tag, Url url) {
		tmTag = tag;
		tmUrl = url;		
	}
	
	public int getIdFromBdd()
	{
		ResultSet result;
		result = Dao.freeRequest("Select tagMapId from jpTagMap WHERE tagMapUrlId="+Integer.toString(tmUrl.getuId())+" AND tagMapTagId="+Integer.toString(tmTag.getTid())+";", null);
		try {
			if(result.next()){
				int id = result.getInt("tagMapId");
				return id;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1; 
	}
	
	public void addTagMaptoBDD(int userId)
	{
        try 
        {
			Dao.freeRequestUpdate("insert into jpTagMap(tagMapUserId, tagMapUrlId, tagMapTagId) values("+Integer.toString(userId)+", "+Integer.toString(tmUrl.getuId())+", "+Integer.toString(tmTag.getTid())+");", null);
		} catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
