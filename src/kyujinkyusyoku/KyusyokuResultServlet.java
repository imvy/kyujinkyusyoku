	package kyujinkyusyoku;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class KyusyokuResultServlet
 */
@WebServlet("/KyusyokuResultServlet")
public class KyusyokuResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyusyokuResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */ protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 // TODO Auto-generated method stub
		 request.setCharacterEncoding("UTF-8");
		 String btn = request.getParameter("submit6");
		 HttpSession session = request.getSession();
		 RequestDispatcher rd = null;
		 KyusyokuBean kbean = new KyusyokuBean();

/* 変更No.043_kim ソース変更 - Start*/
		KyusyokuDao kdao = new KyusyokuDao();

		switch(btn) {

			case "更新" :

					kbean = (KyusyokuBean) session.getAttribute("kyusyokuList1");

//		 String kyusyokuId = kbean.getKyusyokuId();                                            変更No.015_kim 変数の編集・追加 - Start
		 int    kyusyokusyaId           = kbean.getKyusyokusyaId();
		 String kyusyokuName             = kbean.getKyusyokuName();
		 String kyusyokuNameFurigana             = kbean.getKyusyokuNameFurigana();
		 String jyusyo                    = kbean.getJyusyo();
		 String seinengappi              = kbean.getSeinengappi();
		 if( seinengappi.equals("") || seinengappi.equals("null")) {
			 seinengappi = null;
		 }
		 String renrakusakiKyusyokusya = kbean.getRenrakusakiKyusyokusya();
		 int kyusyokuId = kbean.getKyusyokuId();
		 String kibousyokusyu            = kbean.getKibousyokusyu();
		 String uketukenengappi         = kbean.getUketukenengappi();
		 if( uketukenengappi.equals("") || uketukenengappi.equals("null")) {
			 uketukenengappi = null;
		 }
/*
 *		String yukokikan = kbean.getYukokikan();
 *		String syokugyousyoukai = kbean.getSyokugyousyoukai();
 */
		String yuukoukikanStart           = kbean.getYuukoukikanStart();
//変更No.018 if文の追加 - Start
		if( yuukoukikanStart.equals("")|| yuukoukikanStart.equals("null")) {
			yuukoukikanStart = null;
		}
		String yuukoukikanEnd             = kbean.getYuukoukikanEnd();
		if( yuukoukikanEnd.equals("")|| yuukoukikanEnd.equals("null")) {
			yuukoukikanEnd = null;
		}
//変更No.018 if文の追加 - End
		String syoukaiDay                = kbean.getSyoukaiDay();
//変更No.018 if文の追加 - Start
		if( syoukaiDay.equals("")|| syoukaiDay.equals("null")) {
			syoukaiDay = null;
		}
//変更No.018 if文の追加 - End
		int    kyujinId                  = kbean.getKyujinId();
		String saiyouHusaiyou           = kbean.getSaiyouHusaiyou();
		String saiyouDay                 = kbean.getSaiyouDay();
//変更No.018 if文の追加 - Start
		if( saiyouDay.equals("")|| saiyouDay.equals("null")) {
			saiyouDay = null;
		}
//変更No.018 if文の追加 - End
		String roudoukeiyaku            = kbean.getRoudoukeiyaku();
		String tensyokukansyouEnd      = kbean.getTensyokukansyouEnd();
//変更No.018 if文の追加 - Start
/*		if( tensyokukansyouEnd.equals("")|| tensyokukansyouEnd.equals("null")) {
			tensyokukansyouEnd = null;
		}
		*/
//変更No.018 if文の追加 - End
		String risyokujoukyou           = kbean.getRisyokujoukyou();
		String henreikin                 = kbean.getHenreikin();
		String kyusyokuJoukyou          = kbean.getKyusyokuJoukyou();
                                                                                          // 変更No.015_kim 変数の編集・追加 - End
		try {
			kdao.updateKyusyoku(kyusyokusyaId, kyusyokuName, kyusyokuNameFurigana, jyusyo, seinengappi, renrakusakiKyusyokusya, kyusyokuId, kibousyokusyu, uketukenengappi,
							            yuukoukikanStart, yuukoukikanEnd, syoukaiDay, kyujinId, saiyouHusaiyou, saiyouDay,
										roudoukeiyaku, tensyokukansyouEnd, risyokujoukyou, henreikin, kyusyokuJoukyou);
		 }catch( SQLException e) {
					e.printStackTrace();
				}

				rd = request.getRequestDispatcher("/kyusyokuList.jsp");

				rd.forward(request, response);

				break;

			case "追加" :

				 kbean = (KyusyokuBean) session.getAttribute("kyusyokuSyaList");
				 String kyusyokuName2           = kbean.getKyusyokuName();
				 String kyusyokuNameFurigana2   = kbean.getKyusyokuNameFurigana();
				 String jyusyo2                 = kbean.getJyusyo();
				 String seinengappi2            = kbean.getSeinengappi();
				 String renrakusakiKyusyokusya2 = kbean.getRenrakusakiKyusyokusya();

				 try {
				 	 	kbean = kdao.selectKyusyoku(kyusyokuName2, kyusyokuNameFurigana2, jyusyo2, seinengappi2, renrakusakiKyusyokusya2);

				 	 	int    kyusyokusyaId2          = kbean.getKyusyokusyaId();

				 	 	kbean = (KyusyokuBean) session.getAttribute("kyusyokuList2");

					  	String kibousyokusyu2           = kbean.getKibousyokusyu();
					  	String uketukenengappi2         = kbean.getUketukenengappi();
					  	if( uketukenengappi2.equals("") || uketukenengappi2.equals("null")) {
					    		 uketukenengappi2 = null;
					  	}
					  	String yuukoukikanStart2         = kbean.getYuukoukikanStart();
						if( yuukoukikanStart2.equals("")|| yuukoukikanStart2.equals("null")) {
							yuukoukikanStart2 = null;
						}
						String yuukoukikanEnd2           = kbean.getYuukoukikanEnd();
						if( yuukoukikanEnd2.equals("")|| yuukoukikanEnd2.equals("null")) {
							yuukoukikanEnd2 = null;
						}
						String syoukaiDay2               = kbean.getSyoukaiDay();
						if( syoukaiDay2.equals("")|| syoukaiDay2.equals("null")) {
							syoukaiDay2 = null;
						}
						int    kyujinId2                  = kbean.getKyujinId();
						String saiyouHusaiyou2           = kbean.getSaiyouHusaiyou();
						String saiyouDay2                 = kbean.getSaiyouDay();
						if( saiyouDay2.equals("")|| saiyouDay2.equals("null")) {
							saiyouDay2 = null;
						}

						String roudoukeiyaku2            = kbean.getRoudoukeiyaku();
/*						String tensyokukansyouEnd2       = kbean.getTensyokukansyouEnd();
 *						if( tensyokukansyouEnd2.equals("")|| tensyokukansyouEnd2.equals("null")) {
 *							tensyokukansyouEnd2 = null;
 *						}
 */
						String risyokujoukyou2         = kbean.getRisyokujoukyou();
						String henreikin2                = kbean.getHenreikin();
						String kyusyokuJoukyou2          = kbean.getKyusyokuJoukyou();

						kdao.insertKyusyoku(kibousyokusyu2, uketukenengappi2, yuukoukikanStart2, yuukoukikanEnd2,
											syoukaiDay2, kyujinId2, saiyouHusaiyou2, saiyouDay2, roudoukeiyaku2,
											/*tensyokukansyouEnd2*/ risyokujoukyou2, henreikin2, kyusyokuJoukyou2,
											 kyusyokusyaId2);
					} catch ( SQLException e) {
						e.printStackTrace();
					}
					rd = request.getRequestDispatcher("/kyusyokuIResult.jsp");

					rd.forward(request, response);

					break;
			}

		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
/* 変更No.043_kim - End */
