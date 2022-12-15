package kr.jobtc.springboot.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.DefaultTransactionDefinition;

@Service
@Transactional
public class BoardService {
	PageVo pVo;

	@Autowired
	BoardMapper mapper;

	@Autowired
	PlatformTransactionManager manager;
	TransactionStatus status;


	public List<BoardVo> select(PageVo pVo) {
		int totSize = mapper.totList(pVo);
		pVo.setTotSize(totSize);
		this.pVo = pVo;
		List<BoardVo> list = mapper.select(pVo);
		return list;
	}

	public List<BoardVo> board10() {
		List<BoardVo> list = mapper.board10();

		return list;
	}

	public BoardVo view(int sno, String up) {
		BoardVo bVo = null;
		if (up != null && up.equals("up")) {// 상세보기인 경우만
			mapper.hitUp(sno);
		}
		bVo = mapper.view(sno);
		List<AttVo> attList = mapper.attList(sno);
		bVo.setAttList(attList);
		return bVo;
	}

	public boolean delete(BoardVo bVo) {
		boolean b = true;

		// 자신의 글에 댓글이 있는지 판단하기

		// 같은 grp안에 자신의 seq보다 1더 큰 seq의 자료에서
		// deep이 자신 보다 큰것이 있으면 댓글이 있는 것임.
		int replCnt = mapper.replCheck(bVo);

		System.out.println("replCnt : " + replCnt);
		if (replCnt > 0) {
			b = false;
			return b;
		}

		// sno에 해당하는 테이블 삭제
		status = manager.getTransaction(new DefaultTransactionDefinition());
		Object savePoint = status.createSavepoint();

		int cnt = mapper.delete(bVo);
		System.out.println("delete cnt : " + cnt);
		if (cnt < 1) {
			b = false;
		} else {
			// sno를 pSno로 바꾸어 첨부 테이블에서 첨부파일 목록 가져오기
			List<String> attList = mapper.delFileList(bVo.getSno());
			System.out.println("att size : " + attList.size());
			// 첨부 테이블 삭제
			if (attList.size() > 0) {
				cnt = mapper.attDeleteAll(bVo.getSno());
				if (cnt > 0) {
					// 첨부 파일 삭제
					if (attList.size() > 0) {
						String[] delList = attList.toArray(new String[0]);
						fileDelete(delList);
					}
				} else {
					b = false;
				}
			}

		}
		if (b)
			manager.commit(status);
		else
			status.rollbackToSavepoint(savePoint);

		return b;
	}
	public void fileDelete(String[] delFiles) {
//		for(String f : delFiles) {
//			
//			if(file.exists()) file.delete();
//		}
	}
	
	public PageVo getpVo() {
		return pVo;
	}


}
