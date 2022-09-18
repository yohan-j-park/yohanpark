
public class ex_6 {
	public static void main(String[] args) {
		int x= 10, y = 5;
		System.out.println("x=" + x);	//x=10
		System.out.println("y=" + y);	//y=5
		
		int tmp = x;
		
		x = y;
		y = tmp;
		
		System.out.println("x=" + x);	//x=5
		System.out.println("y=" + y);	//y=10
		
	}
}
