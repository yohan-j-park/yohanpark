package kr.jobtc.springboot.guestbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class GuestbookController {
	
	@Autowired
	GuestbookDao dao; 	//
	
	@RequestMapping("/guestbook/guestbook_select")
	public ModelAndView select(GPageVo gVo) {
		ModelAndView mv = new ModelAndView();
		//service or dao
		System.out.println("now Page: " + gVo.getNowPage());
		System.out.println("tot Page: " + gVo.getTotPage());
		System.out.println("dao : " + dao);

		//검색어에 따른 List를 가져오기
		List<GuestbookVo> list = dao.select(gVo);
		
		//가져온 List를 mv에 추가
		gVo = dao.getgVo();		//새로 갱신된 페이지 정보
		mv.addObject("gVo",gVo);	//페이징처리 이후의 정보
		mv.addObject("list",list);
		mv.setViewName("guestbook/guestbook_select");	
		// view에 "guestbook/guestbook_select"를 담았기 때문에 
		// application.properties에서 mcv.view ~에서 접두사 접미사가 붙어 페이지url이 완성된다.
		return mv;
	}
}
