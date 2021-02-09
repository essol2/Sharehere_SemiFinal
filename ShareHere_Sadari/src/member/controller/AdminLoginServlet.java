package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Admin;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/member/Adminlogin")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
//테스트
		System.out.println("request.getParameter(\"userId\") : " + request.getParameter("userId"));
		System.out.println("request.getParameter(\"userPwd\") : " + request.getParameter("userPwd"));
		
		Admin a = new Admin(userId, userPwd);

		Admin loginAdmin = new MemberService().loginMember(a);
		System.out.println("loginAdmin 값 : " + loginAdmin);

		if(loginAdmin != null) {
			request.getSession().setAttribute("loginAdmin", loginAdmin);
			response.sendRedirect(request.getContextPath());
		}else {
			request.setAttribute("msg", "로그인에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
