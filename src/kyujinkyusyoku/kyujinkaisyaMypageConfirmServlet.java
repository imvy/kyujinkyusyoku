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
 * Servlet implementation class kyujinkaisyaMypageConfirmServlet
 */
@WebServlet("/kyujinkaisyaMypageConfirmServlet")
public class kyujinkaisyaMypageConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public kyujinkaisyaMypageConfirmServlet() {
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

		//Get gia tri cua kyujinkaisyaBean luu vao bien kjbean de hien thi cho man hinh confirm sau nay
		KyujinkaisyaBean kjbean = new KyujinkaisyaBean();
		kjbean = (KyujinkaisyaBean) session.getAttribute("kyujinkaisya");

		//Get lai 3 gia tri co the thay doi, nhung item con lai ko can
		kjbean.setZyusyo(request.getParameter("jyusyo1"));
		kjbean.setRenrakusaki1(request.getParameter("renrakusaki1"));
		kjbean.setRenrakusaki2(request.getParameter("renrakusaki2"));

		session.setAttribute("kyujinkaisya1", kjbean);

		rd = request.getRequestDispatcher("/kyujinkaisyaMypageUpdateComplete.jsp");
		rd.forward(request, response);
	}

}
