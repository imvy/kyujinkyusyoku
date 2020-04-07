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
 * Servlet implementation class KyujindeptResultServlet
 */
@WebServlet("/KyujindeptResultServlet")
public class KyujindeptResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujindeptResultServlet() {
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
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		KyujinBean kbean = new KyujinBean();

		KyujinDao kdao = new KyujinDao();

		try {

			kbean = (KyujinBean) session.getAttribute("dept");

			String deptName = kbean.getDeptName();
			String tantouya = kbean.getTantousya();
			String furigana = kbean.getTantousyaFurigana();
			String renrakusaki = kbean.getRenrakusaki();
			int kaisyaId = kbean.getKaisyaId();

			int deptId= kdao.insertKyujin(deptName,renrakusaki, tantouya,furigana , kaisyaId);
			request.setAttribute("deptId",deptId);
			}catch( SQLException e) {
				e.printStackTrace();
			}

			rd = request.getRequestDispatcher("/kyujinDeptResult.jsp");

			rd.forward(request, response);

	}

}
