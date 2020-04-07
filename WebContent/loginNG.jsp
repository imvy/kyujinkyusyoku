<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログインエラー画面</title>
<%-- <link rel="stylesheet" type="text/css" href="default.css"/> --%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
html {
    height: 100%;
    font-size: 1.5rem;
}

body {
    height: 100%;
    margin: 0;
    background-color: #343a40!important;
}
h1 {
    width:100%;
    margin: 0 auto;
    text-align: center;
    padding: 8rem 0 2rem 0;
}
p {
    width:100%;
    margin: 0 auto;
    text-align: center;

}
.return {
    margin: 3rem auto;
    text-align: center;

}
input {
    width:15rem;
}
</style>
</head>
<body>
	<h1 class="text-warning">ログインエラー</h1>
	<p class="text-warning"><u>ログインID</u>・<u>パスワード</u>に誤りがあるか、<u>登録</u>されていません。</p>
<%--	<p><small class="text-white">ログイン画面に戻り、再ログインしてください。</small></p>   --%>
	<div class="return"><input type="button" class="btn btn-warning" onclick="location.href='./logout.jsp'"value="戻る"></div>
</body>
</html>