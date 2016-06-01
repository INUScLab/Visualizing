package visualizing.analysis;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import sclab.db.DbConnector;
import visualizing.report.DetailData;

public class RankDataCtrl {

	DbConnector dbconnector;
	Connection conn;
	PreparedStatement pstmt;
	
	public String sido;
	public String sigoon;
	public String startday;
	public String endday;
	
	public RankDataCtrl(){
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}
	
	void disconnect(){
		dbconnector.disconnect();
	}
	
	void setParameters(String sido, String sigoon){
		this.sido = sido;
		this.sigoon = sigoon;
		this.startday = "20150201";
		this.endday = "20150215";
	}
	
	ArrayList<ArrayList<String>> getRanks(String column) {
		
		ArrayList<ArrayList<String>> datas = new ArrayList<ArrayList<String>>();
		String sql = null;
		
		sql = "select umdong, " + column + " from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\") u inner join CONSUMPTION c on u.code = c.code where (date between '" + startday + "' and '" + endday + "') group by umdong order by " + column + " desc";
		
		//System.out.println(sql);

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				ArrayList<String> temp = new ArrayList<String>();
				
				temp.add(rs.getString("umdong"));
				temp.add(rs.getString(column));
				
				datas.add(temp);
			}
			
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return datas;
	} 
	
	ArrayList<ArrayList<String>> getUpperDatas(String column, ArrayList<ArrayList<String>> umdongs) {
		
		ArrayList<ArrayList<String>> datas = new ArrayList<ArrayList<String>>();
		String sql = null;

		try {
			
			for(int i=0; i<4; i++){
				
				ArrayList<String> temp = new ArrayList<String>();
				
				sql = "select " + column + " from (select * from USER where sido like \"" + sido + "\" and sigoon like \"" + sigoon + "\" and umdong like \"" + umdongs.get(i).get(0) + "\") u inner join CONSUMPTION c on u.code = c.code where (date between '" + startday + "' and '" + endday + "') group by date";
				
				//System.out.println(sql);
				
				pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				
				while(rs.next()){
					
					temp.add(rs.getString(column));
				}
				rs.close();
				
				datas.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return datas;
	}
	
	public RankData returnDatas(String sido, String sigoon){
		
		RankData return_data = new RankData();
		
		setParameters(sido, sigoon);
		
		// 랭킹 정보
		return_data.setLeak_rank(getRanks("sum(leak)"));
		return_data.setFreezed_rank(getRanks("sum(freezed)"));
		return_data.setFat_rank(getRanks("sum(fat)"));
		return_data.setBreakage_rank(getRanks("sum(breakage)"));
		return_data.setReverse_rank(getRanks("sum(reverse)"));
		return_data.setAbsence_rank(getRanks("sum(absence)"));
		
		// 상위 랭킹의 한달간 데이터 받아오기
		return_data.setUpper_leak_data(getUpperDatas("sum(leak)",return_data.getLeak_rank()));
		return_data.setUpper_freezed_data(getUpperDatas("sum(freezed)",return_data.getFreezed_rank()));
		return_data.setUpper_fat_data(getUpperDatas("sum(fat)",return_data.getFat_rank()));
		return_data.setUpper_breakage_data(getUpperDatas("sum(breakage)",return_data.getBreakage_rank()));
		return_data.setUpper_reverse_data(getUpperDatas("sum(reverse)",return_data.getReverse_rank()));
		return_data.setUpper_absence_data(getUpperDatas("sum(absence)",return_data.getAbsence_rank()));
		
		// DB연결 해제
		disconnect();
		
		return return_data;
	}
}
