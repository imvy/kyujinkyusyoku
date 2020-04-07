<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="kyujinkyusyoku.KyujinBean"%>
<%@ page import="kyujinkyusyoku.LoginUserBean"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>求人一覧画面</title>
<link rel="stylesheet" type="text/css" href="default.css" />
<link rel="stylesheet" type="text/css" href="list.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<link rel="stylesheet"
	href="https://cdn.datatables.net/buttons/1.5.6/css/buttons.dataTables.min.css">
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script type="text/javascript" src="js.cookie.js"></script>
</head>

<body class="mainBody">
	<jsp:include page="header2.jsp"></jsp:include>
	<div class="wrapper1">
		<h1 style="display: inline;">求人一覧</h1>
		<form style="padding: 1rem 1rem; clear: both;">
			<%
				if (1 == ((int) session.getAttribute("level_db"))) {
			%>
			<a href="kaisyaNew.jsp" class="btn btn-primary btn-sm" role="button">事業所を追加する</a>
			<%--	<input class = "button" type="button" onclick="location.href='kyujinInsert.jsp'" value="追加"> --%>
			<input type="button" class="btn btn-primary btn-sm"
				onclick="location.href='kyujinInsert.jsp'" value="求人情報を追加する">
			<input type="button" class="btn btn-primary btn-sm"
				onClick="window.open('kyujinPrint.jsp','_blank')" value="印刷">
			<%
				}
			%>
		</form>

		<p class="range_search">
			<span><span class="search_width">受付年月日 </span>: <input
				type="text" id="min_recep_date" name="min_recep_date"
				onChange="dateCheck('min_recep_date');"></span> <span
				class="between_width">~</span><span> <input type="text"
				id="max_recep_date" name="max_recep_date"
				onChange="dateCheck('max_recep_date');"></span>
		</p>
		<p class="range_search">
			<span><span class="search_width">有効期間 </span>: <input
				type="text" id="min_efec_period" name="min_efec_period"
				onChange="dateCheck('min_efec_period');"></span> <span
				class="between_width">~</span><span> <input type="text"
				id="max_efec_period" name="max_efec_period"
				onChange="dateCheck('max_efec_period');"></span>
		</p>

		<form action="KyujinServlet" method="post">
			<div class="table-responsive">
				<table id="myTable"
					class="table table-dark table-hover table-sm table-bordered table-striped">
					<thead class="thead-light">
						<tr>
							<th>求人受理整理番号</th>
							<th>求人事業所名称</th>
							<th>求人事業所名称(ふりがな)</th>
							<th>部署</th>
							<th>連絡先担当者</th>
							<th>連絡先担当者(ふりがな)</th>
							<th>連絡先電話番号</th>
							<th>受付年月日</th>
							<th>有効期間(開始日)</th>
							<th>有効期間(終了日)</th>
							<th>職種</th>
							<%
								if (1 == ((int) session.getAttribute("level_db"))) {
							%><th
								class="th_upd_rmv">編集</th>
							<th class="th_upd_rmv">削除</th>
							<%
								}
							%>
						</tr>
					</thead>
				</table>
			</div>
		</form>
	</div>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/buttons/1.5.6/js/dataTables.buttons.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/buttons/1.5.6/js/buttons.colVis.min.js"></script>
	<script type="text/javascript"
		src="https://ajax.googleapis.com/ajax/libs/jqueryui/1/i18n/jquery.ui.datepicker-ja.min.js"></script>
	<script>
		  /* DataTablesによるtbody策処理 - Start */
	    var th_length = $("table th").length;  //thの数を取得 thの数が13の場合、管理者権限。11の場合、一般権限。

	    /*  以下、管理者権限の処理 */
	    if (th_length === 13){
	      $(document).ready(function(){
			    load_data();
		    });	

		    /* 受付年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_recep_date').value;
		        var iFfin = document.getElementById('max_recep_date').value;

		        var iDateCol = 7;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

		        var datofini=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

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

			  /* 有効期間-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_efec_period').value;
		        var iFfin = document.getElementById('max_efec_period').value;

		        var iStartDateCol = 8;
		        var iEndDateCol = 9;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

		        var datofini=aData[iStartDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iEndDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFini <= datoffin && iFfin === "")
		        {
		            return true;
		        }
		        else if ( datoffin <= iFfin && iFini === "")
		        {
		            return true;
		        }
		        else if ( datofini <= iFfin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && datofini <= iFfin)
		        {
		            return true;
		        }
		        else if (iFini <= datoffin && datoffin <= iFfin)
		        {
		            return true;
		        }
		        return false;
		      }
		    );
		    /* 有効期間-期間検索_End */

		    /* DataTables生成// tao bang */
		   		function load_data(){
				    var data = {act : "show"};
				    var table = $('#myTable').DataTable({
				    	scrollX: true,    // 横スクロール設定：有効
					    stateSave: true,  // ページネーションの選択ページを再読み込み後も固定表示 chinh sua loi va tra lai Trang
					    dom:            "Bfrtip",
		 			    buttons:        [ {extend: 'colvis',
		 	                collectionLayout: 'fixed two-column'}],
					    ajax : {  // ajax処理 su li ajax -->khong do bo java scrip
						    url : "${pageContext.request.contextPath}/KyujinListFetchServlet",
						    type : "get",
						    data:data,
						    dataSrc: "result"
					    },
					    columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
						    {data : "kyujinId"},
						    {data : "kaisyaName", "defaultContent": ""},
						    {data : "kaisyaNameFurigana", "defaultContent": ""},
						    {data : "deptName", "defaultContent": ""},
						    {data : "tantousya", "defaultContent": ""},
						    {data : "tantousyaFurigana", "defaultContent": ""},
						    {data : "renrakusaki", "defaultContent": ""},
						    {data : "uketukenengappi", "defaultContent": ""},
						    {data : "yuukoukikanStart", "defaultContent": ""},
						    {data : "yuukoukikanEnd", "defaultContent": ""},
						    {data : "syokusyu" , "defaultContent": ""},
						    {defaultContent : "<input type='submit' name='' value='編集' class='edit   btn btn-outline-info'   style='font-size:large;'>"},//本defaultContentは編集ボタン作成
						    {defaultContent : "<input type='submit' name='' value='削除' class='remove btn btn-outline-danger' style='font-size:large;'>"} //本defaultContentは削除ボタン作成
					    ],
					    "columnDefs": [ {
						    "targets": [6,10,11,12],  //編集・削除カラム//sua xoa cot
						    "orderable": false   // ソートボタン無効化//vo hieu hoa nut sap xep Sort
						    },
						    { targets: [2,3,5], visible: false },  //対象列を非表示//aan cac cot muc tieu
		 				    { targets: [11,12], width: 80 },       //編集・削除列の横幅を80pxに指定
		 				    { targets: [1,2,5,6,10], width: 120 }, //求人事業所名称・求人事業所名称(ふりがな)・担当者名(ふりがな)・連絡先・職種列の横幅を120pxに指定
		 				    { targets: [0,8,9], width: 130 },      //求人受理整理番号・有効期間(開始・終了)列の横幅を130pxに指定
		 				    { targets: [3,4,7], width: 100 },      //部署名・担当者名・受付年月日列の横幅を100pxに指定
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
			          order: [ [ 7, "desc" ] ] //[7]受付年月日：降順
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
					    },
					    changeMonth: true, changeYear: true
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
					    },
					    changeMonth: true, changeYear: true
				    });
				    $('#min_efec_period').datepicker({
					    dateFormat: 'yy-mm-dd',
					    showButtonPanel: true,
					    language:'ja',
					    buttonImage: "calendar.png",        // カレンダーアイコン画像
					    buttonText: "カレンダーから選択", // ツールチップ表示文言
					    buttonImageOnly: true,           // 画像として表示
					    showOn: "button",
					    onSelect: function () {
					    	table.draw();
					    	$('#max_efec_period').datepicker( 'option', 'minDate', $("#min_efec_period").val());
					    },
					    changeMonth: true, changeYear: true
					    });
				    $('#max_efec_period').datepicker({
					    dateFormat: 'yy-mm-dd',
					    showButtonPanel: true,
					    language:'ja',
					    buttonImage: "calendar.png",        // カレンダーアイコン画像
					    buttonText: "カレンダーから選択", // ツールチップ表示文言
					    buttonImageOnly: true,           // 画像として表示
					    showOn: "button",
					    onSelect: function () {
					    	table.draw();
					    	$('#min_efec_period').datepicker( 'option', 'maxDate', $("#max_efec_period").val());
					    },
					    changeMonth: true, changeYear: true
					    });
				    /* datePickerによる期間検索のカレンダー追加処理 - End */

					  /* 受付年月日-期間検索_Start */
			      $('#min_recep_date').keyup( function() { table.draw(); dateRange(); } );
			      $('#max_recep_date').keyup( function() { table.draw(); dateRange(); } );
			      /* 受付年月日-期間検索_End */
			      /* 有効期間-期間検索_Start */
			      $('#min_efec_period').keyup( function() { table.draw(); dateRange(); } );
			      $('#max_efec_period').keyup( function() { table.draw(); dateRange(); } );
			      /* 有効期間-期間検索_End */
			      $(document).on('click','.ui-datepicker-current',function(){ table.draw(); dateRange(); } );
			      function dateRange(){
			    	  $('#max_recep_date').datepicker( 'option', 'minDate', $("#min_recep_date").val());
			    	  $('#min_recep_date').datepicker( 'option', 'maxDate', $("#max_recep_date").val());
			    	  $('#max_efec_period').datepicker( 'option', 'minDate', $("#min_efec_period").val());
			    	  $('#min_efec_period').datepicker( 'option', 'maxDate', $("#max_efec_period").val());
			      }

			   }
		     /* 編集ボタンの取得と値の入力処理 - Satrt */
		     var edit_data = function(tbody,table){
		       $(tbody).on("click","input.edit",function(){
		    	 var data = table.row( $(this).parents("tr") ).data();
		    	   var kyujin_id = data.kyujinId;
		    		  $('input[name=""]').attr('name', kyujin_id);
		    	 });
			   }
		     /* 編集ボタンの取得と値の入力処理 - End */
		     /* 削除ボタンの取得と値の入力処理 - Satrt */
		     var remove_data = function(tbody,table){
		       $(tbody).on("click","input.remove",function(){
		    	   var data = table.row( $(this).parents("tr") ).data();
		    		 var kyujin_id = data.kyujinId;
		    		 $('input[name=""]').attr('name', kyujin_id);
		    	 });
		     }
		     /* 削除ボタンの取得と値の入力処理 - End */
		  }
		  /* ここまで、管理者権限の処理 */

	    /* 以下、一般ユーザー権限の処理 */
	    if (th_length === 11){
		    $(document).ready(function(){
				  load_data();
			  });

		    /* 受付年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_recep_date').value;
		        var iFfin = document.getElementById('max_recep_date').value;

		        var iDateCol = 7;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

		        var datofini=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

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

			  /* 有効期間-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_efec_period').value;
		        var iFfin = document.getElementById('max_efec_period').value;

		        var iStartDateCol = 8;
		        var iEndDateCol = 9;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

		        var datofini=aData[iStartDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iEndDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

		        if ( iFini === "" && iFfin === "" )
		        {
		            return true;
		        }
		        else if ( iFini <= datofini && iFfin === "")
		        {
		            return true;
		        }
		        else if ( iFini <= datoffin && iFfin === "")
		        {
		            return true;
		        }
		        else if ( datoffin <= iFfin && iFini === "")
		        {
		            return true;
		        }
		        else if ( datofini <= iFfin && iFini === "")
		        {
		            return true;
		        }
		        else if (iFini <= datofini && datofini <= iFfin)
		        {
		            return true;
		        }
		        else if (iFini <= datoffin && datoffin <= iFfin)
		        {
		            return true;
		        }
		        return false;
		      }
		    );
		    /* 有効期間-期間検索_End */

		    /* DataTables生成 */
		   	function load_data(){
				  var data = {act : "show"};
				  var table = $('#myTable').DataTable({
					  scrollX: true,    // 横スクロール設定：有効
					  stateSave: true,  // ページネーションの選択ページを再読み込み後も固定表示
					  dom:            "Bfrtip",
		 			  buttons:        [ {extend: 'colvis',
		 	                collectionLayout: 'fixed two-column'}],
					  ajax : {  // ajax処理
						  url : "${pageContext.request.contextPath}/KyujinListFetchServlet",
						  type : "get",
						  data:data,
						  dataSrc: "result"
					  },
					  columns :[ //生成されるカラムの指定(data:"カラム名")。"defaultContent":""はフィールドの値がnull若しくはundefined時のエラー表示回避処理。
						  {data : "kyujinId"},
						  {data : "kaisyaName", "defaultContent": ""},
						  {data : "kaisyaNameFurigana", "defaultContent": ""},
						  {data : "deptName", "defaultContent": ""},
						  {data : "tantousya", "defaultContent": ""},
						  {data : "tantousyaFurigana", "defaultContent": ""},
						  {data : "renrakusaki", "defaultContent": ""},
						  {data : "uketukenengappi", "defaultContent": ""},
						  {data : "yuukoukikanStart", "defaultContent": ""},
						  {data : "yuukoukikanEnd", "defaultContent": ""},
						  {data : "syokusyu" , "defaultContent": ""}
					  ],
					  "columnDefs": [
						  { targets: [2,5], visible: false },
		 				    { targets: [1,2,5,6,10], width: 120 }, //求人事業所名称・求人事業所名称(ふりがな)・担当者名(ふりがな)・連絡先・職種列の横幅を120pxに指定
		 				    { targets: [0,8,9], width: 130 },      //求人受理整理番号・有効期間(開始・終了)列の横幅を130pxに指定
		 				    { targets: [3,4,7], width: 100 },      //部署名・担当者名・受付年月日列の横幅を100pxに指定
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
			            order: [ [ 7, "desc" ] ] //[7]受付年月日：降順
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
					    },
					    changeMonth: true, changeYear: true
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
					    },
					    changeMonth: true, changeYear: true
				    });
				    $('#min_efec_period').datepicker({
					    dateFormat: 'yy-mm-dd',
					    showButtonPanel: true,
					    language:'ja',
					    buttonImage: "calendar.png",        // カレンダーアイコン画像
					    buttonText: "カレンダーから選択", // ツールチップ表示文言
					    buttonImageOnly: true,           // 画像として表示
					    showOn: "button",
					    onSelect: function () {
					    	table.draw();
					    	$('#max_efec_period').datepicker( 'option', 'minDate', $("#min_efec_period").val());
					    },
					    changeMonth: true, changeYear: true
					    });
				    $('#max_efec_period').datepicker({
					    dateFormat: 'yy-mm-dd',
					    showButtonPanel: true,
					    language:'ja',
					    buttonImage: "calendar.png",        // カレンダーアイコン画像
					    buttonText: "カレンダーから選択", // ツールチップ表示文言
					    buttonImageOnly: true,           // 画像として表示
					    showOn: "button",
					    onSelect: function () {
					    	table.draw();
					    	$('#min_efec_period').datepicker( 'option', 'maxDate', $("#max_efec_period").val());
					    },
					    changeMonth: true, changeYear: true
					    });
				    /* datePickerによる期間検索のカレンダー追加処理 - End */

					  /* 受付年月日-期間検索_Start */
			      $('#min_recep_date').keyup( function() { table.draw(); } );
			      $('#max_recep_date').keyup( function() { table.draw(); } );
			      /* 受付年月日-期間検索_End */
			      /* 有効期間-期間検索_Start */
			      $('#min_efec_period').keyup( function() { table.draw(); } );
			      $('#max_efec_period').keyup( function() { table.draw(); } );
			      /* 有効期間-期間検索_End */
			  }
		  }
	    /* ここまで、一般ユーザー権限の処理 */
		  /* DataTablesによるtbody策処理 - End */


	    /* cookie処理-Start */
	    window.onload = function cookieClear(){
			  var Num = Number(Cookies.get('response_length'));
			  var abc = "abcdefggh";
			  for (var j = 0; j < Num; j++){
				  document.cookie = "value" + j  + "= clear; path=/; max-age=0";
				  document.cookie = "text" + j  + "= clear; path=/; max-age=0";
			  }
		  }
	    /* cookie処理-End */
	    function dateCheck(id){
	    	var inputDate = document.getElementById(id).value.split('-');
	    	var dt = new Date(inputDate[0],inputDate[1]-1,inputDate[2]);
	    	if ((!(dt.getFullYear() == inputDate[0] && dt.getMonth() == inputDate[1]-1 && dt.getDate() == inputDate[2])) && inputDate != ""){
	    		alert('無効な日付です');
	    	}
	    }
	  </script>
</body>
</html>