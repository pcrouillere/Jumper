package dao;

import java.util.ArrayList;
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
}
