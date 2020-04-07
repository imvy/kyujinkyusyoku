package kyujinkyusyoku;

import java.io.Serializable;

public class KyujinkaisyaBean implements Serializable{

	private static final long serialVersionUID = 1L;

	private int kyujinkaisyaId;
	private String kaisyaName;
	private String kaisyaNameFurigana;
	private String zyusyo;
	private int kaisyaView;
	private String renrakusaki1;
	private String renrakusaki2;
	private String userId;

	public KyujinkaisyaBean() {
		kyujinkaisyaId = 0;
		kaisyaName = "";
		kaisyaNameFurigana = "";
		zyusyo = "";
		kaisyaView = 0;
		renrakusaki1 = "";
		renrakusaki2 = "";
		userId = "";
	}

	public int getKyujinkaisyaId() {
		return kyujinkaisyaId;
	}

	public void setKyujinkaisyaId(int kyujinkaisyaId) {
		this.kyujinkaisyaId = kyujinkaisyaId;
	}

	public String getKaisyaName() {
		return kaisyaName;
	}

	public void setKaisyaName(String kaisyaName) {
		this.kaisyaName = kaisyaName;
	}

	public String getKaisyaNameFurigana() {
		return kaisyaNameFurigana;
	}

	public void setKaisyaNameFurigana(String kaisyaNameFurigana) {
		this.kaisyaNameFurigana = kaisyaNameFurigana;
	}

	public String getZyusyo() {
		return zyusyo;
	}

	public void setZyusyo(String zyusyo) {
		this.zyusyo = zyusyo;
	}

	public int getKaisyaView() {
		return kaisyaView;
	}

	public void setKaisyaView(int kaisyaView) {
		this.kaisyaView = kaisyaView;
	}

	public String getRenrakusaki1() {
		return renrakusaki1;
	}

	public void setRenrakusaki1(String renrakusaki1) {
		this.renrakusaki1 = renrakusaki1;
	}

	public String getRenrakusaki2() {
		return renrakusaki2;
	}

	public void setRenrakusaki2(String renrakusaki2) {
		this.renrakusaki2 = renrakusaki2;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

}
