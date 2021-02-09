package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Host;
import member.model.vo.User;

/**
 * Servlet implementation class UpdateMemberServlet
 */
@WebServlet("/member/update")
public class UpdateMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateMemberServlet() {
        super();
         // TODO Auto-generated constructor stub
    }
     
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 한글 값 인코딩
				request.setCharacterEncoding("UTF-8");
				
				// 2. 회원정보 수정에 필요한 값 추출
//				아이디
//				이름
//				비밀번호
//				이메일
//				휴대전화
				
				// 유저 (유저아이디 값이 비어있지 않다면)
				if(request.getParameter("user_no").charAt(0) == 'u') {
					String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
					System.out.println("userId : " + userId);
//						System.out.println("u문 실행");
					String userName = request.getParameter("us_name");
					String userPwd = request.getParameter("us_pwd");
					String userEmail = request.getParameter("us_email");
					String userPhone = request.getParameter("us_phone");
					
					// (유저아이디값, 등을 매개변수로 넘겨주고 유저에 저장)
					User u = new User(request.getParameter("user_id"), userName, userPwd, userEmail, userPhone);
//					 System.out.println("수정하고자 하는 정보 : " + u);
					
					User updateMember = new MemberService().updateMember(u);
//					System.out.println("최종 User 값 : " + updateMember);
					
					
					if(updateMember != null) {
						request.getSession().setAttribute("msg", "회원 정보 수정이 완료되었습니다.");
						request.getSession().setAttribute("loginUser", updateMember);
						response.sendRedirect(request.getContextPath()+"/views/Mypage/mp_update.jsp");
					}else {
						// 수정 실패시 에러 페이지로 forward
						request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
						request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response); 
					}
					
//				호스트 마이페이지
				}else if(request.getParameter("user_no").charAt(0) == 'h'){
					String hostId = ((Host)request.getSession().getAttribute("loginHost")).getHst_id();
					System.out.println("hostId : " + hostId);
//					System.out.println("h문 실행");
					String bsnum = request.getParameter("bsnum");
					String bsname = request.getParameter("bsname");
					
					String userName = request.getParameter("us_name");
					String userPwd = request.getParameter("us_pwd");
					String userEmail = request.getParameter("us_email");
					String userPhone = request.getParameter("us_phone");
					Host h = new Host(bsnum, bsname, request.getParameter("user_id"), userPwd, userName, userEmail, userPhone);
//					 System.out.println("수정하고자 하는 정보 : " + h);
					
					Host updateMember = new MemberService().updateMember(h);
//					System.out.println("최종 Host 값 : " + updateMember);
					
					if(updateMember != null) {
						request.getSession().setAttribute("msg", "회원 정보 수정이 완료되었습니다.");
						request.getSession().setAttribute("loginHost", updateMember);
						response.sendRedirect(request.getContextPath()+"/views/Mypage/mp_update.jsp");
					}else {
						// 수정 실패시 에러 페이지로 forward
						request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
						request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response); 
					}
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
