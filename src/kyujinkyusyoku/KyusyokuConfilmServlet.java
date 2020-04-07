package kyujinkyusyoku;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class KyusyokuConfilmServlet
 */
@WebServlet("/KyusyokuConfilmServlet")
public class KyusyokuConfilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyusyokuConfilmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");

		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		String btn = request.getParameter("submit5");


		switch( btn ) {

			case "更新する" :

				KyusyokuBean kbean = new KyusyokuBean();
				kbean = (KyusyokuBean) session.getAttribute("kyusyoku");

				//求職情報を設定する
				kbean.setKyusyokuName          (request.getParameter("kyusyokuName1"));
				kbean.setKyusyokuNameFurigana  (request.getParameter("kyusyokuNameFurigana1"));
				kbean.setJyusyo                (request.getParameter("jyusyo1"));
				kbean.setSeinengappi           (request.getParameter("seinengappi1"));
				kbean.setRenrakusakiKyusyokusya(request.getParameter("renrakusakiKyusyokusya1"));
				kbean.setKibousyokusyu         (request.getParameter("kibousyokusyu1"));
				kbean.setUketukenengappi       (request.getParameter("uketukenengappi3"));
/*	変更No.013_kim ソースの修正・追加 - Start
*				kbean.setYuukoukikan(request.getParameter("yukoukinan1"));
*				kbean.setSyokugyousyoukai(request.getParameter("syokugyousyoukai3"));
*/
				kbean.setYuukoukikanStart      (request.getParameter("yukoukinanStart3"));
				kbean.setYuukoukikanEnd        (request.getParameter("yukoukinanEnd3"));
				kbean.setSyoukaiDay            (request.getParameter("syoukainengappi1"));
				String kyujinId3 = request.getParameter("kyujinId3");
				if(kyujinId3.equals("")||kyujinId3.equals("0")) {kyujinId3 = "1";}  //""の場合に、"0"を代入
				int kyujinId = Integer.parseInt(kyujinId3);//"0"を、0に型変換 nullでエラーとなるため、0 or 1 を代入
				kbean.setKyujinId(kyujinId);
// 変更No.019_kim 追加 - Start
				KyusyokuBean kbeanKyujinkaisyaName = new KyusyokuBean();
				KyusyokuDao kdao = new KyusyokuDao();
				kbeanKyujinkaisyaName = kdao.selectKyujinKaishaName(kyujinId);
				String kaisyaname = kbeanKyujinkaisyaName.getKaisyaName();
				kbean.setKaisyaName(kaisyaname);
//変更No.019_kim - End
				kbean.setSaiyouHusaiyou        (request.getParameter("saiyouHusaiyou1"));
				kbean.setSaiyouDay             (request.getParameter("saiyouDay1"));
				kbean.setRoudoukeiyaku         (request.getParameter("roudoukeiyaku1"));
				kbean.setTensyokukansyouEnd    (request.getParameter("tensyokukansyouEnd1"));
				kbean.setRisyokujoukyou        (request.getParameter("risyokujoukyou1"));
				kbean.setHenreikin             (request.getParameter("henreikin1"));
				kbean.setKyusyokuJoukyou       (request.getParameter("kyusyokuJoukyou1"));
// 変更No.013_kim - End
				session.setAttribute("kyusyokuList1", kbean);

				rd = request.getRequestDispatcher("/kyusyokuConfilm1.jsp");

				rd.forward(request, response);

				break;

			case "追加する求職情報の確認" :

				KyusyokuBean kbean2 = new KyusyokuBean();
				//求職情報を設定する
//				kbean2.setKyusyokuId(request.getParameter("kyusyokuId2"));
/*
 *              kbean2.setKyusyokuName          (request.getParameter("kyusyokuName2"));
				kbean2.setJyusyo                (request.getParameter("jyusyo2"));
				kbean2.setSeinengappi           (request.getParameter("seinengappi2"));
				kbean2.setRenrakusakiKyusyokusya(request.getParameter("renrakusaki2"));
*/
				kbean2.setKibousyokusyu         (request.getParameter("kibousyokusyu2"));
				kbean2.setUketukenengappi       (request.getParameter("uketukenengappi4"));
/* 変更No.041_kim ソース削除 - Start
 * 				kbean2.setYukokikan(request.getParameter("yukoukinan2"));
 *				kbean2.setSyokugyousyoukai(request.getParameter("syokugyousyoukai4"));
 * 変更No.041_kim - End */
//変更No.035_kim ソース追記 - Start
				kbean2.setYuukoukikanStart       (request.getParameter("yuukoukikanStart4"));
				kbean2.setYuukoukikanEnd         (request.getParameter("yuukoukikanEnd4"));
				kbean2.setSaiyouHusaiyou         (request.getParameter("saiyouHusaiyou2"));
				kbean2.setSyoukaiDay             (request.getParameter("syoukaiDay2"));
				String kyujinId4 = request.getParameter("kyujinId3");
				if(kyujinId4.equals("")||kyujinId4.equals("0")) {kyujinId4 = "1";}  //""の場合に、"0"を代入
				int kyujinId2 = Integer.parseInt(kyujinId4);//"0"を、0に型変換
				kbean2.setKyujinId(kyujinId2);
				@SuppressWarnings("unused") KyusyokuBean kbeanKyujinkaisyaName2 = new KyusyokuBean();
				KyusyokuDao kdao2 = new KyusyokuDao();
				kbeanKyujinkaisyaName = kdao2.selectKyujinKaishaName(kyujinId2);
				String kaisyaname2 = kbeanKyujinkaisyaName.getKaisyaName();
				kbean2.setKaisyaName(kaisyaname2);
				kbean2.setSaiyouDay              (request.getParameter("saiyouDay2"));
				kbean2.setTensyokukansyouEnd     (request.getParameter("tensyokukansyouEnd2"));
				kbean2.setRoudoukeiyaku          (request.getParameter("roudoukeiyaku2"));
				kbean2.setRisyokujoukyou         (request.getParameter("risyokujoukyou2"));
				kbean2.setHenreikin              (request.getParameter("henreikin2"));
				kbean2.setKyusyokuJoukyou        (request.getParameter("kyusyokuJoukyou2"));
//変更No.035_kim - End

				session.setAttribute("kyusyokuList2", kbean2);

				rd = request.getRequestDispatcher("/kyusyokuConfilm2.jsp");

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
