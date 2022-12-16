package kr.jobtc.springboot.board;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@RestController
public class FileUploadController {
	String path="C:\\Users\\p_yoh\\eclipse-workspace\\SpringSpaProject\\src\\main\\webapp\\WEB-INF\\upload\\";
	
	@Autowired
	BoardService service;
	
	@RequestMapping("/board/board_insertR")
	public synchronized String upload(@RequestParam("attFile")List<MultipartFile> mul,
						 @ModelAttribute BoardVo vo) {
		try {
			System.out.println("id :" + vo.getId());
			System.out.println("subject :" + vo.getSubject());
			List<AttVo> attList = new ArrayList<AttVo>();
			
			//본문 내용 저장
			boolean flag = service.insertR(vo);
			if(!flag) return "저장중 오류 발생";
			
			for(MultipartFile m : mul) {
				UUID uuid = UUID.randomUUID();
				String oriFile = m.getOriginalFilename();
				String sysFile = ""; 
				File temp = new File(path + oriFile); 	// 임시저장 경로
				m.transferTo(temp);
				sysFile = path + (uuid.getLeastSignificantBits()*-1) + "-" + oriFile;
				File f = new File(sysFile);
				temp.renameTo(f);
				
				AttVo attVo = new AttVo();
				attVo.setOriFile(oriFile);
				attVo.setSysFile(sysFile);
				
				attList.add(attVo);
				System.out.println(m.getOriginalFilename());
				System.out.println(uuid.getLeastSignificantBits());
			}
			service.insertAttList(attList);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "redirect:/board/board_select";		//파일 업로드 누르고 다시 select Page로 이동하게 하는 코드
		
	}
}
