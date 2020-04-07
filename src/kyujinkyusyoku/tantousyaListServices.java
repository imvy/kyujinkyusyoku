package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class tantousyaListServices {
	  private static Connection con;
	  private static java.sql.PreparedStatement ps = null;
	  private static ResultSet rs = null;

//*********************************************************************************************************************
//													求人会社ID取得
//*********************************************************************************************************************
	  public static KyujinkaisyaBean selectKyujinkaisyaId (String id) {

		  KyujinkaisyaBean bean = null;
			try {

				//classのfornameを利用しjdbcドライバをロードする
				Class.forName("com.mysql.jdbc.Driver");

				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku","inofex","inofex");

				ps = con.prepareStatement(" select * from kyujinkaisya  where user_id = ? ");

				ps.setString(1, id);

				rs = ps.executeQuery();
				while(rs.next()) {
					bean = new KyujinkaisyaBean();
					bean.setKyujinkaisyaId(rs.getInt("kyujinkaisya_id"));
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
//												担当者情報取得
//*********************************************************************************************************************

	  public static ArrayList<tantouListFetchModel> selectAllKyujinDept(int kyujinkaisyaId){
		  @SuppressWarnings("unused")
		  tantouListFetchModel items;
		  ArrayList<tantouListFetchModel>list = new ArrayList<>();
			try {
	 			//JCBDドライバーのロード
	 			Class.forName("com.mysql.jdbc.Driver");
	 			//データーベースへの接続
	 			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
	 			//ステートメントの作成
	 			ps = con.prepareStatement(" SELECT * FROM kyujin_dept WHERE kyujinkaisya_id = ? ");
	 			ps.setInt(1, kyujinkaisyaId);

							//sql文の実行
							rs = ps.executeQuery();

							//rsから実行結果を取り出す
							while(rs.next()) {
								tantouListFetchModel bean = new tantouListFetchModel();

									bean.setDeptId(rs.getInt("dept_id"));
									bean.setDeptName(rs.getString("dept_name"));
									bean.setTantousya(rs.getString("tantousya"));
									bean.setTantousyaFurigana(rs.getString("tantousya_furigana"));
									bean.setRenrakusaki(rs.getString("renrakusaki"));
									bean.setKyujinkaisyaId(rs.getInt("kyujinkaisya_id"));
									bean.setDeptView(rs.getInt("dept_view"));
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
//*********************************************************************************************************************
//													求人情報取得
//*********************************************************************************************************************

	  public static ArrayList<KyujinListFetchModel> selectAllKyujinInfo(int kyujinkaisyaId){
		  @SuppressWarnings("unused")
		  KyujinListFetchModel items;
	  		  ArrayList<KyujinListFetchModel>list = new ArrayList<>();
	  			try {
	  	 			//JCBDドライバーのロード
	  	 			Class.forName("com.mysql.jdbc.Driver");
	  	 			//データーベースへの接続
	  	 			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
	  	 			//ステートメントの作成
	  	 			ps = con.prepareStatement(" SELECT  kj_info.*, "
	  	 									+ "  kj_dept.dept_name, "
	  	 									+ "  kj_dept.tantousya "
	  	 									+ "  FROM kyujin_info as kj_info "
	  	 									+ "  LEFT JOIN kyujin_dept as kj_dept "
	  	 									+ "  ON kj_dept.dept_id = kj_info.dept_id "
	  	 									+ "  LEFT JOIN kyujinkaisya as kj_kaisya "
	  	 									+ "  ON kj_kaisya.kyujinkaisya_id = kj_dept.kyujinkaisya_id "
	  	 									+ "  WHERE kj_kaisya.kyujinkaisya_id = ? "

	  	 					);

	  	 			ps.setInt(1, kyujinkaisyaId);

	  							//sql文の実行
	  							rs = ps.executeQuery();

	  							//rsから実行結果を取り出す
	  							while(rs.next()) {
	  								KyujinListFetchModel bean = new KyujinListFetchModel();

	  									bean.setKyujinId(rs.getInt("kyujin_id"));
	  									bean.setUketukenengappi(rs.getString("kyujin_uketukenengappi"));
	  									bean.setYuukoukikanStart(rs.getString("kyujin_yukokikan_start"));
	  									bean.setYuukoukikanEnd(rs.getString("kyujin_yukokikan_end"));
	  									bean.setKyujinsuu(rs.getInt("kyujinsuu"));
	  									bean.setSyokusyu(rs.getString("kyujin_syokusyu"));
	  									bean.setKoyoukikanStart(rs.getString("kyujin_koyoukikan_start"));
	  									bean.setKoyoukikanEnd(rs.getString("kyujin_koyoukikan_end"));
	  									bean.setTinginKeitai(rs.getString("kyujin_tingin_keitai"));
	  									bean.setTingin(rs.getInt("kyujin_tingin"));
	  									bean.setDeptName(rs.getString("dept_name"));
	  									bean.setTantousya(rs.getString("tantousya"));
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

//*********************************************************************************************************************
//													CLOSE
//*********************************************************************************************************************

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
