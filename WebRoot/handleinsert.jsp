<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    
    <title>handleinsert</title>
    
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
    String types[] = {"remote exploit", "web application exploit", "Local and Privilege Escalation Exploits", "Denial of Service and PoC Exploits"};
    boolean flag = false;
  	String cvename = request.getParameter("cvename");
  	String author = request.getParameter("author");
  	String description = request.getParameter("description");
  	String appname = request.getParameter("appname");
  	String company = request.getParameter("company");
  	String type = request.getParameter("type");
  	String platform = request.getParameter("platform");
  	Date published_time = new Date();
  	
  	Cve cve = new Cve();
  	cve.setCve_name(cvename);
  	cve.setAuthour(author);
  	cve.setDescription(description);
  	cve.setApp_name(appname);
  	cve.setCompany(company);
  	for( int i = 0; i < 4; i++){
  		if( type.equals(types[i]) ){
  			cve.setType(i+1);
  			break;
  		}
  	}
  	cve.setPlatform(platform);
  	cve.setPublished_time(published_time);
  	
  	if( DAOFactory.getICveDAOInstance().insertCve(cve) == true ){
  		System.out.println("Insert success!");
  		flag = true;
  	}
  	
  	if( flag == true ){
  		out.print("insert success!");
  	}else{
  		out.print("record exists! ");
  		out.print("insert failed!");
  	}
  %>
  
  </body>
</html>
