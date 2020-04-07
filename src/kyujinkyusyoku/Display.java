package kyujinkyusyoku;

import java.util.ArrayList;

public class Display {

	public ArrayList<DisplayUserBean> selectlevel(){
		DisplayDao displayDao = new DisplayDao();
		ArrayList<DisplayUserBean> displayBeanList = new ArrayList<>();
		displayBeanList = displayDao.selectlevel();
		return displayBeanList;
	}
}
