package framework;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

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
	
	public HttpServletRequest addvisit(HttpServletRequest req){
		String id = req.getParameter("id");
		User u = User.getInstance();
		Url url = u.getUrlById(Integer.valueOf(id));
		url.addVisit();
		return req;
	}
	
	public HttpServletRequest tagbyid(HttpServletRequest req){
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
	
	public HttpServletRequest graphview(HttpServletRequest req) throws SQLException
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
		JsonOutput fileInstance=new JsonOutput(graphInstance);
		fileInstance.update_output();
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
