package board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.SpaFactory;

public class BoardDao {
    SqlSession session;
    PageVo pVo;

    public BoardDao() {
       session = SpaFactory.getFactory().openSession();
    }
    public List<BoardVo> select(PageVo pVo){
	        List<BoardVo> list = null;
	       
	        //페이지 정보를 재설정해 주기위한 작업
	        int totSize = session.selectOne("board.totList", pVo);
	        pVo.setTotSize(totSize);
	        this.pVo = pVo;
	        list = session.selectList("board.select", pVo);
	        session.close();
	        return list;
	    }
    public PageVo getpVo() {
    	return pVo;
    }
    
}
