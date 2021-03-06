package kyujinkyusyoku;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

/**
 * Servlet implementation class kyujininfoListServlet
 */
@WebServlet("/kyujininfoListServlet")
public class kyujininfoListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static JSONObject simplejo;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public kyujininfoListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		perform(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		perform(request, response);
	}

	@SuppressWarnings("unchecked")
	private void perform(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Su dung parameter kyujinkaisyaId de truyen vao function selectAll, dung lam dk get data
		request.setCharacterEncoding("UTF-8");
		String userId = request.getParameter("reqValue");
		KyujinkaisyaBean kjbean = new KyujinkaisyaBean();
		kjbean = tantousyaListServices.selectKyujinkaisyaId(userId);
		int kyujinkaisyaId = kjbean.getKyujinkaisyaId();

		//Su dung Json de get list data len table
    	simplejo = new JSONObject();
    	Gson gson = new Gson();
    	String actString = "show";
    	ArrayList<KyujinListFetchModel> list = new ArrayList<>();
    	if(actString.equals("show")) {

			//Tien hanh get data len table
    		list=tantousyaListServices.selectAllKyujinInfo(kyujinkaisyaId);
    		JsonElement element = gson.toJsonTree(list, new TypeToken<List<KyujinListFetchModel>>(){
    		}.getType());
    		JsonArray ja = element.getAsJsonArray();

    		response.setContentType("application/json;charset=UTF-8");
    		simplejo.put("status",true);
    		simplejo.put("result",ja);
    		response.getWriter().print(simplejo);
    	}
    }

}
