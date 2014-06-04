package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Tag;
import dao.Url;
import dao.User;
import framework.Session;

public class FastSearchTag extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String part = request.getParameter("part");
		Session session = new Session(request);
		User user = (User) session.get_user();
		HashMap<Tag, ArrayList<Url>> map = user.getTagAutoCompletion(part);
		PrintWriter out = response.getWriter();
		Set<Tag> cles = map.keySet();
		Iterator<Tag> it = cles.iterator();
		while (it.hasNext()){
		   Tag cle = it.next(); // tu peux typer plus finement ici
		   out.print(cle.getTid()+" $$$ "+cle.gettName());
		   ArrayList<Url> valeur = map.get(cle);
		   for(Url url : valeur) {// tu peux typer plus finement ici
			   out.print(" $$$ "+url.getuUri());
		   }
		   out.print("\n");
		}
		
	}

}
