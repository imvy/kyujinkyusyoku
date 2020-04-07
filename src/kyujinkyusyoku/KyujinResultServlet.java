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
 * Servlet implementation class KyujinResultServlet
 */
@WebServlet("/KyujinResultServlet")
public class KyujinResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */ protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String btn = request.getParameter("submit4");
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		KyujinBean kbean = new KyujinBean();


		KyujinDao kdao = new KyujinDao();

		switch(btn) {

			case "更新" :

				 kbean = (KyujinBean) session.getAttribute("kyujinList1");



				int kyujinId = kbean.getKyujinId();
				String kaisyaName = kbean.getKaisyaName();
				String kaisyaNameFurigana = kbean.getKaisyaNameFurigana();
				String zyusyo = kbean.getZyusyo();
				String deptName = kbean.getDeptName();
				String tantousya = kbean.getTantousya();
				String tantousyaFurigana = kbean.getTantousyaFurigana();
				String renrakusaki = kbean.getRenrakusaki();
				String uketukenengappi = kbean.getUketukenengappi();
				if( uketukenengappi.equals("") || uketukenengappi.equals("null")) {
					uketukenengappi = null;
				}
				String yuukoukikanStart = kbean.getYuukoukikanStart();
				if( yuukoukikanStart.equals("")|| yuukoukikanStart.equals("null")) {
					yuukoukikanStart = null;
				}
				String yuukoukikanEnd = kbean.getYuukoukikanEnd();
				if( yuukoukikanEnd.equals("")|| yuukoukikanEnd.equals("null")) {
					yuukoukikanEnd = null;
				}
				int kyujinsuu = kbean.getKyujinsuu();
				String syokusyu = kbean.getSyokusyu();
				String syugyobasyo = kbean.getSyugyobasyo();
				String koyoukikanStart = kbean.getKoyoukikanStart();
				if( koyoukikanStart.equals("")|| koyoukikanStart.equals("null")) {
					koyoukikanStart = null;
				}
				String koyoukikanEnd = kbean.getKoyoukikanEnd();
				if( koyoukikanEnd.equals("")|| koyoukikanEnd.equals("null")) {
					koyoukikanEnd = null;
				}
				String tinginkeitai = kbean.getTinginKeitai();
				int tingin = kbean.getTingin();
				int deptId = kbean.getDeptId();
				int kaisyaId = kbean.getKaisyaId();

				try {

					kdao.updateKyujin(
							kyujinId, kaisyaName, zyusyo, renrakusaki, deptName, tantousya,
							uketukenengappi, yuukoukikanStart, yuukoukikanEnd, kyujinsuu, syokusyu,
							syugyobasyo, koyoukikanStart, koyoukikanEnd, tingin, tinginkeitai, kaisyaId, deptId,
							kaisyaNameFurigana,tantousyaFurigana);
				}catch( SQLException e) {
					e.printStackTrace();
				}

				rd = request.getRequestDispatcher("/kyujinList.jsp");

				rd.forward(request, response);

				break;

			case "追加" :
;
/*				 kbean = (KyujinBean) session.getAttribute("dept");
				 String deptName2 = kbean.getDeptName();
				 String tantousya2 = kbean.getTantousya();
				 String renrakusaki2 = kbean.getRenrakusaki();
*/
				try {
//					kbean = kdao.selectKyujin(deptName2, tantousya2, renrakusaki2);

//					int deptId2 = kbean.getDeptId();

					kbean = (KyujinBean) session.getAttribute("kyujinList2");

					int deptId2 = kbean.getDeptId();

					String uketukenengappi2 = kbean.getUketukenengappi();
					if( uketukenengappi2.equals("")|| uketukenengappi2.equals("null")) {
						uketukenengappi2 = null;
					}
					String yuukoukikanStart2 = kbean.getYuukoukikanStart();
					if( yuukoukikanStart2.equals("")|| yuukoukikanStart2.equals("null")) {
						yuukoukikanStart2 = null;
					}
					String yuukoukikanEnd2 = kbean.getYuukoukikanEnd();
					if( yuukoukikanEnd2.equals("")|| yuukoukikanEnd2.equals("null")) {
						yuukoukikanEnd2 = null;
					}
					int kyujinsuu2 = kbean.getKyujinsuu();
					String syokusyu2 = kbean.getSyokusyu();
					String syugyobasyo2 = kbean.getSyugyobasyo();
					String koyoukikanStart2 = kbean.getKoyoukikanStart();
					if( koyoukikanStart2.equals("")|| koyoukikanStart2.equals("null")) {
						koyoukikanStart2 = null;
					}
					String koyoukikanEnd2 = kbean.getKoyoukikanEnd();
					if( koyoukikanEnd2.equals("")|| koyoukikanEnd2.equals("null")) {
						koyoukikanEnd2 = null;
					}
					String tinginkeitai2 = kbean.getTinginKeitai();
					int tingin2 = kbean.getTingin();

					kdao.insertKyujin(uketukenengappi2, yuukoukikanStart2, yuukoukikanEnd2, kyujinsuu2, syokusyu2, syugyobasyo2, koyoukikanStart2, koyoukikanEnd2, tingin2, tinginkeitai2, deptId2);
				}catch(SQLException e) {
					e.printStackTrace();
				}

				rd = request.getRequestDispatcher("/kyujinList.jsp");

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
