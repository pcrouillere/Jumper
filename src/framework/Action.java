package framework;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import dao.*;
import dao.Tag;
import dao.Url;
import dao.User;

/**
 * Classe qui definie les actions specifiques pour chaque page.
 */
public class Action
{
	FrontController parent = null;
	
	public Action(FrontController parent) {
		this.parent = parent;
	}
	
	public HttpServletRequest addvisit(HttpServletRequest req){
		String id = req.getParameter("id");
		User u = User.getInstance();
		Url url = u.getUrlById(Integer.valueOf(id));
		url.addVisit();
		
		return req;
	}
	
	public HttpServletRequest index(HttpServletRequest req) {
		return req;
	}
	
	public HttpServletRequest error(HttpServletRequest req) {
		return req;
	}
	
	/** Fonction deconnexion
	 * @param req	: HttpServletRequest
	 * @return HttpServletRequest **/
	public HttpServletRequest deconnexion(HttpServletRequest req) {
		this.parent.redirect("login");
		this.parent.session().close();
		return req;
	}
	

	public HttpServletRequest accueil(HttpServletRequest req){
		User user = User.getInstance();
		List<Tag> tags = user.getAllTag();
		int nbTags = tags.size();
		List<Url> urls = user.getAllUrl();
		int nbUrls = urls.size();
		List<Url> untaggedUrls = user.getUntaggedUrl();
		int nbUntaggedUrls = untaggedUrls.size();
		Map<Tag, List<Url>> mapTagUrls = new HashMap<Tag, List<Url>>();
		
		if (tags != null){
			Iterator<Tag> it = tags.iterator();
			while(it.hasNext()){
				Tag tag = it.next();
				mapTagUrls.put(tag, tag.getUrls());
			}
		}
		
		req.setAttribute("tags", tags);
		req.setAttribute("urls", urls);
		req.setAttribute("untaggedurls", untaggedUrls);
		req.setAttribute("mapTagUrls", mapTagUrls);
		req.setAttribute("nbTags", nbTags);
		req.setAttribute("nbUrls", nbUrls);
		req.setAttribute("nbUntaggedUrls", nbUntaggedUrls);
		return req;
	}
	
	/** Fonction login
	 * Gere la connexion de l'utilisateur lors de son arrivee dans l'application
	 * @param req	: HttpServletRequest **/
	
	public HttpServletRequest login(HttpServletRequest req) {
		String email = req.getParameter("email");
		String mdp = req.getParameter("password");
		boolean access = false;
		User user;
		if(email!=null) {
		try {
			user = User.getInstance(email, mdp);
			System.out.println(email);
			System.out.println(mdp);
			if (user!=null) {
				this.parent.session().open(user);
				this.parent.redirect("accueil", true);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		}
		
	return req;
	}
	
	public HttpServletRequest graphview(HttpServletRequest req)
	{
		User user=User.getInstance();
		List<Tag> listTags=user.getAllTag();
		Iterator it = listTags.iterator();
		node instTag=null;
		Tag currentTag=null;
		graph graphInstance=new graph();
		int xVal=0;
		int yVal=0;
		while(it.hasNext())
		{
			currentTag=(Tag) it.next();
			instTag=new node(String.valueOf(currentTag.getTid()), currentTag.gettName(),xVal , yVal, 3);
			xVal++;yVal++;
			graphInstance.putNodes(instTag);
			instTag=null;
		}
		testJson fileInstance=new testJson(graphInstance);
		//fileInstance.update_output();
		return req;
	}
	/** Fonction tableauBord
	 * Gere la page tableau de bord de l'application
	 * @param req	: HttpServletRequest **/
	
	public HttpServletRequest tableaubord(HttpServletRequest req){
		User user = User.getInstance();
		List<Tag> tags = user.getAllTag();
		int nbTags = tags.size();
		List<Url> urls = user.getAllUrl();
		int nbUrls = urls.size();
		List<Url> untaggedUrls = user.getUntaggedUrl();
		int nbUntaggedUrls = untaggedUrls.size();
		Map<Tag, List<Url>> mapTagUrls = new HashMap<Tag, List<Url>>();
		
		if (tags != null){
			Iterator<Tag> it = tags.iterator();
			while(it.hasNext()){
				Tag tag = it.next();
				mapTagUrls.put(tag, tag.getUrls());
			}
		}
		System.out.println(mapTagUrls.size());
		req.setAttribute("tags", tags);
		req.setAttribute("urls", urls);
		req.setAttribute("untaggedurls", untaggedUrls);
		req.setAttribute("mapTagUrls", mapTagUrls);
		req.setAttribute("nbTags", nbTags);
		req.setAttribute("nbUrls", nbUrls);
		req.setAttribute("nbUntaggedUrls", nbUntaggedUrls);		
		return req;
	}
}
