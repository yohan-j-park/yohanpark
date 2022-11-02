package student;

public class Page {
    String findStr =""; // 검색어
    int nowPage =1;    // 현재 페이지
    
    public String getFindStr() {
        return findStr;
    }
    public int getNowPage() {
        return nowPage;
    }
    public void setFindStr(String findStr) {
        this.findStr = findStr;
    }
    public void setNowPage(int nowPage) {
        this.nowPage = nowPage;
    }
    
}
