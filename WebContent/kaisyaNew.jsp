<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="default.css"/>
<link rel="stylesheet" type="text/css" href="form.css"/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<script src="./jquery.autoKana.js" type="text/javascript"></script>
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
</head>
<body class="mainBody">
<div class="wrapper1">
	<h1>事業所追加</h1>
<div class="wrapper2">
	<form action="KyujinKaisyaNewServlet" method="post" class = "form-horizontal needs-validation" novalidate>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">求人事業所名称</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-3 form-inline">
				<input type="text" name="kaisyaName3" id = "kaisyaName" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">ふりがな</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-3">
	      <input type="text" name="kaisyaNameFurigana" id = "kaisyaNameFurigana" class="form-control" required pattern="[\u3041-\u3096\-\ー\s]*">
			  <div class="invalid-feedback">
        求人事業所名称のふりがな(ひらがな)を入力してください
      </div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">郵便番号</label>
			<div class="col-sm-2">
				<input type="text" name="zip11" class="form-control" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','zyusyo3','zyusyo3');">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">所在地</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-4">
				<textarea name="zyusyo3" rows="5" style="vertical-align : middle;" class="form-control" required></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">担当部署</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-2 form-inline">
				<input type="text" name="deptName3"  class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">連絡担当者</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-2">
	            <input type="text" name="tantousya3" id = "tantousya" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">ふりがな</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-2">
				<input type="text" name = "tantousyaFurigana" id = "tantousyaFurigana" class="form-control" required pattern="[\u3041-\u3096\-\ー\s]*">
			  <div class="invalid-feedback">
        連絡担当者名のふりがな(ひらがな)を入力してください
      </div>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">連絡先電話番号</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-5 form-inline">
				<input name="renrakusaki3" type="text"  class="form-control" required>
			</div>
		</div>

	<input type="submit" value="追加"  class="btn btn-info">
	<input class="btn btn-secondary" type="button" onclick="history.back()" value="戻る">

	</form>
	</div>
	</div>
<script>
$(function() {
	$.fn.autoKana('#kaisyaName', '#kaisyaNameFurigana');
	$.fn.autoKana('#tantousya','#tantousyaFurigana');
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