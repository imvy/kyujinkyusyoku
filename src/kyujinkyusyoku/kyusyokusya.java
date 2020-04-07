package kyujinkyusyoku;

public class kyusyokusya {

	public kyusyokusyaBean getKyusyokusya(String id) {

		kyusyokusyaDao ksdao = new kyusyokusyaDao();
		kyusyokusyaBean ksbean = new kyusyokusyaBean();
		ksbean = ksdao.selectKyusyokusya(id);
		return ksbean;
	}

}
