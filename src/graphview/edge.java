package graphview;

public class edge {
	private int source;
	private int target;
	
	public edge(int s, int t)
	{
		this.source=s;
		this.target=t;
	}

	public int getSource() {
		return source;
	}

	public void setSource(int source) {
		this.source = source;
	}

	public int getTarget() {
		return target;
	}

	public void setTarget(int target) {
		this.target = target;
	}
	
	@Override
	public String toString() {
		String retour = "{\"source\":"+this.source+",\"target\":"+this.target+"}";
		return retour;
	}
}
