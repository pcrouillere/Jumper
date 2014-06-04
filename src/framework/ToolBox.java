package framework;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
/**
 * Classe utilitaire.
 */
public class ToolBox {
	
	/**
	 * Methode qui lit le contenu d'un fichier et le retourne.
	 * @param filename String chemin du fichier.
	 * @return String contenu du fichier.
	 */
	public static String load_file(String filename) {
		String content = null;
		File file =  new File(filename);
		if(file.exists()) {
		    try {
		       BufferedInputStream in = new BufferedInputStream(new FileInputStream(file));
		       StringWriter out = new StringWriter();
		       int b;
		       while ((b=in.read()) != -1) {
		    	   out.write(b);
		       }
		       out.flush();
		       out.close();
		       in.close();
		       content = out.toString();
		    }
		    catch (IOException ie)
		    {
		         ie.printStackTrace(); 
		    }
		}
	    return content;
	}
	
	/**
	 * Permet le bon formatage d'un chemin selon le syst�me.
	 * @param filename String chemin � formater
	 * @return String chemin format�
	 */
	public static String parse_filename(String filename)
	{
		if (filename != null) {
			filename = filename.replace('/',File.separatorChar).replace('\\',File.separatorChar);
		}
		return filename;
	}
	
	/**
	 * Fonction qui v�rifie l'existance d'une m�thode pour une classe par r�flexion.
	 * @param class_name String nom complet de la classe, avec package
	 * @param method_name String Methode de la classe
	 * @return Method renvoie la m�thode si elle existe ou null. 
	 */
	public static Method get_method(String class_name, String method_name)
	{
		Method res = null;
		Class<?> c = null;
		try {
			c = Class.forName(class_name);
		} catch (ClassNotFoundException e) {
			return null;
		}
		if (c != null) {
			Method[] m = c.getMethods();
			for(int i = 0;i < m.length && res == null; i++) {
				if (m[i].getName().equals(method_name)) {
					res = m[i];
				}
			}	
		}
		return res;
	}
}
