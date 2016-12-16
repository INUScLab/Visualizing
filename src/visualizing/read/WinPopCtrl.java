package visualizing.read;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sclab.db.DbConnector;

public class WinPopCtrl {

	DbConnector dbconnector;
	Connection conn;
	PreparedStatement pstmt;
	
	public String code;
	public String sdate;
	public String edate;
	
	public WinPopCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	void setParameters(String code, String sdate, String edate){
		this.code = code;
		this.sdate = sdate;
		this.edate = edate;
		
		if(sdate.length() != 10){
			this.sdate = sdate + "-01";
			this.edate = edate + "-31";
		}
	}
	
	// 일간 검침
	ArrayList<WinPop> getInfo() {
		ArrayList<WinPop> datas = new ArrayList<WinPop>();
		String sql = null;
		
		sql = "select date, consumed from CONSUMPTION where (code=" + code + ") and (date between '" + sdate + "' and '" + edate + "')";

		System.out.println(sql);

		try{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WinPop temp = new WinPop();
				temp.setDate(rs.getString("date"));
				temp.setConsumed(rs.getString("consumed"));
				datas.add(temp);
			}
		
		} catch(SQLException e){
			e.printStackTrace();
		}
		return datas;
	}
	
	// 월간 검침
	ArrayList<WinPop> getInfo2() {
		ArrayList<WinPop> datas = new ArrayList<WinPop>();
		String sql = null;
		
		sql = "select date_format(date,'%Y-%m') as d, sum(consumed) from CONSUMPTION where (code=" + code + ") and (date between '" + sdate + "' and '" + edate + "') group by d";

		//System.out.println(sql);

		try{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WinPop temp = new WinPop();
				temp.setDate(rs.getString("d"));
				temp.setConsumed(rs.getString("sum(consumed)"));
				datas.add(temp);
			}
		
		} catch(SQLException e){
			e.printStackTrace();
		}
		return datas;
	}
	
	// 일간검침 모든 작업
	public ArrayList<WinPop> returnDatas(String code, String sdate, String edate){
		
		setParameters(code, sdate, edate);
		
		// 기본 정보
		ArrayList<WinPop> info_array = getInfo();

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
	
	// 월간검침 모든 작업
	public ArrayList<WinPop> returnDatas2(String code, String sdate, String edate){
		
		setParameters(code, sdate, edate);
		
		// 기본 정보
		ArrayList<WinPop> info_array = getInfo2();

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
}
