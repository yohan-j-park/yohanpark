package operation;

public class Page {
	String findStr="";
	int nowPage=1;
	
	int totSize;
	int listSize = 20;
	int blockSize = 5;
	
	int totPage, startPage, endPage;
	int startNo, endNo;	
	
	public void setData(int nowPage, int totSize) {
		this.nowPage = nowPage;
		this.totPage = totSize;
		compute();
	}
	
	public void compute() {
		totPage = (int)Math.ceil((double)totSize/listSize);
		endPage = (int)Math.ceil((double)nowPage/blockSize)*blockSize;
		startPage = endPage - blockSize +1;	
		if(endPage>totPage) endPage = totPage;
		
		endNo = nowPage*listSize;
		startNo = endNo - listSize;		//mysql에서는 +1을 하지 않음. 0부터 시작한다. 오라클은 +1을 해야합니다. mysql limit 속성이 zero베이스이기 때문이다.
		if(endNo>totSize) endNo = totSize;
	}
	
	public int getTotSize() {
		return totSize;
	}
	public void setTotSize(int totSize) {
		this.totSize = totSize;
	}
	public int getListSize() {
		return listSize;
	}
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public int getTotPage() {
		return totPage;
	}
	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getStartNo() {
		return startNo;
	}
	public void setStartNo(int startNo) {
		this.startNo = startNo;
	}
	public int getEndNo() {
		return endNo;
	}
	public void setEndNo(int endNo) {
		this.endNo = endNo;
	}
	
	public String getFindStr() {
		return findStr;
	}
	public void setFindStr(String findStr) {
		this.findStr = findStr;
	}
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
}
