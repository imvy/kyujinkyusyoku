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
 * Servlet implementation class KyujinKaisyaNewServlet
 */
@WebServlet("/KyujinKaisyaNewServlet")
public class KyujinKaisyaNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinKaisyaNewServlet() {
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

		kbean.setKaisyaName(request.getParameter("kaisyaName3"));
		kbean.setKaisyaNameFurigana(request.getParameter("kaisyaNameFurigana"));
		kbean.setZyusyo(request.getParameter("zyusyo3"));
		kbean.setDeptName(request.getParameter("deptName3"));
		kbean.setTantousya(request.getParameter("tantousya3"));
		kbean.setTantousyaFurigana(request.getParameter("tantousyaFurigana"));
		kbean.setRenrakusaki(request.getParameter("renrakusaki3"));

		session.setAttribute("kaisya", kbean);

		rd = request.getRequestDispatcher("/kyujinKaisyaConfilm.jsp");

		rd.forward(request,response);

	}

}
