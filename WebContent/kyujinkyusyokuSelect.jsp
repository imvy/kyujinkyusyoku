<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求人求職選択画面</title>
<link rel="stylesheet" type="text/css" href="reboot.css"/>
<%--<link rel="stylesheet" type="text/css" href="default.css"/> --%>
<style>
html {
    height: 100%;
}

body {
    height: 100%;
    margin: 0;
    background-color: #f7f7f9!important;
}
.wrapper1 {
    width: 85%;
    margin: 0 auto;
    padding-top: 3rem;
  }
h1 {
  text-align: center;
}
form {
  text-align: center;
  margin: 3rem 3rem 3rem 3rem;
  }

input {
  width: 12rem;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
<div class="wrapper1">
<div>
<%--	<h1>「求人」若しくは「求職」をお選びください</h1>   --%>
	<h1>管理簿選択</h1>
	<form action="SelectServlet" method="post">
	<p><input type="submit" name="submit2" value="求人" class="btn btn-outline-info"><p>
	<input type="submit" name="submit2" value="求職" class="btn btn-outline-info">
<%--<input type="button" onclick="location.href='./login.jsp'" value="戻る"> --%>
	</form>
</div>
</div>
</body>
</html>