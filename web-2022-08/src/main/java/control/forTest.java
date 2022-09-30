package control;

public class forTest {
// 1부터 parameter로 전달된 정수까지 출력
	public void test1(int su) {
		for(int i=1; i<=su; i++) {
			System.out.println(i);
		}
		System.out.println("-------------------");
	}
// 1부터 parameter로 전달된 정수 중에서 홀수만 더한 값 출력
	public void test2(int su) {
		int sum = 0;
		int i=1;
		for(i=1; i<=su; i++) {
			if(i%2==1) {
				sum += i;	
			}
		}
		System.out.println(sum);
		System.out.println("-------------------");
	}
// parameter로 전달된 수에 해당하는 구구단 출력
	public void test3(int dan) {
		for(int i=1; i<9; i++) {
			System.out.println(dan + "x" + i + "=" + dan*i);
		}
		System.out.println("-------------------");
	}
// 1부터 parameter로 전달된 수 까지의 합계가 1500이상이 되는 시점의 값과 합계 출력	
	public void test4(int n) {
		int hap = 0;
		int i=1;
		for(i=1; i<100; i++) {
			hap += i;
			if(hap>=1500) break;
		}
		System.out.println("1부터 " + n + "번째 까지의 합계 중에서 1500이상이 되는 시점은 몇 번째? " + i + " 번째 더한 값:" + hap);
	}
	public static void main(String[] args) {
		forTest abc = new forTest();
		abc.test1(10);
		abc.test2(10);
		abc.test3(9);
		abc.test4(100);
	}

}
