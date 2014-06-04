package framework;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;

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
	
	public HttpServletRequest addvisit(HttpServletRequest req, HttpServletResponse response){
		String id = req.getParameter("id");
		User u = User.getInstance();
		Url url = u.getUrlById(Integer.valueOf(id));
		url.addVisit();
		return req;
	}
	
	public HttpServletRequest tagbyid(HttpServletRequest req, HttpServletResponse response){
		String id = req.getParameter("id");
		User user = User.getInstance();
		List<Tag> tags = user.getAllTag();
		int nbTags = tags.size();
		List<Url> urls = user.getAllUrl();
		int nbUrls = urls.size();
		List<Url> untaggedUrls = user.getUntaggedUrl();
		int nbUntaggedUrls = untaggedUrls.size();
		Tag tag = user.getTagById(Integer.valueOf(id));
		List<Url> listUrls = tag.getUrls();
		
		req.setAttribute("tag", tag);
		req.setAttribute("nbTags", nbTags);
		req.setAttribute("nbUrls", nbUrls);
		req.setAttribute("nbUntaggedUrls", nbUntaggedUrls);
		req.setAttribute("listUrls", listUrls);
		return req;
	}
	
	public HttpServletRequest index(HttpServletRequest req, HttpServletResponse response) {
		return req;
	}
	
	public HttpServletRequest error(HttpServletRequest req, HttpServletResponse response) {
		return req;
	}
	
	/** Fonction deconnexion
	 * @param req	: HttpServletRequest
	 * @return HttpServletRequest **/
	public HttpServletRequest deconnexion(HttpServletRequest req, HttpServletResponse response) {
		User user = User.getInstance();
		user.deleteUser();
		this.parent.redirect("login");
		this.parent.session().close();
		return req;
	}
	

	public HttpServletRequest accueil(HttpServletRequest req, HttpServletResponse response){
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
	
	public HttpServletRequest login(HttpServletRequest req, HttpServletResponse response) {
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
				Cookie userCookie = new Cookie("userId", Integer.toString(user.getuId()));
				response.addCookie(userCookie);
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
	
	/** Fonction tableauBord
	 * Gere la page tableau de bord de l'application
	 * @param req	: HttpServletRequest **/
	
	public HttpServletRequest tableaubord(HttpServletRequest req, HttpServletResponse response){
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
	
	public HttpServletRequest ajoutertag(HttpServletRequest req, HttpServletResponse response) throws SQLException
	{
		User user = User.getInstance(); 
		List<Tag> allTags = user.getAllTag();
		List<Url> allUrls = user.getUntaggedUrl();
		req.setAttribute("tags", allTags);
		req.setAttribute("untaggedurls", allUrls);
		//req.setAttribute("script", script);
		return req;
	}
	

	public HttpServletRequest addurl(HttpServletRequest req, HttpServletResponse response){
		int idUser = Integer.parseInt(req.getParameter("id"));
		String siteUrl = req.getParameter("url");
		String nomUrl = req.getParameter("nomUrl");
		System.out.println("id user : "+idUser+" url : "+siteUrl+" nom : "+nomUrl);
		Url url = new Url(idUser,siteUrl, nomUrl, 0);
		try{
			url.addUrlToDBB();
			User user = (User) this.parent.user();
			user.addOneUrl(url);
			
			response.setStatus(200);
		}
		catch(MySQLIntegrityConstraintViolationException e){
			// URL existe déjà dans la BDD
			System.out.println("URL duppliqué");
			response.setStatus(201);

		} catch (SQLException e) {
			// erreur dans l'insertion a la BDD
			e.printStackTrace();
			response.setStatus(400);
		}
	
		return req;
	}
	
	public HttpServletRequest addtagurl(HttpServletRequest req, HttpServletResponse response)
	{
		String uri =(String) req.getParameter("url");
		String listTag=(String)req.getParameter("list");
		System.out.print("L'URL : "+uri+"\nles tags: "+listTag);
		return req;
	}
}
