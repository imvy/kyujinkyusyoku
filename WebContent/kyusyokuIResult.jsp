<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	  <meta charset="UTF-8">
	  <title>求職情報追加完了画面</title>
	  <%--<link rel="stylesheet" type="text/css" href="default.css"/>--%>
	  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <style>
			html {
			    height: 100%;
			    font-size: 1.5rem;
			}

			body {
			    height: 100%;
			    margin: 0;
			    background-color: #f0f0fa!important;
			}
			h1 {
			    width:100%;
			    margin: 0 auto;
			    text-align: center;
			    padding: 8rem 0 2rem 0;
			}
			p {
			    width:100%;
			    margin: 0 auto;
			    text-align: center;

			}
			.close_window {
			    margin: 3rem auto;
			    text-align: center;

			}
			input {
			    width:15rem;
			}
	  </style>
	</head>
  <body class="mainBody">
 	  <h1>新規求職者の追加登録完了</h1>
	  <p>閉じるボタンをクリックしてください。</p>
	  <div class="close_window"><input type="button" class="btn btn-secondary" value="閉じる" onclick="window.opener.location.reload(),window.close()"></div>
  </body>
</html>