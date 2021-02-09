package wrapper;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

// HttpServletRequestWrapper를 상속받는 클래스로 작성
public class EncryptWrapper extends HttpServletRequestWrapper{

	// 반드시 명시적으로 HttpServletRequest를 매개변수로 하는 생성자를 작성해야함
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
		
	}
	
	// ServletRequestWrapper의 getParameter 메소드 오버라이딩
	@Override
	public String getParameter(String key) {
		String value = "";
		
		// userPwd, newPwd만 필터 처리
		if(key != null && (key.equals("userPwd") || key.equals("newPwd"))) {
			value = getSha512(super.getParameter(key));
		}else {
			value = super.getParameter(key);
		}
		return value;
	}

	public String getSha512(String userPwd) {
		StringBuffer encPwd = new StringBuffer();
		
		// sha512 방식의 암호화 객체
		MessageDigest digest = null;
		
		try {
			digest = MessageDigest.getInstance("SHA-512");
			byte[] salt = "f2vm@Mkj1ei".getBytes();	//
			digest.reset();
			digest.update(salt);
			byte[] chars = digest.digest(userPwd.getBytes("UTF-8"));
			for(int i=0; i < chars.length; i++) {
				String hex = Integer.toHexString(0xff & chars[i]);
				if(hex.length() == 1) encPwd.append("0");
				encPwd.append(hex);
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return encPwd.toString();
	}
}
