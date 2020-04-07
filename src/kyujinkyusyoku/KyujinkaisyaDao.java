package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class KyujinkaisyaDao {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private KyujinkaisyaBean bean = null;

//*********************************************************************************************************************
//													求人者取得
//*********************************************************************************************************************
	public KyujinkaisyaBean selectKyujinkaisya (String user_id) {

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成

			ps = con.prepareStatement(
					"select * from kyujinkaisya where user_id = ?"
					);
			ps.setString(1, user_id);

			rs = ps.executeQuery();

			while(rs.next()) {
				bean = new KyujinkaisyaBean();
				bean.setKyujinkaisyaId(rs.getInt("kyujinkaisya_id"));
				bean.setUserId(user_id);
				bean.setKaisyaName(rs.getString("kaisya_name"));
				bean.setKaisyaNameFurigana(rs.getString("kaisya_name_furigana"));
				bean.setZyusyo(rs.getString("zyusyo"));
				bean.setRenrakusaki1(rs.getString("renrakusaki1"));
				bean.setRenrakusaki2(rs.getString("renrakusaki2"));

			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("[Error] ClassNotFoundException");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("[Error] SQLException");
		}finally {
			//クローズ
			close();
		}
		return bean;
	}
//*********************************************************************************************************************
//														求人者情報変更
//*********************************************************************************************************************
	public void updateKyujinkaisya(int kyujinkaisyaId, String zyusyo, String renrakusaki1, String renrakusaki2) throws SQLException{

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("UPDATE kyujinkaisya "
					+ "SET    zyusyo = ?, renrakusaki1 = ?, renrakusaki2 = ? "
					+ "WHERE  kyujinkaisya.kyujinkaisya_id = ? ");

			ps.setString(1, zyusyo);
			ps.setString(2, renrakusaki1);
			ps.setString(3, renrakusaki2);
			ps.setInt(4, kyujinkaisyaId);

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
//																CLOSE
//*********************************************************************************************************************
	public void close() {
		try {
			if(con != null) {
			con.close();
			}
			if (ps !=null) {
			ps.close();
			}
			if(rs !=null) {
			rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}


}
