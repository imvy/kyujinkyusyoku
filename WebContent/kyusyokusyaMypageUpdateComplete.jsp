<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="kyusyokusya1" scope="session" class="kyujinkyusyoku.kyusyokusyaBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求職者変更確認</title>
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
		<h1>求職者変更確認</h1>
		<div class="wrapper2">
				<ul class="list-group">
						<li class="list-group-item">
							<span class="li_width">求職番号 </span> :
							<jsp:getProperty property="kyusyokusyaId" name="kyusyokusya1"/>
						</li>
						<li class="list-group-item">
							<span class="li_width">民名 </span> :
							<jsp:getProperty property="kyusyokusyaName" name="kyusyokusya1"/>
						</li>
						<li class="list-group-item">
							<span class="li_width">フリガナ </span> :
							<jsp:getProperty property="kyusyokusyaNameFurigana" name="kyusyokusya1"/>
						</li>
						<li class="list-group-item">
							<span class="li_width">住所 </span> :
							<jsp:getProperty property="kyusyokusyaZyusyo" name="kyusyokusya1"/>
						</li>
						<li class="list-group-item">
							<span class="li_width">生年月日 </span> :
							<jsp:getProperty property="kyusyokusyaSeinengappi" name="kyusyokusya1"/>
						</li>
						<li class="list-group-item">
							<span class="li_width">連絡先 </span> :
							<jsp:getProperty property="renrakusakiKyusyokusya" name="kyusyokusya1"/>
						</li>
				</ul>
				<br>
				<button type="button" class="btn btn-info" data-toggle="modal" data-target="#testModal">変更</button>
				<input class="btn btn-secondary" type="button" onclick="history.back();" value="戻る">
			<!-- ボタン・リンククリック後に表示される画面の内容 -->
				<div class="modal fade" id="testModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<h4 class="modal-title" id="myModalLabel">変更確認</h4>
							</div>
							<div class="modal-body">
								<label>本当に変更しますか</label>
							</div>
							<div class="modal-footer">
								<form action="kyusyokusyaMypageUpdateServlet" method="post">
									<input class="btn btn-info" type="submit" name="submit" value="変更">
								</form>
								<button type="button" class="btn btn-secondary" data-dismiss="modal">閉じる</button>
							</div>
						</div>
					</div>
				</div>
		</div>
	</div>
</body>
</html>