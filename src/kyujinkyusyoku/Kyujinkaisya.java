package kyujinkyusyoku;

public class Kyujinkaisya {


	//user_idのよって会社情報取る
	public KyujinkaisyaBean getKyujinkaisya (String user_id) {

		KyujinkaisyaDao kjdao = new KyujinkaisyaDao();
		KyujinkaisyaBean kjbean = new KyujinkaisyaBean();
		kjbean = kjdao.selectKyujinkaisya(user_id);

		return kjbean;
	}

}
