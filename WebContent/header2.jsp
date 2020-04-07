<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="user_db" scope="session" class="kyujinkyusyoku.LoginUserBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="reboot.css"/>
<%--<link rel="stylesheet" type="text/css" href="default.css"/>  --%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
html{
    margin: 0 auto;
	font-size:1.5rem;
}

body {
margin: 0 auto;
}

nav {
	margin: 0px auto;
	width:100%;
}

 p{
 margin-bottom: 0px;
}
</style>
</head>
<nav class="navbar navbar-dark bg-dark">
	<p class="text-white" style="display:inline;">ログイン中のユーザー：「<jsp:getProperty property="name" name="user_db"/>」</p>
	<form action="SelectServlet" method="post" style="float:left;">
    <input class="btn btn-light btn-sm" type="submit" name="submit2" value="求人トップ">
	  <input class="btn btn-light btn-sm" type="submit" name="submit2" value="求職トップ">
<%--<input type="button" onclick="location.href='./login.jsp'" value="戻る"> --%>
	</form>
	<a href="/kyujinkyusyoku/LoginServlet?submit1=%E3%83%AD%E3%82%B0%E3%82%A2%E3%82%A6%E3%83%88" class="btn btn-outline-warning btn-sm" style="float:right; overflow: hidden;">ログアウト</a>
</nav>
<body>

</body>
</html>