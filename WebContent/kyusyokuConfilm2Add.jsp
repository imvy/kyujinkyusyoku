<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id ="kyusyokuList2Add" scope="session" class="kyujinkyusyoku.KyusyokuBean"/>  <!--  -->
<jsp:useBean id ="kyusyokuList2"   scope="session" class="kyujinkyusyoku.KyusyokuBean"/>  <!--  -->
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>求職情報再登録確認画面</title>
    <link rel="stylesheet" type="text/css" href="default.css"/>
    <link rel="stylesheet" type="text/css" href="confilm_delete.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
  </head>
  <body class="mainBody">
    <div class="wrapper1">
	    <h1>求職情報の再登録確認</h1>
	    <div class="wrapper2">
	      <form action="KyusyokuResultServletAdd">
	        <ul class="list-group">
				    <li class="list-group-item"><span class="li_width">求職者ID </span> : <jsp:getProperty property="kyusyokusyaId" 			name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">求職者氏名 </span> : <jsp:getProperty property="kyusyokuName" 			name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">住所 </span> : <jsp:getProperty property="jyusyo" 			name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">生年月日 </span> : <jsp:getProperty property="seinengappi" 			name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">連絡先 </span> : <jsp:getProperty property="renrakusakiKyusyokusya" name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">求職希望職種 </span> : <jsp:getProperty property="kibousyokusyu" 			name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">受付年月日 </span> : <jsp:getProperty property="uketukenengappi"		name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">有効期間 </span> : <jsp:getProperty property="yuukoukikanStart" 		name="kyusyokuList2Add"/><span class="between_width"></span>~<span class="between_width"></span><jsp:getProperty property="yuukoukikanEnd" 			name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">紹介年月日 </span> : <jsp:getProperty property="syoukaiDay"		 		name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">求人受理整理番号 </span> : <jsp:getProperty property="kyujinId" 	    	name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">求人事業所名称 </span> : <jsp:getProperty property="kaisyaName"	 		name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">採用・不採用 </span> : <jsp:getProperty property="saiyouHusaiyou"		 		name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">採用年月日 </span> : <jsp:getProperty property="saiyouDay"		 		name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">労働契約 </span> : <jsp:getProperty property="roudoukeiyaku"			name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">離職状況 </span> : <jsp:getProperty property="risyokujoukyou"	        name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">返戻金 </span> : <jsp:getProperty property="henreikin"				name="kyusyokuList2Add"/></li>
			      <li class="list-group-item"><span class="li_width">備考 </span> : <jsp:getProperty property="kyusyokuJoukyou"	    name="kyusyokuList2Add"/></li>
				  </ul>
	  			<br>
	        <input class="btn btn-info" type="submit"name="submit6" value="追加">
	        <input class="btn btn-secondary" type="button" onclick="history.back();" value="戻る">
	      </form>
	    </div>
	  </div>
  </body>
</html>