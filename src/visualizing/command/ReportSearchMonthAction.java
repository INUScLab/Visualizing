package visualizing.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ReportSearchMonthAction implements CommandAction {
	
	@Override
	public void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
	}

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		return "/report/reportMonth.jsp";
	}
	
	

}
