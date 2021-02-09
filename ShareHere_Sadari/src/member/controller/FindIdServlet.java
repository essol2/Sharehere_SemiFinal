package member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class FindIdServlet
 */
@WebServlet("/member/findid")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FindIdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		//이름 휴대전화 입력하면 가입한 아이디 리턴해주기
		String user_name = request.getParameter("username");
		String user_phone = request.getParameter("userphone");
		
		System.out.println("이름, 폰 : " + user_name + ", " + user_phone);
		
		String userId = new MemberService().findId(user_name, user_phone);
		System.out.println("최종 userId : " + userId);
		
		
		
		// userId = "xx회원이시며, 아이디는 xxx" 리턴
		if(userId != "") {	// 잘 
			// 비밀번호 수정이 잘 되었음을 result-success
			request.setAttribute("result", "success");
			request.setAttribute("userId", userId);
		}else {	// 실패
			request.setAttribute("result", "fail");
		}
		// 원래 페이지로 다시 포워딩
		request.getRequestDispatcher("/views/Login/findId.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
