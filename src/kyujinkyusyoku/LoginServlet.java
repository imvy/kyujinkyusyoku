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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		String btn = request.getParameter("submit1");

		RequestDispatcher rd = null;

		HttpSession session = request.getSession();

		switch( btn ) {

			case "Enter":
				//ユーザーIDとパスワードを取得
				String userId = request.getParameter("userId");
				String password = request.getParameter("pass");
				//ログインクラスのインスタンスを作成する
				Login login = new Login ();
				LoginUserBean bean = login.loginCheck(userId, password);

				if(bean != null) {

					session.setAttribute("user_db", bean);
					session.setAttribute("login_db", "login");
					session.setAttribute("level_db", bean.getLevel());

					//Vy add

					//Su dung user_level de xac dinh dung mypage
					Integer user_level = bean.getLevel();
					switch(user_level) {
						case 3:
							//Su dung kyusyokusyaBean de hien thi info cua kyusyokusya
							kyusyokusya kyusyokusya = new kyusyokusya();
							kyusyokusyaBean ksbean = new kyusyokusyaBean();
							ksbean = kyusyokusya.getKyusyokusya(userId);
							session.setAttribute("kyusyokusya", ksbean);

							rd = request.getRequestDispatcher("/kyusyokusya_mypage.jsp");
							break;
						case 4:
							//Su dung kyujinkaisyaBean de hien thi info cua kyujinkaisya
							Kyujinkaisya kyujinkaisya = new Kyujinkaisya();
							KyujinkaisyaBean kjbean = new KyujinkaisyaBean();
							kjbean = kyujinkaisya.getKyujinkaisya(userId);
							session.setAttribute("kyujinkaisya", kjbean);

							rd = request.getRequestDispatcher("/kyujinmypage.jsp");
							break;
						case 1:
						case 2:
							rd = request.getRequestDispatcher("/kyujinkyusyokuSelect.jsp");
							break;
					}
					//Vy add

					//rd = request.getRequestDispatcher("/kyujinkyusyokuSelect.jsp"); //Vy del

				}else {

					rd = request.getRequestDispatcher("/loginNG.jsp");
				}

				rd.forward(request, response);

				break;

			case "ログアウト" :
				session.removeAttribute("user_db");
				session.removeAttribute("login_db");

				rd = request.getRequestDispatcher("/logout.jsp");

				rd.forward(request, response);

				break;
		}
	}

}
