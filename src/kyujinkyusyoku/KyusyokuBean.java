package kyujinkyusyoku;

import java.io.Serializable;

public class KyusyokuBean implements Serializable{

	private static final long serialVersionUID = 1L;
	private int kyusyokusyaId;              // 変更No.002_kim カラム追加_20190701
	private String kyusyokuName;
	private String jyusyo;
	private String seinengappi;
	private String renrakusakiKyusyokusya;            // 変更No.002_kim カラム追加_20190701 変更No.006_kim カラム名変更_20190703
	private int kyusyokuId;
	private String kibousyokusyu;
	private String uketukenengappi;
	private String yuukoukikanStart;                  // 変更No.001_kim カラム追加・削除_20190629 - Start
	private String yuukoukikanEnd;
	private String saiyouHusaiyou;
	private String syoukaiDay;
	private String saiyouDay;
	private String tensyokukansyouEnd;
	private String roudoukeiyaku;
	private String risyokujoukyou;
	private String henreikin;
	private int kyujinId;
	private String kyusyokuJoukyou;                  // 変更No.001_kim カラム追加・削除_20190629 - End 変更No.002_kim カラム追加_20190701
	private int deptId;                             // 変更No.003_kim カラム追加_20190702 - Start
	private int kyujinkaisyaId;
	private String kaisyaName;
	private int currentPageNumber;
	private int allPageCount;
	private int allRecordCount;
	private int pageRangeSize;
	// 変更No.003_kim カラム追加_20190702 - End
	private String kyusyokuNameFurigana;

	public KyusyokuBean() {
		kyusyokusyaId = 0;                   // 変更No.002_kim カラム追加_20190701
		kyusyokuName = "";
		jyusyo = "";
		seinengappi = "";
		renrakusakiKyusyokusya = "";                    // 変更No.002_kim カラム追加_20190701 変更No.006_kim カラム名変更_20190703
		kyusyokuId = 0;
		kibousyokusyu = "";
		uketukenengappi = "";
		// 変更No.001_kim カラム追加・削除_20190629 - Start
		yuukoukikanStart = "";
		yuukoukikanEnd = "";
		saiyouHusaiyou = "";
		syoukaiDay = "";
		saiyouDay = "";
		tensyokukansyouEnd = "";
		roudoukeiyaku = "";
		risyokujoukyou = "";
		henreikin = "";									// 変更No.007_kim データ型変更_20190703
		kyujinId = 0;
		kyusyokuJoukyou = "";				// 変更No.002_kim カラム追加_20190701
		// 変更No.001_kim カラム追加・削除_20190629 - End
		// 変更No.003_kim カラム追加_20190702 - Start
		deptId = 0;
		kyujinkaisyaId = 0;
		kaisyaName = "";
		// 変更No.003_kim カラム追加_20190702 - End
	}

	// 変更No.002_kim カラム追加_20190701 = Start
	public int getKyusyokusyaId() {
		return kyusyokusyaId;
	}

	public void setKyusyokusyaId(int kyusyokusyaId) {
		this.kyusyokusyaId = kyusyokusyaId;
	}

	// 変更No.002_kim カラム追加_20190701 = End

	public String getKyusyokuName() {
		return kyusyokuName;
	}

	public void setKyusyokuName(String kyusyokuName) {
		this.kyusyokuName = kyusyokuName;
	}

	public String getJyusyo() {
		return jyusyo;
	}

	public void setJyusyo(String jyusyo) {
		this.jyusyo = jyusyo;
	}

	public String getSeinengappi() {
		return seinengappi;
	}

	public void setSeinengappi(String seinengappi) {
		this.seinengappi = seinengappi;
	}

	// 変更No.002_kim カラム追加_20190701 - Start	変更No.006_kim カラム名変更_20190703 - Stsrt

	public String getRenrakusakiKyusyokusya() {
		return renrakusakiKyusyokusya;
	}

	public void setRenrakusakiKyusyokusya(String renrakusakiKyusyokusya) {
		this.renrakusakiKyusyokusya = renrakusakiKyusyokusya;
	}

	// 変更No.002_kim カラム追加_20190701 - End 	変更No.006_kim カラム名変更_20190703 - End

	public int getKyusyokuId() {
		return kyusyokuId;
	}

