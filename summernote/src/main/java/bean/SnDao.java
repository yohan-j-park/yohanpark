package bean;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class SnDao {
	String uploadPath = "C:\\Users\\p_yoh\\eclipse-workspace\\summernote\\src\\main\\webapp\\";
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	String sql;
	public SnDao() {
		try {
			conn = new DBConn().getConn();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public boolean insert(SnVo vo) {
		boolean b = false;
		sql = "insert into summernote(subject, doc) values(?,?)";
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getSubject());
			ps.setString(2, vo.getDoc());

			int c = ps.executeUpdate();
			if (c > 0) {
				conn.commit();
				b = true;
			} else {
				conn.rollback();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;

	}

	public boolean modify(SnVo vo) {
		boolean b = false;
		sql = "update summernote set subject=? , doc=? where serial = ? ";
		try {
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getSubject());
			ps.setString(2, vo.getDoc());
			ps.setInt(3, vo.getSerial());

			int c = ps.executeUpdate();
			if (c > 0) {
				conn.commit();
				b = true;
			} else {
				conn.rollback();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;

	}

	public boolean delete(String serial) {
		boolean b = false;

		// img 태그안에 있는 파일명을 찾기 위한 패턴
		String regex = "(<img src=\")(.+?)(\")";
		Pattern pattern = Pattern.compile(regex);
		Matcher matcher = null;
		try {

			// 삭제해야할 파일명을 찾기 위해
			SnVo vo = view(serial);

			// doc 안에 있는 img 태그 정보를 가져와 파일 삭제
			matcher = pattern.matcher(vo.getDoc());

			sql = "delete from summernote where serial = " + serial;
			conn.setAutoCommit(false);
			ps = conn.prepareStatement(sql);

			int c = ps.executeUpdate();
			if (c > 0) {
				conn.commit();
				b = true;

				// upload 경로에 있는 파일 삭제
				while (matcher.find()) {
					File delFile = new File(uploadPath + matcher.group(2));
					if (delFile.exists())
						delFile.delete();

				}

			} else {
				conn.rollback();
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return b;

	}

	public List<SnVo> select(String findStr) {
		List<SnVo> list = new ArrayList<SnVo>();
		sql = "select * from summernote where subject like ? order by serial desc";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, "%" + findStr + "%");
			rs = ps.executeQuery();

			while (rs.next()) {
				SnVo vo = new SnVo();
				vo.setSerial(rs.getInt("serial"));
				vo.setSubject(rs.getString("subject"));

				list.add(vo);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return list;

	}

	public SnVo view(String serial) {
		SnVo vo = new SnVo();
		sql = "select * from summernote where serial = ? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, serial);
			rs = ps.executeQuery();

			while (rs.next()) {
				vo.setSerial(rs.getInt("serial"));
				vo.setSubject(rs.getString("subject"));
				vo.setDoc(rs.getString("doc"));
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return vo;

	}

}
