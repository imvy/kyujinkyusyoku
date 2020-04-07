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
 * Servlet implementation class KyujinConfilmServlet
 */
@WebServlet("/KyujinConfilmServlet")
public class KyujinConfilmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinConfilmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		request.setCharacterEncoding("UTF-8");

		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		String btn = request.getParameter("submit3");
		KyujinBean kbean = new KyujinBean();

		String deptId1;
		String[] deptId2;
		int deptId;
		switch(btn) {

			case "更新する" :


				kbean = (KyujinBean) session.getAttribute("kyujin");
				//求人情報を設定する
				kbean.setKaisyaName(request.getParameter("kaisyaName1"));
				kbean.setKaisyaNameFurigana(request.getParameter("kaisyaNameFurigana1"));
				kbean.setZyusyo(request.getParameter("zyusyo1"));
				kbean.setDeptName(request.getParameter("deptName1"));
				kbean.setTantousyaFurigana(request.getParameter("tantousyaFurigana1"));
				kbean.setRenrakusaki( request.getParameter("renrakusaki1"));
				kbean.setUketukenengappi(request.getParameter("uketukenengappi1"));
				kbean.setYuukoukikanStart(request.getParameter("yukokikanStart1"));
				kbean.setYuukoukikanEnd(request.getParameter("yukokikanEnd1"));
				String kyujinsuu1 = request.getParameter("kyujinsuu1");
				int kyujinsuu2 = Integer.parseInt(kyujinsuu1);
				kbean.setKyujinsuu(kyujinsuu2);
				kbean.setSyokusyu(request.getParameter("syokusyu1"));
				kbean.setSyugyobasyo(request.getParameter("syugyoubasyo1"));
				kbean.setKoyoukikanStart(request.getParameter("koyoukikan1Start1"));
				kbean.setKoyoukikanEnd(request.getParameter("koyoukikanEnd1"));
				kbean.setTinginKeitai(request.getParameter("tinginKeitai"));
				String tingin1 = request.getParameter("tingin1");
				int tingin2 = Integer.parseInt(tingin1);
				kbean.setTingin(tingin2);

				deptId1 = request.getParameter("contact_person");
				deptId2 = deptId1.split(",",0); //20190821 valueに複数の値を","区切りで持たせたために分割
				deptId = Integer.parseInt(deptId2[0]);//20190821
				kbean.setDeptId(deptId);
				kbean.setTantousya(deptId2[2]);//20190821

				session.setAttribute("kyujinList1", kbean);

				rd = request.getRequestDispatcher("/kyujinConfilm1.jsp");

				rd.forward(request, response);

				break;

			case "追加する" :
				KyujinBean kbean2 = new KyujinBean();

				//求人情報を設定する

				kbean2.setKaisyaName(request.getParameter("kaisyaName2"));
				kbean2.setZyusyo(request.getParameter("zyusyo2"));
				//kbean2.setDeptName(request.getParameter("deptName2"));
				// kbean2.setTantousya(request.getParameter("tantousya2"));
				kbean2.setRenrakusaki( request.getParameter("renrakusaki2"));

				kbean2.setUketukenengappi(request.getParameter("uketukenengappi2"));
				kbean2.setYuukoukikanStart(request.getParameter("yukokikanStart2"));
				kbean2.setYuukoukikanEnd(request.getParameter("yukokikanEnd2"));
				String kyujinsuu3 = request.getParameter("kyujinsuu2");
				int kyujinsuu4 = Integer.parseInt(kyujinsuu3);
				kbean2.setKyujinsuu(kyujinsuu4);
				kbean2.setSyokusyu(request.getParameter("syokusyu2"));
				kbean2.setSyugyobasyo(request.getParameter("syugyoubasyo2"));
				kbean2.setKoyoukikanStart(request.getParameter("koyoukikanStart2"));
				kbean2.setKoyoukikanEnd(request.getParameter("koyoukikanEnd2"));
				kbean2.setTinginKeitai(request.getParameter("tinginKeita2"));
				String tingin3 = request.getParameter("tingin2");
				int tingin4 = Integer.parseInt(tingin3);
				kbean2.setTingin(tingin4);
				deptId1 = request.getParameter("contact_person");
				deptId2 = deptId1.split(",",0); //20190821 valueに複数の値を","区切りで持たせたために分割
				deptId = Integer.parseInt(deptId2[0]);//20190821
				kbean2.setDeptId(deptId);
				kbean2.setTantousya(deptId2[2]);//20190821
				kbean2.setDeptName(deptId2[3]);


				session.setAttribute("kyujinList2", kbean2);

				rd = request.getRequestDispatcher("/kyujinConfilm2.jsp");

				rd.forward(request, response);

				break;
		}

	}

}
