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
 * Servlet implementation class SelectServlet
 */
@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectServlet() {
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

		//20190717 ページネーション
		HttpSession session = request.getSession();




		String btn = request.getParameter("submit2");

		RequestDispatcher rd = null;


		switch(btn) {

			case "求人"  :

			case "求人一覧へもどる" :
			case "求人トップ" :

				String kyujinName = "%%";
				String uketukenengappi = "%%";
				String syokusyu = "%%";
				int currentPageNumber = 1;//ページング機能20190718
				String sort = "i.kyujin_uketukenengappi desc";//ソート機能20190718
				session.setAttribute("sort", sort);//ソート機能20190718
				@SuppressWarnings("unused") Kyujin kyujin2 = new Kyujin();
				ArrayList<KyujinBean> kyujinList2 = new ArrayList<>();
				//リクエストスコープに求人情報を設定する
				request.setAttribute("kyujinbeanList", kyujinList2);

				//ページネーション20190717
				session.setAttribute("currentPageNumber", currentPageNumber);
				session.setAttribute("kyujinName", kyujinName);
				session.setAttribute("uketukenengappi", uketukenengappi);
				session.setAttribute("syokusyu", syokusyu);
				Kyujin kyujin = new Kyujin();
				//ページ総数、件数取得20190718
				KyujinBean bean = kyujin.getKyujin(kyujinName, uketukenengappi,syokusyu);
				int allRecordCount = bean.getAllRecordCount();
				int allPageCount = bean.getAllPageCount();
				request.setAttribute("allRecordCount",allRecordCount);
				request.setAttribute("allPageCount", allPageCount);

				rd = request.getRequestDispatcher("/kyujinList.jsp");

				rd.forward(request, response);

				break;
			case "求人検索" :

				kyujinName = "%" + request.getParameter("kaisyaName3") + "%";
				uketukenengappi = "%" + request.getParameter("uketukenengappi5") + "%";
				syokusyu = "%" + request.getParameter("syokusyu3") + "%";
				currentPageNumber = 1;//ページング機能20190718
				sort = "i.kyujin_uketukenengappi desc";//ソート機能20190718
				session.setAttribute("sort", sort);//ソート機能20190718
				kyujin2 = new Kyujin();
				kyujinList2 = new ArrayList<>();
				//リクエストスコープに求人情報を設定する
				request.setAttribute("kyujinbeanList", kyujinList2);

				//20190717 ページネーション
				session.setAttribute("currentPageNumber", currentPageNumber);
				session.setAttribute("kyujinName", kyujinName);
				session.setAttribute("uketukenengappi", uketukenengappi);
				session.setAttribute("syokusyu", syokusyu);
				kyujin = new Kyujin();
				bean = kyujin.getKyujin(kyujinName, uketukenengappi,syokusyu);
				allRecordCount = bean.getAllRecordCount();
				allPageCount = bean.getAllPageCount();
				request.setAttribute("allRecordCount",allRecordCount);
				request.setAttribute("allPageCount", allPageCount);



				rd = request.getRequestDispatcher("/kyujinList.jsp");

				rd.forward(request, response);

				break;

			case "求職" :

			case "求職一覧へもどる" :

			case "求職トップ" :
/*				Kyusyoku kyusyoku = new Kyusyoku();
 *				ArrayList<KyusyokuBean> kyusyokuList = new ArrayList<> ();
 *				kyusyokuList = kyusyoku.getKyusyoku();
 *				//リクエストスコープに求職情報を設定する
 *				request.setAttribute("kyusyokubeanList", kyusyokuList);
 *
 *				rd  = request.getRequestDispatcher("/kyusyokuList.jsp");
 *
 *				rd.forward(request, response);
 */
				String kyusyokuName = "%%";
					   uketukenengappi = "%%";
				String kibousyokusyu = "%%";
					   currentPageNumber = 1;
				       sort = "ksi.kyusyoku_uketukenengappi desc";
				session.setAttribute("sort", sort);
				Kyusyoku kyusyoku2 = new Kyusyoku();
				ArrayList<KyusyokuBean> kyusyokuList2 = new ArrayList<>();
				kyusyokuList2 = kyusyoku2.getKyusyoku(kyusyokuName, uketukenengappi, kibousyokusyu, currentPageNumber, sort);
				//リクエストスコープに求職情報を設定する
				request.setAttribute("kyusyokubeanList", kyusyokuList2);

				//
				session.setAttribute("currentPageNumber", currentPageNumber);
				session.setAttribute("kyusyokuName", kyusyokuName);
				session.setAttribute("uketukenengappi", uketukenengappi);
				session.setAttribute("kibousyokusyu", kibousyokusyu);
				Kyusyoku kyusyoku = new Kyusyoku();
				//
				KyusyokuBean bean2 = kyusyoku.getKyusyoku(kyusyokuName, uketukenengappi, kibousyokusyu);
				 allRecordCount = bean2.getAllRecordCount();
				 allPageCount =   bean2.getAllPageCount();
				request.setAttribute("allRecordCount",allRecordCount);
				request.setAttribute("allPageCount"  ,allPageCount);

				rd = request.getRequestDispatcher("/kyusyokuList.jsp");
				rd.forward(request, response);

				break;



			case "求職検索" :
/*
 *				String kyusyokuName = "%" + request.getParameter("kyusyokuName3") + "%";
 *				String uketukenengappi2 = "%" + request.getParameter("uketukenengappi6");
 *				String kibousyokusyu = "%" + request.getParameter("kibousyokusyu3");
 *				Kyusyoku kyusyoku2 = new Kyusyoku();
 *				ArrayList<KyusyokuBean> kyusyokuList2 = new ArrayList<> ();
 *				kyusyokuList2 = kyusyoku2.getKyusyoku(kyusyokuName, uketukenengappi2, kibousyokusyu);
 *				//リクエストスコープに求職情報を設定する
 *				request.setAttribute("kyusyokubeanList", kyusyokuList2);
 */
				kyusyokuName = "%" + request.getParameter("kyusyokuName3") + "%";
				uketukenengappi = "%" + request.getParameter("uketukenengappi6") + "%";
				kibousyokusyu = "%" + request.getParameter("kibousyokusyu3") + "%";
				currentPageNumber = 1;//ページング機能20190718
				sort = "ksi.kyusyoku_uketukenengappi desc";//ソート機能20190718
				session.setAttribute("sort", sort);//ソート機能20190718
				kyusyoku2 = new Kyusyoku();
				kyusyokuList2 = new ArrayList<>();
				kyusyokuList2 = kyusyoku2.getKyusyoku(kyusyokuName, uketukenengappi, kibousyokusyu, currentPageNumber, sort);
				//リクエストスコープに求人情報を設定する
				request.setAttribute("kyusyokubeanList", kyusyokuList2);

				//20190717 ページネーション
				session.setAttribute("currentPageNumber", currentPageNumber);
				session.setAttribute("kyusyokuName", kyusyokuName);
				session.setAttribute("uketukenengappi", uketukenengappi);
				session.setAttribute("kibousyokusyu", kibousyokusyu);
				kyusyoku = new Kyusyoku();
				bean2 = kyusyoku.getKyusyoku(kyusyokuName, uketukenengappi, kibousyokusyu);
				allRecordCount = bean2.getAllRecordCount();
				allPageCount = bean2.getAllPageCount();
				request.setAttribute("allRecordCount",allRecordCount);
				request.setAttribute("allPageCount", allPageCount);

				rd  = request.getRequestDispatcher("/kyusyokuList.jsp");

				rd.forward(request, response);
		}
	}

}
