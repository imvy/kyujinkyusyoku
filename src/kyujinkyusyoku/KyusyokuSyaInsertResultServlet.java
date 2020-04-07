//変更No.032_kim Servletの追加 - Start
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
 * Servlet implementation class KyusyokuSyaInsertResultServlet
 */
@WebServlet("/KyusyokuSyaInsertResultServlet")
public class KyusyokuSyaInsertResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyusyokuSyaInsertResultServlet() {
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
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		RequestDispatcher rd = null;
		KyusyokuBean kbean = new KyusyokuBean();

		 kbean = (KyusyokuBean) session.getAttribute("kyusyokuSyaList");  /* 変更No.038_kim getAttributeの引数の値を変更 */

		 	String kyusyokuName = kbean.getKyusyokuName();
		 	String kyusyokuNameFurigana = kbean.getKyusyokuNameFurigana();
			String jyusyo = kbean.getJyusyo();
			String seinengappi = kbean.getSeinengappi();
			String renrakusakiKyusyokusya = kbean.getRenrakusakiKyusyokusya();

			KyusyokuDao kdao = new KyusyokuDao();

			try {

				kdao.insertKyusyokusya(kyusyokuName, kyusyokuNameFurigana, jyusyo,seinengappi, renrakusakiKyusyokusya);
			}catch( SQLException e) {
				e.printStackTrace();
			}

			rd = request.getRequestDispatcher("/kyusyokuInfoInsert.jsp"); /* 20190806_変更_kim_求職者追加でウィンドウが閉じる */

			rd.forward(request, response);


	}

}
//変更No.032_kim - End