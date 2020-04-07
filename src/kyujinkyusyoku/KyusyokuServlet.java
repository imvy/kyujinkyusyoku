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
 * Servlet implementation class KyusyokuServlet
 */
@WebServlet("/KyusyokuServlet")
public class KyusyokuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyusyokuServlet() {
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
		Enumeration<String> names = request.getParameterNames();

		//現在のパラメータ名,求職IDのローカル変数を宣言する。
		String name = "";
//		String kyusyokuId = "";													変更No.013_kim ソース修正・追加
		String kyusyokuId_str = "";

		while(names.hasMoreElements()) {

			name = names.nextElement();

			if("編集".equals(request.getParameter(name)) || "削除".equals(request.getParameter(name)))
//				kyusyokuId = name;												変更No.013_kim ソース修正・追加
				kyusyokuId_str = name;
		}
		int kyusyokuId = Integer.parseInt(kyusyokuId_str);                 //変更No.013_kim ソース修正・追加
		Kyusyoku kyusyoku = new Kyusyoku();
//		KyusyokuBean bean = kyusyoku.getKyusyokuId(kyusyokuId);					変更No.013_kim ソース修正・追加
		KyusyokuBean bean = kyusyoku.getKyusyoku(kyusyokuId);
		session.setAttribute("kyusyoku", bean);
//		String btn = request.getParameter(kyusyokuId_);						    変更No.013_kim ソース修正・追加
		String btn = request.getParameter(kyusyokuId_str);

		switch(btn) {

			case "編集" :

				rd = request.getRequestDispatcher("/kyusyokuUpdate.jsp");

				rd.forward(request, response);

				break;

			case "削除" :

				rd = request.getRequestDispatcher("/kyusyokuDelete.jsp");

				rd.forward(request, response);

				break;
		}

	}

}
