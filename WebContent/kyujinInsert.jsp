<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求人追加画面</title>

<script src="https://code.jquery.com/jquery-3.4.1.min.js" integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>

<script type="text/javascript" src="jquery.cookie.js"></script>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
 <link rel="stylesheet" href="default.css">
 <link rel="stylesheet" href="form.css">
 <link rel="stylesheet" type="text/css" href="radio_width.css"/>
</head>

<body class = "mainBody">
<div class="wrapper1">
	<h1>求人追加</h1>
	<div class="wrapper2">
	<form id="mainForm" class="form-horizontal  needs-validation" action="KyujinConfilmServlet" method="post" novalidate>

		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">求人事業所ID</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-4 form-inline">
				<input type="text" class="auto_entry clearfix form-control" id="office_id" value="" name="kaisyaId2" readonly>
					<a href="javascript:void(0);" onclick="window.open('KyujinKaisyaServlet','newwindow','width=800, height=800, top=100, left=200')">事業所選択</a>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">求人事業所名称</label>
			<div class="col-sm-3">
	            <input type="text" class="auto_entry form-control" id="office_name" value="" name="kaisyaName2" readonly>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">所在地</label>
			<div class="col-sm-4">
				<textarea class="auto_entry form-control" id="office_address" name="zyusyo2" rows="5" style="vertical-align: middle;" readonly></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">連絡担当者</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-5 form-inline">
				<select class="form-control" id="contact_person" name="contact_person" onChange="responsible_change()" required>
					<option value = "test">test</option>
				</select> <a href="javascript:void(0);" onclick="officeCheck();">新規担当者追加</a>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">連絡先電話番号</label>
			<div class="col-sm-3">
				<input class="auto_entry" class="form-control" id="phoneNumber" type="text" value="" name="renrakusaki2" readonly>
			</div>
		</div>
		<div class="form-group row row">
			<label class="col-sm-2 control-label"><span class="form_width">受付年月日</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-10  form-inline">
				<input id="reception_date" class="form-control inputDate" type="text" name="uketukenengappi2" onChange="receptionDateChange();" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">有効期間</label>
			<div class="form-inline col-sm-10 ">
				<span><input id="effective_period_start" type="text" class="form-control inputDate" name="yukokikanStart2" onChange="effective_periodDateChange();"></span>
				 <span class="between_width">~</span> <span><input class="form-control inputDate" id="effective_period_end" type="text" name="yukokikanEnd2" min=""></span>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">求人数</span><span class="badge badge-danger">必須</span></label>
			 <div class="col-sm-2">
				<input type="number" name="kyujinsuu2" class="form-control" value="1" min="1" placeholder="数字のみ" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">職種</span><span class="badge badge-danger">必須</span></label>
			 <div class="col-sm-3">
				<input type="text" name="syokusyu2" class="form-control" required>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">郵便番号</label>
			 <div class="col-sm-3">
				<input type="text" name="zip11" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','syugyoubasyo2','syugyoubasyo2');">
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">就業場所</span><span class="badge badge-danger">必須</span></label>
			 <div class="col-sm-4">
				<textarea class="form-control" name="syugyoubasyo2" rows="5" style="vertical-align: middle;" required></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label">雇用期間</label>
			<div class="col-sm-10 form-inline">
				<span><input type="text" name="koyoukikanStart2" class="form-control inputDate" id="employment_period_start"></span>
					 <span class="between_width">~</span> <span><input type="text" name="koyoukikanEnd2" class="form-control inputDate" id="employment_period_end"></span>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">賃金形態</span><span class="badge badge-danger">必須</span></label>
			<div class="btn-group btn-group-toggle" data-toggle="buttons">
			  <label class="btn btn-outline-primary">
				  <input type="radio" name="tinginKeita2" value="年収">年収
				</label>
				<label class="btn btn-outline-primary active">
				  <input type="radio" name="tinginKeita2" value="月給" checked>月給
				</label>
				<label class="btn btn-outline-primary">
				  <input  type="radio" name="tinginKeita2" value="日給">日給
				</label>
				  <label class="btn btn-outline-primary">
				<input type="radio" name="tinginKeita2" value="時給">時給
				</label>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 control-label"><span class="form_width">賃金</span><span class="badge badge-danger">必須</span></label>
			<div class="col-sm-3">
				<input type="number" class="form-control" value="0" min="0" name="tingin2" placeholder="数字のみ">
			</div>
		</div>
		<div class="form-group row">
			<input id="btn-validate" type="submit" name="submit3" value="追加する" class="btn btn-info">
		</div>
	</form>
	<div class="form-group col-sm-offset-2 col-sm-10">
		<button class="btn btn-secondary" onclick="history.back();">戻る</button>
	</div>
	</div>
