package visualizing.log_administor;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import sclab.db.DbConnector;
import visualizing.analysis.AnalysisData;

public class adminlog_ctrl {
	DbConnector dbconnector;
	Connection conn;
	PreparedStatement pstmt;

	public adminlog_ctrl() {
		dbconnector = new DbConnector();
		conn = dbconnector.getConn();
		pstmt = dbconnector.getPstmt();
	}

	void disconnect() {
		dbconnector.disconnect();
	}

	public void setInfo(String date, String id, String ip) {
		String sql = null;
		sql = "INSERT INTO `sclab`.`AdminLog` (`dayandtime`, `id`, `ip`) VALUES (\"" + date + "\"" + ",\"" + id + "\""
				+ ",\"" + ip + "\")";
		System.out.println(sql);

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<adminlog> getLog() {

		ArrayList<adminlog> datas = new ArrayList<adminlog>();
		String sql = null;
		sql = "SELECT num, dayandtime, id, ip FROM sclab.AdminLog order by num desc";

		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				adminlog temp = new adminlog();
				temp.setNum(rs.getInt("num"));
				temp.setDayandtime(rs.getString("dayandtime"));
				temp.setId(rs.getString("id"));
				temp.setIp(rs.getString("ip"));

				datas.add(temp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return datas;
	}

	// 검색한 정보 반환

}
