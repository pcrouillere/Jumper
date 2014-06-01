package framework;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;

/**
 * Class pour Session simplifee
 */
public class Session {
	private HttpSession data = null;

	public Session(HttpServletRequest req) {
		this.data = req.getSession();
	}
 
	public boolean is_open() {
		return (this.data.getAttribute("user") != null);
	}
	
	public void open(Object user) {
		this.data.setAttribute("user",user);
	}
	
	public Object get_user() {
		return this.data.getAttribute("user");
	}
	
	public void set(String name,Object value) {
		this.data.setAttribute(name,value);
	}
	
	public Object get(String name) {
		return this.data.getAttribute(name);
	}
	
	public void close() {
		this.data.removeAttribute("user");
	}
}
