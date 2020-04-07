<!-- 変更No.033_kim JSPの追加 - Start -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id ="kyusyokuSyaList" scope="session" class="kyujinkyusyoku.KyusyokuBean"/>  <!-- 変更No.039_kim idの変更 -->
<jsp:useBean id="kyusyoku" scope="session" class="kyujinkyusyoku.KyusyokuBean"/>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>求職情報の再登録画面</title>
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
	    <h1>求職情報の再登録</h1>
	    <div class="wrapper2">
	      <form action="KyusyokuConfilmServletAdd" method="post" class="needs-validation" novalidate>
<!-- 変更No.040_kim jsp:getPropertyの追加・inputタグのname属性の値を変更 - Start -->
          <a href ="javascript:void(0);" onclick="window.open('KyusyokuSyaSelectServlet','newwindow','width=1300,height=930,top=30px,left=290px')">求職者選択</a>
          <div class="form-group row">
            <label class="col-sm-2 control-label">求職者ID</label>
            <div class="col-sm-3">
              <input class="form-control" type="text" class = "auto_entry" class = "clearfix" id = "job_seeker_id" value="" name="kyusyokusyaId2" readonly>
            </div>
          </div>
          <div class="form-group row">
            <label class="col-sm-2 control-label">求職者氏名</label>
            <div class="col-sm-3">
              <input class="form-control"  type="text" class = "auto_entry" class = "clearfix" id = "job_seeker_name" value="" name="kyusyokuName2" readonly>
            </div>
          </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label">住所</label>
	          <div class="col-sm-7">
	            <input class="form-control" type="text" class = "auto_entry" class = "clearfix" id = "job_seeker_adr" value="" name="jyusyo2" readonly>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label">生年月日</label>
	          <div class="col-sm-10 form-inline">
	            <input class="form-control" type="text" class = "auto_entry" class = "clearfix" id = "job_seeker_birthday" value="" name="seinengappi2" readonly>
	          </div>
	        </div>
	        <div class="form-group row">
	          <label class="col-sm-2 control-label">連絡先</label>
	          <div class="col-sm-3">
	            <input class="form-control" type="text" class = "auto_entry" class = "clearfix" id = "job_seeker_contact" value="" name="renrakusaki2" readonly>
	          </div>
	        </div>
	        <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">求職希望職種</span> <span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-3">
	            <input class="form-control" type="text" name="kibousyokusyu2" required>
	            <div class="invalid-feedback">
                求職者の希望職種を入力してください
              </div>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label"><span class="form_width">受付年月日</span> <span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-10 form-inline">
	            <input id="recep_date" class="form-control recep_date" type="text" name="uketukenengappi4" onChange = "dateChange();" required>
	            <div class="invalid-feedback">
                受付された日付を入力してください
              </div>
	          </div>
	        </div>
          <div class="form-group row">
	          <label class="col-sm-2 control-label">有効期間 <%--&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&thinsp;&thinsp;<span class="badge badge-danger">必須</span> --%></label>
	          <div class="col-sm-10 form-inline">
	            <input id="effec_period_start" class="form-control effec_period_start" type="text" name="yuukoukikanStart4"><span class="between_width"></span>~<span class="between_width"></span><input class="form-control effec_period_end" type="text" name="yuukoukikanEnd4">
	          </div>
	        </div>
	        <br>
	        <input type="submit" class="btn btn-info" name="submit5" value="再登録する求職情報の確認">
	        <p><small>※<span style="color:red;"><u>既に求人事業所に求職者を紹介済み</u></span>の場合、下部「<i class="fas fa-arrow-alt-circle-down"></i>」をクリックし、「職業紹介の取り扱い状況」を追加入力してください。</small></p>
				  <button type="button" class="btn btn-info btn-sm" data-toggle="collapse" data-target="#sample" ><i class="fas fa-arrow-alt-circle-down"></i></button>
	        <div id="sample" class="collapse" style="padding:2rem 1rem; clear:both;">
	          <div class="panel panel-default">
	            <div class="form-group row">
	              <label class="col-sm-2 control-label">紹介年月日</label>
	              <div class="col-sm-10 form-inline">
	                <input class="form-control intro_date" type="text" name="syoukaiDay2">
	              </div>
	            </div>
	            <div class="form-group row">
		            <label class="col-sm-2 control-label"><span class="form_width">求人受理整理番号</span> <span class="badge badge-danger">必須</span><br><a href ="javascript:void(0);" class="btn btn-link" onclick="window.open('kyujinListFetch.jsp','newwindow','top=' + y + ',left=' + x + ',width=1300,height=930')">求人一覧</a></label>
		            <div class="col-sm-4">
		              <input class="form-control" type="text" name="kyujinId3" id="job_offer_id" value="1" name="kyusyoku" pattern="[0-1]|^[3-9][0-9]{6,}$"><span class="between_width"></span><small>※求人一覧より該当する求人情報を選択する。「１」は未紹介。</small>
		              <div class="invalid-feedback">
                    1 or 正しい求人受理整理番号を入力してください
                  </div>
		            </div>
		          </div>
	            <div class="form-group row">
		            <label class="col-sm-2 control-label">求人事業所名称</label>
		            <div class="col-sm-3">
		              <input class="form-control" type="text" name="kaisyaName3" 		id = "job_offer_name"/>
		            </div>
		          </div>
	            <div class="form-group row">
		            <label class="col-sm-2 control-label">採用・不採用</label>
			          <div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-outline-primary active">
									  <input type="radio" name="saiyouHusaiyou2" id="option1" value="未紹介" autocomplete="off"  checked>未紹介
									</label>
									<label class="btn btn-outline-primary">
									  <input type="radio" name="saiyouHusaiyou2" id="option2" value="紹介中" autocomplete="off">紹介中
									</label>
									<label class="btn btn-outline-primary">
									  <input type="radio" name="saiyouHusaiyou2" id="option3" value="採用" autocomplete="off" >採用
									</label>
									<label class="btn btn-outline-primary">
									  <input type="radio" name="saiyouHusaiyou2" id="option4" value="不採用" autocomplete="off">不採用
									</label>
