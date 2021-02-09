package roommate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateMatching;

/**
 * Servlet implementation class RoommateMatchingAllowServlet
 */
@WebServlet("/allow/matching")
public class RoommateMatchingAllowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateMatchingAllowServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("loginUser"); // 매칭 당한 회원
		String userNo = request.getParameter("userNo"); // 나를 매칭 신청한 사람
		
		System.out.println("user.getUserNo() : " + user.getUserNo());
		System.out.println("userNo : " + userNo);
		
		RoommateMatching rm = new RoommateMatching();
		rm.setUserNo2(user.getUserNo());
		rm.setUserNo(userNo);

		int result = new RoommateService().allowMathcing(rm);
		System.out.println("승인 result : " + result);
		
		if (result > 0) {
			request.getSession().setAttribute("msg", "업데이트를 완료했습니다.");		
			response.sendRedirect(request.getContextPath() + "/select/roommateuserdata");
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
