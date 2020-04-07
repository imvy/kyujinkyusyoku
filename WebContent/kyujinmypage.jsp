<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="user_db" scope="session" class="kyujinkyusyoku.LoginUserBean"></jsp:useBean>
<jsp:useBean id="kyujinkaisya" scope="session" class="kyujinkyusyoku.KyujinkaisyaBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>マイページ（求人者）</title>
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
		<h1>マイページ（求人者）</h1>
	</div>
	<div>
		<p class="title">会社情報：</p>
	</div>
	<div class = "wrapper2">
		<form action = "kyujinkaisyaMypageServlet" method = "post">
			<div class="form-group row">
				<label class="col-sm-2 control-label">会社番号</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kyujinkaisyaId" name="kyujinkaisya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">会社名前</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kaisyaName" name="kyujinkaisya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">フリガナ</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kaisyaNameFurigana" name="kyujinkaisya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">住所</label>
				<div class="col-sm-10">
					<jsp:getProperty property="zyusyo" name="kyujinkaisya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">電話番号</label>
				<div class="col-sm-10">
					<jsp:getProperty property="renrakusaki1" name="kyujinkaisya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">メール</label>
				<div class="col-sm-10">
					<jsp:getProperty property="renrakusaki2" name="kyujinkaisya"/>
				</div>
			</div>
			<br>
			<input class="btn btn-info" type="submit" name="submit" value="変更">
		</form>
	</div>
<br><br>
	<div>
		<p class="title">求人情報：</p>
	</div>
	<div class="wrapper3">
		<form  id="job_seeker" name="job_seeker">
			<div class="table-responsive">
				<table id="myTable1" class="table table-dark table-hover table-sm" >
					<thead class="thead-lignt">
						<tr>
							<th>求人番号</th>
							<th>受付日</th>
							<th>求人開始日</th>
							<th>求人終了日</th>
							<th>求人数</th>
							<th>職種</th>
							<th>雇用開始日</th>
							<th>雇用終了日</th>
							<th>賃金形態</th>
							<th>賃金金額</th>
							<th>部署</th>
							<th>担当者名前</th>
						</tr>
					</thead>
				</table>
			</div>
		 </form>
	</div>
<br><br>
	<div>
		<p class="title">担当者一覧：</p>
	</div>
	<input type="hidden" id = "userid" name = "userId_db"  value="<jsp:getProperty property="userId" name="user_db"/>">
	<div class="wrapper3">
		<form  id="job_seeker" name="job_seeker">
			<div class="table-responsive">
				<table id="myTable2" class="table table-dark table-hover table-sm" >
					<thead class="thead-lignt">
						<tr>
							<th>ID</th>
							<th>部署</th>
							<th>名前</th>
							<th>フリガナ</th>
							<th>連絡先</th>
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
		    //Su dung bien de truyen tham so qua Servlet
		    var userid = $('#userid').val();
			//Kiem tra ngay da het han chua?
			var today = new Date().toJSON().slice(0,10);
			//Load data len table kyujin_info
		    var table = $('#myTable1').DataTable({
		    	scrollX: true,    // 横スクロール設定：有効
		    	//scrollY: true,
		    	//"scrollY":        "100px",
 			    stateSave: true,  // ページネーションの選択ページを再読み込み後も固定表示
 			  	//paging: false,
			    //searching: false,
			ajax : {          // ajax処理
				    url : "${pageContext.request.contextPath}/kyujininfoListServlet",
				    type : "get",
				    data:data,
				    data:{reqValue : userid},
				    dataSrc: "result"
			    },
			"language":{
				"url": "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
			},
			columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
				    {data : "kyujinId"},
				    {data : "uketukenengappi", "defaultContent": ""},
				    {data : "yuukoukikanStart", "defaultContent": ""},
				    {data : "yuukoukikanEnd", "defaultContent": ""},
				    {data : "kyujinsuu", "defaultContent": ""},
				    {data : "syokusyu", "defaultContent": ""},
				    {data : "koyoukikanStart", "defaultContent": ""},
				    {data : "koyoukikanEnd", "defaultContent": ""},
				    {data : "tinginKeitai", "defaultContent": ""},
				    {data : "tingin", "defaultContent": ""},
				    {data : "deptName", "defaultContent": ""},
				    {data : "tantousya", "defaultContent": ""}
				    ],
			"columnDefs" : [
				{targets : [0,4,8,9,10,11] , width : 90},
				{targets : [1,2,3,5,6,7] , width : 100}
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
		//Load data len table tantousya
			var table = $('#myTable2').DataTable({
			    	scrollX: true,    // 横スクロール設定：有効
	 			    stateSave: true,  // ページネーションの選択ページを再読み込み後も固定表示
	 			  	//paging: false,
				    //searching: false,
				ajax : {          // ajax処理
					    url : "${pageContext.request.contextPath}/tantousyaListServlet",
					    type : "get",
					    data:data,
					    data:{reqValue : userid},
					    dataSrc: "result"
				    },
				"language":{
					"url": "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
				},
				columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
					    {data : "deptId"},
					    {data : "deptName", "defaultContent": ""},
					    {data : "tantousya", "defaultContent": ""},
					    {data : "tantousyaFurigana", "defaultContent": ""},
					    {data : "renrakusaki", "defaultContent": ""}
					    ],
				"columnDefs" : [
						{targets : [0,1,2,3,4] , width : 100}
				]
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