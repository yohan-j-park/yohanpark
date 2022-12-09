package kr.jobtc.springboot.board;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class BoardController {
	@RequestMapping("/board/board_select")
	public ModelAndView select() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/board_select");
		return mv;
	}
}
