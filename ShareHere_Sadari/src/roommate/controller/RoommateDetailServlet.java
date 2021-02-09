package roommate.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateAttachment;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class RoommateDetailServlet
 */
@WebServlet("/roommate/detail")
public class RoommateDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String getUserNo = request.getParameter("getUserNo");
		
		RoommateUser roommateUser = new RoommateService().selectRoommateUserOne(getUserNo);
		RoommateAttachment attOne = new RoommateService().selectRoommateAttaOne(roommateUser.getrUserNo());
		//System.out.println("여긴 디테일 서블릿 ! -> 디테일페이지 한명 썸네일 attOne : " + attOne);
		
		String page = "";
		
		if(roommateUser != null) {
			request.setAttribute("ru", roommateUser);
			request.setAttribute("attOne", attOne);
			page = "/views/Roommate/rm_userDetail.jsp";
		} 
		
		request.getRequestDispatcher(page).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
