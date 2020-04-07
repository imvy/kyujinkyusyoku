package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DisplayDao {
	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

	public ArrayList<DisplayUserBean> selectlevel() {

		ArrayList<DisplayUserBean> displayBeanList = new ArrayList<>();

		try {

			//classのfornameを利用しjdbcドライバをロードする
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku","inofex","inofex");

			ps = con.prepareStatement("select user_level as level, count(user_level) as ninsuu from user_info group by user_level order by user_level");

			rs = ps.executeQuery();

			while(rs.next()) {
				DisplayUserBean bean = new DisplayUserBean();
				bean.setLevel(rs.getInt("level"));
				bean.setNinsuu(rs.getInt("ninsuu"));

				displayBeanList.add(bean);
			}

		}catch (ClassNotFoundException e){
				e.printStackTrace();
		} catch (SQLException e) {
				e.printStackTrace();
		}finally {

				close();
		}

		return displayBeanList;
	}

	public void close() {
		try {
			if(con !=null)
			con.close();
			if(ps !=null)
			ps.close();
			if(rs !=null)
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
