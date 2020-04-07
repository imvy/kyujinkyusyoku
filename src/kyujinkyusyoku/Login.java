package kyujinkyusyoku;

public class Login {

	public LoginUserBean loginCheck(String userId, String password) {

		LoginUserBean bean = null;

		if(userId.length() > 20 || password.length() > 20)
			return bean;

		LoginDao dao = new LoginDao();

		bean = dao.selectUser(userId, password);

		return bean;
	}
}
