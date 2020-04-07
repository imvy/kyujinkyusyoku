<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dept" scope="session" class="kyujinkyusyoku.KyujinBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>連絡先担当者情報確認画面</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="default.css"/>
    <link rel="stylesheet" type="text/css" href="confilm_delete.css"/>

</head>
<body class="mainBody">
    <div class="wrapper1">
	<h1>追加する連絡担当者の情報確認</h1>
	<div class="wrapper2">
	<form action="KyujindeptResultServlet" method="post" class = "form_width form-horizontal">
	<ul class="list-group">
						<li class="list-group-item"><span class="li_width">部署名 </span> : <jsp:getProperty property="deptName" name="dept" /></li>
						<li class="list-group-item"><span class="li_width">連絡先担当者 </span> : <jsp:getProperty property="tantousya" name="dept" /></li>
						<li class="list-group-item"><span class="li_width">ふりがな </span> : <jsp:getProperty property="tantousyaFurigana" name="dept" /></li>
						<li class="list-group-item"><span class="li_width">連絡先電話番号 </span> : <jsp:getProperty property="renrakusaki" name="dept" /></li>
		      </ul>
	<input type="submit" class="btn btn-info" value="追加">


	</form>
		<br>
	<input type="button" onclick="history.back();" class="btn btn-secondary"   value="戻る">
</div>
</div>
</body>
</html>