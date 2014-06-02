package framework;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class Base {
	/* Classe qui va s'occuper de se connecter � la BDD
	 *  d'effectuer des requ�tes et d'afficher les r�sultats */
	/* La liste qui contiendra tous les r�sultats de nos essais */
	
	private static Base instance = null;
	private Connection connexion;
	 
    public Base(){
    	this.connect();
    }
    
	public static Base getInstance() {
		if (Base.instance == null) {
			Base.instance = new Base();
		}
		return instance;
	}	
	
	public void connect() {
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        String url = "jdbc:mysql://localhost:3306/jumperdatabase";
	        String user = "root";
	        String passwd = "720400";
	        connexion = DriverManager.getConnection(url, user, passwd); 
	      } catch (Exception e) {}
	}
	
	/**
	 * Recupere une requete, l'execute et renvoie le resultat
	 * @param sql
	 * @param sql_data
	 * @return ResultSet
	 * 
	 */
	public ResultSet executeQuery(String sql, Map<String, String> sql_data) {
		ResultSet result = null;
		int i = 0;
		try{
			//if query
			PreparedStatement preparedStatement = connexion.prepareStatement(sql );
			/*Remplissage de la requet */
			if(sql_data != null ){
				for (Map.Entry<String, String> entry : sql_data.entrySet())
				{
					preparedStatement.setString( ++i, entry.getValue() );
				}
			}
			result = preparedStatement.executeQuery();
		} catch (Exception e) {
	        e.printStackTrace();
	    }
		return result;
	}

	/**
	 * Recupere une requete, l'execute et renvoie un boolean
	 * @param sql
	 * @param sql_data
	 * @throws SQLException 
	 */
	public boolean executeUpdate(String sql, String [] sql_data) throws SQLException {
		int status = 0;
			//if query
			PreparedStatement preparedStatement = connexion.prepareStatement(sql);
			/*Remplissage de la requet */
			if (sql_data != null){
				for(int i = 0; i<sql_data.length; i++){
						preparedStatement.setString( i+1, sql_data[i]);
				}
			}
			status = preparedStatement.executeUpdate();
		if (status == 1)
			return true;
		return false;
	}

}
