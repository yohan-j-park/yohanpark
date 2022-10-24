package jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberDto {
    Connection conn;
    
    
    public int insert(MemberVo vo) {
        int cnt = 0;
        
        // connection 생성
        conn = new DBConn("mydb").getConn();
        // transaction 수동으로
        try {
        conn.setAutoCommit(false);
        
        // sql문장
        String sql = "insert into member(id, name, gender, phone, mdate, photo)"
                     +" values(?,?,?,?,now(),? )";
        
        // statement 생성
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, vo.getId());
        ps.setString(2, vo.getIrum());
        ps.setString(3, vo.getGender());
        ps.setString(4, vo.getPhone());
        ps.setString(5, vo.getPhoto());
        
        // 실행
        cnt = ps.executeUpdate();
        if(cnt>0) conn.commit();
        else conn.rollback();
        
        // close
        ps.close();
        conn.close();
        
        }catch(Exception e) {
            e.printStackTrace();
        }
        return cnt;
    }
    
    public int update(MemberVo vo) {
        int cnt = 0;
        
        return cnt;
    }
    
    public int delete(String id) {
        int cnt = 0;
        return cnt;
    }
    
    public Vector<Vector> select(String findStr){
        Vector<Vector> list = new Vector<Vector>();
        try {
            conn = new DBConn("mydb").getConn();
            String sql = "select * from member "    
                    +    "where id like ? "
                    +    "or name like ? "
                    +    "or phone like ? ";        // 한 문장을 여러 줄로 나눠서 썼을 때 공백 하나를 추가해야한다(memberwhere로 인식하기 때문)
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, "%"+findStr+"%");
            ps.setString(2, "%"+findStr+"%");
            ps.setString(3, "%"+findStr+"%");
            
            ResultSet rs = ps.executeQuery();
            while(rs.next()) {
                Vector v = new Vector();
                v.add(rs.getString("id"));
                v.add(rs.getString("name"));
                v.add(rs.getString("gender"));
                v.add(rs.getString("phone"));
                v.add(rs.getString("mdate"));
                list.add(v);
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return list;
    }
    
}
