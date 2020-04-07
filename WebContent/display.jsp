<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kyujinkyusyoku.DisplayUserBean" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Display Level</title>
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
		<h1>ユーザー情報</h1>
		<form  id="job_seeker" name="job_seeker">
			<div class="table-responsive">
				<table id="myTable" class="table table-dark table-hover table-sm" >
					<thead class="thead-lignt">
						<tr>
							<th>レベル</th>
							<th>人</th>
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
			    url : "${pageContext.request.contextPath}/DisplayTableServlet",
			    type : "get",
			    data:data,
			    dataSrc: "result"
		    },
		"language":{
			"url": "//cdn.datatables.net/plug-ins/3cfcc339e89/i18n/Japanese.json"
		},
		columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
			    {data : "level"},
			    {data : "ninsuu"},
			    ]
	})
	}
	</script>
</body>
</html>