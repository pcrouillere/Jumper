package dao;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.annotation.JsonTypeInfo.As;

@JsonTypeInfo(use = JsonTypeInfo.Id.MINIMAL_CLASS, include = As.PROPERTY, property = "@class")

public class graph {
	private List<node> nodes;
	private List<edge> edges;
	
	public graph()
	{
		this.nodes=new ArrayList<node>();
		this.edges=new ArrayList<edge>();
	}
	
	public List<node> getNodes() {
		return nodes;
	}

	public void setNodes(List<node> nodes) {
		this.nodes = nodes;
	}

	public List<edge> getEdges() {
		return edges;
	}

	public void setEdges(List<edge> edges) {
		this.edges = edges;
	}

	public void putNodes(node instance)
	{
		this.nodes.add(instance);
	}
	
	public void putEdges(edge instance)
	{
		this.edges.add(instance);
	}
	
	public boolean edgeAlreadyExist(edge instance)
	{
		edge curedg;
		int i=0;
		while(i<edges.size())
		{
			curedg=edges.get(i);
			if(curedg.getId().equals(instance.getId()))
				return true;
			i++;
		}
		return false;
	}
	
	public boolean locationAlreadyExist(int xVar,int yVar)
	{
		node temp=null;
		int i=0;
		while(i<nodes.size())
		{
			temp=nodes.get(i);
			if(temp.getX()==xVar && temp.getY()==yVar)
			{
				return true;
			}
			i++;
		}
		return false;
	}
}
