package kyujinkyusyoku;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class kyusyokusyaMypageServlet
 */
@WebServlet("/kyusyokusyaMypageServlet")
public class kyusyokusyaMypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public kyusyokusyaMypageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String btn = request.getParameter("submit");

		RequestDispatcher rd = null;

		switch( btn ) {
			case "変更":
				rd = request.getRequestDispatcher("/kyusyokusya_mypage_update.jsp");
				break;
			case "マイページへ戻る":
				rd = request.getRequestDispatcher("/kyusyokusya_mypage.jsp");
				break;
		}
		rd.forward(request, response);
	}

}
