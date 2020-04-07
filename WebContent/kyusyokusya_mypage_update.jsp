<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="kyusyokusya" scope="session" class="kyujinkyusyoku.kyusyokusyaBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求職者変更</title>
<link rel="stylesheet" type="text/css" href="default.css"/>
<link rel="stylesheet" type="text/css" href="form.css"/>
<link rel="stylesheet" type="text/css" href="radio_width.css"/>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<script src="./jquery.autoKana.js"></script>
<style>
h1 {
  text-align: center;
}
</style>
</head>
<body class = "mainBody">
	<h1>求職者変更</h1>
	<div>
		<p>個人情報：</p>
	</div>
	<div class = "wrapper2">
		<form action = "kyusyokusyaMypageConfirmServlet" method = "post" class="was-validated" novalidate>
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
				<label class="col-sm-2 control-label"><span class="form_width">住所</span><span class="badge badge-danger">必須</span></label>
				<div class="col-sm-6">
					<textarea rows="3"  id="address" class="form-control"    name="jyusyo1" 	required>
						<jsp:getProperty property="kyusyokusyaZyusyo" name="kyusyokusya"/>
					</textarea>
					<div class="invalid-feedback">求職者の住所を入力してください</div>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">生年月日</label>
				<div class="col-sm-10">
					<jsp:getProperty property="kyusyokusyaSeinengappi" name="kyusyokusya"/>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label"><span class="form_width">連絡先</span><span class="badge badge-danger">必須</span></label>
				<div class="col-sm-6">
					<input class="form-control"  type="text" name="renrakusakiKyusyokusya1" required value="<jsp:getProperty property="renrakusakiKyusyokusya" name="kyusyokusya"/>">
					<div class="invalid-feedback">求職者の連絡先を入力してください</div>
			</div>
	        </div>
			<br>
			<input class="btn btn-info" type="submit" name="submit" value="変更">
		</form>
		<br>
		<form action="kyusyokusyaMypageServlet" method="post">
			<input class="btn btn-dark" type="submit" name="submit" value="マイページへ戻る">
		</form>
	</div>
</body>
</html>