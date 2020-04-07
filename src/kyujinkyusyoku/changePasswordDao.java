package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class changePasswordDao {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private LoginUserBean bean = null;
//*********************************************************************************************************************
//													パスワード取得
//*********************************************************************************************************************
	public LoginUserBean getPassword(String userId) throws SQLException{

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(" SELECT pass FROM user_info WHERE  user_info.id = ? ");

			ps.setString(1, userId);

			rs = ps.executeQuery();

			while(rs.next()) {
				bean = new LoginUserBean();
				bean.setPassword(rs.getString("pass"));
			}
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			//クローズ
			close();
		}
		return bean;
	}
//*********************************************************************************************************************
//													パスワード変更
//*********************************************************************************************************************
	public void updatePassword(String userId, String old_password, String new_password) throws SQLException{

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(" UPDATE user_info "
									+ " SET    pass = ? "
									+ " WHERE  user_info.id = ? AND user_info.pass = ? ");

			ps.setString(1, new_password);
			ps.setString(2, userId);
			ps.setString(3, old_password);

			ps.executeUpdate();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("[Error] ClassNotFoundException");
		}
		catch (SQLException e) {
			e.printStackTrace();
			System.err.println("[Error] SQLException");
		}
		finally {
			//クローズ
			close();
		}
	}

//*********************************************************************************************************************
//													CLOSE
//*********************************************************************************************************************
	public void close() {
		try {
			if(con !=null)
				con.close();
			if(ps !=null)
				ps.close();
			if(rs !=null)
				rs.close();
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
	}
}