<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="passwordInfo" scope="session" class="kyujinkyusyoku.changePasswordBean"></jsp:useBean>
<jsp:useBean id="user_db" scope="session" class="kyujinkyusyoku.LoginUserBean"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
	  <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	  <title>パスワード変更確認</title>

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
  </head>
<body>
	<div class="wrapper ">
		<div id="formContent">
			<div>
				<br>
				<h1 class="text-secondary">変更確認</h1>
				<br>
			</div>
			<div>
				<form action="changePasswordServlet" method="post">
						<input type="hidden" name = "level_db"  value="<jsp:getProperty property="level" name="user_db"/>">
						<input type="hidden" name = "userId_db"  value="<jsp:getProperty property="userId" name="passwordInfo"/>">
						<input type="hidden" name="old_password" value="<jsp:getProperty property="oldPass" name="passwordInfo"/>">
						<input type="hidden" name="new_password" value="<jsp:getProperty property="newPass" name="passwordInfo"/>">
						<input type="hidden" name="renew_password" value="<jsp:getProperty property="renewPass" name="passwordInfo"/>">
					<div>
						<h4 class="text-secondary">本当に変更しますか。</h4>
					</div>
					<br><br>
					<div style ="display:inline;">
						<input class="btn btn-info" type="submit" name="submit" value="変更する">
						<button type="button" class="btn btn-secondary" onclick="history.back()">閉じる</button>
					</div>
					<br><br><br>
				</form>
			</div>
    	</div>
    </div>
  </body>
</html>