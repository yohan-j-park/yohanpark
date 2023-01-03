package bean;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


@MultipartConfig(
		location="c:/temp", 
		maxFileSize = -1,
		maxRequestSize = -1,
		fileSizeThreshold= 2000)

@WebServlet(urlPatterns = "/upload.up")
public class FileUpload extends HttpServlet {
	String uploadPath = "C:\\Users\\p_yoh\\eclipse-workspace\\summernote\\src\\main\\webapp\\upload\\";
	UUID uuid = null;
	
	// 폴더가 없으면 생성해 두어야 함
	// 클라이언트로 부터 파일이 전송되었을 때 임시로 저장되는 폴더
	String tempDir = "c:/temp/"; 

	HttpServletRequest req;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter out = resp.getWriter();
		String flag = "";

		
		if(req.getParameter("flag") != null) {
			flag = req.getParameter("flag");
		};
		
		if(flag.equals("delete")) {
			String target = req.getParameter("target");
			String[] temp = target.split("/");
			File delFile = new File(uploadPath + temp[temp.length-1]);
			if(delFile.exists()) delFile.delete();
			return;
		}else {
			
			Collection<Part> parts = req.getParts();
			
			
			for(Part p : parts) {
				
				
				if(p.getHeader("Content-Disposition").contains("filename=")){
					
					if(p.getSize()>0) {
						uuid = UUID.randomUUID();
						String temp = String.format("%s-%s",
												uuid.getLeastSignificantBits(),
												p.getSubmittedFileName() );
						p.write(uploadPath + temp);
						p.delete();
						
						
						try {
							Thread.sleep(10);
							out.print("./upload/" + temp);
						}catch(Exception ex) {
							ex.printStackTrace();
						}
						
							
					}
					
				}
			}// end of for
		
		}		
		
	}
	
}

