package kyujinkyusyoku;

import java.io.Serializable;

public class DisplayUserBean implements Serializable{
	private static final long serialVersionUID = 1L;
	private int level;
	private int ninsuu;

	public DisplayUserBean(){
		level = 0;
		ninsuu = 0;
	}

	public int getLevel() {
		return level;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public int getNinsuu() {
		return ninsuu;
	}

	public void setNinsuu(int ninsuu) {
		this.ninsuu = ninsuu;
	}

}
