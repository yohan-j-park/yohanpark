package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Employee {         //CRUD 연습
    Connection conn;
    public Employee() {
        this.conn = new DBConn().getConn();         //
    }
    
    public void insert() throws Exception {
        conn.setAutoCommit(false);
        String sql = "insert into test(id, name) values(?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "e001");
        ps.setString(2, "나씨");
        
        int cnt = ps.executeUpdate();
        if(cnt>0) conn.commit();
        else conn.rollback();
        
        ps.close();
        conn.close();
    }
    public void select() throws Exception {
        conn = new DBConn().getConn();
        String sql = "select * from test";
        PreparedStatement ps = conn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();         // select문장은 executeQuery()사용 ResultSet => 명시적 커서
        while(rs.next()) {
            String id = rs.getString("id");       //id에 있는 필드명을 문자로 가지고오다
            String name = rs.getString("name");
            System.out.printf("id:%s(%s)\n", id, name);
        }
            
            ps.close(); 
            conn.close();   // close 안하면 서버다운됨
    }
    public void update() throws Exception{
        conn = new DBConn().getConn();
        conn.setAutoCommit(false);
        String sql = "update test set name=? where id=?";   // test라는 테이블에서 id가 ?인것을 찾아 이름을 ?로 바꾸겠다.
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "가씨");
        ps.setString(2, "e001");
        int cnt = ps.executeUpdate();

        //검증코드
        if(cnt>0) conn.commit();
        else conn.rollback();   
    }
    public void delete() throws Exception{
        conn = new DBConn().getConn();
        conn.setAutoCommit(false);
        String sql = "delete from test where id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, "b001");
        int cnt = ps.executeUpdate();
        
        if(cnt>0) {
            System.out.println("삭제되었습니다.");
            conn.commit();
        }
        else {
            System.out.println("삭제 할 자료가 없습니다.");
            conn.rollback();
        }
        ps.close();
        conn.close();
        select();
        
        
    }
    public static void main(String[] args) {
        Employee e = new Employee();
        try {
//            e.insert();
//            e.select();
//            e.update();
            e.delete();
        } catch (Exception e1) {

            e1.printStackTrace();
        }
    }
}
