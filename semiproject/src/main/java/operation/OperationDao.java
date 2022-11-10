package operation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import jdbc.DBConn;

public class OperationDao{
	Connection conn;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public OperationDao() {
		try {
			conn = new DBConn("operation_management").getConn();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public void close() {		// rs, ps, conn
		try {
			if(rs != null) rs.close();
			if(ps != null) ps.close();
			if(conn != null) conn.close();
			rs=null;
			ps=null;
			conn=null;					
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
		
	public boolean insert(OperationVo vo) {
		if(conn == null) conn = new DBConn("operation_management").getConn();
		
		boolean b = false;
		String sql = "insert into om(date, machine_no, manager, pr_code, pr_name, taken_time, pf, status, pr_cost, real_price, vat, supply_price)"
					+"values(?,?,?,?,?,?,?,?,?)";
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getDate());
			ps.setString(2, vo.getMachine_no());
			ps.setString(3, vo.getManager());
			ps.setString(4, vo.getPr_code());
			ps.setString(5, vo.getPr_name());
			ps.setString(6, vo.getTaken_time());
			ps.setString(7, vo.getPf());
			ps.setString(8, vo.getStatus());
			ps.setString(9, vo.getPr_cost());	
			
			int cnt = ps.executeUpdate();
			if(cnt>0) {
				conn.commit();
				b=true;
			}else {
				conn.rollback();
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}		
		return b;
	}
	
	public List<OperationVo> select(Page pageVo){
		if(conn == null) conn = new DBConn("operation_management").getConn();
		List<OperationVo> list = new ArrayList<OperationVo>();
		String sql = "";
		
		//검색된 전체 건수
		try {
			sql = " select count(pr_code) totSize from om "	//select에서의 검색 조건과 같아야 한다.
					+ " where date like ? "
					+ " or 	  machine_no like ? "
					+ " or    pf like ? "
					+ " or    pr_name like ? "
					+ " or    pf like ? "
					+ " or    status like ? ";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + pageVo.getFindStr() + "%");
			ps.setString(2, "%" + pageVo.getFindStr() + "%");
			ps.setString(3, "%" + pageVo.getFindStr() + "%");
			ps.setString(4, "%" + pageVo.getFindStr() + "%");
			ps.setString(5, "%" + pageVo.getFindStr() + "%");
			ps.setString(6, "%" + pageVo.getFindStr() + "%");
			
			rs = ps.executeQuery();
			rs.next();
			int totSize = rs.getInt("totSize");
			pageVo.setTotSize(totSize);
			pageVo.compute();
			
			sql = " select * from om "
					+ " where date like ? "
					+ " or 	  machine_no like ? "
					+ " or    vat like ? "
					+ " or    pr_name like ? "
					+ " or    pf like ? "
					+ " or    status like ? "
					+ " order by date asc "
					+ " limit ? , ? ";
		
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + pageVo.getFindStr() + "%");
			ps.setString(2, "%" + pageVo.getFindStr() + "%");
			ps.setString(3, "%" + pageVo.getFindStr() + "%");
			ps.setString(4, "%" + pageVo.getFindStr() + "%");
			ps.setString(5, "%" + pageVo.getFindStr() + "%");
			ps.setString(6, "%" + pageVo.getFindStr() + "%");
			ps.setInt(7, pageVo.getStartNo());
			ps.setInt(8, pageVo.getListSize());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				OperationVo vo = new OperationVo();
				vo.setDate(rs.getString("date"));
				vo.setPr_code(rs.getString("pr_code"));
				vo.setMachine_no(rs.getString("machine_no"));
				vo.setManager(rs.getString("manager"));
				vo.setPr_name(rs.getString("pr_name"));
				vo.setTaken_time(rs.getString("taken_time"));
				vo.setPf(rs.getString("pf"));
				vo.setStatus(rs.getString("status"));
				vo.setVat(rs.getString("vat"));
				list.add(vo);
			}		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		close();
		
		return list;
	}
	
	public OperationVo view(String pr_code) {
		if(conn == null) conn = new DBConn("operation_management").getConn();
		OperationVo vo = new OperationVo();
		String sql = "select * from om where pr_code = ?";
		String real_price = "";
		String pr_cost = "";
		String vat = "";
		String supply_price = "";
		
		
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pr_code);
			rs = ps.executeQuery();
			
			
			
			
			 if(rs.next()) { 
				 
				 switch(rs.getString("pr_name")) {
					case "엑스봇로봇두뇌":
						pr_cost = "250000";
						real_price = "1000000";
						vat = "100000";			
						break;
					case "엑스봇로봇팔":
						pr_cost = "250000";
						real_price = "5000000";
						vat = "500000";
						supply_price = "5500000";
						break;
					case "엑스봇로봇다리":
						pr_cost = "350000";
						real_price = "7000000";
						vat = "700000";
						supply_price = "7700000";
						break;
					case "엑스봇로봇머리":
						pr_cost = "250000";
						real_price = "5000000";
						vat = "500000";
						supply_price = "5500000";
						break;
					case "엑스봇로봇몸통":
						pr_cost = "250000";
						real_price = "5000000";
						vat = "500000";
						supply_price = "5500000";
						break;
					case "엑스봇로봇신경":
						pr_cost = "600000";
						real_price = "1000000";
						vat = "100000";
						supply_price = "1100000";
						break;
						
					}
				 
			 vo.setPr_code(rs.getString("pr_code"));
			 vo.setDate(rs.getString("date")); 
			 vo.setMachine_no(rs.getString("machine_no"));
			 vo.setManager(rs.getString("manager"));
			 vo.setPr_name(rs.getString("Pr_name"));
			 vo.setTaken_time(rs.getString("taken_time")); 
			 vo.setPf(rs.getString("pf"));
			 vo.setStatus(rs.getString("status")); 
			 vo.setReal_price(real_price);
		}
			 
			 
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		close();
		return vo;
	}
	
	public boolean modify(OperationVo vo) {
		if(conn == null) conn = new DBConn("operation_management").getConn();
		boolean b = false;
		
		String sql = " update om set date = ?, machine_no = ?, "
					   + " manager = ?, pr_name = ?, " 
					   + " pf = ?, real_price = ? where pr_code = ?";
		
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getDate());
			ps.setString(2, vo.getMachine_no());
			ps.setString(3, vo.getManager());
			ps.setString(4, vo.getPr_name());
			ps.setString(5, vo.getPf());
			ps.setString(6, vo.getReal_price());
			ps.setString(7, vo.getPr_code());
			

	
			int cnt = ps.executeUpdate();
			System.out.println(cnt);
			if(cnt>0) {
				b = true;
				conn.commit();
			}else {
				conn.rollback();
			}
			
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}		
		return b;
	}
	
	public boolean delete(OperationVo vo) {
		if(conn == null) conn = new DBConn("operation_management").getConn();
		boolean b = false;
		String sql = "delete from om where pr_code = ?";
		try {
			conn.setAutoCommit(false);
			
			 ps = conn.prepareStatement(sql); 
			 ps.setString(1, vo.getPr_code());			 
			
			int cnt = ps.executeUpdate();
			
			if(cnt>0) {
				b = true;
				conn.commit();
			}else {
				conn.rollback();
			}
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return b;		
	}
	
}
