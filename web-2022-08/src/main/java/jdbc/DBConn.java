package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConn {   //데이터베이스커넥션
    private String driver = "com.mysql.cj.jdbc.Driver";
    private String path = "jdbc:mysql://localhost:3306/classicmodels"
                          + "?useUnicode=true&characterEncoding=UTF-8";
    private String user = "hong";
    private String pwd = "1111";
    
    Connection conn;
    
    
    
    public DBConn() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(path, user, pwd);
            System.out.println("Connection Ok");
        } catch (Exception e) {
            
            e.printStackTrace();
        }
    }
    public static void main(String[] args) {
        DBConn dbconn = new DBConn();
    }
    public Connection getConn() {
        return conn;
    }
   

    

}
