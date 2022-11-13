package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Login {
	
	DBConn Connection;
	
	public boolean login(String mId, String pwd) {
		boolean b = false;
		try {
			Connection conn = new DBConn("mydb").getConn();
			String sql = "select * from member where id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, mId);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				b = true;
			}
			ps.close();
			conn.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return b;
	}
}
