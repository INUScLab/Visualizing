package visualizing.command;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import sclab.db.DetailData;
import sclab.db.DetailDataCtrl;

public class ReportSearchDayAction implements CommandAction {

	@Override
	public void forward(HttpServletRequest req, HttpServletResponse resp, String url)
			throws ServletException, IOException {
			RequestDispatcher rd = req.getRequestDispatcher(url);
			rd.forward(req, resp);
	}

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		request.setCharacterEncoding("UTF-8");
		
		DetailDataCtrl ddctrl = new DetailDataCtrl();
		
		String si = request.getParameter("si");
		String guGun = request.getParameter("guGun");
		String umDong = request.getParameter("umDong");
		String consumerNum = request.getParameter("consumerNum");
		String consumerName = request.getParameter("consumerName");
		String telNumber = request.getParameter("telNumber");
		String meterNum = request.getParameter("meterNum");
		String dateYear = request.getParameter("dateYear");
		String dateMonth = request.getParameter("dateMonth");

		if (dateYear == null || dateYear.equals(""))
			dateYear = "2015";
		if (dateMonth == null || dateMonth.equals(""))
			dateMonth = "02";
		if (si == null || si.equals(""))
			si = "인천광역시";
		if (guGun == null || guGun.equals(""))
			guGun = "부평구";
		if (umDong == null || umDong.equals(""))
			umDong = "전체";
		if (consumerNum != null)
			if (consumerNum.equals(""))
				consumerNum = null;
		if (consumerName != null)
			if (consumerName.equals(""))
				consumerName = null;
		if (telNumber != null)
			if (telNumber.equals(""))
				telNumber = null;
		if (meterNum != null)
			if (meterNum.equals(""))
				meterNum = null;
		
		ArrayList<DetailData> data = ddctrl.returnDatas(si, guGun, umDong, consumerNum, consumerName,
				telNumber, meterNum, dateYear, dateMonth);
		//ArrayList<DetailData> array_list = ddctrl.returnDatas("인천광역시","부평구","전체",consumerNum,consumerName,telNumber,meterNum,"2015","02");

		//String uri = request.getRequestURI();
		//forward(request,response,uri);
		int size = data.size();
		
		System.out.print(size);
		request.setAttribute("size", size);		
		request.setAttribute("searchDayData", data);
		
		return "/report/reportDay.jsp";
	}
	
	

}
