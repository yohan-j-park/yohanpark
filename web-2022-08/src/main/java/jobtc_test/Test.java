package jobtc_test;

public class Test{
    
    public void setStudent(Human human) {
        human.insert();
        human.select();
        human.update();
        human.delete();
    }
    
    public static void main(String[] args) {
        Student student = new Student();
        Test test = new Test();
        test.setStudent(student);
    }
}
