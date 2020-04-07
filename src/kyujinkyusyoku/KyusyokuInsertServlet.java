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
 * Servlet implementation class KyusyokuInsertServlet
 */
@WebServlet("/KyusyokuInsertServlet")
public class KyusyokuInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyusyokuInsertServlet() {
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

		//現在のパラメータ名,求職IDのローカル変数を宣言する。
		String name = "";
		String kyusyokuId = "";


		while(names.hasMoreElements()) {

			name = names.nextElement();

			if("求職情報追加".equals(request.getParameter(name)))
				kyusyokuId = name;
		}



		int kyusyokuId2 = Integer.parseInt(kyusyokuId);
		Kyusyoku kyusyoku = new Kyusyoku();

		KyusyokuBean bean = kyusyoku.getKyusyoku1(kyusyokuId2);
		session.setAttribute("kyusyokuList", bean);

		session.setAttribute("kyusyokuSyaList", bean);

		rd = request.getRequestDispatcher("/kyusyokuInfoInsert.jsp");

		rd.forward(request, response);

		}
	}