	public void setKyusyokuId(int kyusyokuId) {
		this.kyusyokuId = kyusyokuId;
	}

	public String getKibousyokusyu() {
		return kibousyokusyu;
	}

	public void setKibousyokusyu(String kibousyokusyu) {
		this.kibousyokusyu = kibousyokusyu;
	}

	public String getUketukenengappi() {
		return uketukenengappi;
	}

	public void setUketukenengappi(String uketukenengappi) {
		this.uketukenengappi = uketukenengappi;
	}

	// 変更No.001_kim カラム追加・削除_20190629 - Start
	public String getYuukoukikanStart() {
		return yuukoukikanStart;
	}

	public void setYuukoukikanStart(String yuukoukikanStart) {
		this.yuukoukikanStart = yuukoukikanStart;
	}

	public String getYuukoukikanEnd() {
		return yuukoukikanEnd;
	}

	public void setYuukoukikanEnd(String yuukoukikanEnd) {
		this.yuukoukikanEnd = yuukoukikanEnd;
	}

	public String getSaiyouHusaiyou() {
		return saiyouHusaiyou;
	}

	public void setSaiyouHusaiyou(String saiyouHusaiyou) {
		this.saiyouHusaiyou = saiyouHusaiyou;
	}

	public String getSyoukaiDay() {
		return syoukaiDay;
	}

	public void setSyoukaiDay(String syoukaiDay) {
		this.syoukaiDay = syoukaiDay;
	}

	public String getSaiyouDay() {
		return saiyouDay;
	}

	public void setSaiyouDay(String saiyouDay) {
		this.saiyouDay = saiyouDay;
	}

	public String getTensyokukansyouEnd() {
		return tensyokukansyouEnd;
	}

	public void setTensyokukansyouEnd(String tensyokukansyouEnd) {
		this.tensyokukansyouEnd = tensyokukansyouEnd;
	}

	public String getRoudoukeiyaku() {
		return roudoukeiyaku;
	}

	public void setRoudoukeiyaku(String roudoukeiyaku) {
		this.roudoukeiyaku = roudoukeiyaku;
	}

	public String getRisyokujoukyou() {
		return risyokujoukyou;
	}

	public void setRisyokujoukyou(String risyokujoukyou) {
		this.risyokujoukyou = risyokujoukyou;
	}

	// 変更No.007_kim データ型変更_20190703 - Start
	public String getHenreikin() {
		return henreikin;
	}

	public void setHenreikin(String henreikin) {
		this.henreikin = henreikin;
	}
	// 変更No.007_kim データ型変更_20190703 - End

	public int getKyujinId() {
		return kyujinId;
	}

	public void setKyujinId(int kyujinId) {
		this.kyujinId = kyujinId;
	}

	// 変更No.002_kim カラム追加_20190701 = Stsrt
	public String getKyusyokuJoukyou() {
		return kyusyokuJoukyou;
	}

	public void setKyusyokuJoukyou(String kyusyokuJoukyou) {
		this.kyusyokuJoukyou = kyusyokuJoukyou;
	}
	// 変更No.002_kim カラム追加_20190701 = End
	// 変更No.001_kim カラム追加・削除_20190629 - End

	// 変更No.003_kim カラム追加_20190702 - Start
	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
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

	public int getCurrentPageNumber() {
		return currentPageNumber;
	}

	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}

	public int getAllPageCount() {
		return allPageCount;
	}

	public void setAllPageCount(int allPageCount) {
		this.allPageCount = allPageCount;
	}

	public int getAllRecordCount() {
		return allRecordCount;
	}

	public void setAllRecordCount(int allRecordCount) {
		this.allRecordCount = allRecordCount;
	}

	public int getPageRangeSize() {
		return pageRangeSize;
	}

	public void setPageRangeSize(int pageRangeSize) {
		this.pageRangeSize = pageRangeSize;
	}

	public String getKyusyokuNameFurigana() {
		return kyusyokuNameFurigana;
	}

	public void setKyusyokuNameFurigana(String kyusyokuNameFurigana) {
		this.kyusyokuNameFurigana = kyusyokuNameFurigana;
	}

	// 変更No.003_kim カラム追加_20190702 - End


}
