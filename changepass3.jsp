
<%@ page import="java.sql.*" %>

<%
  String user=session.getAttribute("uname").toString();

  String s1,s2;
  
  s2=request.getParameter("t3");

Connection con;
  Statement stmt;
  try
   { 
     Class.forName("com.mysql.jdbc.Driver");
  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station","root","9353");
  stmt=con.createStatement();

  ResultSet rs=stmt.executeQuery("select * from register where username='"+user+"' ");

  if(rs.next())
{
  int k=stmt.executeUpdate("update register set password='"+s2+"' where username='"+user+"' ");
	%>
  <script>
    alert("Updated Successfully");
    document.location="login.html";
  </script>
  <%

}
else
{
  %>
  <script>
    alert("Check For Username");
    document.location="resetpass.html";
  </script>
  <%
}

}
 catch(Exception e)
{
  out.println(e);

}%>