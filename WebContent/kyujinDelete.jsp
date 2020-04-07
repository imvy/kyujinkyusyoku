<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="kyujin" scope="session"
	class="kyujinkyusyoku.KyujinBean" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求人削除画面</title>
<link rel="stylesheet" type="text/css" href="default.css" />
<link rel="stylesheet" type="text/css" href="confilm_delete.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
	rel="stylesheet">
</head>
<body class="mainBody">
	<div class="wrapper1">
		<h1>求人情報を削除しますか?</h1>
		<div class="wrapper2">
			<ul class="list-group">
				<li class="list-group-item"><span class="li_width">求人受理整理番号
				</span> : <jsp:getProperty property="kyujinId" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">求人事業所名称
				</span> : <jsp:getProperty property="kaisyaName" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">所在地 </span>
					: <jsp:getProperty property="zyusyo" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">連絡担当者
				</span> : <jsp:getProperty property="tantousya" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">連絡先電話番号
				</span> : <jsp:getProperty property="renrakusaki" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">受付年月日
				</span> : <jsp:getProperty property="uketukenengappi" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">有効期間
				</span> : <jsp:getProperty property="yuukoukikanStart" name="kyujin" /><span
					class="between_width">~</span><jsp:getProperty
						property="yuukoukikanEnd" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">求人数 </span>
					: <jsp:getProperty property="kyujinsuu" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">職種 </span> :
					<jsp:getProperty property="syokusyu" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">就業場所
				</span> : <jsp:getProperty property="syugyobasyo" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">雇用期間
				</span> : <jsp:getProperty property="koyoukikanStart" name="kyujin" /><span
					class="between_width">~</span><jsp:getProperty
						property="koyoukikanEnd" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">賃金形態
				</span> : <jsp:getProperty property="tinginKeitai" name="kyujin" /></li>
				<li class="list-group-item"><span class="li_width">賃金 </span> :
					<jsp:getProperty property="tingin" name="kyujin" /></li>
			</ul>
			<!-- モーダルを開くボタン・リンク -->
			<br>
			<button type="button" class="btn btn-danger" data-toggle="modal"
				data-target="#testModal">削除する</button>
			<form action="SelectServlet" method="post">
				<br>
				<button type="submit" name="submit2" class="btn btn-dark"
					value="求人一覧へもどる">求人一覧へもどる</button>
			</form>
		</div>
	</div>
	<!-- ボタン・リンククリック後に表示される画面の内容 -->
	<div class="modal fade" id="testModal" tabindex="-1" role="dialog"
		aria-labelledby="basicModal" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">削除確認</h4>
				</div>
				<div class="modal-body">
					<label>この求人情報を削除してもよろしいですか？</label>
				</div>
				<div class="modal-footer">
					<form action="KyujinDeleteServlet" method="get">
						<button type="submit" class="btn btn-danger">削除</button>
					</form>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">閉じる</button>
				</div>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>