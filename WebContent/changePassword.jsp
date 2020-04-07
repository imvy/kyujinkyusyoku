<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="user_db" scope="session" class="kyujinkyusyoku.LoginUserBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	  <title>パスワード変更</title>

	  <link rel="stylesheet" type="text/css" href="reboot.css"/>
<%-- 	  <link rel="stylesheet" type="text/css" href="login.css"/>--%>
	  <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<style>
#formContent {
	  -webkit-border-radius: 10px 10px 10px 10px;
	  border-radius: 10px 10px 10px 10px;
	  background: #fff;
	  padding: 30px;
	  width: 100%;
	  max-width: 450px;
	  position: relative;
	  padding: 0px;
	  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
	  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
	  text-align: center;
	}
h1.inactive {
  color: #cccccc;
}

h1.active {
  color: #0d0d0d;
  border-bottom: 2px solid #5fbae9;
}
.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column;
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}
</style>
	  <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
	  <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	  <script>
		  function password_check(){
			  //Check require
			  if(changePassword_form.old_password.value=="" && changePassword_form.new_password.value=="" && changePassword_form.renew_password.value==""){
				  alert("「未入力」の欄があります。");
				  return false;
			  }

			  if (changePassword_form.old_password.value=="" && changePassword_form.new_password.value==""){
				  alert("「未入力」の欄があります。");
				  return false;
			  }

			  if (changePassword_form.old_password.value=="" && changePassword_form.renew_password.value==""){
				  alert("「未入力」の欄があります。");
				  return false;
			  }

			  if (changePassword_form.new_password.value=="" && changePassword_form.renew_password.value==""){
				  alert("「未入力」の欄があります。");
				  return false;
			  }

			  if (changePassword_form.old_password.value==""){
				  alert("「未入力」の欄があります。");
				  return false;
			  }

			  if (changePassword_form.new_password.value==""){
				  alert("「未入力」の欄があります。");
				  return false;
			  }

			  if (changePassword_form.renew_password.value==""){
				  alert("「未入力」の欄があります。");
				  return false;
			  }
			  return;
		  }
	  </script>
  </head>
<body>
	<div class="wrapper ">
		<div id="formContent">
			<div>
				<br>
				<h1 class="text-secondary">パスワード変更</h1>
				<br>
			</div>
			<div>
				<form action="changePasswordServlet" method="post" name="changePassword_form">
					<div>
						<input type="hidden" name = "userId_db"  value="<jsp:getProperty property="userId" name="user_db"/>">
						<input type="hidden" name = "level_db"  value="<jsp:getProperty property="level" name="user_db"/>">
					</div>
					<div style ="display:inline;" class="form-group row">
						<label class="col-sm-5">旧パスワード : </label>
						<input class="col-sm-6" type="password" id="old_password" name="old_password">
					</div>
					<br>
					<div style ="display:inline;">
						<label class="col-sm-5">新パスワード : </label>
						<input class="col-sm-6" type="password" id="new_password" name="new_password">
					</div>
					<br>
					<div style ="display:inline;">
						<label class="col-sm-5">新パスワード 確認 :  </label>
						<input class="col-sm-6" type="password" id="renew_password" name="renew_password">
					</div>
					<br><br>
					<div style ="display:inline;" >
						<input class="btn btn-info" type="submit"  value="変更" name="submit" onclick="return password_check()">
						<input class="btn btn-secondary" type="submit"  value="戻る" name="submit">
					</div>
					<br><br>
			</form>
			</div>
    	</div>
    </div>
  </body>
</html>