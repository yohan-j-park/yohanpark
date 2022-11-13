package operation;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/operation.do")
public class OperationServlet extends HttpServlet{
	String path = "index.jsp?inc=operation/";
	OperationDao dao;
	
	public OperationServlet() {		// void init으로 해도 된다.
		dao = new OperationDao();
		System.out.println("servlet created...");
	}
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(dao==null) dao = new OperationDao();
		
		Page pageVo = new Page();
		
		select(pageVo, req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(dao==null) dao = new OperationDao(); //장시간 세션 방치시에 얘도 죽으니 날아가면 다시 만들자
		
		String job = req.getParameter("job");
		
		String url = "";
		
		RequestDispatcher rd = null;
		
		System.out.println("job : " + job);
		
		Page pageVo = new Page();
		pageVo.setFindPrcode(req.getParameter("findPrcode"));
		pageVo.setFindDate(req.getParameter("findDate"));
		pageVo.setFindMachine_no(req.getParameter("findMachine_no"));
		pageVo.setFindManager(req.getParameter("findManager"));
		pageVo.setFindPrname(req.getParameter("findPrname"));
		pageVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		
		req.setAttribute("pageVo", pageVo);
		
		switch(job) {
		case "select":
			select(pageVo, req, resp);
			break;
		case "insert":
			url = path + "operation_input_form.jsp";
			rd = req.getRequestDispatcher(url);
			List<CostVo> list_cost = dao.select_cost();
			req.setAttribute("list_cost", list_cost);
			rd.forward(req, resp);
			break;
		case "insertR":
			OperationVo vo = (OperationVo)req.getAttribute("vo");
			if( insertR(vo, resp) ) {
				select(pageVo, req, resp);
			}else{
					PrintWriter out = resp.getWriter();
					out.print("<script>");
					out.print("     alert('자료에 오류가 발생!!!');");
					out.print("     history.back();");	//입력폼으로 다시 이동
					out.print("</script>");
				
			};
			break;
		case "update":
			update(req, resp);
			break;
		case "updateR":
			updateR(req, resp);
			break;
		case "deleteR":
			deleteR(req,resp);
			break;
		case "stat":
			stat(pageVo,req,resp);
			break;
		}
	}
	
	public void stat(Page pageVo, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
		if(dao==null) dao = new OperationDao();
		String url = path + "operation_statistics.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(url);
		List<OperationVo> list = dao.select_stat(pageVo);		
		req.setAttribute("list", list);
		req.setAttribute("pageVo", pageVo);
		rd.forward(req, resp);
	}
	
	public void select(Page pageVo, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(dao==null) dao = new OperationDao();
		List<OperationVo> list = dao.select(pageVo);
		dao.close();
		
		String url = path + "operation_list.jsp";
		RequestDispatcher rd = req.getRequestDispatcher(url);
		req.setAttribute("list", list);
		req.setAttribute("pageVo", pageVo);
		
		rd.forward(req, resp);
	}
	
	public boolean insertR(OperationVo vo, HttpServletResponse resp) throws ServletException, IOException {
		if(dao==null) dao = new OperationDao();
		boolean b = dao.insert(vo);
		
		return b;
	}
	
	public void update(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(dao==null) dao = new OperationDao();
		String url = path + "operation_modify.jsp";
		String pr_code = req.getParameter("pr_code");
		OperationVo vo = dao.view(pr_code);
		
		Page pageVo = new Page();
		pageVo.setFindPrcode(req.getParameter("findPrcode"));
		pageVo.setNowPage(Integer.parseInt(req.getParameter("nowPage")));
		
		
		RequestDispatcher rd = req.getRequestDispatcher(url);
		req.setAttribute("vo", vo);
		req.setAttribute("pageVo", pageVo);
		
		
		rd.forward(req, resp);
	}
	
	public void updateR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(dao == null) dao = new OperationDao();
		OperationVo vo = (OperationVo)req.getAttribute("vo");
		Page pageVo = (Page)req.getAttribute("pageVo");
		
		boolean b = dao.modify(vo);
		if(b) {
			select(pageVo, req, resp);
		}else {
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("     alert('자료에 오류가 발생!!!');");
			out.print("     history.back();");	//입력폼으로 다시 이동
			out.print("</script>");
		}
	}
	
	public void deleteR(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		if(dao==null) dao = new OperationDao();
		OperationVo vo= (OperationVo)req.getAttribute("vo");
		Page pageVo = (Page)req.getAttribute("pageVo");
		boolean b = dao.delete(vo);
		if(b) {
			select(pageVo, req, resp);
		}else {
			PrintWriter out = resp.getWriter();
			out.print("<script>");
			out.print("     alert('자료에 오류가 발생!!!');");
			out.print("     history.back();");	//입력폼으로 다시 이동
			out.print("</script>");
		}
	}
	
}
