package jump.requete;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class UrlsbyTagName {
	
	/* La liste qui contiendra tous les résultats de nos essais */
    private List<String> urls = new ArrayList<String>();
    private List<String> errors = new ArrayList<String>();
    private String tagName;
    
    public UrlsbyTagName(String tag){
    	tagName = tag;
    }
    
    public UrlsbyTagName(){
    	tagName = "";
    }
	
	
    public String getTagName() {
		return tagName;
	}

	public void setTagName(String tagName) {
		this.tagName = tagName;
	}

	public List<String> executer() {
		/* Connexion à la base de données */
		String urlBDD = "jdbc:mysql://localhost:3306/jumperdatabase";
		Connection connexion = null;
		Statement statement = null;
		ResultSet resultat = null;
		
		try {
	        Class.forName( "com.mysql.jdbc.Driver" );
	    } catch ( ClassNotFoundException e ) {
			errors.add( "Echec lors du chargement du driver" );
	
	    }
		
		try {
		    connexion = DriverManager.getConnection( urlBDD ,"root","");
	
		    /* Création de l'objet gérant les requêtes */
		    statement = connexion.createStatement();
	
	
		    /* Exécution d'une requête de lecture */
		    resultat = statement.executeQuery( "Select urlUri from jpurl where urlId IN (select tagmapurlid from jptagmap where tagmapUserid = (select userid from jpuser where userMail='pcrouillere@gmail.com')AND tagmaptagid = (select tagId from jptag where tagName='"+tagName+"'));" );
	
		    /* Récupération des données du résultat de la requête de lecture */
		    while ( resultat.next() ) {
		        String url = resultat.getString( "urlUri" );
		        urls.add(url);
		    }
		    
		} catch ( SQLException e ) {
			errors.add("probleme "+e.toString());
		    /* Gérer les éventuelles erreurs ici */
		} finally {
		    if ( connexion != null )
		        try {
		            /* Fermeture de la connexion */
		            connexion.close();
		        } catch ( SQLException ignore ) {
		            /* Si une erreur survient lors de la fermeture, il suffit de l'ignorer. */
		        }
		    if ( resultat != null ) {
		        try {
		            /* On commence par fermer le ResultSet */
		            resultat.close();
		        } catch ( SQLException ignore ) {
		        }
		    }
		    if ( statement != null ) {
		        try {
		            /* Puis on ferme le Statement */
		            statement.close();
		        } catch ( SQLException ignore ) {
		        }
		    }
		}
	
		if(errors.isEmpty())  return urls;
		return errors;
    }
}
