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
		<style  type = "text/css"> 


body { 
    margin:0; 
    padding:0; 
    background-color:#E4E8EC; 
} 
.wrap { 
    margin:150px auto; 
    width:380px; 
    overflow:hidden; 
} 
.loginForm { 
    position:absolute; 
    z-index:0; 
    
    border-radius:4px; 
    height:250px; 
    width:380px; 
 
    opacity:20;
    
} 
.loginForm:before { 
    content:''; 
    position:absolute; 
    z-index:-1; 
    top:5px; 
    bottom:5px; 
    left:5px; 
    right:5px; 
    box-shadow: 0 0 0 0px #FFF;
} 

 h1 { 
    text-shadow: 0 1px 0 rgba(255, 255, 255,.7), 0px 2px 0 rgba(0, 0, 0, .5); 
     
     
    color:#665; 
    line-height:3em; 
    margin:20px 0 20px 18px;  
    font:normal 30px/1 Microsoft YaHei, sans-serif; 
} 

h3 { 
    text-shadow: 0 1px 0, 0px 2px 0 rgba(0, 0, 0, .5);
    display:inline;
    color:#666; 
    line-height:1em;
    text-align:center;
	margin:20px 0px 10px 25px;
    font:normal 20px/1 Microsoft YaHei, sans-serif; 
} 

div{
	margin:20px;
}

fieldset { 
    border:none; 
    padding:10px 10px 0; 
} 

fieldset input[type=submit] { 
    text-align:center; 
    padding:2px 20px; 
    line-height:2em; 
    border:1px solid #ffffff; 
    border-radius:3px; 
    background: -webkit-gradient(linear, left top, left 24, from(#000000), color-stop(0%, #1E90ff), to(#AFEEEE)); 
    background: -moz-linear-gradient(top, #FF6900, #FF9800 0, #000000 24px); 
    background:-o-linear-gradient(top, #FF0900, #FF0800 0, #000000 24px); 
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FFFFFF', endColorstr='#FF0900'); 
    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FF9800', endColorstr='#FF6900')"; 
    height:30px; 
    cursor:pointer; 
    letter-spacing: 4px; 
    margin-left:10px; 
    color:#002000; 
    
    font:normal 18px/1 Microsoft YaHei, sans-serif; 
} 
fieldset input[type=submit]:hover { 
    background: -webkit-gradient(linear, left top, left 24, from(#FF9800), color-stop(0%, #AFEEEE), to(#1E90ff)); 
    background: -moz-linear-gradient(top, #000000, #000000 0, #FF9800 24px); 
    background:-o-linear-gradient(top, #000000, #000000 0, #FF9800 24px);  
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#FF0000', endColorstr='#FF0000'); 
    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#FF6900', endColorstr='#FF9800')"; 
} 
.inputWrap { 
    background: -webkit-gradient(linear, left top, left 24, from(#FFFFFF), color-stop(4%, #EEEEEE), to(#FFFFFF)); 
    background: -moz-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 24px); 
    background: -o-linear-gradient(top, #FFFFFF, #EEEEEE 1px, #FFFFFF 24px); 
    border-radius:3px; 
    border:1px solid #CCC; 
    margin:10px 10px 0; 
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#EEEEEE', endColorstr='#FFFFFF'); 
    -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorstr='#EEEEEE', endColorstr='#FFFFFF')"; 
} 

.logo{
height:auto;
width:auto;
margin-top:300px;
margin-left:580px;
}
 
} 
</style> 

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
  		out.print("<center><h3>insert success!</h3></center>");
  	}else{
  		out.print("record exists! ");
  		out.print("insert failed!");
  	}
  %>
  
  <form action="index.jsp">
  <fieldset> 
      <br><br><center><input type="submit" value="Return" > </center>
   </fieldset>
   </form>
  </body>
</html>
