<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <jsp:useBean id ="kyujinList2" scope="session" class="kyujinkyusyoku.KyujinBean"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求人追加確認画面</title>
<link rel="stylesheet" type="text/css" href="default.css"/>
<link rel="stylesheet" type="text/css" href="confilm_delete.css"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<script type="text/javascript" src="jquery.cookie.js"></script>

</head>
<body class="mainBody">
<div class="wrapper1">
	<h1>求人追加確認</h1>
<div class="wrapper2">
		<form action="KyujinResultServlet" method="get" class = "form-horizontal">
		<ul class="list-group">
				    <li class="list-group-item"><span class="li_width">求人事業所名称 </span> : <jsp:getProperty property="kaisyaName" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">所在地 </span> :       <jsp:getProperty property="zyusyo" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">部署 </span> :   <jsp:getProperty property="deptName" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">連絡担当者 </span> :     <jsp:getProperty property="tantousya" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">連絡先電話番号 </span> :       <jsp:getProperty property="renrakusaki" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">受付年月日 </span> : <jsp:getProperty property="uketukenengappi" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">有効期間 </span> :   <jsp:getProperty property="yuukoukikanStart" name="kyujinList2"/><span class="between_width">~</span><jsp:getProperty property="yuukoukikanEnd" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">求人数 </span> :       <jsp:getProperty property="kyujinsuu" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">職種 </span> :   <jsp:getProperty property="syokusyu" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">就業場所 </span> :     <jsp:getProperty property="syugyobasyo" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">雇用期間 </span> :   <jsp:getProperty property="koyoukikanStart" name="kyujinList2"/><span class="between_width">~</span><jsp:getProperty property="koyoukikanEnd" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">賃金形態 </span> :       <jsp:getProperty property="tinginKeitai" name="kyujinList2"/></li>
				    <li class="list-group-item"><span class="li_width">賃金 </span> : <jsp:getProperty property="tingin" name="kyujinList2"/></li>
				  </ul>
				  <br>
	<input type="submit"name="submit4" value="追加"   class="btn btn-info">
	<input type="button" onclick="history.back()" value="戻る" class="btn btn-secondary">
	</form>
</div>
</div>
</body>
</html>