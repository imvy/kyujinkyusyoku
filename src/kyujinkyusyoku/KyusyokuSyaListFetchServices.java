package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KyusyokuSyaListFetchServices {
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
	 			ps = con.prepareStatement(" SELECT * FROM kyusyokusya WHERE  kyusyokusya_view = 1 ");

							//sql文の実行
							rs = ps.executeQuery();

							//rsから実行結果を取り出す
							while(rs.next()) {
							KyusyokuListFetchModel bean = new KyusyokuListFetchModel();

							bean.setKyusyokusyaId(rs.getInt("kyusyokusya_id"));                           // 変更No.005_kim ソースの変更_20190702 Start
							bean.setKyusyokuName(rs.getString("kyusyoku_name"));
							bean.setKyusyokuNameFurigana	(rs.getString("kyusyoku_name_furigana"));
							bean.setJyusyo(rs.getString("kyusyoku_zyusyo"));
							bean.setSeinengappi(rs.getString("kyusyoku_seinengappi"));
							bean.setRenrakusakiKyusyokusya(rs.getString("renrakusaki_kyusyokusya"));
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
