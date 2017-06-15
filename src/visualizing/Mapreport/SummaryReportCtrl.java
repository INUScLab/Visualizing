package visualizing.Mapreport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;


import sclab.db.DbConnector;

class DateUtil
{
    public static Date addDays(Date date, int days)
    {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        cal.add(Calendar.DATE, days); //minus number would decrement the days
        return cal.getTime();
    }
}

public class SummaryReportCtrl {

	
	
	DbConnector dbconnector ;
	Connection conn  ;
	PreparedStatement pstmt ;
	
	String guGun;
	String umDong;
	String detail;
	double lat;
	double lng;
	
	double consumed;
	double predicted;
	
	int leak;
	int absence;
	int freezed;
	int reverse;
	int fat;
	int breakage;
	
	String latelyLeak;
	String latelyAbsence;
	String latelyFreezed;
	String latelyReverse;
	String latelyFat;
	String latelyBreakage;
	
	double day1;
	double day2;
	double day3;
	double day4;
	double day5;
	double day6;
	double day7;
	
	String gun;
	String dong;
	
	int countLeak;
	int countAbsence;
	int countFreezed;
	int countReverse;
	int countFat;
	int countBreakage;
	
	public SummaryReportCtrl() {
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
		
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	

	public ArrayList<SummaryReport> getSummaryReportList ( ) {

		ArrayList<SummaryReport> summuryReportList  = new ArrayList<SummaryReport> () ;
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String day_current = sdf.format(date);
		String day_6 = sdf.format(DateUtil.addDays(date, -1));
		String day_5 = sdf.format(DateUtil.addDays(date, -2));
		String day_4 = sdf.format(DateUtil.addDays(date, -3));
		String day_3 = sdf.format(DateUtil.addDays(date, -4));
		String day_2 = sdf.format(DateUtil.addDays(date, -5));
		String day_1 = sdf.format(DateUtil.addDays(date, -6));
		
		
		
		
		String sql = "SELECT U.SIGOON , U.UMDONG , U.DETAIL , U.LAT , U.LNG , C.CONSUMED , C.PREDICTED , C.LEAK , C.ABSENCE , C.FREEZED , C.REVERSE , C.FAT , C.BREAKAGE ,  (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND LEAK=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYLEAK ,  (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND ABSENCE=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYABSENCE , (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND FREEZED=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYFREEZED ,  (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND REVERSE=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYREVERSE ,  (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND FAT=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYFAT , (SELECT DATE FROM CONSUMPTION WHERE CODE = U.CODE AND BREAKAGE=1 ORDER BY DATE DESC LIMIT 1 ) AS LATELYBREAKAGE ,  (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '" + day_1 + "') AS DAY1 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '" + day_2 + "') AS DAY2 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '" + day_3 + "') AS DAY3 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '" + day_4 + "') AS DAY4 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '" + day_5 + "') AS DAY5 , (SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '" + day_6 + "') AS DAY6 ,(SELECT CONSUMED FROM CONSUMPTION WHERE CODE = U.CODE AND DATE = '" + day_current + "') AS DAY7 FROM USER U INNER JOIN CONSUMPTION C ON U.CODE = C.CODE AND C.DATE = '" + day_current + "'";
		System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				guGun = rs.getString("U.SIGOON");
				umDong = rs.getString("U.UMDONG");
				detail = rs.getString("U.DETAIL");
				lat = rs.getDouble("U.LAT");
				lng = rs.getDouble("U.LNG");
				
				consumed = rs.getDouble("C.CONSUMED");
				predicted = rs.getDouble("C.PREDICTED");
				
				leak = rs.getInt("C.LEAK");
				absence = rs.getInt("C.ABSENCE");
				freezed = rs.getInt("C.FREEZED");
				reverse = rs.getInt("C.REVERSE");
				fat = rs.getInt("C.FAT");
				breakage = rs.getInt("C.BREAKAGE");
				
				latelyLeak = rs.getString("LATELYLEAK");
				latelyAbsence = rs.getString("LATELYABSENCE");
				latelyFreezed = rs.getString("LATELYFREEZED");
				latelyReverse = rs.getString("LATELYREVERSE");
				latelyFat = rs.getString("LATELYFAT");
				latelyBreakage = rs.getString("LATELYBREAKAGE");
				
				day1 = rs.getDouble("DAY1");
				day2 = rs.getDouble("DAY2");
				day3 = rs.getDouble("DAY3");
				day4 = rs.getDouble("DAY4");
				day5 = rs.getDouble("DAY5");
				day6 = rs.getDouble("DAY6");
				day7 = rs.getDouble("DAY7");
			
				SummaryReport dongSummaryReport  = new SummaryReport( guGun , umDong , detail , lat , lng , consumed , predicted , 
						leak , absence , freezed , reverse ,fat , breakage , 
						latelyLeak , latelyAbsence , latelyFreezed , latelyReverse , latelyFat , latelyBreakage , 
						day1 , day2 , day3 , day4 , day5 , day6 , day7 
						);
				
				summuryReportList.add(dongSummaryReport);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return summuryReportList;
	}

	//?��?��?��,?��측량,�??�� ?���? ?��?��?�� 
	//?��주일 ?��?��?���?
	//�?�??��비스 �? ?��
}
