<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user_db" scope="session" class="kyujinkyusyoku.LoginUserBean"></jsp:useBean>
<jsp:useBean id="kyusyokusya" scope="session" class="kyujinkyusyoku.kyusyokusyaBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ（求職者）</title>
<link rel="stylesheet" type="text/css" href="reboot.css"/>
<link rel="stylesheet" type="text/css" href="default.css"/>
<link rel="stylesheet" type="text/css" href="list.css"/>
<link rel="stylesheet" type="text/css" href="form.css"/>
<link rel="stylesheet" type="text/css" href="radio_width.css"/>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js.cookie.js"></script>
<style>
h1 {
  text-align: center;
}
p.title{
	font-weight: bold;
	font-size: 20px;
}
td.highlight {
        font-weight: bold;
        color: blue;
    }
.active {
  background: gold !important;
}
#GototopBtn {
  display: none;
  position: fixed;
  bottom: 50px;
  right: 25px;
  z-index: 99;
  font-size: 18px;
  border: none;
  outline: none;
  background-color: #65B3D2;
  color: white;
  cursor: pointer;
  padding: 15px;
  border-radius: 4px;
  opacity: 0.5;
}

#GototopBtn:hover {
  background-color: #555;
}
</style>
</head>
<body class = "mainBody">
	<jsp:include page="header.jsp"></jsp:include>
	<div class ="wrapper1" style="display:inline;">
		<div  style = "text-align: right; font-size: 0.5">
			<form action = "changePasswordServlet" method = "post">
				<p style ="display:inline;">
					ID : <jsp:getProperty property = "userId" name = "user_db"/>
						<input class="btn btn-link" type="submit" name="submit" value="パスワード変更">
				</p>
			</form>
		</div>
		<h1>マイページ（求職者）</h1>
	</div>
	<div>
		<p class="title">個人情報：</p>
	</div>
	<div class = "wrapper2">
		<form action = "kyusyokusyaMypageServlet" method = "post">
			<div class="form-group row">
				<label class="col-sm-2 control-label">求職番号</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kyusyokusyaId" name="kyusyokusya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">民名</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kyusyokusyaName" name="kyusyokusya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">フリガナ</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kyusyokusyaNameFurigana" name="kyusyokusya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">住所</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kyusyokusyaZyusyo" name="kyusyokusya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">生年月日</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kyusyokusyaSeinengappi" name="kyusyokusya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">連絡先</label>
				<div class="col-sm-10">
					<jsp:getProperty property="renrakusakiKyusyokusya" name="kyusyokusya"/>
				</div>
			</div>
			<br>
			<input class="btn btn-info" type="submit" name="submit" value="変更">
		</form>
	</div>
	<div>
		<p class="title">申込み求職一覧：</p>
	</div>
	<input type="hidden" id = "userid" name = "userId_db"  value="<jsp:getProperty property="userId" name="user_db"/>">
	<div class="wrapper3">
		<form  id="job_seeker" name="job_seeker">
			<div class="table-responsive">
				<table id="myTable1" class="table table-dark table-hover table-sm" >
					<thead class="thead-lignt">
						<tr>
							<th>ID</th>
							<th>希望職種</th>
							<th>受付日</th>
							<th>求職開始日</th>
							<th>求職終了日</th>
							<th>紹介先/就職先</th>
							<th>求職状況</th>
						</tr>
					</thead>
				</table>
			</div>
		 </form>
	</div>
	<button onclick="topFunction()" id="GototopBtn" title="Go to top">トップへ戻る</button>

	<%-- Su dung JavaScript de load data len table --%>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

	<script type="text/javascript">

		$(document).ready(function(){
			load_data();
		});

		/* DataTables生成 */
		function load_data(){
		    var data = {act : "show"};
		    var userid = $('#userid').val();
		    //Kiem tra ngay da het han chua?
			var today = new Date().toJSON().slice(0,10);
			//Load data len table
		    var table = $('#myTable1').DataTable({
		    	scrollX: true,    // 横スクロール設定：有効
 			    stateSave: true,  // ページネーションの選択ページを再読み込み後も固定表示
 			  	//paging: false,
			    //searching: false,
			ajax : {          // ajax処理
				    url : "${pageContext.request.contextPath}/moushikomiKyusyokuListServlet",
				    type : "get",
				    data:data,
				    data:{reqValue : userid},
				    dataSrc: "result"
			    },
			"language":{
				"url": "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
			},
			columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
				    {data : "kyusyokuId"},
				    {data : "kibousyokusyu", "defaultContent": ""},
				    {data : "uketukenengappi", "defaultContent": ""},
				    {data : "yuukoukikanStart", "defaultContent": ""},
				    {data : "yuukoukikanEnd", "defaultContent": ""},
				    {data : "kaisyaName", "defaultContent": ""},
				    {data : "kyusyokuJoukyou", "defaultContent": ""}
				    ],
			//To mau
			"createdRow": function ( row, data, index ) {
				//Het han dang ky
				if ( data.yuukoukikanEnd < today ) {
					$('td', row).css('background-color', '#50080E');
				}
				//
				if ( data.yuukoukikanStart > today ) {
					$('td', row).css('background-color', 'grey');
				}
			}
		})
		}

		//Scroll to TOP
		//Get the button
		var mybutton = document.getElementById("GototopBtn");

		// When the user scrolls down 20px from the top of the document, show the button
		window.onscroll = function() {scrollFunction()};

		function scrollFunction() {
		  if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
		    mybutton.style.display = "block";
		  } else {
		    mybutton.style.display = "none";
		  }
		}

		// When the user clicks on the button, scroll to the top of the document
		function topFunction() {
		  document.body.scrollTop = 0;
		  document.documentElement.scrollTop = 0;
		}
	</script>
</body>
</html>