<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="kyujin" scope="session"
	class="kyujinkyusyoku.KyujinBean" />
<%@ page import="java.util.ArrayList"%>
<%@ page import="kyujinkyusyoku.KyujinBean"%>
<%@ page import="kyujinkyusyoku.LoginUserBean"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求人編集画面</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>

<script src="./jquery.autoKana.js" type="text/javascript"></script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
<link rel="stylesheet" href="default.css">
<link rel="stylesheet" href="form.css">
<link rel="stylesheet" type="text/css" href="radio_width.css" />

</head>
<body class="mainBody">
	<div class="wrapper1">
		<h1>求人編集</h1>
		<div class="wrapper2">
			<form action="KyujinConfilmServlet" method="post"
				class="form-horizontal needs-validation" novalidate>
				<div class="form-group row">
					<label class="col-sm-2 control-label">求人受理整理番号</label>
					<div class="col-sm-5">
						<p><jsp:getProperty property="kyujinId" name="kyujin" /></p>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">求人事業所名称</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<input type="text" id="kaisyaname" class="form-control"
							value="<jsp:getProperty property="kaisyaName" name="kyujin"/>"
							name="kaisyaName1" required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">ふりがな</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<input type="text" id="kaisyanamefurigana" class="form-control"
							value="<jsp:getProperty property="kaisyaNameFurigana" name="kyujin"/>"
							name="kaisyaNameFurigana1" required
							pattern="[\u3041-\u3096\-\ー\s]*">
						<div class="invalid-feedback">求人事業所名称のふりがな(ひらがな)を入力してください</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">郵便番号</label>
					<div class="col-sm-3">
						<input type="text" class="form-control" name="zip11" size="10"
							maxlength="8"
							onKeyUp="AjaxZip3.zip2addr(this,'','zyusyo1','zyusyo1');">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">所在地</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<textarea class="form-control" name="zyusyo1" rows="5"
							style="vertical-align: middle;" required><jsp:getProperty
								property="zyusyo" name="kyujin" /></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">連絡担当者</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-8 form-inline">
						<select id="contact_person" class="form-control"
							name="contact_person" required onChange="responsible_change()">
							<%
								ArrayList<KyujinBean> beanList = (ArrayList<KyujinBean>) request.getAttribute("dept");
							%>
							<%
								int deptid = (int) request.getAttribute("deptId");
							%>
							<%
								for (KyujinBean bean : beanList) {
							%>
							<%
								if (deptid == bean.getDeptId()) {
							%>
							<option selected
								value="<%=bean.getDeptId()%>,<%=bean.getRenrakusaki()%>,<%=bean.getTantousya()%>,<%=bean.getTantousyaFurigana()%>,<%=bean.getDeptName()%>"><%=bean.getTantousya()%></option>
							<%
								} else {
							%>
							<option
								value="<%=bean.getDeptId()%>,<%=bean.getRenrakusaki()%>,<%=bean.getTantousya()%>,<%=bean.getTantousyaFurigana()%>,<%=bean.getDeptName()%>"><%=bean.getTantousya()%></option>
							<%
								}
								}
							%>
						</select> <input type="hidden" id="office_id"
							value="<jsp:getProperty property="kaisyaId" name="kyujin"/>">
						<a href="javascript:void(0);" onclick="officeCheck();">新規担当者追加</a>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">ふりがな</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<input type="text" id="tantousyaFurigana" class="form-control"
							value="<jsp:getProperty property="tantousyaFurigana" name="kyujin"/>"
							name="tantousyaFurigana1" required
							pattern="[\u3041-\u3096\-\ー\s]*">
						<div class="invalid-feedback">連絡担当者名のふりがな(ひらがな)を入力してください</div>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">部署</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<input type="text" id="dept" class="form-control" name="deptName1"
							required
							value="<jsp:getProperty property="deptName" name="kyujin"/>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">連絡先電話番号</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<input type="text" class="form-control" id="phoneNumber"
							name="renrakusaki1" required
							value="<jsp:getProperty property="renrakusaki" name="kyujin"/>"
							placeholder="数字のみ">
					</div>
				</div>
				<div class="form-group row row">
					<label class="col-sm-2 control-label"><span
						class="form_width">受付年月日</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-10  form-inline">
						<input id="reception_date" class="form-control"
							value="<jsp:getProperty property="uketukenengappi" name="kyujin"/>"
							required type="text" name="uketukenengappi1"
							onChange="dateRangeLimit" min="2019-01-01" max="2099-12-31"
							required>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">有効期間</label>
					<div class="form-inline col-sm-10 ">
						<span><input id="effective_period_start" type="text"
							class="form-control" name="yukokikanStart1"
							value="<jsp:getProperty property="yuukoukikanStart" name="kyujin"/>"
							onChange="effective_periodDateChange();" max="2099-12-31"></span>
						<span class="between_width">~</span> <span><input
							class="form-control" id="effective_period_end" type="text"
							name="yukokikanEnd1"
							value="<jsp:getProperty property="yuukoukikanEnd" name="kyujin"/>"
							min="" max="2099-12-31"></span>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">求人数</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-4">
						<input type="number" class="form-control" name="kyujinsuu1"
							required
							value="<jsp:getProperty property="kyujinsuu" name="kyujin"/>"
							placeholder="数字のみ">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">職種</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<input type="text" class="form-control" name="syokusyu1" required
							value="<jsp:getProperty property="syokusyu" name="kyujin"/>">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">郵便番号</label>
					<div class="col-sm-3">
						<input type="text" name="zip11" class="form-control" size="10"
							maxlength="8"
							onKeyUp="AjaxZip3.zip2addr(this,'','syugyoubasyo1','syugyoubasyo1');">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">就業場所</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<textarea name="syugyoubasyo1" class="form-control" rows="5"
							required style="vertical-align: middle;"><jsp:getProperty
								property="syugyobasyo" name="kyujin" /></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label">雇用期間</label>
					<div class="col-sm-10 form-inline">
						<span><input type="text" name="koyoukikan1Start1"
							class="form-control"
							value="<jsp:getProperty property="koyoukikanStart" name="kyujin"/>"
							class="form-control" id="employment_period_start"></span> <span
							class="between_width">~</span> <span><input type="text"
							class="form-control" name="koyoukikanEnd1"
							value="<jsp:getProperty property="koyoukikanEnd" name="kyujin"/>"
							class="form-control" id="employment_period_end"></span>
					</div>
				</div>
				<input id="tingin" type="hidden"
					value="<jsp:getProperty property="tinginKeitai" name="kyujin"/>">
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">賃金形態</span><span class="badge badge-danger">必須</span></label>
					<div class="btn-group btn-group-toggle" data-toggle="buttons">
						<label class="btn btn-outline-primary"> <input
							type="radio" name="tinginKeitai" value="年収" id="year">年収
						</label> <label class="btn btn-outline-primary"> <input
							type="radio" name="tinginKeitai" value="月給" id="month">月給
						</label> <label class="btn btn-outline-primary"> <input
							type="radio" name="tinginKeitai" value="日給" id="day">日給
						</label> <label class="btn btn-outline-primary"> <input
							type="radio" name="tinginKeitai" value="時給" id="hour">時給
						</label>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2 control-label"><span
						class="form_width">賃金</span><span class="badge badge-danger">必須</span></label>
					<div class="col-sm-5">
						<input type="number" class="form-control" required name="tingin1"
							value="<jsp:getProperty property="tingin" name="kyujin"/>"
							placeholder="数字のみ">
					</div>
				</div>

				<input type="submit" name="submit3" value="更新する"
					class="btn btn-info">
			</form>
			<br>
			<form action="SelectServlet" method="post">
				<input class="btn btn-dark" type="submit" name="submit2"
					value="求人一覧へもどる">
			</form>
		</div>
	</div>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
	<script type="text/javascript">
		$.datepicker._gotoToday = function(id) {
			var target = $(id);
			var inst = this._getInst(target[0]);
			var date = new Date();
			this._setDate(inst, date);
			this._hideDatepicker();
		}

		function responsible_change() {
			var dept = document.getElementById("dept")
			var element = document.getElementById("contact_person").value
					.split(',');
			var phoneNumber = document.getElementById('phoneNumber');
			var tantousyaFurigana = document
					.getElementById('tantousyaFurigana');
			phoneNumber.value = element[1];
			tantousyaFurigana.value = element[3];
			dept.value = element[4];
		}

		$(function() {
			dateRangeLimit();
			var tingin = $("#tingin").val();
			var year = $("#year");//年収
			var month = $("#month");//月収
			var day = $("#day");//日給
			var hour = $("#hour");//時給

			if (tingin === year.val()) {
				year.get(0).checked = true;
				year.parent('.btn').addClass('active');
			} else if (tingin === month.val()) {
				month.get(0).checked = true;
				month.parent('.btn').addClass('active');
			} else if (tingin === day.val()) {
				day.get(0).checked = true;
				day.parent('.btn').addClass('active');
			} else if (tingin === hour.val()) {
				hour.get(0).checked = true;
				hour.parent('.btn').addClass('active');
			}
		});

		function officeCheck() {
			var officeId = document.getElementById("office_id").value
			if (officeId == "") {
				alert("事業所を選択してください");
			} else {
				window.open('kyujinDept.jsp', 'newwindow',
						'width=800, height=800, top=100, left=200')
			}
		}

		$(window).on('load',
				detepick('#reception_date', $("#reception_date").val()));
		$('#reception_date').on('change', function() {
			dateRangeLimit()
		});

		$(window).on(
				'load',
				detepick('#effective_period_start',
						$("#effective_period_start").val()));
		$('#effective_period_start').on('change', function() {
			dateRangeLimit()
		});

		$(window).on(
				'load',
				detepick('#effective_period_end', $("#effective_period_end")
						.val()));
		$('#effective_period_end').on('change', function() {
			dateRangeLimit()
		});

		$(window).on(
				'load',
				detepick('#employment_period_start', $(
						"#employment_period_start").val()));
		$('#employment_period_start').on('change', function() {
			dateRangeLimit()
		});

		$(window).on(
				'load',
				detepick('#employment_period_end', $("#employment_period_end")
						.val()));
		$('#employment_period_end').on('change', function() {
			dateRangeLimit()
		});

		function dateRangeLimit() {
			$('#reception_date').datepicker('option', 'maxDate',
					$('#effective_period_start').val());
			$('#effective_period_start').datepicker('option', 'minDate',
					$('#reception_date').val());
			$('#effective_period_start').datepicker('option', 'maxDate',
					$('#effective_period_end').val());
			$('#effective_period_end').datepicker('option', 'minDate',
					$('#effective_period_start').val());
			$('#employment_period_start').datepicker('option', 'maxDate',
					$('#employment_period_end').val());
			$('#employment_period_end').datepicker('option', 'minDate',
					$('#employment_period_start').val());
		}

		function detepick(officeid, fetchDate) {
			$(officeid).datepicker({
				dateFormat : 'yy/mm/dd',
				showButtonPanel : true,
				language : 'ja',
				buttonImage : "calendar.png", // カレンダーアイコン画像
				buttonText : "カレンダーから選択", // ツールチップ表示文言
				buttonImageOnly : true, // 画像として表示
				showOn : "button", // カレンダー呼び出し元の定義
				changeMonth : true,
				changeYear : true
			});
			/*$(officeid).datepicker('setDate',fetchDate);*/
		}
		(function() {
			window.addEventListener('load',
					function() {
						var forms = document
								.getElementsByClassName('needs-validation');
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();

		function effective_periodDateChange() {
			document.getElementById("effective_period_end").min = effective_period_start.value;//有効期間終了の最小値を開始日の値に日に
		}
		$(function() {
			$.fn.autoKana('#kaisyaname', '#kaisyanamefurigana');
		});
	</script>
</body>
</html>