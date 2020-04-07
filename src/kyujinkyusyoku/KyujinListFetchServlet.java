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
 * Servlet implementation class KyujinListFetchServlet
 */
@WebServlet("/KyujinListFetchServlet")
public class KyujinListFetchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static JSONObject simplejo;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public KyujinListFetchServlet() {
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
    	simplejo = new JSONObject();
    	Gson gson = new Gson();
    	String actString = "show";
    	ArrayList<KyujinListFetchModel> list = new ArrayList<>();
    	if(actString.equals("show")) {
    		list=KyujinListFetchServices.selectAll();
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
