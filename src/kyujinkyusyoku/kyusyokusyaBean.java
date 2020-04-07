package kyujinkyusyoku;

import java.io.Serializable;

public class kyusyokusyaBean implements Serializable{

	private static final long serialVersionUID = 1L;

	private int kyusyokusyaId;
	private String kyusyokusyaName;
	private String kyusyokusyaNameFurigana;
	private String kyusyokusyaZyusyo;
	private String kyusyokusyaSeinengappi;
	private String renrakusakiKyusyokusya;
	private String id;
	private int kyusyokusyaView;

	public kyusyokusyaBean(){
		kyusyokusyaId = 0;
		kyusyokusyaName = "";
		kyusyokusyaNameFurigana = "";
		kyusyokusyaZyusyo = "";
		kyusyokusyaSeinengappi = "";
		renrakusakiKyusyokusya = "";
		id = "";
		kyusyokusyaView = 0;
	}

	public int getKyusyokusyaId() {
		return kyusyokusyaId;
	}

	public void setKyusyokusyaId(int kyusyokusyaId) {
		this.kyusyokusyaId = kyusyokusyaId;
	}

	public String getKyusyokusyaName() {
		return kyusyokusyaName;
	}

	public void setKyusyokusyaName(String kyusyokusyaName) {
		this.kyusyokusyaName = kyusyokusyaName;
	}

	public String getKyusyokusyaNameFurigana() {
		return kyusyokusyaNameFurigana;
	}

	public void setKyusyokusyaNameFurigana(String kyusyokusyaNameFurigana) {
		this.kyusyokusyaNameFurigana = kyusyokusyaNameFurigana;
	}

	public String getKyusyokusyaZyusyo() {
		return kyusyokusyaZyusyo;
	}

	public void setKyusyokusyaZyusyo(String kyusyokusyaZyusyo) {
		this.kyusyokusyaZyusyo = kyusyokusyaZyusyo;
	}

	public String getKyusyokusyaSeinengappi() {
		return kyusyokusyaSeinengappi;
	}

	public void setKyusyokusyaSeinengappi(String kyusyokusyaSeinengappi) {
		this.kyusyokusyaSeinengappi = kyusyokusyaSeinengappi;
	}

	public String getRenrakusakiKyusyokusya() {
		return renrakusakiKyusyokusya;
	}

	public void setRenrakusakiKyusyokusya(String renrakusakiKyusyokusya) {
		this.renrakusakiKyusyokusya = renrakusakiKyusyokusya;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getKyusyokusyaView() {
		return kyusyokusyaView;
	}

	public void setKyusyokusyaView(int kyusyokusyaView) {
		this.kyusyokusyaView = kyusyokusyaView;
	}

}
