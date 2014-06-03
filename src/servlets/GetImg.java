package servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import framework.ToolBox;

public class GetImg extends HttpServlet{
	public void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
		
	      // Get the absolute path of the image
		  String root = getServletContext().getRealPath("/");
		  root = root.substring(0,root.indexOf(".metadata")-1).concat(this.getServletContext().getContextPath()).concat("/");
		  root = ToolBox.parse_filename(root);
	      String imageName = req.getParameter("src");
	      String filename = root+"WebContent/WEB-INF/img/"+imageName;	      
	      File file = new File(filename);
	      resp.setContentLength((int)file.length());
	      
	      FileInputStream in = new FileInputStream(file);
	      OutputStream out = resp.getOutputStream();
	      // Copy the contents of the file to the output stream
	       byte[] buf = new byte[1024];
	       int count = 0;
	       while ((count = in.read(buf)) >= 0) {
	         out.write(buf, 0, count);
	      }
	    out.close();
	    in.close();

	}
}
