package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import jdbc.DBConn;

public class MemberDao {
    Connection conn;
    PreparedStatement ps;
    ResultSet rs;
    public MemberDao() {
        conn = new DBConn("mydb").getConn();
    }
    
    public String insert(MemberVo vo) {
        String msg = "화이팅~~~~~";
        String sql = "insert into member(id, name, gender, phone, sysFile, oriFile) "
                +    " values(?,?,?,?,?,?)";
        try {
            conn.setAutoCommit(false);
            ps = conn.prepareStatement(sql);
            ps.setString(1, vo.getId());
            ps.setString(2, vo.getName());
            ps.setString(3, vo.getGender());
            ps.setString(4, vo.getPhone());
            ps.setString(5, vo.getSysFile());
            ps.setString(6, vo.getOriFile());
            
            int cnt = ps.executeUpdate();
            
            if(cnt>0) {
                conn.commit();
                msg="저장 성공";
            }else {
                conn.rollback();
                msg="저장 중 오류 발생";
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        System.out.println(msg);
        return msg;
    }
    
    public JSONArray select(String findStr) {
        JSONArray array = new JSONArray(); 
        String sql = "select * from member where id like ? or phone like ? ";
        try {
            
            ps = conn.prepareCall(sql);
            ps.setString(1, "%" + findStr + "%");
            ps.setString(2, "%" + findStr + "%");
            
            rs = ps.executeQuery();
            
            while(rs.next()) {
                JSONObject obj = new JSONObject();
                obj.put("id", rs.getString("id"));
                obj.put("name", rs.getString("name"));
                obj.put("phone", rs.getString("phone"));
                obj.put("gender", rs.getString("gender"));
                obj.put("sysFile", rs.getString("sysFile"));
                obj.put("oriFile", rs.getString("oriFile"));
                array.add(obj);          
            }
            
        }catch(Exception e) {
            e.printStackTrace();
        }
        
        return array;        
        
    }
}
