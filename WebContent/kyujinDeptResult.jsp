<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="dept" scope="session" class="kyujinkyusyoku.KyujinBean" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>担当者登録完了</title>
<script type="text/javascript" src="jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="js.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="default.css"/>

</head>
<body onLoad="cookieGet();setTimeout( 'subWin()' , 600);" class="mainBody">

	<h1>担当者を登録しました</h1>
	<%--<button class="btn btn-secondary" onclick="cookieGet();subWin();">閉じる</button> --%>

	<input id = "opValue" type="hidden" value = "<%= request.getAttribute("deptId") %>,<jsp:getProperty property="renrakusaki" name="dept"/>,<jsp:getProperty property="deptName" name="dept"/>  <jsp:getProperty property="tantousya" name="dept"/>">
	<input id = "opText" Type="hidden" value ="<jsp:getProperty property="deptName" name="dept"/>  <jsp:getProperty property="tantousya" name="dept"/>">
	<input id = "renrakusaki" type = "hidden" value ="<jsp:getProperty property="renrakusaki" name="dept"/>" >


<script type="text/javascript">
	var opValue =  document.getElementById("opValue").value;
	var opText =  document.getElementById("opText").value;
	var renrakusaki = document.getElementById("renrakusaki").value;

	function cookieGet(){
		var Num = Number(Cookies.get('response_length'));
		document.cookie = "response_length = " + Num + 1 + "; path=/";
		document.cookie = "value" + Num  + "="+ opValue  + "; path=/; max-age=6000";
		document.cookie = "text" + Num  + "="+ opText + "; path=/; max-age=6000";
	}
	function subWin() {

		let op = document.createElement("option");
		op.value = opValue;
		op.text = opText;
		window.opener.document.getElementById("contact_person").appendChild(op); //<option>要素の作成場所指定            console.log(response[i].tantousya);
		window.opener.document.getElementById('phoneNumber').value = renrakusaki;
		window.opener.$('#contact_person').val(opValue);

		window.close();
	}
</script>

</body>
</html>