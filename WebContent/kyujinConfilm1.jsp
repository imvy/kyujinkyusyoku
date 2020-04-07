<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id ="kyujinList1" scope="session" class="kyujinkyusyoku.KyujinBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求人編集確認画面</title>
<link rel="stylesheet" type="text/css" href="default.css"/>
<link rel="stylesheet" type="text/css" href="confilm_delete.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
</head>
<body class="mainBody">
<div class="wrapper1">
	<h1>求人編集確認</h1>
	<div class="wrapper2">
	<form action="KyujinResultServlet" method="get">
		<ul class="list-group">
                    <li class="list-group-item"><span class="li_width">求人受理整理番号 </span> : <jsp:getProperty property="kyujinId" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">求人事業所名称 </span> : <jsp:getProperty property="kaisyaName" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">ふりがな </span> : <jsp:getProperty property="kaisyaNameFurigana" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">所在地 </span> :       <jsp:getProperty property="zyusyo" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">部署 </span> :   <jsp:getProperty property="deptName" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">連絡担当者 </span> :     <jsp:getProperty property="tantousya" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">ふりがな </span> :     <jsp:getProperty property="tantousyaFurigana" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">連絡先電話番号 </span> :       <jsp:getProperty property="renrakusaki" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">受付年月日 </span> : <jsp:getProperty property="uketukenengappi" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">有効期間 </span> :   <jsp:getProperty property="yuukoukikanStart" name="kyujinList1"/><span class="between_width">~</span><jsp:getProperty property="yuukoukikanEnd" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">求人数 </span> :       <jsp:getProperty property="kyujinsuu" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">職種 </span> :   <jsp:getProperty property="syokusyu" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">就業場所 </span> :     <jsp:getProperty property="syugyobasyo" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">雇用期間 </span> :   <jsp:getProperty property="koyoukikanStart" name="kyujinList1"/><span class="between_width">~</span><jsp:getProperty property="koyoukikanEnd" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">賃金形態 </span> :       <jsp:getProperty property="tinginKeitai" name="kyujinList1"/></li>
				    <li class="list-group-item"><span class="li_width">賃金 </span> : <jsp:getProperty property="tingin" name="kyujinList1"/></li>
				  </ul>
				  <br>
	<input type="submit"name="submit4" value="更新"   class="btn btn-info">
	<input type="button" onclick="history.back()" value="戻る" class="btn btn-secondary">
	</form>
	</div>
	</div>
</body>
</html>

<!--
	<table class="datatables">
		<thead><tr>
		<th>求人ID</th><th>会社名</th><th>住所</th><th>部署</th><th>担当者</th><th>連絡先</th><th>受付日</th><th>有効期間</th><th>求人数</th>
		<th>職種</th><th>就業場所</th><th>雇用期間</th><th>賃金形態</th><th>賃金</th>
		</tr></thead>
		<tbody><tr>
		<td><jsp:getProperty property="kyujinId" name="kyujinList1"/></td>
		<td><jsp:getProperty property="kaisyaName" name="kyujinList1"/></td>
		<td><jsp:getProperty property="zyusyo" name="kyujinList1"/></td>
		<td><jsp:getProperty property="deptName" name="kyujinList1"/></td>
		<td><jsp:getProperty property="tantousya" name="kyujinList1"/></td>
		<td><jsp:getProperty property="renrakusaki" name="kyujinList1"/></td>
		<td><jsp:getProperty property="uketukenengappi" name="kyujinList1"/></td>
		<td><jsp:getProperty property="yuukoukikanStart" name="kyujinList1"/>～<jsp:getProperty property="yuukoukikanEnd" name="kyujinList1"/></td>
		<td><jsp:getProperty property="kyujinsuu" name="kyujinList1"/></td>
		<td><jsp:getProperty property="syokusyu" name="kyujinList1"/></td>
		<td><jsp:getProperty property="syugyobasyo" name="kyujinList1"/></td>
		<td><jsp:getProperty property="koyoukikanStart" name="kyujinList1"/>～<jsp:getProperty property="koyoukikanEnd" name="kyujinList1"/></td>
		<td><jsp:getProperty property="tinginKeitai" name="kyujinList1"/></td>
		<td class = "rightmost"><jsp:getProperty property="tingin" name="kyujinList1"/></td>
		</tr></tbody>
	</table>
 -->