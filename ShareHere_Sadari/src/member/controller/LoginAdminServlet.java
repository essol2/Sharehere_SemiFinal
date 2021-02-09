package member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Admin;
import member.model.vo.User;


/**
 * Servlet implementation class LoginAdminServlet
 */
@WebServlet("/login/member")
public class LoginAdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginAdminServlet() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String admId = request.getParameter("admId");
		String admPwd = request.getParameter("admPwd");
		
		//System.out.println("사용자에게 들어온 admId 값 : " + admId);
		//System.out.println("사용자에게 들어온 admPwd 값 : " + admPwd);
		
		Admin a = new Admin();
		a.setAdm_id(admId);
		a.setAdm_pwd(admPwd);
		//System.out.println("Admin객체에 담은 값들 : " + adm);

		Admin loginAdmin = new MemberService().loginMember(a);
		//System.out.println("service에서 받은 loginAdmin 값 : " + loginAdmin);

		if(loginAdmin != null) {
			HttpSession session = request.getSession();
			session.setAttribute("loginAdmin", loginAdmin);
			response.sendRedirect(request.getContextPath()+"/views/admin/adm_first.jsp");
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
