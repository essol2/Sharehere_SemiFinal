package member.model.vo;

// 원하는 비밀번호자리수를 매개변수로 전달하면  --> ex. getRandomPassword(16)
// String(length 16)인 값을 리턴한다.
public class RandomPassword {

	/*
	public static void main(String[] args) {
		System.out.println(getRamdomPassword(16));
		

	}
	*/
	public static String getRandomPassword(int len) {
		char[] charSet = new char[] { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
				'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O',
				'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c',
				'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q',
				'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '~', '!', '@', '#', '%',
				'^', '&', '*'};
		int idx = 0;
		StringBuffer sb = new StringBuffer();

		
		for (int i = 0; i < len; i++) {

			// 36 * 생성된 난수를 Int로 추출 (소숫점제거)
			idx = (int) (charSet.length * Math.random()); 

			// System.out.println("idx :::: "+idx);
			sb.append(charSet[idx]);
		}
		
		return sb.toString();
	}
}
