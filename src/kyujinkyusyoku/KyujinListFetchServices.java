package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KyujinListFetchServices {
	  private static Connection con;
	  private static java.sql.PreparedStatement ps = null;
	  private static ResultSet rs = null;

	  public static ArrayList<KyujinListFetchModel> selectAll(){
		  @SuppressWarnings("unused")
		KyujinListFetchModel items;
		  ArrayList<KyujinListFetchModel>list = new ArrayList<>();
			try {
	 			//JCBDドライバーのロード
	 			Class.forName("com.mysql.jdbc.Driver");
	 			//データーベースへの接続
	 			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
	 			//ステートメントの作成
	 			ps = con.prepareStatement(""
	 					+ "select "
	 					+ 	"i.kyujin_id, "
	 					+ 	"k.kaisya_name, "
	 					+   "k.kaisya_name_furigana,"
	 					+ 	"d.dept_name, "
	 					+   "d.tantousya,"
	 					+   "d.tantousya_furigana,"
	 					+ 	"d.renrakusaki, "
	 					+ 	"i.kyujin_uketukenengappi, "
	 					+ 	"i.kyujin_yukokikan_start, "
	 					+ 	"i.kyujin_yukokikan_end, "
	 					+ 	"i.kyujin_syokusyu "
	 					+ "from kyujin_info i "
	  					+ 	"join kyujin_dept d "
	 					+ 		"on i.dept_id = d.dept_id "
	 					+ 	"join kyujinkaisya k "
	 					+ "		on k.kyujinkaisya_id = d.kyujinkaisya_id "
	 					+ "where i.kyujin_view = 1"
	 					);

	 			//sql文の実行
	 			rs = ps.executeQuery();

	 			//rsから実行結果を取り出す
	 			while(rs.next()) {
	 				KyujinListFetchModel bean = new KyujinListFetchModel();
	 				bean.setKyujinId(rs.getInt("kyujin_id"));
	 				bean.setKaisyaName(rs.getString("kaisya_name"));
	 				bean.setKaisyaNameFurigana(rs.getString("kaisya_name_furigana"));
	 				bean.setDeptName(rs.getString("dept_name"));
	 				bean.setTantousya(rs.getString("tantousya"));
	 				bean.setTantousyaFurigana(rs.getString("tantousya_furigana"));
	 				bean.setRenrakusaki(rs.getString("renrakusaki"));
	 				bean.setUketukenengappi(rs.getString("kyujin_uketukenengappi"));
	 				bean.setYuukoukikanStart(rs.getString("kyujin_yukokikan_start"));
	 				bean.setYuukoukikanEnd(rs.getString("kyujin_yukokikan_end"));
	 				bean.setSyokusyu(rs.getString("kyujin_syokusyu"));
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
