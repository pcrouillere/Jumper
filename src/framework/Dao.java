package framework;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;


/*  Classe abstraite */
public abstract class Dao implements Serializable {
/* Fonction pour inserer une valeur dans une table 
 * @param
 * String tableName		: Nom de la table
 * String[] sql_data			: Ensemble des donnees � inserer
 *  */
	
	static protected boolean insert(String tableName, String[] sql_data) throws SQLException{
		String chaine = "";
		for(int i = 0; i < sql_data.length; i++){
			chaine += ",?";
		}
		return Base.getInstance().executeUpdate("INSERT INTO "+tableName+" VALUES (NULL"+chaine+");",sql_data);
	}
	
/* Fonction pour supprimer une valeur dans une table 
 * @param
 * String tableName		: Nom de la table
 * int keyId			: Id de la valeur � supprimer 
 * */
	
	static protected boolean delete(String tableName, int keyId) throws SQLException{
		String[] chaine = new String[1];
		chaine[0] = "";
		chaine[0] += keyId;
		return Base.getInstance().executeUpdate("DELETE FROM "+tableName+" WHERE id=?;",chaine);
	}
	
/* Fonction pour effectuer une requete qqconque
 * @param
 * String sql					: Requ�te
 * Map<String, String> attr 	: Ensemble des attributs
 *  */
	
	static protected ResultSet freeRequest(String sql, Map<String, String> attr){
		return Base.getInstance().executeQuery(sql,  attr);
	}
	
	static protected boolean freeRequestUpdate(String sql, String [] attr) throws SQLException{
		return Base.getInstance().executeUpdate(sql,  attr);
	}
	
	static protected ResultSet search(String tableName, Map<String, String> attr, String orderBy){
		int i = 0;
		String chaine = "";
		if(attr != null ){
			for (Map.Entry<String, String> entry : attr.entrySet())
			{
				if(i==0){
				    chaine += " "+entry.getKey()+" = ?";
				    i=1;
				}
				else{
				    chaine += " AND "+entry.getKey()+" = ?";
				}
			}
		}
		if (attr != null && attr.size() != 0 ){
			return Base.getInstance().executeQuery("SELECT * FROM "+tableName+" WHERE"+chaine+" "+orderBy+";",attr);
		}
		else{
			return Base.getInstance().executeQuery("SELECT * FROM "+tableName+" "+orderBy+";",attr);
		}
	}
	
	static protected  ResultSet search(String tableName, Map<String, String> attr){
		return search(tableName, attr, "");
	}
	
	static protected ResultSet search(String tableName, String columName, Map<String, String> attr, String orderBy){
		int i = 0;
		String chaine = "";
		if(attr != null ){
			for (Map.Entry<String, String> entry : attr.entrySet())
			{
				if(i==0){
				    chaine += " "+entry.getKey()+" = ?";
				    i=1;
				}
				else{
				    chaine += " AND "+entry.getKey()+" = ?";
				}
			}
		}
		if (attr != null && attr.size() != 0 ){
			return Base.getInstance().executeQuery("SELECT "+columName+" FROM "+tableName+" WHERE"+chaine+" "+orderBy+";",attr);
		}
		else{
			return Base.getInstance().executeQuery("SELECT "+columName+" FROM "+tableName+" "+orderBy+";",attr);
		}
	}

}
