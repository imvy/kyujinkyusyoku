package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KyusyokuListFetchServices {
	  private static Connection con;
	  private static java.sql.PreparedStatement ps = null;
	  private static ResultSet rs = null;

	  public static ArrayList<KyusyokuListFetchModel> selectAll(){
		  @SuppressWarnings("unused")
		KyusyokuListFetchModel items;
		  ArrayList<KyusyokuListFetchModel>list = new ArrayList<>();
			try {
	 			//JCBDドライバーのロード
	 			Class.forName("com.mysql.jdbc.Driver");
	 			//データーベースへの接続
	 			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
	 			//ステートメントの作成
	 			ps = con.prepareStatement(" SELECT ksi.kyusyoku_id, ks.kyusyoku_name, ks.kyusyoku_name_furigana, ks.kyusyoku_seinengappi, ksi.kyusyoku_kibousyokusyu, "
						+ 		 " ksi.kyusyoku_uketukenengappi, ksi.syoukai_day, kji.kyujin_id, kj.kaisya_name, kj.kaisya_name_furigana, "
						+        " ksi.saiyou_husaiyou, ksi.saiyou_day, ksi.roudoukeiyaku, "
						+        " DATE_ADD(DATE_ADD(ksi.saiyou_day, INTERVAL + 2 YEAR),INTERVAL - 1 DAY) AS tensyokukansyou_end, "
						+        " ksi.risyokujoukyou, ksi.henreikin, ksi.kyusyoku_joukyou, kd.dept_id, kj.kyujinkaisya_id"
						+ " FROM  kyusyokusya AS ks "
						+ " LEFT JOIN  kyusyoku_info AS ksi "
						+ " ON ks.kyusyokusya_id = ksi.kyusyokusya_id "
						+ " LEFT JOIN kyujin_info AS kji "
						+ " ON ksi.kyujin_id = kji.kyujin_id "
						+ " LEFT JOIN kyujin_dept AS kd "
						+ " ON kji.dept_id = kd.dept_id "
						+ " LEFT JOIN kyujinkaisya AS kj ON kd.kyujinkaisya_id = kj.kyujinkaisya_id"
						+ " WHERE "
						+ " ksi.kyusyoku_view = 1 ");

							//sql文の実行
							rs = ps.executeQuery();

							//rsから実行結果を取り出す
							while(rs.next()) {
							KyusyokuListFetchModel bean = new KyusyokuListFetchModel();

							bean.setKyusyokuId(rs.getInt("kyusyoku_id"));                           // 変更No.005_kim ソースの変更_20190702 Start
							bean.setKyusyokuName(rs.getString("kyusyoku_name"));
							bean.setKyusyokuNameFurigana	(rs.getString("kyusyoku_name_furigana"));
							bean.setSeinengappi(rs.getString("kyusyoku_seinengappi"));
							bean.setKibousyokusyu(rs.getString("kyusyoku_kibousyokusyu"));
							bean.setUketukenengappi(rs.getString("kyusyoku_uketukenengappi"));
							bean.setSyoukaiDay(rs.getString("syoukai_day"));
							bean.setKyujinId(rs.getInt("kyujin_id"));
							bean.setKaisyaName(rs.getString("kaisya_name"));
							bean.setKaisyaNameFurigana(rs.getString("kaisya_name_furigana"));
							bean.setSaiyouHusaiyou(rs.getString("saiyou_husaiyou"));
							bean.setSaiyouDay(rs.getString("saiyou_day"));
							bean.setRoudoukeiyaku(rs.getString("roudoukeiyaku"));
							bean.setTensyokukansyouEnd(rs.getString("tensyokukansyou_end"));
							bean.setRisyokujoukyou(rs.getString("risyokujoukyou"));
							bean.setHenreikin(rs.getString("henreikin"));									// 変更No.006_kim データ型変更_20190703
							bean.setKyusyokuJoukyou(rs.getString("kyusyoku_joukyou"));
							bean.setDeptId(rs.getInt("dept_id"));
							bean.setKyujinkaisyaId(rs.getInt("kyujinkaisya_id"));
							list.add(bean);	 			}
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
