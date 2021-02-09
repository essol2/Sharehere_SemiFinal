package roommate.controller;

import java.io.IOException;
import java.text.ParseException;
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
 * Servlet implementation class RoommatePayCheck
 */
@WebServlet("/roommate/payCheck")
public class RoommatePayCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommatePayCheck() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("loginUser");
		String getUserNo = request.getParameter("getUserNo"); // 상대방
		String survey = request.getParameter("getUserSurvey");
		
		String redirectURL = request.getParameter("redirectURL");
		String backURL = request.getParameter("backURL");
		
		System.out.println();
		
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
				ArrayList<RoommateUser> ruList = new ArrayList<RoommateUser>();
				ruList = new RoommateService().selectList(survey);
				ArrayList<RoommateAttachment> rmat = new ArrayList<RoommateAttachment>();
				rmat = new RoommateService().selectAttachmentList();
				//System.out.println("ruList : " + ruList);
				request.setAttribute("roommateUserList", ruList);
				request.setAttribute("roommateAttachmentList", rmat);
				request.getSession().setAttribute("Paymsg", "결제가 필요한 서비스입니다!");		
				response.sendRedirect(request.getContextPath() + backURL);	
			} else if (compare <= 0) { // 만기날짜 남음
				//System.out.println("day1 < day2");
				RoommateUser ru = new RoommateService().selectRoommateUserOne(getUserNo); // 상대방
				RoommateAttachment attOne = new RoommateService().selectRoommateAttaOne(ru.getrUserNo());
				//System.out.println("디테일페이지 한명 썸네일 attOne : " + attOne); // 썸네일 없으면 null
				request.setAttribute("attOne", attOne);
				request.setAttribute("ru", ru);
				request.getRequestDispatcher("/views/Roommate/rm_userDetail.jsp").forward(request, response);
			} 
		} else { // ru가 null -> 결제 하지 않은 사람
			ArrayList<RoommateUser> ruList = new ArrayList<RoommateUser>();
			ruList = new RoommateService().selectList(survey);
			ArrayList<RoommateAttachment> rmat = new ArrayList<RoommateAttachment>();
			rmat = new RoommateService().selectAttachmentList();
			request.setAttribute("roommateUserList", ruList);
			request.setAttribute("roommateAttachmentList", rmat);
			request.getSession().setAttribute("Paymsg", "결제가 필요한 서비스입니다!");		
			response.sendRedirect(request.getContextPath() + "/views/Roommate/rm_userlist.jsp");	
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
