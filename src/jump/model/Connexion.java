package jump.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

public class Connexion {
	/* La liste qui contiendra tous les r�sultats de nos essais */
    private List<String> tags = new ArrayList<String>();
    private List<String> errors = new ArrayList<String>();
    private String RealRequest;
    private int userId;
    
    public Connexion(int utilisateurId){
    	userId = utilisateurId;
    }
    
    public List<String> executerRequest(int numRequest, String[] request) {
	/* Connexion � la base de donn�es */
	String url = "jdbc:mysql://localhost:3306/jumperdatabase";
	Connection connexion = null;
	Statement statement = null;
	ResultSet resultat = null;
	
	try {
        Class.forName( "com.mysql.jdbc.Driver" );
    } catch ( ClassNotFoundException e ) {
		errors.add( "Echec lors du chargement du driver" );

    }
	
	try {
	    connexion = DriverManager.getConnection( url ,"root","root");

	    /* Cr�ation de l'objet g�rant les requ�tes */
	    statement = connexion.createStatement();
	    
	    switch(numRequest) {
	    	case 1:
	    		/* Requete simple */
	    		/* Entrer toutes les informations dans resquest */
	    		RealRequest = "Select "+ request[0] +" from " + request[1] + " where " + request[2];
	    		break;
	    	case 2:
	    		
	    		break;
	    		
	    } 

	    /* Ex�cution d'une requ�te de lecture */
	    resultat = statement.executeQuery(RealRequest);

	    /* R�cup�ration des donn�es du r�sultat de la requ�te de lecture */
	    while ( resultat.next() ) {
	        String tag = resultat.getString( "tagName" );
	        

	        /* Traiter ici les valeurs r�cup�r�es. */
	        tags.add( tag);
	    }
	    
	} catch ( SQLException e ) {
		errors.add("probleme");
	    /* G�rer les �ventuelles erreurs ici */
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

    return tags;
}
}
