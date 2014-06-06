package framework;

import graphview.edge;
import graphview.graph;
import graphview.node;

import java.io.IOException;
import java.io.StringWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mysql.jdbc.exceptions.jdbc4.MySQLIntegrityConstraintViolationException;


import dao.*;

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
	
	public HttpServletRequest removeurlfromtag(HttpServletRequest req, HttpServletResponse response){
		int urlId = Integer.parseInt(req.getParameter("urlid"));
		int tagId = Integer.parseInt(req.getParameter("tagid"));
		User user = (User) this.parent.user();
		user.removeUrlFromTag(urlId, tagId);
		user.setuTagMap(null);
		user.addAllMap();
		return req;	
	}
	
	public HttpServletRequest removeurlfrombdd(HttpServletRequest req, HttpServletResponse response){
		int urlId = Integer.parseInt(req.getParameter("urlid"));
		User user = (User) this.parent.user();
		user.removeUrlFromBdd(urlId);
		user.setuTagMap(null);
		user.addAllMap();
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
		
		
		System.out.println("login login login login ");
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
				System.out.println("user not null");
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
	
	public HttpServletRequest graphview(HttpServletRequest req, HttpServletResponse response) throws SQLException
	{
		System.out.println("Loading Graph");
		User user=User.getInstance();
		List<Tag> listTags=user.getAllTag();
		Iterator it = listTags.iterator();
		node instTag=null;
		Tag currentTag=null;
		graph graphInstance=new graph();
		int xVal;
		int yVal;
		Random r=new Random();
		while(it.hasNext())
		{
			currentTag=(Tag) it.next();
			do
			{
				xVal=r.nextInt(user.getAllTag().size()/2);
				yVal=r.nextInt(user.getAllTag().size()/2);
			}while(graphInstance.locationAlreadyExist(xVal, yVal));
			
			instTag=new node(String.valueOf(currentTag.getTid()), currentTag.gettName(),xVal , yVal, currentTag.getUrls().size());
			graphInstance.putNodes(instTag);
			instTag=null;
		}
		List<Url> listUrls=user.getAllUrl();
		Iterator itUri=listUrls.iterator();
		Url currentUrl;
		for(int k=0;k<listUrls.size();k++)
		{
			currentUrl=(Url) listUrls.get(k);
			if(currentUrl.getTags().size()>1)
			{
				edge instance = null;
				String idEdge;
				for(int i=0;i<currentUrl.getTags().size();i++)
				{
					for(int j=i+1;j<currentUrl.getTags().size();j++)
					{
						idEdge=String.valueOf(currentUrl.getuId())+String.valueOf(i)+String.valueOf(j);
						if(currentUrl.getTags().get(i).getTid()!=currentUrl.getTags().get(j).getTid())
						{
							instance=new edge(idEdge,String.valueOf(currentUrl.getTags().get(i).getTid()),String.valueOf(currentUrl.getTags().get(j).getTid()));
							graphInstance.putEdges(instance);
						}
						instance=null;
					}
				}
			}
		}		
		System.out.println("getting ready to output files");
		
		ObjectMapper mapper = new ObjectMapper();
		StringWriter sw = new StringWriter();
		try 
		{
			mapper.writeValue(sw, graphInstance);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		req.setAttribute("json_data", sw.toString());
		/*
		JsonOutput fileInstance=new JsonOutput(graphInstance,this.parent);
		fileInstance.update_output();
		*/
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
			url.setuId(url.getIdFromBDD());
			User user = (User) this.parent.user();
			user.addOneUrl(url);
			response.setStatus(200);
		}
		catch(MySQLIntegrityConstraintViolationException e){
			// URL existe d�j� dans la BDD
			System.out.println("URL duppliquee");
			response.setStatus(201);

		} catch (SQLException e) {
			// erreur dans l'insertion a la BDD
			e.printStackTrace();
			response.setStatus(400);
		}
	
		return req;
	}

	/** Fonction advancedsearch
	 * Gere la page advancedsearch de l'application
	 * @param req	: HttpServletRequest **/
	
	public HttpServletRequest advancedsearch(HttpServletRequest req, HttpServletResponse response){
		User user = User.getInstance();
		List<Tag> tags = user.getAllTag();
		int nbTags = tags.size();
		List<Url> urls = user.getAllUrl();
		int nbUrls = urls.size();
		List<Url> untaggedUrls = user.getUntaggedUrl();
		int nbUntaggedUrls = untaggedUrls.size();
		Map<Tag, List<Url>> mapTagUrls = new HashMap<Tag, List<Url>>();
		
		String tagoper = req.getParameter("tagoper");
		System.out.println(tagoper);
	   //this.parent.redirect("accueil", true);
		return req;
	
	}
	

	
	
	public HttpServletRequest addtagurl(HttpServletRequest req, HttpServletResponse response)
	{
		User user = User.getInstance(); 
		String uri =(String) req.getParameter("url");
		String listTag=(String)req.getParameter("list");
		Url url=user.getUrlById(Integer.valueOf(uri));
		String str[] = listTag.split("\\$\\$\\$");
		for(int i=0; i<str.length; i++)
		{
			Tag tag = user.getTagByName(str[i]);
			if(tag == null) {
				//add tag
				tag=new Tag(str[i],user.getuId());
				tag.addTagtoBDD();
				tag.setTid(tag.getTagIdFromBDD());
				user.addOneTag(tag);
			} 
			TagMap tm=new TagMap(tag,url);
			tm.addTagMaptoBDD(user.getuId());
			tm.setTmId(tm.getIdFromBdd());
			user.addOneMap(tm);
		}
		return req;
	}

}
