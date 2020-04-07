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
	<p class="text-white" style="display:inline;">ログイン中のユーザー：「<jsp:getProperty property="userId" name="user_db"/>」</p>
	<form action="SelectServlet" method="post" style="float:left;">
 <!--    <input class="btn btn-light btn-sm" type="submit" name="submit2" value="求人トップ">
	  <input class="btn btn-light btn-sm" type="submit" name="submit2" value="求職トップ"> -->
	<%-- <% if ( 4 ==((int)session.getAttribute("level_db"))) {%><input type="button" value="マイページ" onClick="location.href='kyujinmypage.jsp'"　class="btn btn-light btn-sm"> <% } %> --%>
	
	<% if ( 4 ==((int)session.getAttribute("level_db"))) {%><button type="button"  class="btn btn-outline-warning btn-sm" data-toggle="modal" data-target="#testModal">PW変更</button> <% } %>
	&nbsp;
	<a href="/LoginServlet?submit1=%E3%83%AD%E3%82%B0%E3%82%A2%E3%82%A6%E3%83%88" class="btn btn-outline-warning btn-sm" style="float:right; overflow: hidden;">ログアウト</a>
</nav>
<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
	aria-labelledby="basicModal" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel">パスワード変更</h4>
			</div>
			<form action="" method="post">
			<div class="modal-body">
					<p>
						旧パスワード : <input type="password" name="pass1" id="pass1" class="form-control" required>
					</p>
					<p>
						新パスワード : : <input type="password" name="pass2" id="pass2" class="form-control">
					</p>
					<p>
						変更パスワード確認 : <input type="password" name="pass3" id="pass3" class="form-control" required>
					</p>
			</div>
			<div class="modal-footer">
				<button type="submit" id="btnhenkou" class="btn btn-danger">変更</button>
				<button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
			</div>
			</form>
		</div>
	</div>
</div>




<body>

</body>
</html>