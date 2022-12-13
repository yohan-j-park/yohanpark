package kr.jobtc.springboot.guestbook;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class GuestbookDao {
	GPageVo gVo;
	
	@Autowired
	GuestbookMapper mapper;


	public int getTotSize(GPageVo gVo) {
		int totSize = 0;
		totSize = mapper.totSize(gVo);		
		return totSize;
	}
	
	public List<GuestbookVo> select(GPageVo gVo){
		List<GuestbookVo> list = null;
		int totSize = getTotSize(gVo);
		gVo.setTotSize(totSize);
		this.gVo = gVo;
		list = mapper.list(gVo);
		
		return list;
	}
	public GPageVo getgVo() {return gVo;}
}
