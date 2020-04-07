package kyujinkyusyoku;

import java.io.Serializable;
public class LoginUserBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private String userId;
	private String password;
	private String name;
	private int level;

	public LoginUserBean(){
		userId = "";
		password ="";
		name = "";
		level = 0;

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}


}
