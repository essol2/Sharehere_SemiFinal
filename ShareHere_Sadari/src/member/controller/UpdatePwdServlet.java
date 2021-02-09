package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Host;
import member.model.vo.User;

/**
 * Servlet implementation class UpdatePwdServlet
 */
//@WebServlet("/member/updatePwd")
@WebServlet(name="UpdatePwdServlet", urlPatterns="/member/updatePwd")
public class UpdatePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// userId가 필요함 -> 세션에 저장 된 loginUser를 통해서 알아오기
		String userNo = request.getParameter("user_no");
		System.out.println(userNo);
		
		if(userNo.charAt(0) == 'u') {
			HttpSession session = request.getSession();
			User loginUser = (User)session.getAttribute("loginUser");
			
			String userId = loginUser.getUserId();
			String userPwd = request.getParameter("userPwd");	// 현재 비밀번호
			String newPwd = request.getParameter("newPwd");		// 변경할 비밀번호
			
			 System.out.println(userId + " " + userPwd + " " + newPwd);
			
			User updateMember = new MemberService().updatePwd(userId, userPwd, newPwd);
			
			//System.out.println(updateMember);  // 확인하기 
			
			if(updateMember != null) {	// 잘 
				// 비밀번호 수정이 잘 되었음을 result-success
				request.setAttribute("result", "success");
				// 수정 된 객체 다시 loginUser에 저장
				request.setAttribute("loginUser", updateMember);
			}else {	// 실패
				request.setAttribute("result", "fail");
			}
			RequestDispatcher view = request.getRequestDispatcher("/views/Mypage/pwdUpdateForm.jsp");
			// 원래 페이지로 다시 포워딩
			view.forward(request, response);
			
			// 호스트 비밀번호 변경
		}else if(userNo.charAt(0) == 'h'){
			HttpSession session = request.getSession();
			Host loginHost = (Host)session.getAttribute("loginHost");
			
			String userId = loginHost.getHst_id();
			String userPwd = request.getParameter("userPwd");	// 현재 비밀번호
			String newPwd = request.getParameter("newPwd");		// 변경할 비밀번호
			
			 System.out.println(userId + " " + userPwd + " " + newPwd);
			
			 Host updateMember = new MemberService().updateHPwd(userId, userPwd, newPwd);
			
			//System.out.println(updateMember);  // 확인하기 
			
			if(updateMember != null) {	// 잘 
				// 비밀번호 수정이 잘 되었음을 result-success
				request.setAttribute("result", "success");
				// 수정 된 객체 다시 loginUser에 저장
				request.setAttribute("loginHost", updateMember);
			}else {	// 실패
				request.setAttribute("result", "fail");
			}
			RequestDispatcher view = request.getRequestDispatcher("/views/Mypage/pwdUpdateForm.jsp");
			// 원래 페이지로 다시 포워딩
			view.forward(request, response);
		}
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
