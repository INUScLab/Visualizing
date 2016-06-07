package visualizing.read;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import sclab.db.DbConnector;

public class ReadMonthCtrl {

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
	public String date_start;
	public String date_end;

	
	public ReadMonthCtrl(){
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
		
		char pre;
		if(month.charAt(1) == '0'){
			this.date_start = year + "0901";
			this.date_end = year + month + "31";
		}
		else{
			pre = (char)((int)(month.charAt(1))-1);
			this.date_start = year + month.charAt(0) + pre + "01";
			this.date_end = year + month + "31";
		}
		
	}
	
	// 월간 검침
	ArrayList<ReadMonth> getInfo() {

		ArrayList<ReadMonth> datas = new ArrayList<ReadMonth>();
		String sql = null;
		
		sql = "select u.code, u.detail, u.number, u.meter_num, date_format(date, '%Y-%m'), sum(c.consumed) from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\" and umdong like \"" + umdong + "\") u inner join CONSUMPTION c on u.code = c.code where (date between '" + date_start + "' and '" + date_end + "') and (" + code + " and " + detail + " and " + number + " and " + meter_num + ") group by u.code, date_format(date, '%Y-%m')";

		//System.out.println(sql);

		try{
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			int i = 0;
			String pre_value = null;
			
			while(rs.next()) {
				if(i%2 == 0)
				{
					pre_value = rs.getString("sum(c.consumed)");
				}	
				else
				{
					ReadMonth temp = new ReadMonth();
					temp.setCode(rs.getString("u.code"));
					temp.setDetail(rs.getString("u.detail"));
					temp.setNumber(rs.getString("u.number"));
					temp.setMeter_num(rs.getString("u.meter_num"));
					temp.setMonth(rs.getString("date_format(date, '%Y-%m')"));
					temp.setValue(rs.getString("sum(c.consumed)"));
					temp.setPre_value(pre_value);
					datas.add(temp);
				}
				i++;
			}
		
		} catch(SQLException e){
			e.printStackTrace();
		}
		return datas;
	}
	
	// 모든 작업
	public ArrayList<ReadMonth> returnDatas(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String year, String month){
		
		setParameters(sido, sigoon, umdong, code, detail, number, meter_num, year, month);
		
		// 기본 정보
		ArrayList<ReadMonth> info_array = getInfo();

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
}
