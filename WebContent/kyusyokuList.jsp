<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kyujinkyusyoku.KyusyokuBean" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>求職一覧画面</title>
    <link rel="stylesheet" type="text/css" href="default.css"/>
    <link rel="stylesheet" type="text/css" href="list.css"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="js.cookie.js"></script>
		<script>
		  var top = window.innerHeight / 2;
		  var left = window.innerWidth / 2;

		  var WIDTH = 1600;
		  var HEIGHT = 950;
		  var x = left - (WIDTH / 2);
		  var y = top - (HEIGHT / 2);
		</script>
    </head>
    <body class="mainBody">
	    <jsp:include page="header2.jsp"></jsp:include>
	    <div class="wrapper1">
		    <h1>求職一覧</h1>
	      <form style="padding:1rem 1rem; clear:both;">
	   	    <%if ( 1 ==((int)session.getAttribute("level_db"))) {%>
	    <%--    <input type="button" onclick="location.href='kyusyokuSyaSel_Ins.jsp'"    value="追加">   --%>	       <!-- 変更No.026_kim onclick時のアドレス変更 -->
	    <%---	<input type="button" onclick="location.href='kyusyokuSyaSel_Ins.jsp'"    value="追加">         <!-- 変更No.026_kim onclick時のアドレス変更 --> --%>
	        <a href="javascript:void(0);"  class="btn btn-primary btn-sm" onclick="window.open('kyusyokuSyaNew.jsp',null,'top=' + y + ',left=' + x + ',width=1600,height=950')">新規求職者・求職情報の追加</a>
		      <input type="button" class="btn btn-primary btn-sm" onclick="location.href='kyusyokuInfoInsertAdd.jsp'"    value="求職情報の再登録">
		      <input type="button" class="btn btn-primary btn-sm" onClick="window.open('kyusyokuPrint.jsp','_blank')" value="印刷">
		  	  <% } %>
		    </form>
<%--vy add --%>
<%--<div>
<form action = "DisplayServlet" method = "post">
	<button type="submit" class="btn btn-info" >Display</button>
