package kyujinkyusyoku;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
/**
 * Servlet implementation class KyujinResponsibledataServlet
 */
@WebServlet("/KyujinResponsibledataServlet")
public class KyujinResponsibledataServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinResponsibledataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
//		doPost(request, response);

		 try {

			 	request.setCharacterEncoding("UTF-8");

		        //パラメータ取得
			 	String kaisyaId_ = request.getParameter("id");
		        int kaisyaId = Integer.parseInt(kaisyaId_);

		        //処理（DB呼び出し等）

		        Kyujin dept = new Kyujin();
		        ArrayList<KyujinBean> deptList = new ArrayList<>();
		        deptList = dept.getDept(kaisyaId);



 		        //String response1 = "1a";
 		        //String response2 = "2b";

		        //出力(レスポンスをmapに格納してJSON化)

		        //JSONマップ
		        Map<String, ArrayList<KyujinBean>> mapMsg = new HashMap<String, ArrayList<KyujinBean>>();

		        //追加
		        //mapMsg.put("response1", response1);
		        //mapMsg.put("response2", response2);
		        mapMsg.put("response3", deptList);

		        //マッパ(JSON <-> Map, List)
		        ObjectMapper mapper = new ObjectMapper();

		        //json文字列
		        String jsonStr = mapper.writeValueAsString(mapMsg);  //list, map

		        //ヘッダ設定
		        response.setContentType("application/json;charset=UTF-8");   //JSON形式, UTF-8

		        //pwオブジェクト
		        PrintWriter pw = response.getWriter();

		        //出力
		        pw.print(jsonStr);

		        //クローズ
		        pw.close();

		    } catch(Exception e) {
		        e.printStackTrace();
		    }
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);


		    }
	}


