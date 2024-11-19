
<%
  String user=request.getParameter("t1");

  session.setAttribute("uname",user);

%>

<jsp:forward page="changepass2.html" />
