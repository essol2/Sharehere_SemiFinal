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
 * Servlet implementation class RoommateKeepIdCheckServlet
 */
@WebServlet("/keep/idCheck")
public class RoommateKeepIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateKeepIdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		User user = (User) request.getSession().getAttribute("loginUser");
		String loginUserNO = user.getUserNo();
		String rUserNo = request.getParameter("rUserNo");
		
		System.out.println("찜하기 아이디체크 세션 : " + loginUserNO);
		System.out.println("찜하기 상대방 회원번호 :" + rUserNo);
		
		int result = new RoommateService().countRoommateKeepUserIdCheck(loginUserNO, rUserNo);
		
		if (result > 0) { // 이미 같은 회원을 찜 한 이력이 있음
			RoommateUser ru = new RoommateService().selectRoommateUserOne(rUserNo);
			RoommateAttachment attOne = new RoommateService().selectRoommateAttaOne(rUserNo);
			request.setAttribute("ru", ru);
			request.setAttribute("attOne", attOne);
			request.getSession().setAttribute("msg", "이미 찜한 회원입니다. 마이페이지에서 확인해주세요.");
			request.getRequestDispatcher("/views/Roommate/rm_userDetail.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("userNo2", rUserNo);
			response.sendRedirect(request.getContextPath() + "/roommate/keepUser");
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
