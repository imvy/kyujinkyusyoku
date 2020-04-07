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
 * Servlet implementation class KyusyokuDeleteServlet
 */
@WebServlet("/KyusyokuDeleteServlet")
public class KyusyokuDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyusyokuDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		KyusyokuBean kbean = new KyusyokuBean();
		//選択された求職IDを取得
		kbean = (KyusyokuBean) session.getAttribute("kyusyoku");
 		int kyusyokuId = kbean.getKyusyokuId();								// 変更No.023_kim -ソース変更
		//求職情報を表示しなくする
		KyusyokuDao kdao = new KyusyokuDao();
		try {
			kdao.updateKyusyoku(kyusyokuId);
		}catch( SQLException e) {
			e.printStackTrace();
		}

		rd = request.getRequestDispatcher("/kyusyokuList.jsp");

		rd.forward(request, response);
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
