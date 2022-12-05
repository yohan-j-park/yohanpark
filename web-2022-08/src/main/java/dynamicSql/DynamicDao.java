package dynamicSql;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.MyFactoryclassicmodels;

public class DynamicDao {
    SqlSession sqlSession;
    public DynamicDao() {
        sqlSession = MyFactoryclassicmodels.getFactory().openSession();
    }
    
    public void ifTest(){
        DynamicVo vo = new DynamicVo();
        List<DynamicVo> list = null;
        System.out.println("test1.........");
        list = sqlSession.selectList("dynamic.if_test",vo);
        for(DynamicVo v : list) {
            System.out.printf("%s / %s \n", v.getEmployeeNumber(),v.getLastName());
        }
        
        System.out.println("test2...........");
        vo.setLastName("Bow");
        list = sqlSession.selectList("dynamic.if_test",vo);
        for(DynamicVo v : list) {
            System.out.printf("%s / %s \n", v.getEmployeeNumber(),v.getLastName());
        }
    }
    
    public void chooseTest(){
        DynamicVo vo = new DynamicVo();
        List<DynamicVo> list = null;
        System.out.println("test1......");
        vo.setOfficeCode(1);
        
        list = sqlSession.selectList("dynamic.choose_test",vo);
        for(DynamicVo v : list) {
            System.out.printf("%s / %s \n", v.getEmployeeNumber(),v.getOfficeCode());
        }
        
        System.out.println("test2.......");
        
        vo.setOfficeCode(2);
        
        list = sqlSession.selectList("dynamic.choose_test",vo);
        for(DynamicVo v : list) {
            System.out.printf("%s / %s / %s \n", v.getEmployeeNumber(),v.getOfficeCode(),v.getEmail());
        }
    }
    
    public void forEachTest() {
        int[] code = {1,3};
        List<DynamicVo> list = null;
        list = sqlSession.selectList("dynamic.forEach_test",code);
        for(DynamicVo vo : list) {
            System.out.printf("%s / %s / %s / %s / %s \n",
                               vo.getEmployeeNumber(), vo.getFirstName(),
                               vo.getLastName(), vo.getEmail(), vo.getOfficeCode());
        }
    }
    
    public static void main(String[] args) {
        DynamicDao dao = new DynamicDao();
//        dao.ifTest();
        dao.chooseTest();
//        dao.forEachTest();
    }
}
