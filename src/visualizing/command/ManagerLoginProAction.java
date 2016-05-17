package visualizing.command;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sclab.db.DbConnector;



public class ManagerLoginProAction implements CommandAction {
	
	@Override
	public void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
	}
	
	public String checkId(String id, String pw) {

		DbConnector dbconnector = new DbConnector();
		Connection conn = dbconnector.getConn();
		PreparedStatement pstmt = dbconnector.getPstmt();

		String sql = "select strcmp((select SHA2(\"" + pw
				+ "\",512)),(select password from ADMIN where id =\"" + id
				+ "\")) as checkId;"; // 쿼리
		String value = null;

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				value = rs.getString("checkId");
			}

			rs.close();
			pstmt.close();
			conn.close();
			dbconnector.disconnect();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return value;
	} // 아디와 비밀번호 체크하는 함수


	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("userId");
		String passwd = request.getParameter("userPasswd");

		int check = 0;
		String result = checkId(id,passwd);
		if (result != null && result.equals("0")){
			check = 1;
			/*System.out.print("check=1");*/
		} else {
			check=0;
			//return "/index.jsp";
			/*System.out.print("check=0");*/
	     }
		
		request.setAttribute("check", new Integer(check));
		request.setAttribute("id", id);
		/*System.out.print("request까지 넣음");*/
		return "/logon/loginPro.jsp";
	}

	
}
