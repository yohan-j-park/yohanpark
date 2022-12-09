package kr.jobtc.springboot.guestbook;

import java.util.List;

public interface GuestbookMapper {
	public List<GuestbookVo> list(String findStr);
}
