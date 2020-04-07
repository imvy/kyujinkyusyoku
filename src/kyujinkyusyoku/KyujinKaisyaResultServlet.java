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
 * Servlet implementation class KyujinKaisyaResultServlet
 */
@WebServlet("/KyujinKaisyaResultServlet")
public class KyujinKaisyaResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinKaisyaResultServlet() {
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

		 kbean = (KyujinBean) session.getAttribute("kaisya");

		 	String kaisyaName = kbean.getKaisyaName();
		 	String kaisyaNameFurigana = kbean.getKaisyaNameFurigana();
			String zyusyo = kbean.getZyusyo();
			String deptName = kbean.getDeptName();
			String tantouya = kbean.getTantousya();
			String tantousyaFurigana = kbean.getTantousyaFurigana();
			String renrakusaki = kbean.getRenrakusaki();

			KyujinDao kdao = new KyujinDao();

			try {

				kdao.insertKyujin(kaisyaName,kaisyaNameFurigana, zyusyo,deptName,tantouya,tantousyaFurigana,renrakusaki);
			}catch( SQLException e) {
				e.printStackTrace();
			}

			rd = request.getRequestDispatcher("/kyujinList.jsp");

			rd.forward(request, response);


	}

}
