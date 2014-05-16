package jump.servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jump.requete.TagsbyId;
import jump.requete.UrlsbyTagName;

public class tableauBord extends HttpServlet {
	public static final String ATT_MAP_TAGS = "MapTags";
    public static final String VUE          = "/tableauBord.jsp";
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

    	int userId = 1;
		/* Initialisation de l'objet Java et récupération des messages */
		TagsbyId req1 = new TagsbyId(userId);
		UrlsbyTagName req2= new UrlsbyTagName();
	    List<String> tags = req1.executer();

	    Map<String, List<String>> mapTagUrls = new HashMap<String,List<String>>();
	    Map<String, List<String>> myMap = new HashMap<String,List<String>>();
		request.setAttribute("mainMenu", myMap);

	    List<String> urls;
	    String tag;
	    
	    for(int i=0 ; i<tags.size() ; i++){
	    	
	    	urls = new ArrayList<String>();
	    	
	    	tag = tags.get(i);
	    	System.out.println("tag "+tag);
	    	req2.setTagName(tag);
	    	urls = req2.executer();
	    	System.out.println("urls "+urls.toString());
	    	myMap.put(tag, urls);
	    }
	    
	    
		//request.setAttribute("mainMenu", myMap);
		/*List<String> adminItemsList = new ArrayList<String>();
		adminItemsList.add("User Creation");
		adminItemsList.add("Branch Creation");
		myMap.put("Administrator", adminItemsList);

		
		adminItemsList = new ArrayList<String>();
		adminItemsList.add("Coucou");
		adminItemsList.add("Youyou");
		
		myMap.put("Lookup Configuration", adminItemsList);
	    */
	    
	    
	    /* Enregistrement de la liste des messages dans l'objet requête */
	   // request.setAttribute( ATT_MAP_TAGS, mapTagUrls );
	    //request.setAttribute( "map", mapTagUrls );
	    //	request.setAttribute( "tags", tags );
	    //	request.setAttribute( "urls", urls );
	    /* Transmission vers la page en charge de l'affichage des résultats */
	    this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }
}
