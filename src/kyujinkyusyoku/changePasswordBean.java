package kyujinkyusyoku;

import java.io.Serializable;

public class changePasswordBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private String userId;
	private String oldPass;
	private String newPass;
	private String renewPass;

	public changePasswordBean(){
		userId = "";
		oldPass = "";
		newPass = "";
		renewPass = "";
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getOldPass() {
		return oldPass;
	}

	public void setOldPass(String oldPass) {
		this.oldPass = oldPass;
	}

	public String getNewPass() {
		return newPass;
	}

	public void setNewPass(String newPass) {
		this.newPass = newPass;
	}

	public String getRenewPass() {
		return renewPass;
	}

	public void setRenewPass(String renewPass) {
		this.renewPass = renewPass;
	}

}
