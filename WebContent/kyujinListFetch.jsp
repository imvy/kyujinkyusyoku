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
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.js"
	integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
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
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.19/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.min.css">
<script type="text/javascript" src="js.cookie.js"></script>
</head>
<body class="mainBody">
	<div class="wrapper1">
		<h1 style="display: inline;">求人一覧</h1>

		<p style="margin: 1rem 0;">
			<span>受付年月日&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp; <input type="text"
				id="min_recep_date" name="min_recep_date"></span>&nbsp;&nbsp;~&nbsp;&nbsp;<span>
				<input type="text" id="max_recep_date" name="max_recep_date">
			</span>
		</p>
		<p style="margin: 1rem 0;">
			<span>有効期間&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:&nbsp;&nbsp;
				<input type="text" id="min_efec_period" name="min_efec_period">
			</span>&nbsp;&nbsp;~&nbsp;&nbsp;<span> <input type="text"
				id="max_efec_period" name="max_efec_period"></span>
		</p>


		<div class="table-responsive">
			<table id="myTable"
				class="table table-dark table-hover table-sm tablesorter">
				<thead class="thead-lignt">
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
						<th></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/1.10.19/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script>
		  /* DataTablesによるtbody策処理 - Start */

	      $(document).ready(function(){
			    load_data();
		    });

		    /* 受付年月日-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_recep_date').value;
		        var iFfin = document.getElementById('max_recep_date').value;

		        console.log("受付年月日：iFini = " + iFini);

		        var iDateCol = 7;

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

			  /* 有効期間-期間検索_Start */
		    $.fn.dataTableExt.afnFiltering.push(
		      function( oSettings, aData, iDataIndex ) {
		        var iFini = document.getElementById('min_efec_period').value;
		        var iFfin = document.getElementById('max_efec_period').value;

		        var iStartDateCol = 8;
		        var iEndDateCol = 9;

		        iFini=iFini.substring(0,10);// + iFini.substring(5,7) + iFini.substring(8,10);
		        iFfin=iFfin.substring(0,10);// + iFfin.substring(5,7) + iFfin.substring(8,10);

		        console.log("有効期間：iFini = " + iFini);
		        console.log("有効期間：iFfin = " + iFfin);


		        var datofini=aData[iStartDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);
		        var datoffin=aData[iEndDateCol].substring(0,10);// + aData[iDateCol].substring(5,7) + aData[iDateCol].substring(8,10);

		        console.log("有効期間：datofini = " + datofini);
		        console.log("有効期間：datoffin = " + datoffin);

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
						    {data : "syokusyu" , "defaultContent": ""},
						    {defaultContent : "<input type='submit' name='' value='選択' class='button btn btn-outline-success'  onclick='window.close();' style='font-size:large;'>"}//本defaultContentは編集ボタン作成
					    ],
					    "columnDefs": [ {
						    "targets": [11],  //選択カラム
						    "orderable": false   // ソートボタン無効化
						    },
						    { targets: [2,5], visible: false }],//フリガナ欄非表示
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
			     	      }
			     	    },
			     	   /* 以下、機能無効化処理。今回は無効化処理無し。
			         /* 件数切替機能 無効 */
			         //   lengthChange: false,
			         /* 情報表示 無効 */
			         //   info: false,
			         /* ページング機能 無効 */
			            paging: false,
			         /* ソート機能 無効 */
			         //   ordering: false,

			         /* ソート機能 デフォルトのソート列指定 */
			          order: [ [ 7, "desc" ] ] //[7]受付年月日：降順
				    })
				    	  $('#myTable tbody').on('click','.button',function(){
		              var currow = $(this).closest('tr');
		              var id = currow.find('td:eq(0)').text();
		              var name = currow.find('td:eq(1)').text()

	                /*  確認用(コンソールの代替) */
//		              var result = id + '\n' + name;
//		              alert(result);

   		   		      window.opener.$("#job_offer_id").val(id);
		   	   	      window.opener.$("#job_offer_name").val(name);
				    	  });

					  /* datePickerによる期間検索のカレンダー追加処理 - Start */
				    $('#min_recep_date').datepicker({
					    dateFormat: 'yy-mm-dd',
					    language:'ja',
					    buttonImage: "calendar.png",        // カレンダーアイコン画像
					    buttonText: "カレンダーから選択", // ツールチップ表示文言
					    buttonImageOnly: true,           // 画像として表示
					    showOn: "button",                   // カレンダー呼び出し元の定義
					    onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true
				    });
				    $('#max_recep_date').datepicker({
					    dateFormat: 'yy-mm-dd',
					    language:'ja',
					    buttonImage: "calendar.png",        // カレンダーアイコン画像
					    buttonText: "カレンダーから選択", // ツールチップ表示文言
					    buttonImageOnly: true,           // 画像として表示
					    showOn: "button",
					    onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true
				    });
				    $('#min_efec_period').datepicker({
					    dateFormat: 'yy-mm-dd',
					    language:'ja',
					    buttonImage: "calendar.png",        // カレンダーアイコン画像
					    buttonText: "カレンダーから選択", // ツールチップ表示文言
					    buttonImageOnly: true,           // 画像として表示
					    showOn: "button",
					    onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true
				    });
				    $('#max_efec_period').datepicker({
					    dateFormat: 'yy-mm-dd',
					    language:'ja',
					    buttonImage: "calendar.png",        // カレンダーアイコン画像
					    buttonText: "カレンダーから選択", // ツールチップ表示文言
					    buttonImageOnly: true,           // 画像として表示
					    showOn: "button",
					    onSelect: function () { table.draw(); }, changeMonth: true, changeYear: true
				    });
				    /* datePickerによる期間検索のカレンダー追加処理 - End */

					  /* 受付年月日-期間検索_Start */
			      $('#min_recep_date').keyup( function() { table.draw(); } );
			      $('#max_recep_date').keyup( function() { table.draw(); } );
			      /* 受付年月日-期間検索_End */
			      /* 有効期間(開始日)-期間検索_Start */
			      $('#min_efec_period').keyup( function() { table.draw(); } );
			      $('#max_efec_period').keyup( function() { table.draw(); } );
			      /* 有効期間(開始日)-期間検索_End */
				  }
	  </script>
</body>
</html>