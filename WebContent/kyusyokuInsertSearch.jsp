<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kyujinkyusyoku.KyusyokuBean" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>求職者一覧画面</title>
    <link rel="stylesheet" type="text/css" href="default.css"/>
    <link rel="stylesheet" type="text/css" href="list.css"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
		<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"/>
	</head>
    <body class="mainBody">
		<div class="wrapper1">
			<h1>求職者一覧</h1>
			<form  id="job_seeker" name="job_seeker">
			  <div class="table-responsive">
			    <table id="myTable" class="table table-dark table-hover table-sm" >
				    <thead class="thead-lignt">
				      <tr>
				        <th>求職者ID</th><th>求職者氏名</th><th>求職者氏名(ふりがな)</th><th>住所</th><th>生年月日</th><th>連絡先</th><th></th>
				      </tr>
				    </thead>
			    </table>
			  </div>
		 </form>
		</div>
		<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				    load_data();
			 });

			function load_data(){
				    var data = {act : "show"};
				    var table = $('#myTable').DataTable({
					ajax : {          // ajax処理
						    url : "${pageContext.request.contextPath}/KyusyokuSyaListFetchServlet",
						    type : "get",
						    data:data,
						    dataSrc: "result"
					    },
					"language":{
						"url": "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
					},
					columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
						    {data : "kyusyokusyaId"},
						    {data : "kyusyokuName", "defaultContent": ""},
						    {data : "kyusyokuNameFurigana", "defaultContent": ""},
						    {data : "jyusyo", "defaultContent": ""},
						    {data : "seinengappi", "defaultContent": ""},
						    {data : "renrakusakiKyusyokusya", "defaultContent": ""},
						    {defaultContent : '<input type="submit" value="選択" class="btn btn-outline-success button"/>'}//本defaultContentは選択ボタン作成
						    ],
					// 件数切替機能 無効
				  //lengthChange: false,
				  // 検索機能 無効
				  // searching: false,
				  // ソート機能 無効
				  // ordering: false,
				  // 情報表示 無効
				  //info: false,
				  // ページング機能 無効
				  paging: false,
				  "columnDefs": [{
					    "targets": [6],  //選択カラム
						    "orderable": false,   // ソートボタン無効化
						    },
						    { targets: [2], visible: false }, //ふりがな列を非表示
					  ],
				})
				  $('#myTable tbody').on('click','.button',function(){
					  var currow = $(this).closest('tr');
					  var id = currow.find('td:eq(0)').text();
					  var name = currow.find('td:eq(1)').text();
					  var adr = currow.find('td:eq(2)').text();
					  var birthday = currow.find('td:eq(3)').text();
					  var contact = currow.find('td:eq(4)').text();

				/*  確認用(コンソールの代替)
					  var result = id + '\n' + name + '\n' + adr + '\n' + birthday + '\n' + contact;
					  alert(result);
				*/
					  window.opener.$("#job_seeker_id").val(id);
			   	  window.opener.$("#job_seeker_name").val(name);
					  window.opener.$("#job_seeker_adr").val(adr);
					  window.opener.$("#job_seeker_birthday").val(birthday);
					  window.opener.$("#job_seeker_contact").val(contact);

					  window.close();
				  });
			}
		</script>
	</body>
</html>