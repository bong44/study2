
public class TestMyCalc {
	// 클리아언트가 서버한테 숫자 두개 사이의 합을 구해서 리턴해주는 함수를 만들어달라 함
	
	public int mySum(int a, int b) {
		int sum = 0;
		for (int i = 1; i < b; i++) {
			sum += i;
		}
		return sum;
	}
	
	public static void main(String[] args) {
		TestMyCalc calc = new TestMyCalc();
		int rs = calc.mySum(3, 6);
		System.out.println("결과: "+rs);
	}
	
}
