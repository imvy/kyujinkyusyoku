<!-- 変更No.031_kim JSPの追加 - Start -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="kyusyokuSyaList" scope="session" class="kyujinkyusyoku.KyusyokuBean"/>  <!-- 変更No.037_kim idの値を変更 -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>求職者追加確認画面</title>
    <link rel="stylesheet" type="text/css" href="default.css"/>
    <link rel="stylesheet" type="text/css" href="confilm_delete.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  </head>
  <body class="mainBody">
    <div class="wrapper1">
	    <h1>追加される求職者の確認</h1>
	    <div class="wrapper2">
				<form action="KyusyokuSyaInsertResultServlet" method="post">
				  <ul class="list-group">
				    <li class="list-group-item"><span class="li_width">求職者氏名 </span> : <jsp:getProperty property="kyusyokuName"           name="kyusyokuSyaList"/></li>
				    <li class="list-group-item"><span class="li_width">ふりがな </span> :   <jsp:getProperty property="kyusyokuNameFurigana"   name="kyusyokuSyaList"/></li>
				    <li class="list-group-item"><span class="li_width">住所 </span> :       <jsp:getProperty property="jyusyo"                 name="kyusyokuSyaList"/></li>
				    <li class="list-group-item"><span class="li_width">生年月日 </span> :   <jsp:getProperty property="seinengappi"            name="kyusyokuSyaList"/></li>
				    <li class="list-group-item"><span class="li_width">連絡先 </span> :     <jsp:getProperty property="renrakusakiKyusyokusya" name="kyusyokuSyaList"/></li>
				  </ul>
				  <br><%--<br><br> --%>
				  <input type="submit" class="btn btn-info" value="追加">
				  <input type="button" class="btn btn-secondary" onclick="history.back();" value="戻る">

				</form>
			</div>
	  </div>
  </body>
</html>
<!-- 変更No.031_kim - End -->