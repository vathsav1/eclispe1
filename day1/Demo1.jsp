<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="p1.DBUtil" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%
int stdid = Integer.parseInt(request.getParameter("t1"));
String name = request.getParameter("t2");
try
{
	DBUtil.connect();
	Class.forName("com.mysql.cj.jdbc.Driver");
	out.println("Driver Class Loaded");
	
	DBUtil.con = DriverManager.getConnection("jdbc:mysql://localhost:3306/s5","root","tiger");
	out.println("Connection is established");
	DBUtil.st = DBUtil.con.createStatement();
	int i = DBUtil.st.executeUpdate("insert into student values("+stdid+",'"+name+"')");
	out.println("value of i is:"+i);
	if(i>0)
	{
		out.println("record inserted");
	}
	else{
		out.println("record not inserted");
	}
	DBUtil.st.close();
	out.println("statement closed");
	DBUtil.con.close();
	out.println("connection closed");
}
catch(Exception e){
	out.println("error"+e);
}
%>
</body>
</html>