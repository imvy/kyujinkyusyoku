package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DisplayModel {
	  private static Connection con;
	  private static java.sql.PreparedStatement ps = null;
	  private static ResultSet rs = null;

	  public static ArrayList<DisplayListModel> selectLevel(){
		  @SuppressWarnings("unused")
		  DisplayListModel items;
		  ArrayList<DisplayListModel>list = new ArrayList<>();
			try {
	 			//JCBDドライバーのロード
	 			Class.forName("com.mysql.jdbc.Driver");
	 			//データーベースへの接続
	 			con = DriverManager.getConnection("jdbc:mysql://192.168.100.21:3306/kyujinkyusyoku", "inofex","inofex");
	 			//ステートメントの作成
	 			ps = con.prepareStatement(" select user_level as level, count(user_level) as ninsuu from user_info group by user_level order by user_level");

							//sql文の実行
							rs = ps.executeQuery();

							//rsから実行結果を取り出す
							while(rs.next()) {
								DisplayListModel bean = new DisplayListModel();
								bean.setLevel(rs.getInt("level"));
								bean.setNinsuu(rs.getInt("ninsuu"));
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
