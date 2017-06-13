
<!DOCTYPE html>
<html>
<head>
<title>UpdatetData</title>

<meta name="keywords" content="keyword1,keyword2,keyword3">
<meta name="description" content="this is my page">
<meta name="content-type" content="text/html; charset=utf-8">
<meta charset = "UTF-8">
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

.loginForm h1 { 
    text-shadow: 0 1px 0 rgba(255, 255, 255,.7), 0px 2px 0 rgba(0, 0, 0, .5); 
    text-transform:uppercase; 
    text-align:center; 
    color:#666; 
    line-height:3em; 
    margin:0px 0 20px 18px; 
    letter-spacing: 4px; 
    font:normal 30px/1 Microsoft YaHei, sans-serif; 
} 

fieldset { 
    border:none; 
    padding:10px 10px 0; 
} 

fieldset input[type=text], fieldset input[type=password] { 
    width:100%; 
    line-height:2em; 
    font-size:15px; 
    height:24px; 
    border:none; 
    padding:5px 4px 3px 2.2em; 
    width:300px; 
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
fieldset input[type=checkbox] { 
    margin-left:10px; 
    vertical-align:middle; 
} 
fieldset a { 
    color:blue; 
    font-size:28px; 
    margin:6px 0 0 10px; 
    text-decoration:none; 
} 
fieldset a:hover { 
    text-decoration:underline; 
} 
fieldset span { 
    font-size:12px; 
} 
</style> 

</head> 
 
<body class = "userlogin_body"> 
<div class="wrap"> 
  <form action="handleupdate.jsp" method="post"> 
    <section class="loginForm"> 
    
      <header> 
   
      <h1>Update Data</h1> 
     
      </header> 
     
      <div class="loginForm_content"> 
        <fieldset> 
          <div class="inputWrap"> 
            <input type="text" name="old_cvename" placeholder="old cvename" autofocus required> 
          </div> 
          <div class="inputWrap"> 
            <input type="text" name="new_cvename" placeholder="new cvename" autofocus required> 
          </div> 
          <div class="inputWrap"> 
            <input type="text" name="description" placeholder="description" autofocus required> 
          </div>
        </fieldset>
         
        <fieldset> 
          <center><input type="submit" value="Update" > </center>
        </fieldset> 
      </div> 
    </section> 
  </form> 
</div> 
<div class = "logo">
</div>
<script type="text/javascript">
function saysuccess(){
	alert("insert data success!")
}
</script>
</body> 
</html> 
</BODY>
</HTML>

