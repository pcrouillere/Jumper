package graphview;

import dao.Tag;

public class node {
	

	private int id;
	private double size;
	private int colorId;
	public int getColorId() {
		return colorId;
	}

	public void setColorId(int colorId) {
		this.colorId = colorId;
	}

	private String color;
	private String name;
	private int index;
	private Tag tag;


	public node(int i,String n, double s, Tag t )
	{
		this.id=i;
		this.name=n;
		this.size=s;
		this.tag = t;
		this.color = "#C6DBEF";
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public double getSize() {
		return size;
	}

	public void setSize(double size) {
		this.size = size;
	}

	public String getColor() {
		return color;
	}

	public Tag getTag() {
		return tag;
	}

	public void setTag(Tag tag) {
		this.tag = tag;
	}
	

	public void setColor(String color) {
		this.color = color;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	
	@Override
	public String toString() {
		String retour = "{\"name\":\""+name+"\", \"r\":"+size+", \"id\":"+id+", \"index\":"+index+",\"color\":\""+color+"\" }";
		return retour;
	}
}
	