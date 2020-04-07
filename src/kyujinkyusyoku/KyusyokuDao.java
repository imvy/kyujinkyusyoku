package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KyusyokuDao {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;

/******************************************************************************************************************************************************
 * 																	求職リスト用DAO
 *****************************************************************************************************************************************************

	public ArrayList<KyusyokuBean> selecltKyusyoku(){
		ArrayList<KyusyokuBean> beanList = new ArrayList<>();

		try{

			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("SELECT *"
									+ "FROM kyusyokusya AS ks "
									+ "LEFT JOIN kyusyoku_info AS ksi "
									+ "ON ks.kyusyokusya_id = ksi.kyusyokusya_id "
									+ "LEFT JOIN kyujin_info AS kji "
									+ "ON ksi.kyujin_id = kji.kyujin_id "
									+ "LEFT JOIN kyujin_dept AS kd "
									+ "ON kji.dept_id = kd.dept_id "
									+ "LEFT JOIN kyujinkaisya AS kj ON kd.kyujinkaisya_id = kj.kyujinkaisya_id"
									+ "	WHERE ksi.kyusyoku_view = 1;");						// 変更No.004_kim SQL文の変更_20190702 End

			rs = ps.executeQuery();

			while(rs.next()) {
				KyusyokuBean bean = new KyusyokuBean();

				bean.setKyusyokuId(rs.getInt("kyusyoku_id"));                           // 変更No.005_kim ソースの変更_20190702 Start
				bean.setKyusyokuName(rs.getString("kyusyoku_name"));
				bean.setSeinengappi(rs.getString("kyusyoku_seinengappi"));
				bean.setKyusyokuId(rs.getInt("kyusyoku_id"));
				bean.setKibousyokusyu(rs.getString("kyusyoku_kibousyokusyu"));
				bean.setUketukenengappi(rs.getString("kyusyoku_uketukenengappi"));
				bean.setSyoukaiDay(rs.getString("syoukai_day"));
				bean.setKyujinId(rs.getInt("kyujin_id"));
				bean.setKaisyaName(rs.getString("kaisya_name"));
				bean.setSaiyouHusaiyou(rs.getString("saiyou_husaiyou"));
				bean.setSaiyouDay(rs.getString("saiyou_day"));
				bean.setRoudoukeiyaku(rs.getString("roudoukeiyaku"));
				bean.setTensyokukansyouEnd(rs.getString("tensyokukansyou_end"));
				bean.setRisyokujoukyou(rs.getString("risyokujoukyou"));
				bean.setHenreikin(rs.getString("henreikin"));									// 変更No.006_kim データ型変更_20190703
				bean.setKyusyokuJoukyou(rs.getString("kyusyoku_joukyou"));
				bean.setDeptId(rs.getInt("dept_id"));
				bean.setKyujinkaisyaId(rs.getInt("kyujinkaisya_id"));
				// 変更No.005_kim ソースの変更_20190702 End
				beanList.add(bean);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("[Error] ClassNotFoundException");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("[Error] SQLException");
		}finally {
			//クローズ
			close();
		}
		return beanList;


	}
*/
/******************************************************************************************************************************************************
 * 															     求職検索用SELECT
 ******************************************************************************************************************************************************/
		public ArrayList<KyusyokuBean> kyusyokuSearch(String kyusyokuName, String uketukenengappi, String kibousyokusyu, int currentPageNumber, String sort){

			ArrayList<KyusyokuBean> beanList = new ArrayList<>();

			try {
				//JCBDドライバーのロード
				Class.forName("com.mysql.jdbc.Driver");
				//データーベースへの接続
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
				//ステートメントの作成
				ps = con.prepareStatement(" SELECT ksi.kyusyoku_id, ks.kyusyoku_name, ks.kyusyoku_seinengappi, ksi.kyusyoku_kibousyokusyu, "
										+ 		 " ksi.kyusyoku_uketukenengappi, ksi.syoukai_day, kji.kyujin_id, kj.kaisya_name, "
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
										+"  WHERE ( ks.kyusyoku_name like ?) "
										+"  AND ( "
										+		" DATE_FORMAT   (ksi.kyusyoku_uketukenengappi  , '%Y-%m-%d') like ? "
										+		" OR DATE_FORMAT(ksi.kyusyoku_uketukenengappi  , '%Y%m%d') like ? "
										+		" OR DATE_FORMAT(ksi.kyusyoku_uketukenengappi  , '%Y/%m/%d') like ? "
										+		" OR DATE_FORMAT(ksi.kyusyoku_uketukenengappi  , '%Y年%m月%d日') like ? "
										+		" OR ksi.kyusyoku_uketukenengappi IS NULL "
										+	") "
										+	" AND (ksi.kyusyoku_kibousyokusyu like ?"
										+   " OR ksi.kyusyoku_kibousyokusyu IS NULL ) "
										+	" AND ksi.kyusyoku_view = 1 "
										+ " ORDER BY  " + sort
										+ " LIMIT ?,10");

				ps.setString(1, kyusyokuName);
				ps.setString(2, uketukenengappi);
				ps.setString(3, uketukenengappi);
				ps.setString(4, uketukenengappi);
				ps.setString(5, uketukenengappi);
				ps.setString(6, kibousyokusyu);
				ps.setInt(7, (currentPageNumber-1)*10);
				//sql文の実行
				rs = ps.executeQuery();

				//rsから実行結果を取り出す
				while(rs.next()) {
				KyusyokuBean bean = new KyusyokuBean();

				bean.setKyusyokuId(rs.getInt("kyusyoku_id"));                           // 変更No.005_kim ソースの変更_20190702 Start
				bean.setKyusyokuName(rs.getString("kyusyoku_name"));
				bean.setSeinengappi(rs.getString("kyusyoku_seinengappi"));
				bean.setKibousyokusyu(rs.getString("kyusyoku_kibousyokusyu"));
				bean.setUketukenengappi(rs.getString("kyusyoku_uketukenengappi"));
				bean.setSyoukaiDay(rs.getString("syoukai_day"));
				bean.setKyujinId(rs.getInt("kyujin_id"));
				bean.setKaisyaName(rs.getString("kaisya_name"));
				bean.setSaiyouHusaiyou(rs.getString("saiyou_husaiyou"));
				bean.setSaiyouDay(rs.getString("saiyou_day"));
				bean.setRoudoukeiyaku(rs.getString("roudoukeiyaku"));
				bean.setTensyokukansyouEnd(rs.getString("tensyokukansyou_end"));
				bean.setRisyokujoukyou(rs.getString("risyokujoukyou"));
				bean.setHenreikin(rs.getString("henreikin"));									// 変更No.006_kim データ型変更_20190703
				bean.setKyusyokuJoukyou(rs.getString("kyusyoku_joukyou"));
				bean.setDeptId(rs.getInt("dept_id"));
				bean.setKyujinkaisyaId(rs.getInt("kyujinkaisya_id"));
					beanList.add(bean);
				}
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.err.println("[Error] ClassNotFoundException");
			} catch (SQLException e) {
				e.printStackTrace();
				System.err.println("[Error] SQLException");
			}finally {
				//クローズ
				close();
			}
			return beanList;

		}

/******************************************************************************************************************************************************
 * 														ページネーション用レコード取得
 ******************************************************************************************************************************************************/
		public KyusyokuBean selectKyusyoku2(String kyusyokuName, String uketukenengappi, String kibousyokusyu) {

			KyusyokuBean bean = new KyusyokuBean();

			try {
				//JCBDドライバーのロード
				Class.forName("com.mysql.jdbc.Driver");
				//データーベースへの接続
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
				//ステートメントの作成
				ps = con.prepareStatement("SELECT"
									+ " count(*),"
									+ " TRUNCATE(count(*)/10 + 0.9,0) "
									+ " FROM  kyusyokusya AS ks "
									+ " LEFT JOIN kyusyoku_info AS ksi "
									+ " ON ks.kyusyokusya_id = ksi.kyusyokusya_id "
									+ " LEFT JOIN kyujin_info AS kji "
									+ " ON ksi.kyujin_id = kji.kyujin_id "
									+ " LEFT JOIN kyujin_dept AS kd "
									+ " ON kji.dept_id = kd.dept_id "
									+ " LEFT JOIN kyujinkaisya AS kj "
									+ " ON kd.kyujinkaisya_id = kj.kyujinkaisya_id"
									+"  WHERE ( ks.kyusyoku_name like ?) "
									+"  AND ( "
									+		" DATE_FORMAT   (ksi.kyusyoku_uketukenengappi  , '%Y-%m-%d') like ? "
									+		" OR DATE_FORMAT(ksi.kyusyoku_uketukenengappi  , '%Y/%m/%d') like ? "
									+		" OR DATE_FORMAT(ksi.kyusyoku_uketukenengappi  , '%Y年%m月%d日') like ? "
									+		" OR ksi.kyusyoku_uketukenengappi IS NULL "
									+	") "
									+	" AND (ksi.kyusyoku_kibousyokusyu like ?"
									+   "OR ksi.kyusyoku_kibousyokusyu IS NULL ) "
									+	" AND ksi.kyusyoku_view = 1 ");
				//?の部分に求職情報を設定する
				ps.setString(1, kyusyokuName);
				ps.setString(2, uketukenengappi);
				ps.setString(3, uketukenengappi);
				ps.setString(4, uketukenengappi);
				ps.setString(5, kibousyokusyu);
				//sql文の実行
				rs = ps.executeQuery();

				while(rs.next()) {
					bean.setAllRecordCount(rs.getInt("count(*)"));//レコード総数
					bean.setAllPageCount(rs.getInt("TRUNCATE(count(*)/10 + 0.9,0)"));//ページ総数

				}
			}catch (ClassNotFoundException e) {
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

/******************************************************************************************************************************************************
 * 																	絞込用DAO
 ******************************************************************************************************************************************************/

	public KyusyokuBean selectKyusyoku(int kyusyokuId) {

		KyusyokuBean bean = new KyusyokuBean();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			//ps = con.prepareStatement("select kyusyoku_id, kyusyoku_name,kyusyoku_zyusyo, kyusyoku_seinengappi, kyusyoku_kibousyokusyu, kyusyoku_uketukenengappi,kyusyoku_yuukoukikan, syokugyousyoukai from kyusyoku_info where kyusyoku_id = ?");
			ps = con.prepareStatement(" SELECT ks.kyusyokusya_id, ks.kyusyoku_name, ks.kyusyoku_name_furigana, ks.kyusyoku_seinengappi, ks.kyusyoku_zyusyo,"
									+ " ks.kyusyoku_seinengappi, ks.renrakusaki_kyusyokusya,ksi.kyusyoku_kibousyokusyu, "
									+ " ksi.kyusyoku_uketukenengappi, ksi.kyusyoku_yuukoukikan_start, ksi.kyusyoku_yuukoukikan_end, "
									+ " ksi.syoukai_day, kj.kyujinkaisya_id, kj.kaisya_name, "
									+ " ksi.saiyou_husaiyou, ksi.saiyou_day, ksi.roudoukeiyaku, "
									+ " DATE_ADD(DATE_ADD(ksi.saiyou_day, INTERVAL + 2 YEAR),INTERVAL - 1 DAY) AS tensyokukansyou_end, "
									+ " ksi.risyokujoukyou, ksi.henreikin, ksi.kyusyoku_joukyou, ksi.kyusyoku_id, kji.kyujin_id, kd.dept_id "											// 変更No.004_kim SQL文の変更_20190702 Start
									+ " FROM kyusyokusya AS ks "
									+ " LEFT JOIN kyusyoku_info AS ksi "
									+ " ON ks.kyusyokusya_id = ksi.kyusyokusya_id "
									+ " LEFT JOIN kyujin_info AS kji "
									+ " ON ksi.kyujin_id = kji.kyujin_id "
									+ " LEFT JOIN kyujin_dept AS kd "
									+ " ON kji.dept_id = kd.dept_id "
									+ " LEFT JOIN kyujinkaisya AS kj "
									+ " ON kd.kyujinkaisya_id = kj.kyujinkaisya_id "
									+ " WHERE kyusyoku_id = ? ");						// 変更No.004_kim SQL文の変更_20190702 End
			//?の部分に求職IDを設定する
			ps.setInt(1, kyusyokuId);

			rs = ps.executeQuery();

			while( rs.next() ) {
				bean.setKyusyokusyaId(rs.getInt("kyusyokusya_id"));                           // 変更No.005_kim ソースの変更_20190702 Start
				bean.setKyusyokuName(rs.getString("kyusyoku_name"));
				bean.setKyusyokuNameFurigana(rs.getString("kyusyoku_name_furigana"));
				bean.setJyusyo(rs.getString("kyusyoku_zyusyo"));
				bean.setSeinengappi(rs.getString("kyusyoku_seinengappi"));
				bean.setRenrakusakiKyusyokusya(rs.getString("renrakusaki_kyusyokusya"));
				bean.setKibousyokusyu(rs.getString("kyusyoku_kibousyokusyu"));
				bean.setUketukenengappi(rs.getString("kyusyoku_uketukenengappi"));
				bean.setYuukoukikanStart(rs.getString("kyusyoku_yuukoukikan_start"));
				bean.setYuukoukikanEnd(rs.getString("kyusyoku_yuukoukikan_end"));
				bean.setSyoukaiDay(rs.getString("syoukai_day"));
				bean.setKyujinkaisyaId(rs.getInt("kyujinkaisya_id"));
				bean.setKaisyaName(rs.getString("kaisya_name"));
				bean.setSaiyouHusaiyou(rs.getString("saiyou_husaiyou"));
				bean.setSaiyouDay(rs.getString("saiyou_day"));
				bean.setRoudoukeiyaku(rs.getString("roudoukeiyaku"));
				bean.setTensyokukansyouEnd(rs.getString("tensyokukansyou_end"));
				bean.setRisyokujoukyou(rs.getString("risyokujoukyou"));
				bean.setHenreikin(rs.getString("henreikin"));									// 変更No.006_kim データ型変更_20190703
				bean.setKyusyokuJoukyou(rs.getString("kyusyoku_joukyou"));
				bean.setKyusyokuId(rs.getInt("kyusyoku_id"));
				bean.setKyujinId(rs.getInt("kyujin_id"));
				bean.setDeptId(rs.getInt("dept_id"));				                          // 変更No.005_kim ソースの変更_20190702 End

			}
		}catch (ClassNotFoundException e) {
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

/******************************************************************************************************************************************************
 * 																	求職編集用DAO
 ******************************************************************************************************************************************************/

//変更点No,007_kim  ソース変更 - Start
	public void updateKyusyoku( int kyusyokusya_id, String kyusyoku_name, String kyusyoku_name_furigana, String kyusyoku_zyusyo, String kyusyoku_seinengappi,
								  String renrakusaki_kyusyokusya, int kyusyoku_id,String kyusyoku_kibousyokusyu,
								  String kyusyoku_uketukenengappi, String kyusyoku_yuukoukikan_start, String kyusyoku_yuukoukikan_end,
								  String syoukai_day, int kyujin_id, String saiyou_husaiyou, String saiyou_day,
								  String roudoukeiyaku, String tensyokukansyou_end,  String risyokujoukyou, String henreikin,
								  String kyusyoku_joukyou) throws SQLException{

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("UPDATE kyusyokusya, kyusyoku_info "
									+ "SET    kyusyoku_name = ?, kyusyoku_name_furigana = ?, kyusyoku_zyusyo = ?, kyusyoku_seinengappi = ?, renrakusaki_kyusyokusya = ?, "
										   + "kyusyoku_kibousyokusyu = ?, kyusyoku_uketukenengappi = ?, kyusyoku_yuukoukikan_start = ?, "
										   + "kyusyoku_yuukoukikan_end = ?, syoukai_day = ?, kyujin_id = ?, saiyou_husaiyou = ?, saiyou_day = ?, "
										   + "roudoukeiyaku = ?, tensyokukansyou_end = ?, risyokujoukyou = ?, henreikin = ?, kyusyoku_joukyou = ? "
										   + "WHERE  kyusyokusya.kyusyokusya_id = ? "
										   + "AND kyusyoku_info.kyusyoku_id = ?;");

			ps.setString(1, kyusyoku_name);
			ps.setString(2, kyusyoku_name_furigana);
			ps.setString(3, kyusyoku_zyusyo);
			ps.setString(4, kyusyoku_seinengappi);
			ps.setString(5, renrakusaki_kyusyokusya);
			ps.setString(6, kyusyoku_kibousyokusyu);
			ps.setString(7, kyusyoku_uketukenengappi);
			ps.setString(8, kyusyoku_yuukoukikan_start);
			ps.setString(9, kyusyoku_yuukoukikan_end);
			ps.setString(10, syoukai_day);
			ps.setInt(11, kyujin_id);
			ps.setString(12, saiyou_husaiyou);
			ps.setString(13, saiyou_day);
			ps.setString(14, roudoukeiyaku);
			ps.setString(15, tensyokukansyou_end);
			ps.setString(16, risyokujoukyou);
			ps.setString(17, henreikin);
			ps.setString(18, kyusyoku_joukyou);
			ps.setInt(19, kyusyokusya_id);  //変更No00.
			ps.setInt(20, kyusyoku_id);

//変更点No,007_kim  ソース変更 - end

			ps.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("[Error] ClassNotFoundException");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("[Error] SQLException");
		}finally {
			//クローズ
			close();
		}
	}


//変更No.018_kim ソース追加 - Start
/******************************************************************************************************************************************************
 * 																求人事業所名称表示用DAO
 ******************************************************************************************************************************************************/


	public KyusyokuBean selectKyujinKaishaName (int kyujinId) {
		KyusyokuBean bean = new KyusyokuBean();

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("SELECT kj.kaisya_name  FROM  kyujin_info AS kji JOIN kyujin_dept AS kd ON kji.dept_id = kd.dept_id JOIN kyujinkaisya AS kj ON kd.kyujinkaisya_id = kj.kyujinkaisya_id WHERE kyujin_id = ?");

			ps.setInt(1, kyujinId);

			rs = ps.executeQuery();


			while( rs.next() ) {
				bean.setKaisyaName(rs.getString("kaisya_name"));
				}
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.err.println("[Error] ClassNotFoundException");
			} catch (SQLException e) {
				e.printStackTrace();
				System.err.println("[Error] SQLException");
			} finally {
				//クローズ
				close();
			}
			return bean;
		}
//変更No.018_kim - End

/******************************************************************************************************************************************************
 * 																	kyusyokusya追加用DAO
 ******************************************************************************************************************************************************/
//変更点No,007_kim  ソース変更 - start
	public void insertKyusyokusya( String kyusyokusya_name, String kyusyoku_name_furigana, String kyusyoku_zyusyo,String kyusyoku_seinengappi,
									String renrakusaki_kyusyokusya) throws SQLException{

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("INSERT INTO  kyusyokusya ( kyusyoku_name, kyusyoku_name_furigana, kyusyoku_zyusyo, kyusyoku_seinengappi, renrakusaki_kyusyokusya) "
									+ "VALUES(?,?,?,?,?)");


			ps.setString(1, kyusyokusya_name);
			ps.setString(2, kyusyoku_name_furigana);
			ps.setString(3, kyusyoku_zyusyo);
			ps.setString(4, kyusyoku_seinengappi);
			ps.setString(5, renrakusaki_kyusyokusya);

			ps.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("[Error] ClassNotFoundException");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("[Error] SQLException");
		}finally {
			//クローズ
			close();
		}
	}
//変更点No,007_kim  ソース変更 - end
//変更点No.034_kim ソース追加 - Start

/*
 *                                             **** 求職者ID取得 ****
 */


		public KyusyokuBean selectKyusyoku(String kyusyoku_name, String kyusyoku_name_furigana, String kyusyoku_zyusyo,String kyusyoku_seinengappi,
				String renrakusaki_kyusyokusya){

			KyusyokuBean bean = new KyusyokuBean();

			try {
				//JCBDドライバーのロード
				Class.forName("com.mysql.jdbc.Driver");
				//データーベースへの接続
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
				//ステートメントの作成
				ps = con.prepareStatement("SELECT kyusyokusya_id "
										+ "FROM   kyusyokusya "
										+ "WHERE  kyusyoku_name = ? and kyusyoku_name_furigana = ? and kyusyoku_zyusyo = ? and kyusyoku_seinengappi = ? "
										+"and renrakusaki_kyusyokusya = ?");
				//?の部分に求人IDを設定する
				ps.setString(1, kyusyoku_name);
				ps.setString(2, kyusyoku_name_furigana);
				ps.setString(3, kyusyoku_zyusyo);
				ps.setString(4, kyusyoku_seinengappi);
				ps.setString(5, renrakusaki_kyusyokusya);
				rs = ps.executeQuery();
				while(rs.next()) {

					bean.setKyusyokusyaId(rs.getInt("kyusyokusya_id"));
				}
			}catch (ClassNotFoundException e) {
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
//変更点No.034_kim - End


/*
 *                                     **** 求職者検索用 ****
 */
		public ArrayList<KyusyokuBean> kyusyokuSearch(String KyusyokuName){

			ArrayList<KyusyokuBean> beanList = new ArrayList<>();

			try {
				//JCBDドライバーのロード
				Class.forName("com.mysql.jdbc.Driver");
				//データーベースへの接続
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
				//ステートメントの作成
//				ps = con.prepareStatement("SELECT * FROM kyusyokusya WHERE (kyusyoku_name like ?)");
				ps = con.prepareStatement("SELECT * FROM kyusyokusya WHERE kyusyokusya_view = 1");

//				ps.setString(1, KyusyokuName);
				//sql文の実行
				rs = ps.executeQuery();

				//rsから実行結果を取り出す
				while(rs.next()) {
					KyusyokuBean bean = new KyusyokuBean();
					bean.setKyusyokusyaId(rs.getInt("kyusyokusya_id"));
					bean.setKyusyokuName(rs.getString("kyusyoku_name"));
					bean.setJyusyo(rs.getString("kyusyoku_zyusyo"));
					bean.setSeinengappi(rs.getString("kyusyoku_seinengappi"));
					bean.setRenrakusakiKyusyokusya(rs.getString("renrakusaki_kyusyokusya"));
					bean.setKyusyokusyaId(rs.getInt("kyusyokusya_id"));
					beanList.add(bean);
				}
			}catch (ClassNotFoundException e) {
				e.printStackTrace();
				System.err.println("[Error] ClassNotFoundException");
			} catch (SQLException e) {
				e.printStackTrace();
				System.err.println("[Error] SQLException");
			}finally {
				//クローズ
				close();
			}
			return beanList;}
/*
 *                                      **** 求職情報検索用select ****
*/
		public KyusyokuBean selectKyusyoku1(int kyusyokuId) {

			KyusyokuBean bean = new KyusyokuBean();

			try {
				//JCBDドライバーのロード
				Class.forName("com.mysql.jdbc.Driver");
				//データーベースへの接続
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
				//ステートメントの作成
				ps = con.prepareStatement(
						"SELECT * FROM kyusyokusya WHERE (kyusyokusya_id like ?)");
				//?の部分に求人IDを設定する
				ps.setInt(1, kyusyokuId);
				//sql文の実行
				rs = ps.executeQuery();

				while(rs.next()) {
					bean.setKyusyokuName(rs.getString("kyusyoku_name"));
					bean.setJyusyo(rs.getString("kyusyoku_zyusyo"));
					bean.setSeinengappi(rs.getString("kyusyoku_seinengappi"));
					bean.setRenrakusakiKyusyokusya(rs.getString("renrakusaki_kyusyokusya"));

				}
			}catch (ClassNotFoundException e) {
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
/******************************************************************************************************************************************************
 * 																	kyusyoku_info追加用DAO
 ******************************************************************************************************************************************************/
//変更点No,008_kim  ソース追加 - start
	public void insertKyusyoku( String kyusyoku_kibousyokusyu, String kyusyoku_uketukenengappi, String kyusyoku_yuukoukikan_start,
								 String kyusyoku_yuukoukikan_end, String syoukai_day, int kyujin_id ,String saiyou_husaiyou,
								 String saiyou_day, String roudoukeiyaku, /*String tensyokukansyou_end,*/ String risyokujoukyou,
								 String henreikin,  String kyusyoku_joukyou, int kyusyokusya_id) throws SQLException{

		try {
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("INSERT INTO kyusyoku_info(kyusyoku_kibousyokusyu,kyusyoku_uketukenengappi,kyusyoku_yuukoukikan_start,kyusyoku_yuukoukikan_end, saiyou_husaiyou,syoukai_day, kyujin_id,saiyou_day, roudoukeiyaku,risyokujoukyou,henreikin, kyusyokusya_id, kyusyoku_view,kyusyoku_joukyou) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,1,?)");


			ps.setString(1, kyusyoku_kibousyokusyu);
			ps.setString(2, kyusyoku_uketukenengappi);
			ps.setString(3, kyusyoku_yuukoukikan_start);
			ps.setString(4, kyusyoku_yuukoukikan_end);
			ps.setString(5, saiyou_husaiyou);
			ps.setString(6, syoukai_day);
			if (kyujin_id != 0) {
				  ps.setInt(7, kyujin_id);
				  } else {
					ps.setObject(7, null);
				}
			ps.setString(8, saiyou_day);
//			ps.setString(8, tensyokukansyou_end);
			ps.setString(9, roudoukeiyaku);
			ps.setString(10, risyokujoukyou);
			ps.setString(11, henreikin);
			ps.setInt(12, kyusyokusya_id);
			ps.setString(13, kyusyoku_joukyou);

			ps.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("[Error] ClassNotFoundException");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("[Error] SQLException");
		}finally {
			//クローズ
			close();
		}
	}
//変更点No,008_kim  ソース追加 - end

/******************************************************************************************************************************************************
 * 																	求職検索用DAO
 ******************************************************************************************************************************************************/
//変更点No,007_kim  ソース変更 - start
	public ArrayList<KyusyokuBean> searchKyusyoku(String kyusyokuName, String uketukenengappi,String kibousyokusyu){
		ArrayList<KyusyokuBean> beanList = new ArrayList<>();

		try{

			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			//ps = con.prepareStatement("select kyusyoku_id, kyusyoku_name, kyusyoku_seinengappi, kyusyoku_kibousyokusyu, kyusyoku_uketukenengappi, syokugyousyoukai from kyusyoku_info where (kyusyoku_name like ?) and (kyusyoku_uketukenengappi like ?) and (kyusyoku_kibousyokusyu like ?)");
			ps = con.prepareStatement("SELECT *"
									+ "FROM kyusyokusya AS ks "
									+ "LEFT JOIN kyusyoku_info AS ksi "
									+ "ON ks.kyusyokusya_id = ksi.kyusyokusya_id "
									+ "LEFT JOIN kyujin_info AS kji "
									+ "ON ksi.kyujin_id = kji.kyujin_id "
									+ "LEFT JOIN kyujin_dept AS kd "
									+ "ON kji.dept_id = kd.dept_id "
									+ "LEFT JOIN kyujinkaisya AS kj "
									+ "ON kd.kyujinkaisya_id = kj.kyujinkaisya_id "
									+ "WHERE (kyusyoku_name like ?) "
									+ "AND (DATE_FORMAT(ksi.kyusyoku_uketukenengappi, '%Y-%m-%d') like ?) "
									+ "AND (kyusyoku_kibousyokusyu like ?);");

			ps.setString(1, kyusyokuName);
			ps.setString(2, uketukenengappi);
			ps.setString(3, kibousyokusyu);
			rs = ps.executeQuery();

			while(rs.next()) {
				KyusyokuBean bean = new KyusyokuBean();
				bean.setKyusyokusyaId(rs.getInt("kyusyokusya_id"));
				bean.setKyusyokuName(rs.getString("kyusyoku_name"));
				bean.setSeinengappi(rs.getString("kyusyoku_seinengappi"));
				bean.setKyusyokuId(rs.getInt("kyusyoku_id"));
				bean.setKibousyokusyu(rs.getString("kyusyoku_kibousyokusyu"));
				bean.setUketukenengappi(rs.getString("kyusyoku_uketukenengappi"));
				bean.setSyoukaiDay(rs.getString("syoukai_day"));
				bean.setKyujinId(rs.getInt("kyujin_id"));
				bean.setKaisyaName(rs.getString("kaisya_name"));
				bean.setSaiyouHusaiyou(rs.getString("saiyou_husaiyou"));
				bean.setSaiyouDay(rs.getString("saiyou_day"));
				bean.setRoudoukeiyaku(rs.getString("roudoukeiyaku"));
				bean.setTensyokukansyouEnd(rs.getString("tensyokukansyou_end"));	//変更点No,025_kim  ソース変更
				bean.setRisyokujoukyou(rs.getString("risyokujoukyou"));
				bean.setHenreikin(rs.getString("henreikin"));
				bean.setKyusyokuJoukyou(rs.getString("kyusyoku_joukyou"));			//変更点No,025_kim  ソース変更
				beanList.add(bean);
			}
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("[Error] ClassNotFoundException");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("[Error] SQLException");
		}finally {
			//クローズ
			close();
		}
		return beanList;
	}
//変更点No,007_kim  ソース変更 - End

/******************************************************************************************************************************************************
 * 																	削除用DAO
 ******************************************************************************************************************************************************/
	public void updateKyusyoku(int kyusyokuId) throws SQLException{					// 変更No.024_kim -ソース変更

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("update kyusyoku_info set kyusyoku_view = 0 where kyusyoku_id = ?");
			ps.setInt(1, kyusyokuId);													// 変更No.024_kim -ソース変更

			ps.executeUpdate();
		}catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.err.println("[Error] ClassNotFoundException");
		} catch (SQLException e) {
			e.printStackTrace();
			System.err.println("[Error] SQLException");
		}finally {
			//クローズ
			close();
		}
	}

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
