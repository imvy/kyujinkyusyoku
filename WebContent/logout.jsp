<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
	  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	  <title>ログイン画面</title>
	  <link rel="stylesheet" type="text/css" href="reboot.css"/>
	  <link rel="stylesheet" type="text/css" href="logout.css"/>
	  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script>
		  function login_check(){
			  if(login_form.userId.value=="" && login_form.pass.value==""){
				  alert("ログインIDとパスワードを入力してください");
				  return false;
			  }

			  if (login_form.userId.value==""){
				  alert("ログインIDを入力してください");
				  return false;
			  }

			  if (login_form.pass.value==""){
				  alert("パスワードを入力してください");
				  return false;
			  }

			  return;
		  }
	  </script>
  </head>
  <body>
    <div class="wrapper">
      <div id="formContent">
        <div class="fadeIn first">
          <br>
          <h4 class="text-secondary">求人求職管理システム</h4>
          <p class="text-secondary">Login</p>
        </div>
        <form action="LoginServlet" method="post" name="login_form">
          <input type="text" id="login" class="fadeIn second" name="userId" placeholder="login id">
          <input type="password" id="password" class="fadeIn third" name="pass" placeholder="password">
          <input type="submit" class="fadeIn fourth" value="Enter" name="submit1" onclick="return login_check()">
        </form>
        <div id="formFooter">
          <small class="text-secondary">イノフェックス株式会社</small>
        </div>
      </div>
    </div>
  </body>
</html>