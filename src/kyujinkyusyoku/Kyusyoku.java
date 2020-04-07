package kyujinkyusyoku;

import java.util.ArrayList;

public class Kyusyoku {
/*
 *	//求職情報を取得する
 *	public ArrayList<KyusyokuBean> getKyusyoku(){
 *	 	KyusyokuDao kdao = new KyusyokuDao ();
 *		ArrayList<KyusyokuBean> kyusyokuList = new ArrayList<> ();
 * 		kyusyokuList = kdao.selectKyusyoku();
 *		return kyusyokuList;
 *	}
 */
	//ページネーション用レコード数
		public KyusyokuBean getKyusyoku(String kyusyokuName, String uketukenengappi, String kibousyokusyu) {

			KyusyokuDao kdao = new KyusyokuDao();
			KyusyokuBean bean = new KyusyokuBean();
			bean = kdao.selectKyusyoku2(kyusyokuName, uketukenengappi, kibousyokusyu);
			return bean;
		}

	//求職一覧を取得する
	public KyusyokuBean getKyusyoku(int kyusyokuId) {				//変更No.009_kim データ型変更
		KyusyokuDao kdao = new KyusyokuDao ();
		KyusyokuBean bean = new KyusyokuBean ();
		bean = kdao.selectKyusyoku(kyusyokuId);
		return bean;
	}

	//求職検索情報を取得する
	public ArrayList<KyusyokuBean> getKyusyoku(String kyusyokuName, String uketukenengappi, String kibousyokusyu, int currentPageNumber, String sort){
		KyusyokuDao kdao = new KyusyokuDao ();
		ArrayList<KyusyokuBean> kyusyokuList = new ArrayList<>();
		kyusyokuList = kdao.kyusyokuSearch(kyusyokuName, uketukenengappi, kibousyokusyu, currentPageNumber, sort);
		return kyusyokuList;
	}

	public ArrayList<KyusyokuBean> getKyusyoku(String kyusyokuName){

		KyusyokuDao kdao = new KyusyokuDao ();
		ArrayList<KyusyokuBean> kyusyokuList = new ArrayList<>();
		kyusyokuList = kdao.kyusyokuSearch(kyusyokuName);
		return kyusyokuList;

	}

	public KyusyokuBean getKyusyoku1(int kyusyokuId) {

		KyusyokuDao kdao = new KyusyokuDao();
		KyusyokuBean bean = new KyusyokuBean();
		bean = kdao.selectKyusyoku1(kyusyokuId);
		return bean;
	}

}
