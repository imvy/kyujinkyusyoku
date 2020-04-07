package kyujinkyusyoku;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class KyujinKaisyaServlet
 */
@WebServlet("/KyujinKaisyaServlet")
public class KyujinKaisyaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinKaisyaServlet() {
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

		String kyujinName = "";

		Kyujin kyujin2 = new Kyujin();
		ArrayList<KyujinBean> kyujinList2 = new ArrayList<>();
		kyujinList2 = kyujin2.getKyujin(kyujinName);
		//リクエストスコープに会社情報を設定する
		session.setAttribute("kaisyaList", kyujinList2);

		rd = request.getRequestDispatcher("/kyujinInsertSearch.jsp");

		rd.forward(request, response);

	}

}
