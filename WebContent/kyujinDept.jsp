<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>連絡先担当者追加画面</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<script src="./jquery.autoKana.js" type="text/javascript"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<link rel="stylesheet" type="text/css" href="default.css"/>
<link rel="stylesheet" type="text/css" href="form.css"/>

</head>
<body class = "mainBody">
<div class="wrapper1">
<h1>追加する連絡先担当者の情報</h1>
<div class="wrapper2">
<form action="KyujinDeptServlet" method="post" class = "needs-validation form-horizontal" novalidate>
<input type = "hidden" value = "" name = "kaisyaId" id = "office_id">

	<div class="form-group row" >
		<label class="col-sm-5 control-label"><span class="form_width">部署名</span><span class="badge badge-danger">必須</span></label>
		<div class="col-sm-6">
			<input type="text" value="" name="deptName3" class="form-control" required>
		</div>
	</div>
	<div class="form-group row" >
		<label class="col-sm-5 control-label"><span class="form_width">連絡担当者</span><span class="badge badge-danger">必須</span></label>
		<div class="col-sm-6">
			<input type="text" id = "tantousya" value="" class="form-control" name="tantousya3" required>
		</div>
	</div>
	<div class="form-group row" >
		<label class="col-sm-5 control-label"><span class="form_width">ふりがな</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-6">
			<input type="text" id = "tantousyafurigana" value="" class="form-control" name="furigana" required>
		</div>
	</div>
	<div class="form-group row" >
		<label class="col-sm-5 control-label"><span class="form_width">連絡先電話番号</span><span class="badge badge-danger">必須</span></label>
		<div class="col-sm-6">
			<input type="text" value="" name="renrakusaki3" class="form-control" required>
		</div>
	</div>
	<input type="submit" value="追加" class="btn btn-info" id="btn-validate">
</form>
<br>
	<input type="button" class="btn btn-secondary" name ="submit2" value="閉じる" onclick = "window.close();">
</div>
</div>
<script type="text/javascript">
	window.onload = function() {
		var officeId = window.opener.document.getElementById('office_id').value;
		document.getElementById('office_id').value = officeId;
	}
	$(function() {
		$.fn.autoKana('#tantousya', '#tantousyafurigana');
	});
	 (function() {
	   	  window.addEventListener('load', function() {
	   	    var forms = document.getElementsByClassName('needs-validation');
	   	    var validation = Array.prototype.filter.call(forms, function(form) {
	   	      form.addEventListener('submit', function(event) {
	   	        if (form.checkValidity() === false) {
	   	          event.preventDefault();
	   	          event.stopPropagation();
	   	        }
	   	        form.classList.add('was-validated');
	   	      }, false);
	   	    });
	   	  }, false);
	   	})();

</script>
</body>
</html>