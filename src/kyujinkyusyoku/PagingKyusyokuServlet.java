package kyujinkyusyoku;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PagingKyusyokuServlet
 */
@WebServlet("/PagingKyusyokuServlet")
public class PagingKyusyokuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PagingKyusyokuServlet() {
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

		//ページング20190717
		int currentPageNumber = ((int)session.getAttribute("currentPageNumber"));
		String kyusyokuName = (String)session.getAttribute("kyusyokuName");
		String uketukenengappi = (String)session.getAttribute("uketukenengappi");
		String kibousyokusyu = (String)session.getAttribute("kibousyokusyu");
		Kyusyoku kyusyoku2 = new Kyusyoku();
		ArrayList<KyusyokuBean> kyusyokuList2 = new ArrayList<>();
		Kyusyoku kyusyoku = new Kyusyoku();
		KyusyokuBean bean = kyusyoku.getKyusyoku(kyusyokuName, uketukenengappi,kibousyokusyu);
		int allRecordCount = bean.getAllRecordCount();
		int allPageCount = bean.getAllPageCount();






		String movePage = request.getParameter("movePage");
		if (movePage == null) {
			movePage = "1";
		}

		switch(movePage) {

			case "<<"  :

				currentPageNumber = 1;

				break;

			case "<" :

				currentPageNumber--;

				break;

			case ">" :

				currentPageNumber++;

				break;

			case ">>" :
				currentPageNumber = allPageCount;

				break;

			default  :


				currentPageNumber = Integer.parseInt(movePage);


				break;


		}


		//ソート機能20190718
		String sortType = request.getParameter("sortType");
		String sort = "";
		if (sortType == null) {
			sortType = "ソート種類継続";
		}
		switch(sortType) {

			case "受付の新しい順":
				sort ="ksi.kyusyoku_uketukenengappi desc";

				break;

			case "受付の古い順":
				sort ="ksi.kyusyoku_uketukenengappi";

				break;

			case "求職者名順":

				sort = "ks.kyusyoku_name";

				break;

			case "ソート種類継続":
				sort = (String)session.getAttribute("sort");

				break;
		}

		kyusyokuList2 = kyusyoku2.getKyusyoku(kyusyokuName, uketukenengappi, kibousyokusyu, currentPageNumber, sort);
		//リクエストスコープに求人情報を設定する
		request.setAttribute("kyusyokubeanList", kyusyokuList2);
		request.setAttribute("allRecordCount",allRecordCount);
		request.setAttribute("allPageCount", allPageCount);


		session.setAttribute("currentPageNumber", currentPageNumber);
		session.setAttribute("sort", sort);



		rd = request.getRequestDispatcher("/kyusyokuList.jsp");

		rd.forward(request, response);





	}

}
