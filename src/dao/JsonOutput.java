package dao;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.StringWriter;
import java.io.Writer;

import com.fasterxml.jackson.databind.ObjectMapper;

import framework.FrontController;

public class JsonOutput 
{
	public graph instance;
	public FrontController instanceFront;
	
	public JsonOutput(graph i,FrontController ins)
	{
		this.instance=i;
		this.instanceFront=ins;
	}
	
	private String toJson()
	{
		ObjectMapper mapper = new ObjectMapper();
		String answer;
		StringWriter sw = new StringWriter();
		try 
		{
			mapper.writeValue(sw, instance);
		} 
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		answer = sw.toString();
		return answer;
	}
	
	public void update_output()
	{
		try
		{
			File file=new File(this.instanceFront.get_root()+"WebContent/js/data.json");
		    FileOutputStream is = new FileOutputStream(file);
	        OutputStreamWriter osw = new OutputStreamWriter(is);    
	        Writer w = new BufferedWriter(osw);
	        w.write(toJson());
	        w.close();
		}
		catch(IOException e)
		{
			System.err.println("Problem writing to the file data.json");
		}
		
	}
}
