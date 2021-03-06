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
 * Servlet implementation class RoommateDeleteMatchingServlet
 */
@WebServlet("/delete/matching") // 내가 신청한 매칭 내가 철회
public class RoommateDeleteMatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateDeleteMatchingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("loginUser");
		String loginUser = user.getUserNo();
		String userNo2 = request.getParameter("userNo2");
		
		System.out.println("loginUser : " + loginUser);
		System.out.println("userNo2 : " + userNo2);
		
		RoommateMatching rm = new RoommateMatching();
		rm.setUserNo(loginUser);
		rm.setUserNo2(userNo2);

		int result = new RoommateService().deleteMathcing(rm);
		
		if (result > 0) {
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
