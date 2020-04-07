//変更No.030_kim Servlet追加 - Start
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
 * Servlet implementation class KyusyokuSyaNewServlet
 */
@WebServlet("/KyusyokuSyaNewServlet")
public class KyusyokuSyaNewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyusyokuSyaNewServlet() {
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

		KyusyokuBean kbean = new KyusyokuBean();

		kbean.setKyusyokuName(request.getParameter("kyusyokuName3"));
		kbean.setKyusyokuNameFurigana(request.getParameter("kyusyokuNameFurigana3"));
		kbean.setJyusyo(request.getParameter("jyusyo3"));
		kbean.setSeinengappi(request.getParameter("seinengappi3"));
		kbean.setRenrakusakiKyusyokusya(request.getParameter("renrakusakiKyusyokusya3"));

		session.setAttribute("kyusyokuSyaList", kbean);  /* 変更No.036_kim  setAttributeの引数の値を変更 */

		rd = request.getRequestDispatcher("/kyusyokuSyaInsertConfilm.jsp");

		rd.forward(request,response);

	}

}
//変更No.030_kim - End