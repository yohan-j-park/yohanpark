
public class ex_10 {
	public static void main(String args[]) {
		String str = "3";

		System.out.println(str.charAt(0) - '0');
		System.out.println('3' - '0' + 1); // => 아스키코드값 '3':51 0:48
		System.out.println(Integer.parseInt("3") + 1);
		System.out.println("3" + "3" + 1);
		System.out.println(3 + '0');   // '0' => 아스키코드값 48
	}
}
