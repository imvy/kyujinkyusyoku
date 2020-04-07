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
 * Servlet implementation class kyujinkaisyaMypageUpdateServlet
 */
@WebServlet("/kyujinkaisyaMypageUpdateServlet")
public class kyujinkaisyaMypageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public kyujinkaisyaMypageUpdateServlet() {
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
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;

		KyujinkaisyaBean kjbean = new KyujinkaisyaBean();
		KyujinkaisyaDao kjdao = new KyujinkaisyaDao();

		//Get data sau khi chinh sua, no dc luu trong kyujinkaisya1
		kjbean = (KyujinkaisyaBean) session.getAttribute("kyujinkaisya1");

		//Get 3 data zyusyo va renrakusaki1 va renrakusaki2 de truyen vao update
		String zyusyo = kjbean.getZyusyo();
		String renrakusaki1 = kjbean.getRenrakusaki1();
		String renrakusaki2 = kjbean.getRenrakusaki2();
		//Get kyujinkaisyaId de lam dieu kien WHERE
		Integer kyujinkaisyaId = kjbean.getKyujinkaisyaId();

		//Tien hanh update data
		try {
			kjdao.updateKyujinkaisya(kyujinkaisyaId, zyusyo, renrakusaki1, renrakusaki2);
		}
		catch ( SQLException e ) {
			e.printStackTrace();
		}

		//Sau khi update xong thi quay tro ve MyPage
		rd = request.getRequestDispatcher("/kyujinmypage.jsp");
		rd.forward(request, response);
	}

}
