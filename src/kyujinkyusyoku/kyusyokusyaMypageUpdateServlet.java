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
 * Servlet implementation class kyusyokusyaMypageUpdateServlet
 */
@WebServlet("/kyusyokusyaMypageUpdateServlet")
public class kyusyokusyaMypageUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public kyusyokusyaMypageUpdateServlet() {
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

		kyusyokusyaBean ksbean = new kyusyokusyaBean();
		kyusyokusyaDao ksdao = new kyusyokusyaDao();

		//Get data sau khi chinh sua, no dc luu trong kyusyokusya1
		ksbean = (kyusyokusyaBean) session.getAttribute("kyusyokusya1");

		//Get 2 data zyusyo va renrakusaki de truyen vao update
		String zyusyo = ksbean.getKyusyokusyaZyusyo();
		String renrakusaki = ksbean.getRenrakusakiKyusyokusya();
		//Get kyusyokusyaId de lam dieu kien WHERE
		Integer kyusyokusyaId = ksbean.getKyusyokusyaId();

		//Tien hanh update data
		try {
			ksdao.updateKyusyokusya(kyusyokusyaId, zyusyo, renrakusaki);
		}
		catch ( SQLException e ) {
			e.printStackTrace();
		}

		//Sau khi update xong thi quay tro ve MyPage
		rd = request.getRequestDispatcher("/kyusyokusya_mypage.jsp");
		rd.forward(request, response);
	}

}
