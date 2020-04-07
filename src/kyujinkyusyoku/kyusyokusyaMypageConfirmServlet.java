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
 * Servlet implementation class kyusyokusyaMypageConfirmServlet
 */
@WebServlet("/kyusyokusyaMypageConfirmServlet")
public class kyusyokusyaMypageConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public kyusyokusyaMypageConfirmServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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

		//Get gia tri cua kyusyokusyaBean luu vao bien ksbean de hien thi cho man hinh confirm sau nay
		kyusyokusyaBean ksbean = new kyusyokusyaBean();
		ksbean = (kyusyokusyaBean) session.getAttribute("kyusyokusya");

		//Get lai 2 gia tri co the thay doi, nhung item con lai ko can
		ksbean.setKyusyokusyaZyusyo(request.getParameter("jyusyo1"));
		ksbean.setRenrakusakiKyusyokusya(request.getParameter("renrakusakiKyusyokusya1"));

		session.setAttribute("kyusyokusya1", ksbean);

		rd = request.getRequestDispatcher("/kyusyokusyaMypageUpdateComplete.jsp");
		rd.forward(request, response);
	}

}
