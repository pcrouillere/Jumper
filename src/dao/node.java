package dao;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.JsonTypeInfo.As;;

@JsonTypeInfo(use = JsonTypeInfo.Id.MINIMAL_CLASS, include = As.PROPERTY, property = "@class")

public class node {
	private String id;
	private String label;
	private int x;
	private int y;
	private int size;

	public node(@JsonProperty("id") String i,@JsonProperty("label")String l,@JsonProperty("x")int xx,@JsonProperty("y")int yy,@JsonProperty("size")int s)
	{
		this.id=i;
		this.label=l;
		this.x=xx;
		this.y=yy;
		this.size=s;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
}
