<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page language="java" import="com.cve.factory.*"%>
<%@ page language="java" import="com.cve.vo.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>handleupdate</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <%
  boolean flag = false;
  String old_cvename = request.getParameter("old_cvename");
  String new_cvename = request.getParameter("new_cvename");
  
  if( DAOFactory.getICveDAOInstance().updateCve(new_cvename, old_cvename) == true ){
      System.out.println("Update success!");
      flag = true;
  }
  
  if( flag == true ){
  	  out.print("update success!");
  }else{
  	  out.print("update failed!");
  }
  %>
  </body>
</html>
