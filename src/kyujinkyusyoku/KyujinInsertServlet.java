package kyujinkyusyoku;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class KyujinInsertServlet
 */
@WebServlet("/KyujinInsertServlet")
public class KyujinInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		RequestDispatcher rd = null;
		HttpSession session = request.getSession();
		Enumeration<String> names = request.getParameterNames();

		//現在のパラメータ名,求人IDのローカル変数を宣言する。
		String name = "";
		String kyujinId = "";


		while(names.hasMoreElements()) {

			name = names.nextElement();

			if("求人追加".equals(request.getParameter(name)) || "連絡担当者追加".equals(request.getParameter(name)))
				kyujinId = name;
		}

		int kyujinId2 = Integer.parseInt(kyujinId);
		Kyujin kyujin = new Kyujin();
		//KyujinBean bean = kyujin.getKyujin1(kyujinId2);
		//session.setAttribute("kaisyaList", bean);
		String btn = request.getParameter(kyujinId);
		switch(btn) {

			case "求人追加" :

				KyujinBean bean = kyujin.getKyujin1(kyujinId2);
				session.setAttribute("kaisyaList", bean);

				KyujinBean dbean = new KyujinBean();

				dbean.setDeptName( bean.getDeptName());
				dbean.setTantousya(bean.getTantousya());
				dbean.setRenrakusaki(bean.getRenrakusaki());

				session.setAttribute("dept", dbean);

				rd = request.getRequestDispatcher("/kyujinInsert.jsp");

				rd.forward(request, response);

				break;

			case "連絡担当者追加" :


				 //会社検索用
				KyujinBean kbean = kyujin.getKyujin2(kyujinId2);
				session.setAttribute("kaisya", kbean);


				rd = request.getRequestDispatcher("/kyujinDept.jsp");

				rd.forward(request, response);

				break;
		}
	}


}
