<%@page import="java.sql.*"%>
<%
   String r,d1,d2,d3,d4,id;
    r=request.getParameter("prodId");


   Connection con;
   Statement stmt;
     try
	{
 	Class.forName("com.mysql.jdbc.Driver");
        	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station","root","9353");
        	stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from product where prod_id='"+r+"' ");
    
	while(rs.next()){
        id=r;
        d1=rs.getString(2);
        d2=rs.getString(4);
        d3=rs.getString(5);
        d4=rs.getString(7);


  try
   { 
     Class.forName("com.mysql.jdbc.Driver");
  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station","root","9353");
  stmt=con.createStatement();
  int k=stmt.executeUpdate("insert into wishlist values('"+d1+"','"+d2+"','"+d3+"','"+id+"','"+d4+"')");
  }
  
  catch(Exception e)
  {
  out.println(e);
  } 
}
}
catch(Exception e)
{
out.println(e);
}

%>

<%-- <jsp:forward page="Home.jsp?username=<%= user %>&password=<%= p1 %>"/> --%>

<jsp:forward page="wishlist.jsp"/>