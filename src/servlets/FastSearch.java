package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Url;
import dao.User;
import framework.Session;

public class FastSearch extends HttpServlet{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String part = request.getParameter("part");
		Session session = new Session(request);
		User user = (User) session.get_user();
		ArrayList<Url> liste = user.getAutoCompletion(part);
		PrintWriter out = response.getWriter();
		for(Url url : liste){
		    out.println(url.getuUri()+" $$$ "+url.getuTitle()+" $$$ "+url.getuUserId());
		}
	}

}