<%--
									<label class="btn btn-outline-primary active">
									  <input type="radio" name="saiyouHusaiyou2" id="option5" value="" autocomplete="off" checked>
									</label>
 --%>
								</div>
		          </div>
	            <div class="form-group row">
		            <label class="col-sm-2 control-label">採用年月日</label>
		            <div class="col-sm-10 form-inline">
		              <input class="form-control recruit_date" type="text" name="saiyouDay2">
		            </div>
		          </div>
	            <div class="form-group row">
		            <label class="col-sm-2 control-label">労働契約</label>
		              <div class="btn-group btn-group-toggle" data-toggle="buttons">
									<label class="btn btn-outline-primary">
									  <input type="radio" name="roudoukeiyaku2" id="option1" value="無期" autocomplete="off">無期
									</label>
									<label class="btn btn-outline-primary">
									  <input type="radio" name="roudoukeiyaku2" id="option2" value="有期" autocomplete="off">有期
									</label>
									<label class="btn btn-outline-primary active">
									  <input type="radio" name="roudoukeiyaku2" id="option3" value="" autocomplete="off" checked>
									</label>
								</div>
		          </div>
	            <div class="form-group row">
		            <label class="col-sm-2 control-label">離職状況</label>
		            <div class="col-sm-5">
		              <textarea class="form-control" name="risyokujoukyou2" rows="3" style="vertical-align : middle;"></textarea>
		            </div>
		          </div>
	            <div class="form-group row">
		            <label class="col-sm-2 control-label">返戻金</label>
		            <div class="btn-group btn-group-toggle" data-toggle="buttons">
								<label class="btn btn-outline-primary">
									<input type="radio" name="henreikin2" id="option1" value="無" autocomplete="off">無
								</label>
								<label class="btn btn-outline-primary">
									<input type="radio" name="henreikin2" id="option2" value="有" autocomplete="off">有
								</label>
								<label class="btn btn-outline-primary active">
									<input type="radio" name="henreikin2" id="option3" value="" autocomplete="off" checked>
							  </label>
								</div>
		          </div>
	            <div class="form-group row">
	              <label class="col-sm-2 control-label">備考</label>
	                <div class="col-sm-5">
	                  <textarea class="form-control" name="kyusyokuJoukyou2" rows="3" style="vertical-align : middle;"></textarea>
	                </div>
	            </div>
	<!-- 変更No.040_kim - End -->
		          <br>
		          <input type="submit" class="btn btn-info" name="submit5" value="再登録する求職情報の確認">
	          </div>
	        </div>
        </form>
        <br>
	      <form action="SelectServlet" method="post">
	        <input class="btn btn-dark" type="submit"name="submit2" value="求職一覧へもどる">
	      </form>
      </div>
    </div>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script>
			window.onload = function () {
				var date = new Date();
				var year = date.getFullYear();
				var month = ("0" + (date.getMonth() + 1)).slice(-2);
				var day = ("0" + date.getDate()).slice(-2);
				var today;

				today = year + "/" + month + "/" + day;
				document.getElementById("recep_date").value = today;
				document.getElementById("effec_period_start").value = today;
			}
			function dateChange() {
				document.getElementById("effec_period_start").value = document.getElementById("recep_date").value;
			}
			$.datepicker._gotoToday = function(id) {
		    	var target = $(id);
		    	var inst = this._getInst(target[0]);
		    	var date = new Date();
		    	this._setDate(inst,date);
		    	this._hideDatepicker();
		    }
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