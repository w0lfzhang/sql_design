<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page language="java" import="com.cve.factory.*"%>
<%@ page language="java" import="com.cve.vo.*"%>
<%@ page language="java" import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>handleselect</title>
    
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
  Cve cve = null;
  List<Cve> cves = null;
  boolean multi_flag = false;
  int recordlen = 0;
  String time;
  
  String cvename = request.getParameter("cvename");
  String author = request.getParameter("author");
  String company = request.getParameter("company");
  String appname = request.getParameter("appname");
  String fuzzy = request.getParameter("fuzzy");
  
  boolean cvename_flag = cvename.equals("");
  boolean author_flag = author.equals("");
  boolean company_flag = company.equals("");
  boolean appname_flag = appname.equals("");
  boolean fuzzy_flag = fuzzy.equals("");
  
  String types[] = {"remote exploit", "web application exploit", "Local and Privilege Escalation Exploits", "Denial of Service and PoC Exploits"};
  
  SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss:SS");   
  TimeZone t = sdf.getTimeZone();   
  t.setRawOffset(0);   
  sdf.setTimeZone(t);   
  Long startTime = System.currentTimeMillis();
  Long endTime = 0L;
  
  //search according to cvename and author and company and appname
  if ( !cvename_flag && !author_flag && !company_flag && !appname_flag && fuzzy_flag ){
  	  cve = DAOFactory.getICveDAOInstance().queryBymany(cvename, author, company, appname);
  }
  
  //search according to cvename
  if( !cvename_flag && author_flag && company_flag && appname_flag && fuzzy_flag ){
  	  cve = DAOFactory.getICveDAOInstance().queryByName(cvename);
  }
  
  //search according to author
  if( cvename_flag && !author_flag && company_flag && appname_flag && fuzzy_flag){
  	  cves = DAOFactory.getICveDAOInstance().queryByauthor(author);
  	  multi_flag = true;  
  }
  
  //search according to appname
  if( cvename_flag && author_flag && company_flag && !appname_flag && fuzzy_flag){
  	  cves = DAOFactory.getICveDAOInstance().queryByappname(appname);
  	  multi_flag = true; 
   }
  	  
  //search according to company
  if( cvename_flag && author_flag && !company_flag && appname_flag && fuzzy_flag){
  	  cves = DAOFactory.getICveDAOInstance().queryBycompany(company);
  	  multi_flag = true; 
   }
  
  //search according to author and appname
  if( cvename_flag && !author_flag && company_flag && !appname_flag && fuzzy_flag){
  	  cves = DAOFactory.getICveDAOInstance().queryByAuthorandAppname(author, appname);
  	  multi_flag = true; 
   }
   
  //fuzzy search
  if( cvename_flag && author_flag && company_flag && appname_flag && !fuzzy_flag){
  	  cves = DAOFactory.getICveDAOInstance().queryByfuzzy(fuzzy);
  	  multi_flag = true;
  }
  //just finish these searches, and the rest searches is the same as the above.
  
  endTime = System.currentTimeMillis();
  time = sdf.format(new Date(endTime - startTime));
  %>

<h1>Search results: </h1>

<%
	if( multi_flag && cves != null )
	{
		recordlen = cves.size();
		for( int i = 0; i < recordlen; i++ )
		{
%>

<div>
  <h3>cvename: <%=cves.get(i).getCve_name()%></h3>
  <h3>author: <%=cves.get(i).getAuthour()%></h3>
  <h3>published_time: <%=cves.get(i).getPublished_time() %></h3>
  <h3>description: <%=cves.get(i).getDescription() %></h3>
  <h3>type: <%=types[cves.get(i).getType()-1] %></h3>
  <h3>appname: <%=cves.get(i).getApp_name() %></h3>
  <h3>company: <%=cves.get(i).getCompany() %></h3>
  <h3>platform: <%=cves.get(i).getPlatform() %></h3><br>
</div>
<% 
	    }
    }if ( multi_flag == false && cve != null){
    	recordlen = 1;
%>

<div>
  <h3>cvename: <%=cve.getCve_name()%></h3>
  <h3>author: <%=cve.getAuthour()%></h3>
  <h3>published_time: <%=cve.getPublished_time() %></h3>
  <h3>description: <%=cve.getDescription() %></h3>
  <h3>type: <%=types[cve.getType()-1] %></h3>
  <h3>appname: <%=cve.getApp_name() %></h3>
  <h3>company: <%=cve.getCompany() %></h3>
  <h3>platform: <%=cve.getPlatform() %></h3><br>
</div>

<%
    }
 %>
 
 <div>
 	Search <%=recordlen %> result(s). 
 	Used about <%=time %> s.
 </div>

  <form action="index.jsp">
  <fieldset> 
          <br><br><center><input type="submit" value="Return" > </center>
   </fieldset>
   </form>
  </body>
</html>
