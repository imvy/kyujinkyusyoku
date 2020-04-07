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
 * Servlet implementation class KyujinDeptServlet
 */
@WebServlet("/KyujinDeptServlet")
public class KyujinDeptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinDeptServlet() {
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
		//doGet(request, response);

		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;

		KyujinBean kbean = new KyujinBean();

		kbean.setDeptName(request.getParameter("deptName3"));
		kbean.setTantousya(request.getParameter("tantousya3"));
		kbean.setTantousyaFurigana(request.getParameter("furigana"));
		kbean.setRenrakusaki(request.getParameter("renrakusaki3"));
		String kaisyaId = request.getParameter("kaisyaId");
		int kaisyaId2 = Integer.parseInt(kaisyaId);
		kbean.setKaisyaId(kaisyaId2);

		session.setAttribute("dept", kbean);

		rd = request.getRequestDispatcher("/kyujinDeptConfilm.jsp");

		rd.forward(request,response);

	}

}
