package bean;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {
	String driver = "com.mysql.cj.jdbc.Driver";
	String path = "jdbc:mysql://localhost:3306/mydb?useUnicode=true&characterEncoding=UTF-8";

	String user = "hong";
	String pwd = "1111";
	
	Connection conn;

	public DBConn() {
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(path, user, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection getConn() {
		return conn;
	}
}
