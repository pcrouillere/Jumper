package jump.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jump.requete.TagsbyId;

public class tableauBord extends HttpServlet {
	public static final String ATT_TAGS = "tags";
    public static final String VUE          = "/tableauBord.jsp";
    
    public void doGet( HttpServletRequest request, HttpServletResponse response ) throws ServletException, IOException {

    	int userId = 1;
		/* Initialisation de l'objet Java et récupération des messages */
		TagsbyId test = new TagsbyId(userId);
	    List<String> tags = test.executerTests( request );
	    
	    /* Enregistrement de la liste des messages dans l'objet requête */
	    request.setAttribute( ATT_TAGS, tags );
	
	    /* Transmission vers la page en charge de l'affichage des résultats */
	    this.getServletContext().getRequestDispatcher( VUE ).forward( request, response );
    }
}
