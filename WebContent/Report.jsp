<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
			
			<%
   /*  if (request.getParameter("id") != null && request.getParameter("id") != "")
    {
        id = Integer.parseInt(request.getParameter("id").toString());
    }
 */

    Statement stmt = null;
    Connection con = null;
    String Content = new String("");
	String id = "C1";
    try
    {
        String filename = "data" + id + ".pdf";
        String user = session.getAttribute("user").toString();
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
		
        stmt = con.createStatement();
        String qry = "select * from customer where c_id =" + id;
        ResultSet rst = stmt.executeQuery(qry);
        if (rst.next())
        {
            Content = rst.getString("c_name");
        }
        out.println(Content);
        byte requestBytes[] = Content.getBytes();
        ByteArrayInputStream bis = new ByteArrayInputStream(requestBytes);
        response.reset();
        response.setContentType("application/pdf");
        response.setHeader("cache-control", "no-cache");
        response.setHeader("Content-disposition", "attachment; filename=" + filename);
        byte[] buf = new byte[1024];
        int len;
        while ((len = bis.read(buf)) > 0)
        {
            response.getOutputStream().write(buf, 0, len);
        }
        bis.close();
        response.getOutputStream().flush();
    }
    catch (Exception e)
    {
        e.printStackTrace();
        System.out.println(e.getMessage());
    }
%>
			
</body>
</html>