</form>
</div>--%>
<%--vy add --%>
		    <p class="range_search"><span><span class="search_width">受付年月日 </span>: <input type="text" id="min_recep_date"   name="min_recep_date">   </span><span class="between_width">~</span><span> <input type="text" id="max_recep_date"   name="max_recep_date">  </span></p>
	      <p class="range_search"><span><span class="search_width">紹介年月日 </span>: <input type="text" id="min_intro_date"   name="min_intro_date">   </span><span class="between_width">~</span><span> <input type="text" id="max_intro_date"   name="max_intro_date">  </span></p>
	      <p class="range_search"><span><span class="search_width">採用年月日 </span>: <input type="text" id="min_recruit_date" name="min_recruit_date"> </span><span class="between_width">~</span><span> <input type="text" id="max_recruit_date" name="max_recruit_date"></span></p>
		    <form action="KyusyokuServlet" method="post">
		      <div class="table-responsive">
		        <table id="myTable" class="table table-dark table-hover table-striped table-bordered  table-sm">
			        <thead class="thead-light">
			          <tr><!-- 変更No.010_kim 見出しの追加 -->
				          <th>求職番号</th><th>求職者氏名</th><th>求職者氏名(ふりがな)</th><th>生年月日</th>
				          <th>求職希望職種</th><th>受付年月日</th><th>紹介年月日</th><th>求人受理整理番号</th>
				          <th>求人事業所名称</th><th>求人事業所名称(ふりがな)</th><th>採用・不採用</th><th>採用年月日</th><th>労働契約</th>
				          <th>転職勧奨禁止期間(開始日)</th><th>転職勧奨禁止期間(終了日)</th><th>離職状況</th>
				          <th>返戻金</th><th>備考</th><% if ( 1 ==((int)session.getAttribute("level_db"))) {%><th class="th_upd_rmv">編集</th><th class="th_upd_rmv">削除</th><% } %>
		  	        </tr>
			        </thead>
	      <%--		<tbody>
			          <%ArrayList<KyusyokuBean> beanList = (ArrayList<KyusyokuBean>)request.getAttribute("kyusyokubeanList"); %>
			          <%for(KyusyokuBean bean : beanList) { %>
			            <tr>
			              <td><%= bean.getKyusyokuId() %>											<!-- 変更No.011_kim 取得データ変更 -->
	  	              <td><%= bean.getKyusyokuName() %>
			              <td><%= bean.getSeinengappi() %></td>
			              <td><%= bean.getKibousyokusyu() %></td>
			              <td><%= bean.getUketukenengappi() %></td>
		         	      <td><%= bean.getSyoukaiDay() %></td>
			              <td><%= bean.getKyujinId() %></td>
			              <td><%= bean.getKaisyaName() %></td>										<!-- 変更No.012_kim 取得データ追加 - Start -->
			              <td><%= bean.getSaiyouHusaiyou() %></td>
			              <td><%= bean.getSaiyouDay() %></td>
			              <td><%= bean.getRoudoukeiyaku() %></td>
			              <td><%= bean.getSaiyouDay() %></td>
			              <td><%= bean.getTensyokukansyouEnd() %></td>
			              <td><pre><%= bean.getRisyokujoukyou() %><pre></td>
			              <td><%= bean.getHenreikin() %></td>
			              <td class ="rightmost"><pre><%= bean.getKyusyokuJoukyou() %></pre></td>										<!-- 変更No.012_kim 取得データ追加 - End -->
	              <%--	<% if ( 1 ==((int)session.getAttribute("level_db"))) {%>  権限管理 --%>
	            <%--		<td class = "control" id ="edit"><input type="submit" name="<%= bean.getKyusyokuId() %>" value="編集"></td>
			              <td class = "control"><input type="submit" name="<%= bean.getKyusyokuId() %>" value="削除"></td>
	            <%--		<% } %> 権限管理 --%>
	        <%--		</tr>
				<% } %>
		            </tbody> --%>
		        </table>
		      </div>
	      </form>
      </div>
		  <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
		  <script type="text/javascript" src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
      <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
      <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.colVis.min.js"></script>
      <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>

		  <script>
      /* DataTablesによるtbody作成処理 - Start */
      var th_length = $("table th").length;  //thの数を取得 thの数が20の場合、管理者権限。18の場合、一般権限。

      /*  以下、管理者権限の処理  */
      if (th_length === 20){
        $(document).ready(function(){
 		    load_data();
 	      });

		    /* 受付年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_recep_date').value;
		        var iFfin = document.getElementById('max_recep_date').value;

//		        console.log("受付年月日：iFini = " + iFini);

		        var iDateCol = 5;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

		//        console.log("受付年月日：iFini = " + iFini);
		//        console.log("受付年月日：iFfin = " + iFfin);


		        var datofini=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

		//        console.log("受付年月日：datofini = "datofini);
		//        console.log("受付年月日：datoffin = "datoffin);

		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFfin >= datoffin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && iFfin >= datoffin)
		        {
		            return true;
		        }
		        return false;
		      }
		    );
			  /* 受付年月日-期間検索_End */

			  /* 紹介年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_intro_date').value;
		        var iFfin = document.getElementById('max_intro_date').value;

		        var iDateCol = 6;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

//		        console.log("紹介年月日：iFini = " + iFini);
//		        console.log("紹介年月日：iFfin = " + iFfin);


		        var datofini=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

//		        console.log("紹介年月日：datofini = " + datofini);
//		        console.log("紹介年月日：datoffin = " + datoffin);

		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFfin >= datoffin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && iFfin >= datoffin)
		        {
		            return true;
		        }
		        return false;
		      }
		    );
		    /* 紹介年月日-期間検索_End */

		    /* 採用年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_recruit_date').value;
		        var iFfin = document.getElementById('max_recruit_date').value;

		        var iDateCol = 11;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

//		        console.log("採用年月日：iFini = " + iFini);
//		        console.log("採用年月日：iFfin = " + iFfin);


		        var datofini=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

//		        console.log("採用年月日：datofini = " + datofini);
//		        console.log("採用年月日：datoffin = " + datoffin);

		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFfin >= datoffin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && iFfin >= datoffin)
		        {
		            return true;
		        }
		        return false;
		      }
		    );
		    /* 採用年月日-期間検索_End */

	      /* DataTables生成 */
	    	function load_data(){
	 		    var data = {act : "show"};
	 		    var table = $('#myTable').DataTable({
	 			    scrollX: true,    // 横スクロール設定：有効
	 			    stateSave: true,  // ページネーションの選択ページを再読み込み後も固定表示
	 			    dom:            "Bfrtip",
	 			    buttons:        [ {extend: 'colvis',
	 	                collectionLayout: 'fixed two-column'}],
	 			    ajax : {          // ajax処理
	 				    url : "${pageContext.request.contextPath}/KyusyokuListFetchServlet",
	 				    type : "get",
	 				    data:data,
	 				    dataSrc: "result"
	 			    },
	 			    columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
	 				    {data : "kyusyokuId"},
	 				    {data : "kyusyokuName", "defaultContent": ""},
	 				    {data : "kyusyokuNameFurigana", "defaultContent": ""},
	 				    {data : "seinengappi", "defaultContent": ""},
	 				    {data : "kibousyokusyu", "defaultContent": ""},
	 				    {data : "uketukenengappi", "defaultContent": ""},
	 				    {data : "syoukaiDay", "defaultContent": ""},
	 				    {data : "kyujinId"},
	 				    {data : "kaisyaName", "defaultContent": ""},
	 				    {data : "kaisyaNameFurigana", "defaultContent": ""},
	 				    {data : "saiyouHusaiyou", "defaultContent": ""},
	 				    {data : "saiyouDay" , "defaultContent": ""},
	 				    {data : "roudoukeiyaku" , "defaultContent": ""},
	 				    {data : "saiyouDay" , "defaultContent": ""},
	 				    {data : "tensyokukansyouEnd" , "defaultContent": ""},
	 				    {data : "risyokujoukyou" , "defaultContent": ""},
	 				    {data : "henreikin" , "defaultContent": ""},
	 				    {data : "kyusyokuJoukyou" , "defaultContent": ""},
	 				    {defaultContent : "<input type='submit' name='' value='編集' class='edit   btn btn-outline-info'   style='font-size:large;'>"},//本defaultContentは編集ボタン作成
	 				    {defaultContent : "<input type='submit' name='' value='削除' class='remove btn btn-outline-danger' style='font-size:large;'>"} //本defaultContentは削除ボタン作成
	 			    ],
	 			    "columnDefs": [ {
	 				    "targets": [18,19],  //編集・削除カラム
	 				    "orderable": false,   // ソートボタン無効化
	 				    },
	 				    { targets: [2,3,9,13,14,15,16,17], visible: false }, //対象列を非表示
	 				    { targets: [0,12,16], width: 80 },       //求職番号,労働契約,返戻金列の横幅を80pxに指定
	 				    { targets: [1,10], width: 120 },          //求職者名,採用・不採用列の横幅を120pxに指定
	 				    { targets: [3,5,6,11], width: 100 },     //生年月日,受付年月日,紹介年月日,採用年月日列の横幅を100pxに指定
	 				    { targets: [2,4,7,8,9,13,14], width: 150 },  //求職希望職種,求人受理整理番号,事業所名称,転職勧奨禁止期間(開始)・(終了)の横幅を150pxに指定
	 				    { targets: [15,17], width: 200 }        //離職状況,備考列の横幅を200pxに指定
	 				  ],
	 				  /*
	 				  fixedColumns:   {
		 			    leftColumns: 2,
		 			    rightColumns: 2
		 			  },*/
	 			    "language": {  //言語を日本語に変更
	 					  "sProcessing":   "処理中...",
	 					  "sLengthMenu":   "_MENU_ 件表示",
	 					  "sZeroRecords":  "データはありません。",
	 					  "sInfo":         " _TOTAL_ 件中 _START_ から _END_ まで表示",
	 					  "sInfoEmpty":    " 0 件中 0 から 0 まで表示",
	 					  "sInfoFiltered": "（全 _MAX_ 件より抽出）",
	 					  "sInfoPostFix":  "",
	 					  "sSearch":       "検索:",
	 					  "sUrl":          "",
	 					  "oPaginate": {
	 						  "sFirst":    "先頭",
	 						  "sPrevious": "前",
	 						  "sNext":     "次",
	 						  "sLast":     "最終"
	 	     	    },
	 	     	    buttons: {
	 	                colvis: '表示列の選択'
	 	            }
	 	     	  },
	 	     	  /* 以下、機能無効化処理。今回は無効化処理無し。
	 	        /* 件数切替機能 無効 */
	 	        //   lengthChange: false,
	 	        /* 情報表示 無効 */
	 	        //   info: false,
	 	        /* ページング機能 無効 */
	 	        /*   paging: false,
	 	        /* ソート機能 無効 */
	 	        //   ordering: false,

	 	        /* ソート機能 デフォルトのソート列指定 */
	 	        order: [ [ 5, "desc" ] ] //[5]受付年月日：降順
	 		    })

	 		    edit_data("#myTable tbody",table);
			    remove_data("#myTable tbody",table);

			    $.datepicker._gotoToday = function(id) {
			    	var target = $(id);
			    	var inst = this._getInst(target[0]);
			    	var date = new Date();
			    	this._setDate(inst,date);
			    	this._hideDatepicker();
			    }

				  /* datePickerによる期間検索のカレンダー追加処理 - Start */
			    $('#min_recep_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",                   // カレンダー呼び出し元の定義
				    onSelect: function () {
				    	table.draw();
				      $('#max_recep_date').datepicker( 'option', 'minDate', $("#min_recep_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#max_recep_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#min_recep_date').datepicker( 'option', 'maxDate', $("#max_recep_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#min_intro_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#max_intro_date').datepicker( 'option', 'minDate', $("#min_intro_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#max_intro_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#min_intro_date').datepicker( 'option', 'maxDate', $("#max_efec_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#min_recruit_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#max_recruit_date').datepicker( 'option', 'minDate', $("#min_recruit_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#max_recruit_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#min_recruit_date').datepicker( 'option', 'maxDate', $("#max_recruit_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    /* datePickerによる期間検索のカレンダー追加処理 - End */


				  /* 受付年月日-期間検索_Start */
		      $('#min_recep_date').keyup( function() { table.draw(); dateRange(); } );
		      $('#max_recep_date').keyup( function() { table.draw(); dateRange(); } );
		      /* 受付年月日-期間検索_End */
		      /* 紹介年月日-期間検索_Start */
		      $('#min_intro_date').keyup( function() { table.draw(); dateRange(); } );
		      $('#max_intro_date').keyup( function() { table.draw(); dateRange(); } );
		      /* 紹介年月日-期間検索_End */
		      /* 採用年月日-期間検索_Start */
		      $('#min_recruit_date').keyup( function() { table.draw(); dateRange(); } );
		      $('#max_recruit_date').keyup( function() { table.draw(); dateRange(); } );
		      /* 採用年月日-期間検索_End */
		      $(document).on('click','.ui-datepicker-current',function(){
		    	  table.draw(); dateRange(); } );
		      function dateRange(){
		    	  $('#max_recep_date').datepicker( 'option', 'minDate', $("#min_recep_date").val());
		    	  $('#min_recep_date').datepicker( 'option', 'maxDate', $("#max_recep_date").val());
		    	  $('#max_intro_date').datepicker( 'option', 'minDate', $("#min_intro_date").val());
		    	  $('#min_intro_date').datepicker( 'option', 'maxDate', $("#max_efec_date").val());
		    	  $('#max_recruit_date').datepicker( 'option', 'minDate', $("#min_recruit_date").val());
		    	  $('#min_recruit_date').datepicker( 'option', 'maxDate', $("#max_recruit_date").val());
		      }
/*
		    	$('#myTable tbody').on('click','.btn',function(){
		  		  var currow = $(this).closest('tr');
		  		  var id = currow.find('td:eq(5)').text();

		  		  //console.log(id);
		  		  alert(id);
		    	});
		    	*/
	      }

	    	/* 編集ボタンの取得と値の入力処理 - Satrt */
		     var edit_data = function(tbody,table){
		       $(tbody).on("click","input.edit",function(){
		    	 var data = table.row( $(this).parents("tr") ).data();
		    	   var kyusyoku_id = data.kyusyokuId;
		    		  $('input[name=""]').attr('name', kyusyoku_id);
		    	 });
			   }
		     /* 編集ボタンの取得と値の入力処理 - End */
		     /* 削除ボタンの取得と値の入力処理 - Satrt */
		     var remove_data = function(tbody,table){
		       $(tbody).on("click","input.remove",function(){
		    	   var data = table.row( $(this).parents("tr") ).data();
		    		 var kyusyoku_id = data.kyusyokuId;
		    		 $('input[name=""]').attr('name', kyusyoku_id);
		    	 });
		     }
		     /* 削除ボタンの取得と値の入力処理 - End */
		  }
		  /* ここまで、管理者権限の処理 */

		  /*  以下、一般ユーザー権限の処理 */
      if (th_length === 18){
        $(document).ready(function(){
 		    load_data();
 	    });

		    /* 受付年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_recep_date').value;
		        var iFfin = document.getElementById('max_recep_date').value;

//		        console.log("受付年月日：iFini = " + iFini);

		        var iDateCol = 5;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

		//        console.log("受付年月日：iFini = " + iFini);
		//        console.log("受付年月日：iFfin = " + iFfin);


		        var datofini=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

		//        console.log("受付年月日：datofini = "datofini);
		//        console.log("受付年月日：datoffin = "datoffin);

		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFfin >= datoffin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && iFfin >= datoffin)
		        {
		            return true;
		        }
		        return false;
		      }
		    );
			  /* 受付年月日-期間検索_End */

			  /* 紹介年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_intro_date').value;
		        var iFfin = document.getElementById('max_intro_date').value;

		        var iDateCol = 6;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

//		        console.log("紹介年月日：iFini = " + iFini);
//		        console.log("紹介年月日：iFfin = " + iFfin);


		        var datofini=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

//		        console.log("紹介年月日：datofini = " + datofini);
//		        console.log("紹介年月日：datoffin = " + datoffin);

		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFfin >= datoffin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && iFfin >= datoffin)
		        {
		            return true;
		        }
		        return false;
		      }
		    );
		    /* 紹介年月日-期間検索_End */

		    /* 採用年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_recruit_date').value;
		        var iFfin = document.getElementById('max_recruit_date').value;

		        var iDateCol = 10;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

//		        console.log("採用年月日：iFini = " + iFini);
//		        console.log("採用年月日：iFfin = " + iFfin);


		        var datofini=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

//		        console.log("採用年月日：datofini = " + datofini);
//		        console.log("採用年月日：datoffin = " + datoffin);

		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFfin >= datoffin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && iFfin >= datoffin)
		        {
		            return true;
		        }
		        return false;
		      }
		    );
		    /* 採用年月日-期間検索_End */


	      /* DataTables生成 */
	    	function load_data(){
	 		    var data = {act : "show"};
	 		    var table = $('#myTable').DataTable({
	 			    scrollX: true,    // 横スクロール設定：有効
	 			    stateSave: true,  // ページネーションの選択ページを再読み込み後も固定表示
	 			    dom:            "Bfrtip",
	 			    buttons:        [ {extend: 'colvis',
	 	                collectionLayout: 'fixed two-column'}],
	 			    ajax : {          // ajax処理
	 				    url : "${pageContext.request.contextPath}/KyusyokuListFetchServlet",
	 				    type : "get",
	 				    data:data,
	 				    dataSrc: "result"
	 			    },
	 			    columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
	 				    {data : "kyusyokuId"},
	 				    {data : "kyusyokuName", "defaultContent": ""},
	 				    {data : "kyusyokuNameFurigana", "defaultContent": ""},
	 				    {data : "seinengappi", "defaultContent": ""},
	 				    {data : "kibousyokusyu", "defaultContent": ""},
	 				    {data : "uketukenengappi", "defaultContent": ""},
	 				    {data : "syoukaiDay", "defaultContent": ""},
	 				    {data : "kyujinId"},
	 				    {data : "kaisyaName", "defaultContent": ""},
 	 				    {data : "kaisyaNameFurigana", "defaultContent": ""},
	 				    {data : "saiyouHusaiyou", "defaultContent": ""},
	 				    {data : "saiyouDay" , "defaultContent": ""},
	 				    {data : "roudoukeiyaku" , "defaultContent": ""},
	 				    {data : "saiyouDay" , "defaultContent": ""},
	 				    {data : "tensyokukansyouEnd" , "defaultContent": ""},
	 				    {data : "risyokujoukyou" , "defaultContent": ""},
	 				    {data : "henreikin" , "defaultContent": ""},
	 				    {data : "kyusyokuJoukyou" , "defaultContent": ""}
	 			    ],
	 			    "columnDefs": [
	 				    { targets: [2,3,9,13,14,15,16], visible: false }, //対象列を非表示
	 				    { targets: [0,12,16], width: 80 },       //求職番号,労働契約,返戻金列の横幅を80pxに指定
	 				    { targets: [1,10], width: 120 },          //求職者名,採用・不採用列の横幅を120pxに指定
	 				    { targets: [3,5,6,11], width: 100 },     //生年月日,受付年月日,紹介年月日,採用年月日列の横幅を100pxに指定
	 				    { targets: [4,7,8,13,14], width: 150 },  //求職希望職種,求人受理整理番号,事業所名称,転職勧奨禁止期間(開始)・(終了)の横幅を150pxに指定
	 				    { targets: [15,17], width: 200 },        //離職状況,備考列の横幅を200pxに指定
	 				  ],
	 			    "language": {  //言語を日本語に変更
	 					  "sProcessing":   "処理中...",
	 					  "sLengthMenu":   "_MENU_ 件表示",
	 					  "sZeroRecords":  "データはありません。",
	 					  "sInfo":         " _TOTAL_ 件中 _START_ から _END_ まで表示",
	 					  "sInfoEmpty":    " 0 件中 0 から 0 まで表示",
	 					  "sInfoFiltered": "（全 _MAX_ 件より抽出）",
	 					  "sInfoPostFix":  "",
	 					  "sSearch":       "検索:",
	 					  "sUrl":          "",
	 					  "oPaginate": {
	 						  "sFirst":    "先頭",
	 						  "sPrevious": "前",
	 						  "sNext":     "次",
	 						  "sLast":     "最終"
	 	     	    },
		 	     	  buttons: {
		 	                colvis: '表示列の選択'
		 	            }
	 	     	  },
	 	     	  /* 以下、機能無効化処理。今回は無効化処理無し。
	 	        /* 件数切替機能 無効 */
	 	        //   lengthChange: false,
	 	        /* 情報表示 無効 */
	 	        //   info: false,
	 	        /* ページング機能 無効 */
	 	        /*   paging: false,
	 	        /* ソート機能 無効 */
	 	        //   ordering: false,

	 	        /* ソート機能 デフォルトのソート列指定 */
	 	        order: [ [ 5, "desc" ] ] //[5]受付年月日：降順
	 		    })

	 		    $.datepicker._gotoToday = function(id) {
			    	var target = $(id);
			    	var inst = this._getInst(target[0]);
			    	var date = new Date();
			    	this._setDate(inst,date);
			    	this._hideDatepicker();
			    }

				  /* datePickerによる期間検索のカレンダー追加処理 - Start */
			    $('#min_recep_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",                   // カレンダー呼び出し元の定義
				    onSelect: function () {
				    	table.draw();
				      $('#max_recep_date').datepicker( 'option', 'minDate', $("#min_recep_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#max_recep_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#min_recep_date').datepicker( 'option', 'maxDate', $("#max_recep_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#min_intro_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#max_intro_date').datepicker( 'option', 'minDate', $("#min_intro_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#max_intro_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#min_intro_date').datepicker( 'option', 'maxDate', $("#max_efec_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#min_recruit_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#max_recruit_date').datepicker( 'option', 'minDate', $("#min_recruit_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    $('#max_recruit_date').datepicker({
				    dateFormat: 'yy-mm-dd',
				    showButtonPanel: true,
				    language:'ja',
				    buttonImage: "calendar.png",        // カレンダーアイコン画像
				    buttonText: "カレンダーから選択", // ツールチップ表示文言
				    buttonImageOnly: true,           // 画像として表示
				    showOn: "button",
				    onSelect: function () {
				    	table.draw();
				    	$('#min_recruit_date').datepicker( 'option', 'maxDate', $("#max_recruit_date").val());
				    }, changeMonth: true, changeYear: true
			    });
			    /* datePickerによる期間検索のカレンダー追加処理 - End */

			    /* 受付年月日-期間検索_Start */
			      $('#min_recep_date').keyup( function() { table.draw(); dateRange(); } );
			      $('#max_recep_date').keyup( function() { table.draw(); dateRange(); } );
			      /* 受付年月日-期間検索_End */
			      /* 紹介年月日-期間検索_Start */
			      $('#min_intro_date').keyup( function() { table.draw(); dateRange(); } );
			      $('#max_intro_date').keyup( function() { table.draw(); dateRange(); } );
			      /* 紹介年月日-期間検索_End */
			      /* 採用年月日-期間検索_Start */
			      $('#min_recruit_date').keyup( function() { table.draw(); dateRange(); } );
			      $('#max_recruit_date').keyup( function() { table.draw(); dateRange(); } );
			      /* 採用年月日-期間検索_End */
			      $(document).on('click','.ui-datepicker-current',function(){ table.draw(); dateRange(); } );
			      function dateRange(){
			    	  $('#max_recep_date').datepicker( 'option', 'minDate', $("#min_recep_date").val());
			    	  $('#min_recep_date').datepicker( 'option', 'maxDate', $("#max_recep_date").val());
			    	  $('#max_intro_date').datepicker( 'option', 'minDate', $("#min_intro_date").val());
			    	  $('#min_intro_date').datepicker( 'option', 'maxDate', $("#max_efec_date").val());
			    	  $('#max_recruit_date').datepicker( 'option', 'minDate', $("#min_recruit_date").val());
			    	  $('#min_recruit_date').datepicker( 'option', 'maxDate', $("#max_recruit_date").val());
			      }
		    }
		  }
		  /* ここまで、一般ユーザー権限の処理 */

		  /* DataTablesによるtbody策処理 - End */


	    /* cookie処理-Start */
	    window.onload = function cookieClear(){
			  var Num = Number(Cookies.get('response_length'));
			  var abc = "abcdefggh";
//			  console.log("a");
//			  console.log(abc);
//			  console.log(Num);
			  for (var j = 0; j < Num; j++){
				  document.cookie = "value" + j  + "= clear; path=/; max-age=0";
				  document.cookie = "text" + j  + "= clear; path=/; max-age=0";
			  }
		  }
	    /* cookie処理-End */



  </script>
</body>
</html>