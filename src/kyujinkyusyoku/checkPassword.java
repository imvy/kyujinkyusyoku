package kyujinkyusyoku;

public class checkPassword {

	public Boolean checkPass(String new_password) {

		if(new_password.length() > 20)
			return false;

		return true;

	}
}
