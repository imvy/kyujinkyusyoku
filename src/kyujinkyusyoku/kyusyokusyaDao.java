package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class kyusyokusyaDao {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	private kyusyokusyaBean bean = null;
//*********************************************************************************************************************
//													求職者取得
//*********************************************************************************************************************
	public kyusyokusyaBean selectKyusyokusya(String id) {

		try {

			//classのfornameを利用しjdbcドライバをロードする
			Class.forName("com.mysql.jdbc.Driver");

			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku","inofex","inofex");

			ps = con.prepareStatement(" select kyusyokusya_id, "
									+ " kyusyoku_name as kyusyokusya_name,"
									+ " kyusyoku_name_furigana as kyusyokusya_name_furigana,"
									+ " kyusyoku_zyusyo as kyusyokusya_zyusyo,"
									+ " kyusyoku_seinengappi as kyusyokusya_seinengappi,"
									+ " renrakusaki_kyusyokusya,"
									+ " kyusyokusya_view,"
									+ " id"
									+ " from kyusyokusya"
									+ " where id = ? "
									);

			ps.setString(1, id);

			rs = ps.executeQuery();
			while(rs.next()) {
				bean = new kyusyokusyaBean();
				bean.setKyusyokusyaId(rs.getInt("kyusyokusya_id"));
				bean.setKyusyokusyaName(rs.getString("kyusyokusya_name"));
				bean.setKyusyokusyaNameFurigana(rs.getString("kyusyokusya_name_furigana"));
				bean.setKyusyokusyaZyusyo(rs.getString("kyusyokusya_zyusyo"));
				bean.setKyusyokusyaSeinengappi(rs.getString("kyusyokusya_seinengappi"));
				bean.setRenrakusakiKyusyokusya(rs.getString("renrakusaki_kyusyokusya"));
				bean.setId(rs.getString("id"));
				bean.setKyusyokusyaView(rs.getInt("kyusyokusya_view"));
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

//*********************************************************************************************************************
//														求職者情報変更
//*********************************************************************************************************************
	public void updateKyusyokusya(int kyusyokusyaId, String zyusyo, String renrakusaki) throws SQLException{

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://192.168.100.21:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("UPDATE kyusyokusya "
									+ "SET    kyusyoku_zyusyo = ?, renrakusaki_kyusyokusya = ?"
									+ "WHERE  kyusyokusya.kyusyokusya_id = ? ");

			ps.setString(1, zyusyo);
			ps.setString(2, renrakusaki);
			ps.setInt(3, kyusyokusyaId);

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
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
