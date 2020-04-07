package kyujinkyusyoku;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KyujinDao {

	private Connection con = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;


//ページング用レコード数取得
		public KyujinBean selectKyujin2(String KaisyaName, String uketukenengappi, String syokusyu) {

			KyujinBean bean = new KyujinBean();

			try {
				//JCBDドライバーのロード
				Class.forName("com.mysql.jdbc.Driver");
				//データーベースへの接続
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
				//ステートメントの作成
				ps = con.prepareStatement(
						"SELECT"
						+ 	" count(*),"
						+ 	" TRUNCATE(count(*)/10 + 0.9,0) "
						+ " FROM kyujin_info i "
						+ 	" JOIN kyujin_dept d "
						+ 		" USING(dept_id) "
						+ 	" JOIN kyujinkaisya k "
						+		 " USING(kyujinkaisya_id) "
						+ " WHERE ( k.kaisya_name like ?) "
						+ 	" AND ("
						+ 		" DATE_FORMAT(i.kyujin_uketukenengappi  , '%Y-%m-%d') like ? "
						+ 		" OR DATE_FORMAT(i.kyujin_uketukenengappi  , '%Y%m%d') like ? "
						+ 		" OR DATE_FORMAT(i.kyujin_uketukenengappi  , '%Y年%m月%d日') like ? "
						+ 		" OR i.kyujin_uketukenengappi IS NULL"
						+ 	" ) "
						+ 	" AND (i.kyujin_syokusyu like ?) "
						+ 	" AND i.kyujin_view = 1 "
						);
				//?の部分に求人IDを設定する
				ps.setString(1, KaisyaName);
				ps.setString(2, uketukenengappi);
				ps.setString(3, uketukenengappi);
				ps.setString(4, uketukenengappi);
				ps.setString(5, syokusyu);
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
//絞り込み用Dao
	public KyujinBean selectKyujin(int kyujinId) {

		KyujinBean bean = new KyujinBean();

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(
					"SELECT i.kyujin_id, "
					+ "k.kaisya_name, "
					+ "k.kaisya_name_furigana,"
					+ "k.zyusyo,"
					+ "d.dept_name, "
					+ "d.tantousya, "
					+ "d.tantousya_furigana, "
					+ "d.renrakusaki, "
					+ "DATE_FORMAT(i.kyujin_uketukenengappi,'%Y/%m/%d') AS kyujin_uketukenengappi, "
					+ "DATE_FORMAT(i.kyujin_yukokikan_start,'%Y/%m/%d') AS kyujin_yukokikan_start, "
					+ "DATE_FORMAT(i.kyujin_yukokikan_end,'%Y/%m/%d') AS kyujin_yukokikan_end, "
					+ "i.kyujinsuu, "
					+ "i.kyujin_syokusyu, "
					+ "i.kyujin_syuugyoubasyo, "
					+ "DATE_FORMAT(i.kyujin_koyoukikan_start,'%Y/%m/%d') AS kyujin_koyoukikan_start, "
					+ "DATE_FORMAT(i.kyujin_koyoukikan_end,'%Y/%m/%d') AS kyujin_koyoukikan_end, "
					+ "i.kyujin_tingin, "
					+ "i.kyujin_tingin_keitai,"
					+ " d.dept_id,"
					+ " k.kyujinkaisya_id "
					+ "FROM kyujin_info i "
					+ 	"JOIN kyujin_dept d "
					+ 		"USING(dept_id) "
					+ 	"JOIN kyujinkaisya k "
					+		 "USING(kyujinkaisya_id)"
					+ "WHERE kyujin_id = ?"
					);
			//?の部分に求人IDを設定する
			ps.setInt(1, kyujinId);
			//sql文の実行
			rs = ps.executeQuery();

			while(rs.next()) {
				bean.setKyujinId(kyujinId);
				bean.setKaisyaName(rs.getString("kaisya_name"));
				bean.setKaisyaNameFurigana(rs.getString("kaisya_name_furigana"));
				bean.setZyusyo(rs.getString("zyusyo"));
				bean.setDeptName(rs.getString("dept_name"));
				bean.setTantousya(rs.getString("tantousya"));
				bean.setTantousyaFurigana(rs.getString("tantousya_furigana"));
				bean.setRenrakusaki(rs.getString("renrakusaki"));
				bean.setUketukenengappi(rs.getString("kyujin_uketukenengappi"));
				bean.setYuukoukikanStart(rs.getString("kyujin_yukokikan_start"));
				bean.setYuukoukikanEnd(rs.getString("kyujin_yukokikan_end"));
				bean.setKyujinsuu(rs.getInt("kyujinsuu"));
				bean.setSyokusyu(rs.getString("kyujin_syokusyu"));
				bean.setSyugyobasyo(rs.getString("kyujin_syuugyoubasyo"));
				bean.setKoyoukikanStart(rs.getString("kyujin_koyoukikan_start"));
				bean.setKoyoukikanEnd(rs.getString("kyujin_koyoukikan_end"));
				bean.setTingin(rs.getInt("kyujin_tingin"));
				bean.setTinginKeitai(rs.getString("kyujin_tingin_keitai"));
				bean.setDeptId(rs.getInt("dept_id"));
				bean.setKaisyaId(rs.getInt("kyujinkaisya_id"));

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
//求人編集
	public void updateKyujin(int kyujinId, String KaisyaName,String zyusyo, String renrakusaki, String dept_name, String tantousya, String uketukenengappi,String YuukoukikanStart,String YuukoukikanEnd, int kyujinsuu, String syokusyu , String syugyobasyo, String koyoukikanStart,String koyoukikanEnd, int tingin, String tingin_keitai, int kyujinkaisya_id, int dept_id,String KaisyaNameFurigana,String TantousyaFurigana) throws SQLException {

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(
					"update "
					+ 	"kyujinkaisya, "
					+ 	"kyujin_dept , "
					+ 	"kyujin_info "
					+ "set	"
					+ 	"kaisya_name = ?,"
					+ 	"zyusyo = ?,"
					+ 	"dept_name = ?,"
					+ 	"renrakusaki = ?,"
					+ 	"kyujin_uketukenengappi = ?,	"
					+ 	"kyujin_yukokikan_start = ?,	"
					+ 	"kyujin_yukokikan_end = ?,"
					+ 	"kyujinsuu = ?, "
					+ 	"kyujin_syokusyu = ?, "
					+ 	"kyujin_syuugyoubasyo = ?,"
					+ 	"kyujin_koyoukikan_start = ?,"
					+ 	"kyujin_koyoukikan_end = ?,"
					+ 	"kyujin_tingin = ?,"
					+ 	"kyujin_tingin_keitai = ?,"
					+ "kyujin_info.dept_id = ?,"
					+ "kaisya_name_furigana =?,"
					+ "tantousya_furigana = ?"
					+ " WHERE "
					+ 	"kyujin_info.kyujin_id = ?  "
					+ 	"AND kyujin_dept.dept_id = ? "
					+ 	"AND kyujinkaisya.kyujinkaisya_id = ? "
					);

			ps.setString(1, KaisyaName);
			ps.setString(2, zyusyo);
			ps.setString(3, dept_name);
			ps.setString(4,renrakusaki);
			ps.setString(5, uketukenengappi);
			ps.setString(6, YuukoukikanStart );
			ps.setString(7, YuukoukikanEnd );
			ps.setInt(8,kyujinsuu );
			ps.setString(9,syokusyu );
			ps.setString(10, syugyobasyo);
			ps.setString(11, koyoukikanStart);
			ps.setString(12, koyoukikanEnd);
			ps.setInt(13, tingin);
			ps.setString(14, tingin_keitai);
			ps.setInt(15, dept_id);
			ps.setString(16, KaisyaNameFurigana);
			ps.setString(17, TantousyaFurigana);
			ps.setInt(18, kyujinId);
			ps.setInt(19, dept_id);
			ps.setInt(20, kyujinkaisya_id);

			ps.executeUpdate();

		}catch(ClassNotFoundException e){
			System.out.println("[Error]ClassNotFoundException");
		}catch(SQLException e) {
			System.out.println("[Error]SQLException");
		}finally {
			close();
		}

	}
//会社表用insert
	public void insertKyujin(String kaisyaName,String kaisyaNameFurigana,String zyusyo,String deptName,String tantouya,String tantousyaFurigana,String renrakusaki) throws SQLException{
		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(
					 " INSERT INTO kyujinkaisya(kaisya_name,kaisya_name_furigana,zyusyo) "
					+ " VALUE(?,?,?); "
					);

			ps.setString(1, kaisyaName);
			ps.setString(2, kaisyaNameFurigana);
			ps.setString(3, zyusyo);


			ps.executeUpdate();
			ps = con.prepareStatement(
					" INSERT INTO kyujin_dept(dept_name,tantousya,tantousya_furigana,renrakusaki,kyujinkaisya_id) "
					+ " SELECT ?,?,?,?,LAST_INSERT_ID() FROM dual; "
					);

			ps.setString(1, deptName);
			ps.setString(2, tantouya);
			ps.setString(3, tantousyaFurigana);
			ps.setString(4, renrakusaki);
			ps.executeUpdate();

		}catch(ClassNotFoundException e){
			System.out.println("[Error]ClassNotFoundException");
		}catch(SQLException e) {
			System.out.println("[Error]SQLException");
		}finally {
			close();
		}

	}

//会社ID取得

	public KyujinBean selectKyujin(String kaisyaName,String zyusyo){

		KyujinBean bean = new KyujinBean();

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("SELECT kyujinkaisya_id FROM kyujinkaisya WHERE kaisya_name = ? AND zyusyo = ?");
			//?の部分に求人IDを設定する
			ps.setString(1,kaisyaName);
			ps.setString(2,zyusyo);
			rs = ps.executeQuery();
			while(rs.next()) {

				bean.setKaisyaId(rs.getInt("kyujinkaisya_id"));
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

//dept表用insert
	public int insertKyujin(String dept_name, String renrakusaki, String tantousya,String furigana , int kyujinkaisya_id)throws SQLException {
		int deptId = 0;
		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(
					"insert into kyujin_dept "
					+ "(dept_name, "
					+ "tantousya,"
					+ " tantousya_furigana, "
					+ "renrakusaki, "
					+ "kyujinkaisya_id) "
					+ "value(?,?,?,?,?)");

			ps.setString(1, dept_name);
			ps.setString(2, tantousya);
			ps.setString(3, furigana);
			ps.setString(4, renrakusaki);
			ps.setInt(5, kyujinkaisya_id);

			ps.executeUpdate();

			ps = con.prepareStatement(
					" SELECT LAST_INSERT_ID() AS dept_id  "
					+ " 	 "
					);
			rs = ps.executeQuery();

			while (rs.next()) {
				deptId = rs.getInt("dept_id");
			}


		}catch(ClassNotFoundException e){
			System.out.println("[Error]ClassNotFoundException");
		}catch(SQLException e) {
			System.out.println("[Error]SQLException");
		}finally {
			close();
		}
		return deptId;
	}

//	deptID取得用
	public KyujinBean selectKyujin(String deptName, String tantousya, String renrakusaki){

		KyujinBean bean = new KyujinBean();

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("SELECT dept_id "
					+ "FROM  kyujin_dept "
					+ "	WHERE dept_name = ?"
					+ "	AND tantousya = ?"
					+ "	AND renrakusaki = ?");
			//?の部分に求人IDを設定する
			ps.setString(1,deptName);
			ps.setString(2,tantousya);
			ps.setString(3,renrakusaki);

			rs = ps.executeQuery();
			while(rs.next()) {

				bean.setDeptId(rs.getInt("dept_id"));
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





//kyujin_info用insert
	public void insertKyujin(String uketukenengappi,String YuukoukikanStart,String YuukoukikanEnd,int kyujinsuu, String syokusyu , String syugyobasyo, String koyoukikanStart,String koyoukikanEnd, int tingin,String tingin_keitai, int dept_id) throws SQLException {

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(
					"insert into kyujin_info "
					+ 	"(kyujin_uketukenengappi, "
					+ 	"kyujin_yukokikan_start,"
					+ 	"kyujin_yukokikan_end ,"
					+ 	"kyujinsuu, "
					+ 	"kyujin_syokusyu, "
					+ 	"kyujin_syuugyoubasyo, "
					+ 	"kyujin_koyoukikan_start,"
					+ 	"kyujin_koyoukikan_end, "
					+ 	"kyujin_tingin,"
					+ 	"kyujin_tingin_keitai, "
					+ 	"dept_id,"
					+ 	"kyujin_view) "
					+ "values(?,?,?,?,?,?,?,?,?,?,?,1)"
					);

			ps.setString(1, uketukenengappi);
			ps.setString(2, YuukoukikanStart);
			ps.setString(3, YuukoukikanEnd);
			ps.setInt(4, kyujinsuu);
			ps.setString(5, syokusyu);
			ps.setString(6, syugyobasyo );
			ps.setString(7, koyoukikanStart);
			ps.setString(8, koyoukikanEnd);
			ps.setInt(9, tingin);
			ps.setString(10, tingin_keitai);
			ps.setInt(11, dept_id);

			ps.executeUpdate();
		}catch(ClassNotFoundException e){
			System.out.println("[Error]ClassNotFoundException");
		}catch(SQLException e) {
			System.out.println("[Error]SQLException");
		}finally {
			close();
		}

	}

//会社検索用
	public ArrayList<KyujinBean> kyujinSearch(String KaisyaName){

		ArrayList<KyujinBean> beanList = new ArrayList<>();

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(
							" SELECT "
							+ " DISTINCT "
							+ 	" k.kaisya_name,"
							+ 	" k.kyujinkaisya_id,  "
							+ 	" k.zyusyo "
							+" FROM  kyujinkaisya k "
							+" WHERE kaisya_view = 1 "

					);


			// ps.setString(1, KaisyaName);
			//sql文の実行
			rs = ps.executeQuery();

			//rsから実行結果を取り出す
			while(rs.next()) {
				KyujinBean bean = new KyujinBean();
				bean.setKaisyaName(rs.getString("k.kaisya_name"));
				bean.setKaisyaId(rs.getInt("k.kyujinkaisya_id"));
				bean.setZyusyo(rs.getString("k.zyusyo"));
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

	public ArrayList<KyujinBean> deptSearch(){

		ArrayList<KyujinBean> beanList = new ArrayList<>();

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(
							" SELECT "
							+ 	" dept_id,"
							+ 	" tantousya,  "
							+ 	" renrakusaki,"
							+ 	" kyujinkaisya_id"
							+" FROM  kyujin_dept "

					);


			// ps.setString(1, KaisyaName);
			//sql文の実行
			rs = ps.executeQuery();

			//rsから実行結果を取り出す
			while(rs.next()) {
				KyujinBean bean = new KyujinBean();
				bean.setDeptId(rs.getInt("dept_id"));
				bean.setTantousya(rs.getString("tantousya"));
				bean.setRenrakusaki(rs.getString("renrakusaki"));
				bean.setKaisyaId(rs.getInt("kyujinkaisya_id"));
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

	//部署情報取得用 20190809 - Rev.02_Start

		public ArrayList<KyujinBean> deptSerch(int kaisyaId){

			ArrayList<KyujinBean> beanList = new ArrayList<>();

			try {
				//JCBDドライバーのロード
				Class.forName("com.mysql.jdbc.Driver");
				//データーベースへの接続
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
				//ステートメントの作成
				ps = con.prepareStatement(
								" SELECT "
								+ 	"dept_id, "
								+ "dept_name,"
								+ "tantousya, "
								+ "tantousya_furigana, "
								+ "renrakusaki "
								+" FROM  kyujin_dept "
								+" WHERE kyujinkaisya_id = ?;"
						);


				  ps.setInt(1, kaisyaId);
				//sql文の実行
				rs = ps.executeQuery();

				//rsから実行結果を取り出す
				while(rs.next()) {
					KyujinBean bean = new KyujinBean();
					bean.setDeptId(rs.getInt("dept_id"));
					bean.setTantousya(rs.getString("tantousya"));
					bean.setTantousyaFurigana(rs.getString("tantousya_furigana"));
					bean.setRenrakusaki(rs.getString("renrakusaki"));
					bean.setDeptName(rs.getString("dept_name"));
					beanList.add(bean);
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
			return beanList;

		}
	//  End
//会社、部門情報検索用select
	public KyujinBean selectKyujin1(int kyujinId) {

		KyujinBean bean = new KyujinBean();

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement(
					"SELECT "
					+	 "k.kaisya_name, "
					+	 "k.zyusyo,"
					+	 "d.dept_name, "
					+	 "d.tantousya, "
					+	 "d.renrakusaki "
					+ "FROM  kyujin_dept d "
					+ 	"JOIN kyujinkaisya k "
					+		"USING(kyujinkaisya_id)"
					+ "WHERE dept_id = ?");
			//?の部分に求人IDを設定する
			ps.setInt(1, kyujinId);
			//sql文の実行
			rs = ps.executeQuery();

			while(rs.next()) {
				bean.setKaisyaName(rs.getString("kaisya_name"));
				bean.setZyusyo(rs.getString("zyusyo"));
				bean.setDeptName(rs.getString("dept_name"));
				bean.setTantousya(rs.getString("tantousya"));
				bean.setRenrakusaki(rs.getString("renrakusaki"));

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

//会社検索用
	public KyujinBean selectKyujin2(int kyujinId) {

		KyujinBean kbean = new KyujinBean();

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("SELECT kaisya_name, zyusyo FROM kyujinkaisya WHERE kyujinkaisya_id = ?");

			//?の部分に求人IDを設定する
			ps.setInt(1, kyujinId);
			//sql文の実行
			rs = ps.executeQuery();

			while(rs.next()) {
				kbean.setKaisyaName(rs.getString("kaisya_name"));
				kbean.setZyusyo(rs.getString("zyusyo"));

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
		return kbean;
	}


//削除用updata
	public void updateKyujin(int kyujinId) throws SQLException{

		try {
			//JCBDドライバーのロード
			Class.forName("com.mysql.jdbc.Driver");
			//データーベースへの接続
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/kyujinkyusyoku", "inofex","inofex");
			//ステートメントの作成
			ps = con.prepareStatement("update kyujin_info set kyujin_view = 0 WHERE kyujin_id = ?");
			ps.setInt(1, kyujinId);
			//sql文の実行
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
