package visualizing.Mapreport;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;

import sclab.db.DbConnector;

public class DongInfoCtrl {

	DbConnector dbconnector;
	Connection conn;
	PreparedStatement pstmt;
	
	public DongInfoCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	public ArrayList<DongInfo> getDongInfoList ( ) {

		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String currentDate = sdf.format(date);
		
		ArrayList<DongInfo> dongInfoList  = new ArrayList<DongInfo> () ;
		
		String gu;
		String dong;
		double lat;
		double lng;
		int count_leak;
		int count_absence;
		int count_freezed;
		int count_reverse;
		int count_fat;
		int count_breakage;
		
		String sql = "SELECT DISTINCT U.SIGOON , U.UMDONG , D.LAT , D.LNG , ( SELECT SUM(C.LEAK) FROM CONSUMPTION C WHERE C.CODE IN ( SELECT CODE FROM USER WHERE UMDONG = U.UMDONG )  AND C.DATE = '"+ currentDate + "') AS LEAK, ( SELECT SUM(C.ABSENCE) FROM CONSUMPTION C WHERE C.CODE IN ( SELECT CODE FROM USER WHERE UMDONG = U.UMDONG )  AND C.DATE = '"+ currentDate + "') AS ABSENCE , ( SELECT SUM(C.FREEZED) FROM CONSUMPTION C WHERE C.CODE IN ( SELECT CODE FROM USER WHERE UMDONG = U.UMDONG )  AND C.DATE = '"+ currentDate + "') AS FREEZED , ( SELECT SUM(C.REVERSE) FROM CONSUMPTION C WHERE C.CODE IN ( SELECT CODE FROM USER WHERE UMDONG = U.UMDONG )  AND C.DATE = '"+ currentDate + "') AS REVERSE, ( SELECT SUM(C.FAT) FROM CONSUMPTION C WHERE C.CODE IN ( SELECT CODE FROM USER WHERE UMDONG = U.UMDONG )  AND C.DATE = '"+ currentDate + "') AS FAT, ( SELECT SUM(C.BREAKAGE) FROM CONSUMPTION C WHERE C.CODE IN ( SELECT CODE FROM USER WHERE UMDONG = U.UMDONG )  AND C.DATE = '"+ currentDate + "') AS BREAKAGE FROM USER U INNER JOIN UMDONG D ON U.UMDONG = D.NAME;";
		//System.out.println(currentDate);
		//System.out.println(sql);
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				gu = rs.getString("U.SIGOON");
				dong = rs.getString("U.UMDONG");
				lat = rs.getDouble("D.LAT");
				lng = rs.getDouble("D.LNG");
				count_leak = rs.getInt("LEAK");
				count_absence = rs.getInt("ABSENCE");
				count_freezed = rs.getInt("FREEZED");
				count_reverse = rs.getInt("REVERSE");
				count_fat = rs.getInt("FAT");
				count_breakage = rs.getInt("BREAKAGE");
				
				DongInfo dongInfo = new DongInfo( gu , dong, lat, lng , count_leak , count_absence , count_freezed , count_reverse , count_fat , count_breakage );
				dongInfoList.add(dongInfo);
			}
			
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}

		disconnect();
		return dongInfoList;
	}
	
	
}

