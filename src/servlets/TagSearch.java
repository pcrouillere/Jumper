package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Url;
import dao.User;
import framework.Session;

public class TagSearch extends HttpServlet
{
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException 
	{
		String tagName = request.getParameter("name");
		Session session = new Session(request);
		User user = (User) session.get_user();
		List<Url> liste = user.getTagByName(tagName).getUrls();
		PrintWriter out = response.getWriter();
		for(Url url : liste)
		{
		    out.print(url.getuUri()+"@");
		}
	}

}