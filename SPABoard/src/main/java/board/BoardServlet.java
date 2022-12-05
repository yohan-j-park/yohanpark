package board;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/board/board.do")
public class BoardServlet extends HttpServlet{
	HttpServletRequest req;
	HttpServletResponse resp;
	
	String job="select";
	RequestDispatcher rd;
	PageVo pVo;
	BoardVo bVo;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.req = req;
		this.resp = resp;
		pVo = new PageVo();
		select();
	}
	 protected void select() throws ServletException, IOException {
	        BoardDao dao = new BoardDao();
	        List<BoardVo> list = dao.select(pVo);
	        req.setAttribute("list", list);
	       
	        // 기준 페이지 정보에서 pVo가 갱신되었기 때문에 다시 dao로 부터 읽어 재설정
	        req.setAttribute("pVo", dao.getpVo());
	       
	        rd = req.getRequestDispatcher("select.jsp");
	        rd.include(req, resp);
	    }	
	
}
