package kyujinkyusyoku;

import java.io.Serializable;

public class KyujinBean implements Serializable{ //chuyen doi trang thai doi tuong

	private static final long serialVersionUID = 1L;
	private int kyujinId;
	private int deptId;//20190702追記
	private int kaisyaId;//20190702追記
	private String kaisyaName;
	private String zyusyo;
	private String deptName;//20190702追記
	private String tantousya;//20190702追記
	private String renrakusaki;
	private String uketukenengappi;
	private String yuukoukikanStart;
	private String yuukoukikanEnd;
	private int kyujinsuu;
	private String syokusyu;
	private String syugyobasyo;
	private String koyoukikanStart;
	private String koyoukikanEnd;
	private int tingin;
	private String tinginKeitai;
	private int currentPageNumber;//20190712
	private int allPageCount;//20190712
	private int allRecordCount;//20190712
	private int pageRangeSize;//20190712
	private String kaisyaNameFurigana;//20190826
	private String tantousyaFurigana;






	public KyujinBean() {

		kyujinId = 0;
		deptId = 0;//20190702追記
		kaisyaId = 0;//20190702追記
		kaisyaName = "";
		zyusyo = "";
		deptName = "";//20190702追記
		tantousya = "";//20190702追記
		renrakusaki = "";
		uketukenengappi = "";
		yuukoukikanStart = "";
		yuukoukikanEnd = "";
		kyujinsuu = 0;
		syokusyu = "";
		koyoukikanStart = "";
		koyoukikanEnd = "";
		tingin = 0;
		tinginKeitai = "";
		currentPageNumber = 0;//20190712
		allPageCount = 0;//20190712
		allRecordCount = 0;//20190712
		pageRangeSize = 0;//20190712
		kaisyaNameFurigana = "";
		tantousyaFurigana = "";

	}






	public int getKyujinId() {
		return kyujinId;
	}






	public void setKyujinId(int kyujinId) {
		this.kyujinId = kyujinId;
	}






	public int getDeptId() {
		return deptId;
	}






	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}






	public int getKaisyaId() {
		return kaisyaId;
	}






	public void setKaisyaId(int kaisyaId) {
		this.kaisyaId = kaisyaId;
	}






	public String getKaisyaName() {
		return kaisyaName;
	}






	public void setKaisyaName(String kaisyaName) {
		this.kaisyaName = kaisyaName;
	}






	public String getZyusyo() {
		return zyusyo;
	}






	public void setZyusyo(String zyusyo) {
		this.zyusyo = zyusyo;
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






	public String getRenrakusaki() {
		return renrakusaki;
	}






	public void setRenrakusaki(String renrakusaki) {
		this.renrakusaki = renrakusaki;
	}






	public String getUketukenengappi() {
		return uketukenengappi;
	}






	public void setUketukenengappi(String uketukenengappi) {
		this.uketukenengappi = uketukenengappi;
	}






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






	public int getKyujinsuu() {
		return kyujinsuu;
	}






	public void setKyujinsuu(int kyujinsuu) {
		this.kyujinsuu = kyujinsuu;
	}






	public String getSyokusyu() {
		return syokusyu;
	}






	public void setSyokusyu(String syokusyu) {
		this.syokusyu = syokusyu;
	}






	public String getSyugyobasyo() {
		return syugyobasyo;
	}






	public void setSyugyobasyo(String syugyobasyo) {
		this.syugyobasyo = syugyobasyo;
	}






	public String getKoyoukikanStart() {
		return koyoukikanStart;
	}






	public void setKoyoukikanStart(String koyoukikanStart) {
		this.koyoukikanStart = koyoukikanStart;
	}






	public String getKoyoukikanEnd() {
		return koyoukikanEnd;
	}






	public void setKoyoukikanEnd(String koyoukikanEnd) {
		this.koyoukikanEnd = koyoukikanEnd;
	}






	public int getTingin() {
		return tingin;
	}






	public void setTingin(int tingin) {
		this.tingin = tingin;
	}






	public String getTinginKeitai() {
		return tinginKeitai;
	}






	public void setTinginKeitai(String tinginKeitai) {
		this.tinginKeitai = tinginKeitai;
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






	public String getKaisyaNameFurigana() {
		return kaisyaNameFurigana;
	}






	public void setKaisyaNameFurigana(String kaisyaNameFurigana) {
		this.kaisyaNameFurigana = kaisyaNameFurigana;
	}






	public String getTantousyaFurigana() {
		return tantousyaFurigana;
	}






	public void setTantousyaFurigana(String tantousyaFurigana) {
		this.tantousyaFurigana = tantousyaFurigana;
	}






	public static long getSerialversionuid() {
		return serialVersionUID;
	}


















}
