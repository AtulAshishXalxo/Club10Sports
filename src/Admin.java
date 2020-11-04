
import java.io.*;

import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Admin
 */

@WebServlet(name="Admin", urlPatterns=("/Admin"))
@MultipartConfig(maxFileSize=16177216)


public class Admin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Admin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
   @Override
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out=response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		int result=0;
		String Pro_name = request.getParameter("ProName");
		String Pro_type = request.getParameter("ProType");
		String Pro_id = request.getParameter("ProId");
		String Pro_disc = request.getParameter("ProDesc");
		String Pro_price = request.getParameter("ProPrice");
		String Pro_cat=request.getParameter("category");
		
		
		HttpSession  session= request.getSession();
		String user=session.getAttribute("user").toString();
		Part part=request.getPart("image_up");
		
		
		if(part!=null)
		{
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"root", "");
			
			PreparedStatement stmt = connection.prepareStatement("INSERT INTO Products VALUES(?,?,?,?,?,?,?,?)");
			InputStream is=part.getInputStream();
			stmt.setString(1, user);
			stmt.setString(2, Pro_name);
			stmt.setString(3, Pro_type);
			stmt.setString(4, Pro_id);
			stmt.setString(5, Pro_disc);
			stmt.setString(6, Pro_price);
			stmt.setString(7, Pro_cat);
			stmt.setBlob(8,is);
			
			/*
			stmt.setString(1, Pro_name);
			stmt.setString(2, Pro_type);
			stmt.setString(3, Pro_id);
			stmt.setString(4, Pro_disc);
			stmt.setString(5, Pro_price);
			stmt.setBlob(6,is);*/
			
			result =stmt.executeUpdate();
			if(result>0)
			{
				response.sendRedirect("Show.jsp");
			}
			else
			{
				response.sendRedirect("Admin.jsp");
			}
		}
			catch(Exception e)
			{
			
				out.println(e);
			}
		}
	}


}
