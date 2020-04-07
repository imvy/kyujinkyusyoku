<!-- 変更No.029_kim JSPの追加 - Start -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>新規求職者追加画面</title>
    <link rel="stylesheet" type="text/css" href="default.css"/>
    <link rel="stylesheet" type="text/css" href="form_subwindow.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.js" integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
    <script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
    <script src="./jquery.autoKana.js"></script>
  </head>
  <body class="mainBody">
    <div class="wrapper1">
	    <h1>新規求職者追加</h1>
	    <div class="wrapper2">
	    <form action="KyusyokuSyaNewServlet" method="post" class="form-horizontal needs-validation" novalidate>
	      <div class="form-group row">
	        <label class="col-sm-2 control-label"><span class="form_width">求職者氏名</span> <span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-3">
	            <input class="kyusyokusya_name form-control" type="text" name="kyusyokuName3" pattern=.{1,20} required/>
	            <div class="invalid-feedback">
                求職者の氏名(最大20文字)を入力してください
              </div>
	          </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 control-label"><span class="form_width">ふりがな</span> <span class="badge badge-danger">必須</span></label>
	          <div class="col-sm-3">
	            <input class="kyusyokusya_name_furigana form-control" type="text" name="kyusyokuNameFurigana3" required pattern="[\u3041-\u3096\-\ー\s]*"/>
	            <div class="invalid-feedback">
                氏名のふりがな(ひらがな)を入力してください
              </div>
	          </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 control-label">郵便番号 </label>
	        <div class="col-sm-3">
	          <input class="form-control" type="text" name="zip11" size="10" maxlength="8" onKeyUp="AjaxZip3.zip2addr(this,'','jyusyo3','jyusyo3');" placeholder="000-0000 or 0000000">
	        </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 control-label"><span class="form_width">住所</span> <span class="badge badge-danger">必須</span></label>
	        <div class="col-sm-5">
	          <textarea id="address" class="form-control" name="jyusyo3" rows="3" style="vertical-align : middle;" required/></textarea>
	          <div class="invalid-feedback">
              求職者の住所を入力してください
            </div>
	        </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 control-label"><span class="form_width">生年月日</span> <span class="badge badge-danger">必須</span></label>
	        <div class="col-sm-10  form-inline ">
	          <input class="form-control birthday" type="text" name="seinengappi3" required pattern="^\d{4}[-/]\d{1,2}[-/]\d{1,2}$"/>
	          <div class="invalid-feedback">
              求職者の生年月日を入力してください 例:2000-01-01 or 2000/01/01
            </div>
	        </div>
	      </div>
	      <div class="form-group row">
	        <label class="col-sm-2 control-label"><span class="form_width">連絡先</span> <span class="badge badge-danger">必須</span></label>
	        <div class="col-sm-3">
	          <input class="form-control" type="text" name="renrakusakiKyusyokusya3" required/>
	          <div class="invalid-feedback">
              求職者の連絡先(電話番号)を入力してください
            </div>
	        </div>
	      </div>
        <br><%--<br><br> --%>
        <%--<input type="button" onclick="location.href='./kyusyokuSyaSel_Ins.jsp'" value="戻る"> --%>
	      <input type="submit" class="btn btn-info" value="追加情報確認">
	      <a href="javascript:;" class="btn btn-dark" onclick="window.close();">ウィンドウを閉じる</a>
	    </form>
	    </div>
	  </div>
	  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	  <script>
      $(function() {
				$.fn.autoKana('.kyusyokusya_name', '.kyusyokusya_name_furigana');
			});
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
<!-- 変更No.029_kim - End -->