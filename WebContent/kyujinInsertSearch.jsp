<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
	<%@ page import="kyujinkyusyoku.KyujinBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>会社一覧画面</title>
<script type="text/javascript" src="jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="jquery.cookie.js"></script>
<link rel="stylesheet" type="text/css" href="default.css"/>
<style>

.mainBody{font-size: x-large;}
input#selectButton{
	width: 50px;
	 height: 40px;
	 position: fixed;
	 right: 5em;
	 bottom: 15em;
	}
input.auto_entry{
	outline:0;
	border:0px;
	background: #fff8dc;
}
</style>
</head>
<body class="mainBody">
<div class="wrapper1">
	<h1 id = "HHHH">会社一覧</h1>
<div class="wrapper2">
	<form id ="office_selection" name ="office_selection">
		<%ArrayList<KyujinBean> beanList = (ArrayList<KyujinBean>) session.getAttribute("kaisyaList"); %>
		<%for(KyujinBean bean : beanList) { %>

		<p>
			<label><input type="radio" id = "<%= bean.getKaisyaId() %>" name="kaisya" value="<%= bean.getKaisyaId() %>%<%= bean.getKaisyaName() %>%<%= bean.getZyusyo() %>"><%= bean.getKaisyaName() %></label>
		</p>

		<% } %>
	</form>

	<input type="button"  id = "selectButton" value="選択" onclick = "reflect();cookieClear();dbConnection();">

</div>
</div>
<script type="text/javascript">


	function reflect(){
		console.clear();
		window.opener.contact_person.textContent = ""; // <select id = "contact_person"></select>内を空に
		var element = document.getElementById( "office_selection" ) ; //form要素(id ="office_selection")を取得
		var radioNodeList = element.kaisya ; //form要素内の[name="kaisya"]グループを取得
		var a = radioNodeList.value ;// 選択状態の値(value)を取得

		if(!window.opener || window.opener.closed){
		    alert("呼び出し元が既に閉じられています。");
		    return false;
		  }

		var values = a.split('%');
		var id      = values[0];
		var name    = values[1];

		var address = values[2];

		var subWindowTxt = id;
		var mainWindowTxt =  window.opener.document.getElementById('office_id');
		if(mainWindowTxt != null){
			mainWindowTxt.value = id;
		  }
		subWindowTxt = name;
		var mainWindowTxt =  window.opener.document.getElementById('office_name');
		if(mainWindowTxt != null){
			mainWindowTxt.value = name;
		}
		subWindowTxt = address;
		var mainWindowTxt =  window.opener.document.getElementById('office_address');
		if(mainWindowTxt != null){
			mainWindowTxt.value = address;

		}
	}

	function cookieClear(){
		var Num = Number($.cookie("response_length"));
		for (var j = 0; j < Num; j++){
			document.cookie = "value" + j  + "= clear; path=/; max-age=0";
			document.cookie = "text" + j  + "= clear; path=/; max-age=0";
		}
	}

	//JSON,サーブレット呼び出し
	function dbConnection(){
        var element = document.getElementById( "office_selection" ) ; //form要素(id ="office_selection")を取得
        var radioNodeList = element.kaisya ; //form要素内の[name="kaisya"]グループを取得
        var a = radioNodeList.value ;// 選択状態の値(value)を取得
        var values = a.split('%');//0 id, 1 name, 2 address
        var id      = values[0];
        var request = {
                id : id
        };
        $.ajax({
            type :"GET",
            url :"KyujinResponsibledataServlet",
            data : request,
            async : true, //true:非同期、false:同期    同期での通信は非推奨
            success : function(data) {
                  //通信が成功した場合に受け取るメッセージ
                  //response1 = data["response1"];
                  //response2 = data["response2"];
                  response = data["response3"];
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("リクエスト時になんらかのエラーが発生しました：" + textStatus +":\n" + errorThrown);
            }
            }).done(function(date){
            	document.cookie = "response_length = " + response.length + "; path=/";
        		//console.log(response);
        		for(var i = 0; i < response.length; i++){
            		let op = document.createElement("option"); //<option>要素を作る
            		op.value = response[i].deptId + "," + response[i].renrakusaki + "," + response[i].tantousya + "," + response[i].deptName; //<option>要素のvalue　カンマ区切りで左からdeptId、電話番号、担当者名
            		op.text = response[i].deptName + " " +response[i].tantousya; //<option>要素のtext
            		window.opener.document.getElementById("contact_person").appendChild(op); //<option>要素の作成場所指定
            		window.opener.document.getElementById('phoneNumber').value = response[0].renrakusaki;
            		document.cookie = "value" + i  + "="+  response[i].deptId + "," + response[i].renrakusaki + "," + response[i].tantousya +","+response[i].deptName + "; path=/; max-age=6000";
            		document.cookie = "text" + i  + "=" +response[i].deptName + " " + response[i].tantousya + "; path=/; max-age=6000";
            		//console.log(response[i].tantousya);
            		//console.log(response[i].deptName);
        		}
        		window.close();
        });

	}

	</script>



</body>
</html>