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
 * Servlet implementation class changePasswordServlet
 */
@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePasswordServlet() {
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

		String btn = request.getParameter("submit");

		RequestDispatcher rd = null;

		HttpSession session = request.getSession();

		//Get gia tri da input tren man hinh
		String uerId_db = request.getParameter("userId_db");
		String old_password = request.getParameter("old_password");
		String new_password = request.getParameter("new_password");
		String renew_password = request.getParameter("renew_password");
		String level = request.getParameter("level_db");

		switch( btn ) {
			case "パスワード変更":
				rd = request.getRequestDispatcher("/changePassword.jsp");
				break;
			case "変更":
				//Tien hanh check password
				//Pass_db se duoc get tu database
				changePasswordDao getPass = new changePasswordDao();
				LoginUserBean beanPass = new LoginUserBean();
				try {
					beanPass = getPass.getPassword(uerId_db);
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
				String pass_db = beanPass.getPassword();
				//Check do dai
				checkPassword checkPassword = new checkPassword();
				Boolean nagasa = false;
				nagasa = checkPassword.checkPass(new_password);
				if (nagasa == false) {
					rd = request.getRequestDispatcher("/changePasswordNG1.jsp");
				}else {
					//Check tinh dung dan cua Old password
					//Truong hop nhap old pass dung
					if (pass_db.equals(old_password) == true) {
						//Check new pass va renew pass co giong nhau hay ko
						if (new_password.equals(renew_password) == false) {
							rd = request.getRequestDispatcher("/changePasswordNG3.jsp");
						} else {
							//Truong hop nhap Old pass dung, confirm lai lan nua,hien thi modal
							changePasswordBean cpbean = new changePasswordBean();
							cpbean.setUserId(uerId_db);
							cpbean.setOldPass(old_password);
							cpbean.setNewPass(new_password);
							cpbean.setRenewPass(renew_password);
							session.setAttribute("passwordInfo", cpbean);
							rd = request.getRequestDispatcher("/changePasswordConfirm.jsp");
						}
					}else {
						rd = request.getRequestDispatcher("/changePasswordNG2.jsp");
					}
				}
				break;
			case "変更する":
				//Truong hop da xac nhan muon update, tien hanh update data
				changePasswordDao changePass = new changePasswordDao();
				try {
					changePass.updatePassword(uerId_db, old_password, new_password);
				}
				catch ( SQLException e ) {
					e.printStackTrace();
				}
				if (level.equals("3") == true) {
					rd = request.getRequestDispatcher("/kyusyokusya_mypage.jsp");
				} else {
					rd = request.getRequestDispatcher("/kyujinmypage.jsp");
				}
				break;
			case "戻る":
				if (level.equals("3") == true) {
					rd = request.getRequestDispatcher("/kyusyokusya_mypage.jsp");
				} else {
					rd = request.getRequestDispatcher("/kyujinmypage.jsp");
				}
				break;
		}
		rd.forward(request, response);
	}

}
