package visualizing.report;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sclab.db.DbConnector;
import visualizing.analysis.AnalysisData;

public class DetailDataCtrl {

	DbConnector dbconnector;
	Connection conn;
	PreparedStatement pstmt;
	
	public String sido;
	public String sigoon;
	public String umdong;
	public String code;
	public String detail;
	public String number;
	public String meter_num;
	public String startday;
	public String endday;
	public String year;

	
	public DetailDataCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	void setParameters(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String year, String month){
		
		if(sido == null || sido.equals("전체")){
			this.sido = "%"; this.sigoon = "%"; this.umdong = "%";
		}
		else if (sigoon == null || sigoon.equals("전체")){
			this.sido = sido; this.sigoon = "%"; this.umdong = "%";
		}
		else if (umdong == null || umdong.equals("전체")){
			this.sido = sido; this.sigoon = sigoon; this.umdong = "%";
		}
		else{
			this.sido = sido; this.sigoon = sigoon; this.umdong = umdong;
		}
		
		if(code == null){
			this.code = "true";
		}
		else{
			this.code = "u.code=" + code;
		}
		if(detail == null){
			this.detail = "true";
		}
		else{
			this.detail = "u.detail like '%" + detail + "%'";
		}
		if(number == null){
			this.number = "true";
		}
		else{
			this.number = "u.number like '%" + number + "%'";
		}
		if(meter_num == null){
			this.meter_num = "true";
		}
		else{
			this.meter_num = "u.meter_num like '%" + meter_num + "%'";
		}
		
		if(month != null){
			this.startday = year + month + "01";
			this.endday = year + month + "31";
		}
		else{
			this.year = year;
		}
	}
	
	// 일간
	ArrayList<DetailData> getInfo() {

		ArrayList<DetailData> datas = new ArrayList<DetailData>();
		String sql = null;
		
		sql = "select u.code, u.detail, u.number, u.meter_num, u.meter_type, sum(consumed), group_concat(consumed) from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\" and umdong like \"" + umdong + "\") u inner join CONSUMPTION c on u.code = c.code where (date between '" + startday + "' and '" + endday + "') and (" + code + " and " + detail + " and " + number + " and " + meter_num + ") group by u.code";
		
		//System.out.println(sql);

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				DetailData temp = new DetailData();
				temp.setCode(rs.getString("u.code"));
				temp.setDetail(rs.getString("u.detail"));
				temp.setNumber(rs.getString("u.number"));
				temp.setMeter_num(rs.getString("u.meter_num"));
				temp.setMeter_type(rs.getString("u.meter_type"));
				temp.setTotal_consumed(rs.getString("sum(consumed)"));
				
				String[] str = new String(rs.getString("group_concat(consumed)")).split(",");
				
				temp.setConsumed_days(str);
				
				datas.add(temp);
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 월간
	ArrayList<DetailData> getInfo2() {

		ArrayList<DetailData> datas = new ArrayList<DetailData>();
		String sql = null;
		
		sql = "select code, detail, number, meter_num, meter_type, sum(c), group_concat(c order by d) from (select u.code, u.detail, u.number, u.meter_num, u.meter_type, date_format(date,'%Y-%m') as d, sum(consumed) as c from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\" and umdong like \"" + umdong + "\") u inner join CONSUMPTION c on u.code = c.code where (date_format(date,'%Y')='" + year + "') and (" + code + " and " + detail + " and " + number + " and " + meter_num + ") group by u.code ,date_format(date,'%Y-%m')) a group by code;";
		
		//System.out.println(sql);
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				DetailData temp = new DetailData();
				temp.setCode(rs.getString("code"));
				temp.setDetail(rs.getString("detail"));
				temp.setNumber(rs.getString("number"));
				temp.setMeter_num(rs.getString("meter_num"));
				temp.setMeter_type(rs.getString("meter_type"));
				temp.setTotal_consumed(rs.getString("sum(c)"));
				
				String[] str = new String(rs.getString("group_concat(c order by d)")).split(",");
				
				temp.setConsumed_days(str);
				
				datas.add(temp);
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 일간 모든 작업
	public ArrayList<DetailData> returnDatas(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String year, String month){
		
		setParameters(sido, sigoon, umdong, code, detail, number, meter_num, year, month);
		
		// 기본 정보
		ArrayList<DetailData> info_array = getInfo();

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
	
	// 월간 모든 작업
	public ArrayList<DetailData> returnDatas2(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String year){
		
		setParameters(sido, sigoon, umdong, code, detail, number, meter_num, year, null);
		
		// 기본 정보
		ArrayList<DetailData> info_array = getInfo2();

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
	
	public List<DetailData> getList (int start, int end, ArrayList<DetailData> arrayList){
		List<DetailData> lists = new ArrayList<DetailData>();
		
		if (end == 0) return lists;
		
		for (int i=start-1; i<end; i++){
			lists.add(arrayList.get(i));
		}
		
		return lists;
	}
}