</div>
  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
	<script>
	$.datepicker._gotoToday = function(id) {
		var target = $(id);
		var inst = this._getInst(target[0]);
		var date = new Date();
		this._setDate(inst,date);
		this._hideDatepicker();
	}
	window.onload = function () {
		var cookie_get = document.cookie.split(';');
		contact_person.textContent = ""; // <select id = "contact_person"></select>内を空に
		for(var i = 0; i < (cookie_get.length- 1)/2 ; i++){
    		let op = document.createElement("option"); //<option>要素を作る
    		op.value = $.cookie("value" + i); //<option>要素のvalue カンマ区切りで左からdeptId、電話番号、担当者名
    		op.text = $.cookie("text" + i); //<option>要素のtext
    		document.getElementById("contact_person").appendChild(op); //<option>要素の作成場所指定            console.log(response[i].tantousya);
    		}
	}

	var reception_date =  document.getElementById("reception_date");//受付年月日要素取得
	var effective_period_start = document.getElementById("effective_period_start");//有効期間開始日要素取得
	function receptionDateChange() {
		effective_period_start.value = reception_date.value;//受付valueを有効開始valueに
		effective_period_start.min = reception_date.value;//有効開始の最小値を受付日の値に
		effective_periodDateChange();
	}
	function effective_periodDateChange(){
		document.getElementById("effective_period_end").min = effective_period_start.value;//有効期間終了の最小値を開始日の値の日に
	}


	function responsible_change(){
		var element = document.getElementById("contact_person").value.split(',')[1];
		var phoneNumber = document.getElementById('phoneNumber');
		phoneNumber.value = element;
	}
	function officeCheck(){
		var officeId = document.getElementById("office_id").value
		if ( officeId == ""){
			alert("事業所を選択してください");
		}else{
			window.open('kyujinDept.jsp','newwindow','width=800, height=800, top=100, left=200')
		}
	}
	$('#btn-validate').click(function(){
		console.log("aaa");
		if ($('#mainForm').smkValidate()) {
			console.log("bbb");
			return true;
		}else{
			console.log("ccc");
			return false;
		}
	});

$(function(){
	$(window).on('load', detepick('#reception_date'));
	$(window).on('load',$('#reception_date').datepicker('setDate','today'));
	$('#reception_date').on('change', function(){dateRangeLimit()});

	$(window).on('load', detepick('#effective_period_start'));
	$(window).on('load',$('#effective_period_start').datepicker('setDate','today'));
	$('#effective_period_start').on('change', function(){dateRangeLimit()});

	$(window).on('load', detepick('#effective_period_end'));
	$(window).on('load',  dateRangeLimit());
	$('#effective_period_end').on('change', function(){dateRangeLimit()});

	$(window).on('load', detepick('#employment_period_start'));
	$('#employment_period_start').on('change',function(){dateRangeLimit()});

	$(window).on('load', detepick('#employment_period_end'));
	$('#employment_period_end').on('change', function(){dateRangeLimit()});
});



function dateRangeLimit(){
	$('#reception_date').datepicker( 'option', 'maxDate', $('#effective_period_start').val());
	$('#effective_period_start').datepicker( 'option', 'minDate', $('#reception_date').val());
	$('#effective_period_start').datepicker( 'option', 'maxDate', $('#effective_period_end').val());
	$('#effective_period_end').datepicker( 'option', 'minDate', $('#effective_period_start').val());
	$('#employment_period_start').datepicker( 'option', 'maxDate', $('#employment_period_end').val());
	$('#employment_period_end').datepicker( 'option', 'minDate', $('#employment_period_start').val());
	}
function detepick(officeid){
		$(officeid).datepicker({
				dateFormat: 'yy/mm/dd',
			  showButtonPanel: true,
				language:'ja',
				buttonImage: "calendar.png",        // カレンダーアイコン画像
				buttonText: "カレンダーから選択", // ツールチップ表示文言
				buttonImageOnly: true,           // 画像として表示
				showOn: "button",                   // カレンダー呼び出し元の定義
			    changeMonth: true, changeYear: true
		    });
	}
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