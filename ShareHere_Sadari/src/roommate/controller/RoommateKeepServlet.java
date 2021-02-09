package roommate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateAttachment;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class RoommateKeepServlet
 */
@WebServlet("/roommate/keepUser")
public class RoommateKeepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateKeepServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		User user = (User) request.getSession().getAttribute("loginUser");
		String loginUserNO = user.getUserNo();
		String rUserNo = (String) request.getSession().getAttribute("userNo2");
		
		 //System.out.println("찜하기 로그인유저 : " + loginUserNO);
		 //System.out.println("찜하기 상대방 회원번호 : " + rUserNo);
		 
		int result = new RoommateService().insertKeepRoommateUser(loginUserNO, rUserNo);
		
		System.out.println("RoommateKeepUser 결과 : " + result);
		
		if (result > 0) {
			RoommateUser ru = new RoommateService().selectRoommateUserOne(rUserNo);
			System.out.println("ru : " + ru);
			RoommateAttachment attOne = new RoommateService().selectRoommateAttaOne(rUserNo);
			request.setAttribute("ru", ru);
			request.setAttribute("attOne", attOne);
			request.getSession().setAttribute("msg", "찜 완료!");
			request.getRequestDispatcher("/views/Roommate/rm_userDetail.jsp").forward(request, response);
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
