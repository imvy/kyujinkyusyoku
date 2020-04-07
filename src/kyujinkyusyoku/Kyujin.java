package kyujinkyusyoku;

import java.util.ArrayList;

public class Kyujin {

	//求人情報を取得する
	public KyujinBean getKyujin(int kyujinId) {

		KyujinDao kdao = new KyujinDao();
		KyujinBean bean = new KyujinBean();
		bean = kdao.selectKyujin(kyujinId);
		return bean;
	}
//ページネーション用レコード数
	public KyujinBean getKyujin(String kaisyaName, String uketukenengappi, String syokusyu) {

		KyujinDao kdao = new KyujinDao();
		KyujinBean bean = new KyujinBean();
		bean = kdao.selectKyujin2(kaisyaName, uketukenengappi, syokusyu);
		return bean;
	}


	public ArrayList<KyujinBean> getKyujin(String kaisyaName){

		KyujinDao kdao = new KyujinDao ();
		ArrayList<KyujinBean> kaisyaList = new ArrayList<>();
		kaisyaList = kdao.kyujinSearch(kaisyaName);
		return kaisyaList;

	}
	public ArrayList<KyujinBean> getDept(){

		KyujinDao kdao = new KyujinDao ();
		ArrayList<KyujinBean> deptList = new ArrayList<>();
		deptList = kdao.deptSearch();
		return deptList;

	}

	//会社、部署検索用
	public KyujinBean getKyujin1(int kyujinId) {

		KyujinDao kdao = new KyujinDao();
		KyujinBean bean = new KyujinBean();
		bean = kdao.selectKyujin1(kyujinId);
		return bean;
	}


	 //会社検索用
	public KyujinBean getKyujin2(int kyujinId) {

		KyujinDao kdao = new KyujinDao();
		KyujinBean kbean = new KyujinBean();
		kbean = kdao.selectKyujin2(kyujinId);
		return kbean;
	}

	//部署情報取得用 20190809 - Rev.01_Start
		public ArrayList<KyujinBean> getDept(int kaisyaId) {
			KyujinDao kdao = new KyujinDao();
			ArrayList<KyujinBean> deptList = new ArrayList<>();
			deptList = kdao.deptSerch(kaisyaId);
			return deptList;
		}
		// End

}
