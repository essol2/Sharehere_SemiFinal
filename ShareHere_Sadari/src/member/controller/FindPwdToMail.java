package member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dao.HTMLMailSenderU;
import member.model.dao.MailSender;
import member.model.service.MemberService;
import member.model.vo.Host;
import member.model.vo.RandomPassword;
import member.model.vo.User;

/**
 * Servlet implementation class FindPwdToMail
 */
//@WebServlet("/member/findpwd")
@WebServlet(name="FindPwdToMail", urlPatterns="/member/findpwd")
public class FindPwdToMail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FindPwdToMail() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 값은 유효성 검사를 걸쳣고, null값이 아님, 해당 값을 조회해보면됨.
		// 넘겨받은 id로 셀렉해보기.
		String userId = request.getParameter("userId");
		String Paraphone = request.getParameter("phone");
		String Paraemail = request.getParameter("email");

		int result = new MemberService().idCheck(userId);
		System.out.println("회원타입 result : " + result);
		// 아이디 없을때
		if(result == 0) { // 해당아이디 없음
			request.setAttribute("result", "fail");

			// 아이디 있을때 --> 유효성 검사 후 1.이메일 전송, 2.비밀번호 변경, 3.완료 팝업
		}else {
			// 일반회원일때 -> 이메일 전송
			if(result == 2) {
				User findUser = new User(userId, Paraemail, Paraphone);
				findUser = new MemberService().selectPwdMember(findUser);
				
				// 값이 존재한다면(유효한 값이라면)
				if(findUser != null) {
					// 값 뽑아내기
					String name = findUser.getUserName();
					String userPwd = findUser.getUserPwd(); 
					String newPwd = new RandomPassword().getRandomPassword(16);

					// 비번 변경
					User updateMember = new MemberService().updatePwd(userId, userPwd, getSha512(newPwd));
					
					// 비밀번호변경 실패시 result - fail
					if(updateMember == null) {
//						System.out.println("비밀번호 변경 실패");
						request.setAttribute("result", "fail");
						
					}else {
//						System.out.println("일반//비번변경 완료 전송완료");
						// 이메일, 이름, 새 비번, false(html)
						boolean mailresult = new HTMLMailSenderU().send(Paraemail, name, newPwd, false);
						System.out.println("이메일 전송 비번 : " + newPwd);
						System.out.println("mailresult : " + mailresult);
						if(mailresult) {
							request.setAttribute("result", "success");
						}else {
							System.out.println("이메일 전송 실패");
							request.setAttribute("result", "fail");
						}
					}
					
				}else {	// 셀렉 결과 없을떄
					request.setAttribute("result", "fail");
//					System.out.println("(User입력데이터와)일치하는 값이 없습니다.");
				}


				// 호스트 회원일때 메일 전송
			}else /*if(result == 3)*/ {	// 호스트 회원일때
				Host findUser = new Host(userId, Paraemail, Paraphone);
				findUser = new MemberService().selectPwdMember(findUser);
				
				// 값이 존재한다면(유효한 값이라면)
				if(findUser != null) {
					// 값 뽑아내기
					String name = findUser.getHst_name();
					String userPwd = findUser.getHst_pwd(); 
					String newPwd = new RandomPassword().getRandomPassword(16);

					// 비번 변경
					Host updateMember = new MemberService().updateHPwd(userId, userPwd, getSha512(newPwd));
//					System.out.println("호스트//메일 전송완료");
					
					// 비밀번호변경 실패시 result - fail
					if(updateMember == null) {
//						System.out.println("비밀번호 변경 실패");
						request.setAttribute("result", "fail");
						
					}else {
						// 이메일, 이름, 새 비번, false(html)
						boolean mailresult = new HTMLMailSenderU().send(Paraemail, name, newPwd, false);
//						System.out.println("mailresult : " + mailresult);
						if(mailresult) {
							request.setAttribute("result", "success");
						}else {
							System.out.println("이메일 전송 실패");
							request.setAttribute("result", "fail");
						}
					}
				}else {	// 셀렉 결과 없을떄
					request.setAttribute("result", "fail");
//					System.out.println("(Host입력데이터와)일치하는 값이 없습니다.");
				}
			}



		}




		// 원래 위치로 포워딩
		request.getRequestDispatcher("/views/Login/findPwd.jsp").forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	// 암호화
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
