package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Tag;
import dao.Url;
import dao.User;
import framework.Session;

public class advancedsearch extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String req = request.getParameter("req");
		PrintWriter out = response.getWriter();
		Session session = new Session(request);
		User user = (User) session.get_user();
		List<Url> urls=user.advancedsearch(req); 
		Iterator<Url> it = urls.iterator();
		if( urls.size()>0){
			while (it.hasNext()){
				   Url url = it.next(); // tu peux typer plus finement ici
				   out.print(" $$$ "+url.getuUri());
				   System.out.print(" $$$ "+url.getuUri());
				}
		}
		else{
			out.print(" $$$ ");
			System.out.print("");
		}
	}
}
