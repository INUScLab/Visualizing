package visualizing.read;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sclab.db.DbConnector;

public class ReadDataCtrl {

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
	public String status_sql = "";
	public String date;

	
	public ReadDataCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	void setParameters(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String[] str, String date){
		
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
		
		if(str == null){
			this.status_sql = "leak,freezed,fat,breakage,reverse,absence,";
		}
		else{
			for(int i=0;i<str.length;i++){
				this.status_sql += str[i] + ",";
			}
		}
		
		this.date = date;
	}
	
	// 일간 검침
	ArrayList<ReadData> getInfo(String[] list) {

		ArrayList<ReadData> datas = new ArrayList<ReadData>();
		String sql = null;
		
		sql = "select u.code, u.detail, u.number, u.meter_num, u.meter_type," + status_sql + "consumed from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\" and umdong like \"" + umdong + "\") u inner join CONSUMPTION c on u.code = c.code where (date = '" + date + "') and (" + code + " and " + detail + " and " + number + " and " + meter_num + ") group by u.code";
		
		System.out.println(sql);

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				if( list == null){
					ReadData temp = new ReadData();
					temp.setCode(rs.getString("u.code"));
					temp.setDetail(rs.getString("u.detail"));
					temp.setNumber(rs.getString("u.number"));
					temp.setMeter_num(rs.getString("u.meter_num"));
					temp.setMeter_type(rs.getString("u.meter_type"));
					
					String[] str = new String(status_sql).split(",");
					String meter_status = "";
					int check = 0;
					
					for(int i=0;i<str.length;i++){
						if( Integer.parseInt(rs.getString(str[i]))>0){
							switch(str[i]){
								case "leak" : meter_status += "누수 "; break;
								case "freezed" : meter_status += "동파 "; break;
								case "fat" : meter_status += "비만관 "; break;
								case "breakage" : meter_status += "파손 "; break;
								case "reverse" : meter_status += "역류 "; break;
								case "absence" : meter_status += "부재중 "; break;
							}
						}
						else{
							check++;
						}
					}
					
					if(check == str.length){
						meter_status = "정상";
					}
					else{
						
					}
					
					temp.setMeter_status(meter_status);
					temp.setDate(date);
					temp.setConsumed(rs.getString("consumed"));
					
					datas.add(temp);
				}
				else{
					String[] str = new String(status_sql).split(",");
					String meter_status = "";
					
					for(int i=0;i<str.length;i++){
						if( Integer.parseInt(rs.getString(str[i]))>0){
							switch(str[i]){
								case "leak" : meter_status += "누수 "; break;
								case "freezed" : meter_status += "동파 "; break;
								case "fat" : meter_status += "비만 "; break;
								case "breakage" : meter_status += "파손 "; break;
								case "reverse" : meter_status += "역류 "; break;
								case "absence" : meter_status += "부재중 "; break;
							}
							ReadData temp = new ReadData();
							temp.setCode(rs.getString("u.code"));
							temp.setDetail(rs.getString("u.detail"));
							temp.setNumber(rs.getString("u.number"));
							temp.setMeter_num(rs.getString("u.meter_num"));
							temp.setMeter_type(rs.getString("u.meter_type"));
							temp.setMeter_status(meter_status);
							temp.setDate(date);
							temp.setConsumed(rs.getString("consumed"));
							
							datas.add(temp);
						}
					}
				}
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return datas;
	}
	
	// 모든 작업
	public ArrayList<ReadData> returnDatas(String sido, String sigoon, String umdong, String code, String detail, String number, String meter_num, String[] str, String date){
		
		setParameters(sido, sigoon, umdong, code, detail, number, meter_num, str, date);
		
		// 기본 정보
		ArrayList<ReadData> info_array = getInfo(str);

		// DB연결 해제
		disconnect();
		
		return info_array;
	}
}
