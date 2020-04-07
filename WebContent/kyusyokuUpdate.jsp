<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="kyusyoku" scope="session" class="kyujinkyusyoku.KyusyokuBean"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>求職編集画面</title>
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
		<script>
		  var top = window.innerHeight / 2;
		  var left = window.innerWidth / 2;

		  var WIDTH = 1300;
		  var HEIGHT = 930;
		  var x = left - (WIDTH / 2);
		  var y = top - (HEIGHT / 2);
		</script>
  </head>
  <body class="mainBody">
    <div class="wrapper1">
	    <h1>求職編集</h1>
	    <div class="wrapper2">
	      <form action="KyusyokuConfilmServlet" class="needs-validation" novalidate>
	        <div class="form-group row">
            <label class="col-sm-2 control-label">求職番号</label>
            <div class="col-sm-10">
              <jsp:getProperty property="kyusyokuId" name="kyusyoku"/>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 control-label"><span class="form_width">求職者氏名</span><span class="badge badge-danger">必須</span></label>
            <div class="col-sm-3">
              <input class="form-control" type="text" name="kyusyokuName1"  pattern=.{1,20}  value="<jsp:getProperty property="kyusyokuName" name="kyusyoku"/>" required>
              <div class="invalid-feedback">
                求職者の氏名(最大20文字)を入力してください
              </div>
            </div>
          </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">ふりがな</span><span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-3">
	            <input class="form-control" type="text" name="kyusyokuNameFurigana1" 	 	   value="<jsp:getProperty property="kyusyokuNameFurigana" name="kyusyoku"/>" required pattern="[\u3041-\u3096\-\ー\s]*">
	            <div class="invalid-feedback">
                氏名のふりがな(ひらがな)を入力してください
              </div>
	          </div>
	        </div>
	        <!-- ▼郵便番号入力フィールド(3桁+4桁) -->
          <div class="form-group row">
	          <label class="col-sm-2 control-label">郵便番号 </label>
	          <div class="col-sm-3">
	            <input class="form-control" type="text" name="zip11" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','jyusyo1','jyusyo1');" placeholder="000-0000 or 0000000">
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">住所</span><span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-4">
	            <textarea    id="address" class="form-control textarea_middle"    name="jyusyo1" 	required  		rows="3" ><jsp:getProperty property="jyusyo" 		 name="kyusyoku"/></textarea>
	            <div class="invalid-feedback">
                  求職者の住所を入力してください
                </div>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">生年月日</span><span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-10  form-inline ">
	            <input class="form-control birthday" type="text" name="seinengappi1" 	required	   value="<jsp:getProperty property="seinengappi" 	         name="kyusyoku"/>">
                <div class="invalid-feedback">
                  求職者の生年月日を入力してください 例:2000-01-01 or 2000/01/01
                </div>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">連絡先</span><span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-3">
	            <input class="form-control"  type="text" name="renrakusakiKyusyokusya1" required value="<jsp:getProperty property="renrakusakiKyusyokusya" name="kyusyoku"/>">
	            <div class="invalid-feedback">
              求職者の連絡先(電話番号)を入力してください
            </div>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">求職希望職種</span><span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-3">
	            <input class="form-control"  type="text" name="kibousyokusyu1" 	required 	   value="<jsp:getProperty property="kibousyokusyu" 	 name="kyusyoku"/>">
	             <div class="invalid-feedback">
                求職者の希望職種を入力してください
              </div>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">受付年月日</span><span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-10 form-inline">
	            <input id="recep_date" class="form-control recep_date" type="text" name="uketukenengappi3" required	   value="<jsp:getProperty property="uketukenengappi"        name="kyusyoku"/>">
	            <div class="invalid-feedback">
                受付された日付を入力してください 例:2000-01-01 or 2000/01/01
              </div>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label">有効期間</label>
	          <div class="col-sm-10 form-inline">
	            <input id="effec_period_start" class="form-control effec_period_start" type="text" name="yukoukinanStart3" 	   value="<jsp:getProperty  property="yuukoukikanStart"       name="kyusyoku"/>"><span class="between_width"></span>~<span class="between_width"></span><input class="form-control effec_period_end"  type="text" name="yukoukinanEnd3"      value="<jsp:getProperty property="yuukoukikanEnd"     name="kyusyoku"/>">
	          </div>
	        </div>
          <div class="form-group row">
            <label class="col-sm-2 control-label">紹介年月日</label>
            <div class="col-sm-10 form-inline">
              <input class="form-control intro_date" type="text" name="syoukainengappi1" 	   value="<jsp:getProperty property="syoukaiDay" 		     name="kyusyoku"/>">
            </div>
          </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">求人受理整理番号</span><span class="badge badge-danger">必須</span><br><a href ="javascript:void(0);" class="btn btn-link" onclick="window.open('kyujinListFetch.jsp','newwindow','top=' + y + ',left=' + x + ',width=1300,height=930')">求人一覧</a></label>
	          <div class="col-sm-4">
	            <input class="form-control" type="text" name="kyujinId3" 	required	id = "job_offer_id" 	   value="<jsp:getProperty property="kyujinId" 	             name="kyusyoku"/>" pattern="[1]|^[3-9][0-9]{6,}$"><span class="between_width"></span><small>※求人一覧より該当する求人情報を選択する。「１」は未紹介。</small>
	            <div class="invalid-feedback">
                1 or 正しい求人受理整理番号を入力してください
              </div>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">求人事業所名称</span><span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-3">
	            <input type="text" name="kaisyaName3" 	required	id = "job_offer_name" class="form-control" value="<jsp:getProperty property="kaisyaName" name="kyusyoku"/>"/>
	          </div>
	        </div>
          <input id = "recruitment_not_adopted" type="hidden"  	 value="<jsp:getProperty property="saiyouHusaiyou" 	     name="kyusyoku"/>">
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">採用・不採用</span><span class="badge badge-danger">必須</span></label>
		        <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-primary">
							  <input type="radio" name="saiyouHusaiyou1" id="not_introduction" value="未紹介" autocomplete="off" required>未紹介
							</label>
							<label class="btn btn-outline-primary">
							  <input type="radio" name="saiyouHusaiyou1" id="in_introduction" value="紹介中" autocomplete="off">紹介中
							</label>
							<label class="btn btn-outline-primary">
							  <input type="radio" name="saiyouHusaiyou1" id="recruitment" value="採用" autocomplete="off" >採用
							</label>
							<label class="btn btn-outline-primary">
							  <input type="radio" name="saiyouHusaiyou1" id="not_adopted" value="不採用" autocomplete="off">不採用
							</label>
							<%--
							<label class="btn btn-outline-primary">
							  <input type="radio" name="saiyouHusaiyou1" id="null_recruit" value="" autocomplete="off">
							</label>
							 --%>
						</div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label">採用年月日</label>
	          <div class="col-sm-10 form-inline">
	            <input class="form-control recruit_date" type="text" name="saiyouDay1" 			   value="<jsp:getProperty property="saiyouDay" 		     name="kyusyoku"/>">
	          </div>
	        </div>
          <div class="form-group row">
	          <input id = "working_contract" type="hidden"  	 value="<jsp:getProperty property="roudoukeiyaku" 	     name="kyusyoku"/>">
	          <label class="col-sm-2 control-label">労働契約</label>
	          <div class="btn-group btn-group-toggle" data-toggle="buttons">
							<label class="btn btn-outline-primary">
							  <input type="radio" name="roudoukeiyaku1" id="indefinite" value="無期" autocomplete="off">無期
							</label>
							<label class="btn btn-outline-primary">
							  <input type="radio" name="roudoukeiyaku1" id="fixed_term" value="有期" autocomplete="off">有期
							</label>
							<label class="btn btn-outline-primary">
							  <input type="radio" name="roudoukeiyaku1" id="null_working_contract" value="" autocomplete="off">
							</label>
						</div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label">離職状況</label>
	          <div class="col-sm-5">
	            <textarea class="form-control textarea_middle" name="risyokujoukyou1" rows="3" ><jsp:getProperty property="risyokujoukyou"  name="kyusyoku"/></textarea>
	          </div>
	        </div>
          <div class="form-group row">
	          <input id = "returning_money" type="hidden"  	 value="<jsp:getProperty property="henreikin" 	     name="kyusyoku"/>">
	          <label class="col-sm-2 control-label">返戻金</label>
	          <div class="btn-group btn-group-toggle" data-toggle="buttons">
						  <label class="btn btn-outline-primary">
						    <input type="radio" name="henreikin1" id="none" value="無" autocomplete="off">無
						  </label>
							<label class="btn btn-outline-primary">
								<input type="radio" name="henreikin1" id="exists" value="有" autocomplete="off">有
							</label>
							<label class="btn btn-outline-primary">
								<input type="radio" name="henreikin1" id="null_returning_money" value="" autocomplete="off">
							</label>
						</div>
	        </div>
          <div class="form-group row">
            <label class="col-sm-2 control-label">備考</label>
            <div class="col-sm-5">
              <textarea class="form-control textarea_middle" name="kyusyokuJoukyou1" rows="4" ><jsp:getProperty property="kyusyokuJoukyou" name="kyusyoku"/></textarea>
            </div>
          </div>
	        <br>
	        <input class="btn btn-info" type="submit" name="submit5" value="更新する">
	      </form>
	      <br>
	      <form action="SelectServlet" method="post">
	        <input class="btn btn-dark" type="submit" name="submit2" value="求職一覧へもどる">
	      </form>
	    </div>
	  </div>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	  <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
	  <script>
	    $(function(){

				var RECRUITMENT_NOT_ADOPTED = $("#recruitment_not_adopted").val();
//				console.log(RECRUITMENT_NOT_ADOPTED);

				var NOT_INTRODUCTION = $("#not_introduction");
				var IN_INTRODUCTION  = $("#in_introduction");
				var RECRUITMENT      = $("#recruitment");
				var NOT_ADOPTED      = $("#not_adopted");
		    var NULL_RECRUIT     = $("#null_recruit");


				if( RECRUITMENT_NOT_ADOPTED == NOT_INTRODUCTION.val() ){
					NOT_INTRODUCTION.get(0).checked = true;
					NOT_INTRODUCTION.parent('.btn').addClass('active');
				} else if ( RECRUITMENT_NOT_ADOPTED == IN_INTRODUCTION.val() ){
					IN_INTRODUCTION.get(0).checkd = true;
					IN_INTRODUCTION.parent('.btn').addClass('active');
				} else if ( RECRUITMENT_NOT_ADOPTED == RECRUITMENT.val() ){
					RECRUITMENT.get(0).checked = true;
					RECRUITMENT.parent('.btn').addClass('active');
				} else if ( RECRUITMENT_NOT_ADOPTED == NOT_ADOPTED.val() ){
					NOT_ADOPTED.get(0).checked = true;
					NOT_ADOPTED.parent('.btn').addClass('active');
				} /*else if ( RECRUITMENT_NOT_ADOPTED == NULL_RECRUIT.val() ){
					NULL_RECRUIT.get(0).checked = true;
					NULL_RECRUIT.parent('.btn').addClass('active');
				}*/

//				console.log("NOT_INTRODUCTION.checked =" + NOT_INTRODUCTION.checked);
//				console.log("IN_INTRODUCTION.checked =" + IN_INTRODUCTION.checked);
//				console.log("RECRUITMENT.checked =" + RECRUITMENT.checked);
//				console.log("NOT_ADOPTED.checked =" + NOT_ADOPTED.checked);
//				console.log("NULL_RECRUIT.checked =" + NULL_RECRUIT.checked);


				var WORKING_CONTRACT = $("#working_contract").val();
//				console.log(WORKING_CONTRACT);

				var INDEFINITE            = $("#indefinite");
				var FIXED_TERM            = $("#fixed_term");
				var NULL_WORKING_CONTRACT = $("#null_working_contract");

				if( WORKING_CONTRACT == INDEFINITE.val() ){
					INDEFINITE.get(0).checked = true;
					INDEFINITE.parent('.btn').addClass('active');
				} else if ( WORKING_CONTRACT == FIXED_TERM.val() ){
					FIXED_TERM.get(0).checkd = true;
					FIXED_TERM.parent('.btn').addClass('active');
				} else if ( WORKING_CONTRACT == NULL_WORKING_CONTRACT.val() ){
					NULL_WORKING_CONTRACT.get(0).checked = true;
					NULL_WORKING_CONTRACT.parent('.btn').addClass('active');
				}


				var RETURNING_MONEY = $("#returning_money").val();
//				console.log(RETURNING_MONEY);

				var NONE                 = $("#none");
				var EXISTS               = $("#exists");
				var NULL_RETURNING_MONEY = $("#null_returning_money");

				if( RETURNING_MONEY == NONE.val() ){
					NONE.get(0).checked = true;
					NONE.parent('.btn').addClass('active');
				} else if ( RETURNING_MONEY == EXISTS.val() ){
					EXISTS.get(0).checkd = true;
					EXISTS.parent('.btn').addClass('active');
				} else if ( RETURNING_MONEY == NULL_RETURNING_MONEY.val() ){
					NULL_RETURNING_MONEY.get(0).checked = true;
					NULL_RETURNING_MONEY.parent('.btn').addClass('active');
				}
	    });

      /* 文字列nullを空文字へ変更 */
	    $(function(){
	    	/* 受付年月日_Start */
	    	if($('.recep_date').val() == 'null') {
	    		$('.recep_date').val("");
	    	/* 受付年月日_Start */
	    	}
		    /* 有効期間(開始日)_Start */
				if($('.effec_period_start').val() == 'null') {
					$('.effec_period_start').val("");
				}
				/* 有効期間(開始日)_End */
				/* 有効期間(終了日)_Start */
	      if($('.effec_period_end').val() == 'null') {
					$('.effec_period_end').val("");
				}
	      /* 有効期間(終了日)_End */
	      /* 紹介年月日_Start */
	      if($('.intro_date').val() == 'null') {
				$('.intro_date').val("");
			  }
	      /* 紹介年月日_End */
				/* 採用年月日_Start */
				if($('.recruit_date').val() == 'null') {
				$('.recruit_date').val("");
			  }
	      /* 採用年月日_End */
		  });

	    $.datepicker._gotoToday = function(id) {
	    	var target = $(id);
	    	var inst = this._getInst(target[0]);
	    	var date = new Date();
	    	this._setDate(inst,date);
	    	this._hideDatepicker();
	    }

	    /* カレンダー(datepicker) */
	    $(function(){
		    $(".birthday").datepicker();
		  });
		  $('.birthday').datepicker({
			  dateFormat: 'yy/mm/dd',
			  language:'ja',
			  buttonImage: "calendar.png",        // カレンダーアイコン画像
			  buttonText: "カレンダーから選択", // ツールチップ表示文言
			  buttonImageOnly: true,           // 画像として表示
			  showOn: "button",                   // カレンダー呼び出し元の定義
			  yearRange: '-100:+0',
			  changeMonth: true,
			  changeYear: true
		  });
		  $(function(){
			  $(".effec_period_start").datepicker();
			});
			$(function(){
			    $(".recep_date").datepicker();
			  });
			  $('.recep_date').datepicker({
				  dateFormat: 'yy/mm/dd',
				  showButtonPanel: true,
				  language:'ja',
				  buttonImage: "calendar.png",        // カレンダーアイコン画像
				  buttonText: "カレンダーから選択", // ツールチップ表示文言
				  buttonImageOnly: true,           // 画像として表示
				  showOn: "button",                   // カレンダー呼び出し元の定義
				  changeMonth: true,
				  changeYear: true
			  });
			  $(function(){
				  $(".effec_period_start").datepicker();
				});
				$('.effec_period_start').datepicker({
					dateFormat: 'yy/mm/dd',
					showButtonPanel: true,
					language:'ja',
					buttonImage: "calendar.png",        // カレンダーアイコン画像
					buttonText: "カレンダーから選択", // ツールチップ表示文言
					buttonImageOnly: true,           // 画像として表示
					showOn: "button",
					onSelect: function () {
						$('.effec_period_end').datepicker( 'option', 'minDate', $(".effec_period_start").val());
					},// カレンダー呼び出し元の定義
					changeMonth: true,
					changeYear: true
				});
			  $(function(){
				  $(".effec_period_end").datepicker();
				});
				$('.effec_period_end').datepicker({
					dateFormat: 'yy/mm/dd',
					showButtonPanel: true,
					language:'ja',
					buttonImage: "calendar.png",        // カレンダーアイコン画像
					buttonText: "カレンダーから選択", // ツールチップ表示文言
					buttonImageOnly: true,           // 画像として表示
					showOn: "button",                   // カレンダー呼び出し元の定義
					onSelect: function () {
				  	$('.effec_period_start').datepicker( 'option', 'maxDate', $(".effec_period_end").val());
				  },
					changeMonth: true,
					changeYear: true
				});
			  $(function(){
				  $(".intro_date").datepicker();
				});
				$('.intro_date').datepicker({
					dateFormat: 'yy/mm/dd',
					showButtonPanel: true,
					language:'ja',
					buttonImage: "calendar.png",        // カレンダーアイコン画像
					buttonText: "カレンダーから選択", // ツールチップ表示文言
					buttonImageOnly: true,           // 画像として表示
					showOn: "button",                   // カレンダー呼び出し元の定義
					changeMonth: true,
					changeYear: true
			  });
			  $(function(){
				  $(".recruit_date").datepicker();
				});
				$('.recruit_date').datepicker({
					dateFormat: 'yy/mm/dd',
					showButtonPanel: true,
					language:'ja',
					buttonImage: "calendar.png",        // カレンダーアイコン画像
					buttonText: "カレンダーから選択", // ツールチップ表示文言
					buttonImageOnly: true,           // 画像として表示
					showOn: "button",                   // カレンダー呼び出し元の定義
					changeMonth: true,
					changeYear: true
			  });

				/* バリデーション */
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