package kyujinkyusyoku;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class KyujinServlet
 */
@WebServlet("/KyujinServlet")
public class KyujinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
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
		Enumeration<String> names = request.getParameterNames();

		//現在のパラメータ名,求人IDのローカル変数を宣言する。
		String name = "";
		String kyujinId = "";
		int kaisyaId;

		while(names.hasMoreElements()) {

			name = names.nextElement();

			if("編集".equals(request.getParameter(name)) || "削除".equals(request.getParameter(name)))
				kyujinId = name;
		}
		int kyujinId2 = Integer.parseInt(kyujinId);
		Kyujin kyujin = new Kyujin();
		KyujinBean bean = kyujin.getKyujin(kyujinId2);
		session.setAttribute("kyujin", bean);
		request.setAttribute("deptId",bean.getDeptId());//20190827

		kaisyaId = bean.getKaisyaId();
		ArrayList<KyujinBean> deptList = new ArrayList<>();
        deptList = kyujin.getDept(kaisyaId);
        request.setAttribute("dept", deptList);

		String btn = request.getParameter(kyujinId);
		switch(btn) {

			case "編集" :
				rd = request.getRequestDispatcher("/kyujinUpdate.jsp");

				rd.forward(request, response);

				break;

			case "削除" :
				rd = request.getRequestDispatcher("/kyujinDelete.jsp");

				rd.forward(request, response);

				break;
		}
	}

}
