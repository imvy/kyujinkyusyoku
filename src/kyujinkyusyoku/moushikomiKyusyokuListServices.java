package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class moushikomiKyusyokuListServices {
	  private static Connection con;
	  private static java.sql.PreparedStatement ps = null;
	  private static ResultSet rs = null;

//*********************************************************************************************************************
//
//*********************************************************************************************************************
	  public static kyusyokusyaBean selectKyusyokusyaId (String id) {

		  kyusyokusyaBean bean = null;
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
//
//*********************************************************************************************************************

	  public static ArrayList<KyusyokuListFetchModel> selectAll(int kyusyokusyaId){
		  @SuppressWarnings("unused")
		KyusyokuListFetchModel items;
		  ArrayList<KyusyokuListFetchModel>list = new ArrayList<>();
			try {
	 			//JCBDドライバーのロード
	 			Class.forName("com.mysql.jdbc.Driver");
	 			//データーベースへの接続
	 			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
	 			//ステートメントの作成
	 			ps = con.prepareStatement(" SELECT "
	 					+ " ksi.kyusyoku_id, "
	 					+ " ksi.kyusyoku_kibousyokusyu, "
	 					+ " ksi.kyusyoku_uketukenengappi, "
	 					+ " ksi.kyusyoku_yuukoukikan_start, "
	 					+ " ksi.kyusyoku_yuukoukikan_end, "
	 					+ " kj.kaisya_name, "
	 					+ " ksi.kyusyoku_joukyou "
						+ " FROM  kyusyoku_info AS ksi "
						+ " LEFT JOIN kyujin_info AS kji "
						+ " ON ksi.kyujin_id = kji.kyujin_id "
						+ " LEFT JOIN kyujin_dept AS kd "
						+ " ON kji.dept_id = kd.dept_id "
						+ " LEFT JOIN kyujinkaisya AS kj "
						+ " ON kd.kyujinkaisya_id = kj.kyujinkaisya_id"
						+ " WHERE "
						+ " ksi.kyusyokusya_id = ? ");
	 			ps.setInt(1, kyusyokusyaId);

							//sql文の実行
							rs = ps.executeQuery();

							//rsから実行結果を取り出す
							while(rs.next()) {
								KyusyokuListFetchModel bean = new KyusyokuListFetchModel();

									bean.setKyusyokuId(rs.getInt("kyusyoku_id"));
									bean.setKibousyokusyu(rs.getString("kyusyoku_kibousyokusyu"));
									bean.setUketukenengappi(rs.getString("kyusyoku_uketukenengappi"));
									bean.setYuukoukikanStart(rs.getString("kyusyoku_yuukoukikan_start"));
									bean.setYuukoukikanEnd(rs.getString("kyusyoku_yuukoukikan_end"));
									bean.setKaisyaName(rs.getString("kaisya_name"));
									bean.setKyusyokuJoukyou(rs.getString("kyusyoku_joukyou"));
								list.add(bean);
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
	 		return list;
	 	}

	private static void close() {
		// TODO 自動生成されたメソッド・スタブ
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
