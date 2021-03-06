<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id ="kaisya" scope="session" class="kyujinkyusyoku.KyujinBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会社追加確認画面</title>
<link rel="stylesheet" type="text/css" href="default.css"/>
<link rel="stylesheet" type="text/css" href="confilm_delete.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
</head>
<body class="mainBody">
<div class="wrapper1">
<h1>追加会社確認</h1>
<div class="wrapper2">
	<form action="KyujinKaisyaResultServlet" method="post" class = "form_width form-horizontal">
		<ul class="list-group">
			<li class="list-group-item"><span class="li_width">求人事業所名称 </span> : <jsp:getProperty property="kaisyaName" name="kaisya"/></li>
			<li class="list-group-item"><span class="li_width">ふりがな </span> :   <jsp:getProperty property="kaisyaNameFurigana" name="kaisya"/></li>
			<li class="list-group-item"><span class="li_width">所在地 </span> :       <jsp:getProperty property="zyusyo" name="kaisya"/></li>
			<li class="list-group-item"><span class="li_width">担当部署 </span> :   <jsp:getProperty property="deptName" name="kaisya"/></li>
			<li class="list-group-item"><span class="li_width">連絡担当者 </span> :     <jsp:getProperty property="tantousya" name="kaisya"/></li>
			<li class="list-group-item"><span class="li_width">ふりがな </span> :   <jsp:getProperty property="tantousyaFurigana" name="kaisya"/></li>
			<li class="list-group-item"><span class="li_width">連絡先電話番号 </span> :       <jsp:getProperty property="renrakusaki" name="kaisya"/></li>
		</ul>
		<br>
	<input type="submit" value="追加"  class="btn btn-info">
	<input type="button" onclick="history.back()" value="戻る" class="btn btn-secondary">
	</form>
</div>
</div>
</body>
</html>