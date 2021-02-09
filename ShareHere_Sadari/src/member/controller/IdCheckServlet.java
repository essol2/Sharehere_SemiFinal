package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;

/**
 * Servlet implementation class IdCheckServlet
 */
@WebServlet("/member/idCheck")
public class IdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    // 아이디 중복 검사 Servlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");

		String userId = request.getParameter("userId");
		// System.out.println("userId : " + userId);
		
		//--> 중복x면 0, userId면 2 hostid면 3 리턴																					수정전--중복 아이디가 있으면1, 없으면 0 리턴 (수정전)
		int result = new MemberService().idCheck(userId);
		System.out.println("idcheck result : " + result);
		PrintWriter out = response.getWriter();
		
		if(result > 0) {
			out.print("fail");
		}else {
			out.print("success");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
