package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class LoginDao {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private LoginUserBean bean = null;

	public LoginUserBean selectUser(String userId, String password) {

		try {

			//classのfornameを利用しjdbcドライバをロードする
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku","inofex","inofex");

			ps = con.prepareStatement("select name,user_level from user_info where id = ? and pass = ?");

			ps.setString(1, userId);
			ps.setString(2, password);

			rs = ps.executeQuery();
			while(rs.next()) {
				bean = new LoginUserBean();
				bean.setUserId(userId);
				bean.setPassword(password); //Vy add
				bean.setName(rs.getString("name"));
				bean.setLevel(rs.getInt("user_level"));
			}

		}catch (ClassNotFoundException e){
				e.printStackTrace();
		} catch (SQLException e) {
				e.printStackTrace();
		}finally {

				close();
		}

		return bean;
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
