package kyujinkyusyoku;

public class tantouListFetchModel {

	private int deptId;
	private String deptName;
	private String tantousya;
	private String tantousyaFurigana;
	private String renrakusaki;
	private int kyujinkaisyaId;
	private int deptView;

	public int getDeptId() {
		return deptId;
	}
	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}

	public String getTantousya() {
		return tantousya;
	}
	public void setTantousya(String tantousya) {
		this.tantousya = tantousya;
	}

	public String getTantousyaFurigana() {
		return tantousyaFurigana;
	}
	public void setTantousyaFurigana(String tantousyaFurigana) {
		this.tantousyaFurigana = tantousyaFurigana;
	}

	public String getRenrakusaki() {
		return renrakusaki;
	}
	public void setRenrakusaki(String renrakusaki) {
		this.renrakusaki = renrakusaki;
	}

	public int getKyujinkaisyaId() {
		return kyujinkaisyaId;
	}
	public void setKyujinkaisyaId(int kyujinkaisyaId) {
		this.kyujinkaisyaId = kyujinkaisyaId;
	}

	public int getDeptView() {
		return deptView;
	}
	public void setDeptView(int deptView) {
		this.deptView = deptView;
	}
}
