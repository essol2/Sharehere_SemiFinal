package roommate.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateAttachment;
import roommate.model.vo.RoommatePay;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class RoommateMyPagePayCheckServlet
 */
@WebServlet("/roommate/myPage/payCheck")
public class RoommateMyPagePayCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateMyPagePayCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("loginUser");
		String getUserNo = request.getParameter("getUserNo");
		
		// 해당 회원이 디비에 있는지 확인
		//int result = new RoommateService().listCountPayCheck(user.getUserId());
		
		// 해당 회원의 구독권 만기날짜 가져오기
		RoommatePay rp = new RoommateService().selectRoommateUserPayCheckOne(user.getUserNo());

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if (rp != null) { // 결제한 사람
		Date today = new Date(); // 오늘날짜
		Date exday = rp.getExpiry_Date(); // 만기일
		
		String day1 = null;
		String day2 = null;
	
			try {
				day1 = sdf.format(today); // 오늘
				day2 = sdf.format(exday); // 만기	
			} catch(Exception e) {
				e.printStackTrace();
			}
			
		int compare = day1.compareTo(day2);
			
			if (compare > 0) { // 만기날짜 넘음
				//System.out.println("day1 > day2");
				//System.out.println("구독권이 만료");
				RoommateUser rmuser = new RoommateService().selectRoommateUserOne(user.getUserNo()); // 다시 로그인 유저 마이페이지로
				RoommateAttachment rmatta = new RoommateService().selectRoommateAttaOne(user.getUserNo());
				request.getSession().setAttribute("Paymsg", "구독권이 만료되었습니다.");		
				response.sendRedirect(request.getContextPath() + "/select/roommateuserdata");	
			} else if (compare <= 0) { // 만기날짜 남음
				//System.out.println("day1 < day2");
				RoommateUser ru = new RoommateService().selectRoommateUserOne(getUserNo);
				RoommateAttachment attOne = new RoommateService().selectRoommateAttaOne(ru.getrUserNo());
				System.out.println("디테일페이지 한명 썸네일 attOne : " + attOne);
				request.setAttribute("attOne", attOne);
				request.setAttribute("ru", ru);
				request.getRequestDispatcher("/views/Roommate/rm_userDetail.jsp").forward(request, response);
			} 
		} else {
			RoommateUser rmuser = new RoommateService().selectRoommateUserOne(user.getUserNo()); // 다시 로그인 유저 마이페이지로
			RoommateAttachment rmatta = new RoommateService().selectRoommateAttaOne(user.getUserNo());
			request.getSession().setAttribute("Paymsg", "결제가 필요한 서비스입니다.");		
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
