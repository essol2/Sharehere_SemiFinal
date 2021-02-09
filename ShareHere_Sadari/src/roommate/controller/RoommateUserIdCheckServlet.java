package roommate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class RoommateUserIdCheckServlet
 */
@WebServlet("/roommate/idCheck")
public class RoommateUserIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateUserIdCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("loginUser");
		String loginUserNO = user.getUserNo();
		//System.out.println("룸메 아이디체크 서블릿 로그인유저넘버 : " + loginUserNO);
		
		int listCount = new RoommateService().getListCount(loginUserNO);
		
		//System.out.println("로그인 계정 체크??? listCount :" + listCount);
		//String survey = (String) request.getSession().getAttribute("survey");
		if (listCount > 0) { // 이미 설문조사를 했던 회원
			RoommateUser ru = new RoommateService().selectRoommateUserOne(loginUserNO);
			String survey = ru.getrUserResult();
			request.getSession().setAttribute("survey", survey);		
			request.getSession().setAttribute("msg", "이미 설문조사를 하셨습니다!");	
			
			// 해당 회원 유형의 유저 리스트 출력할 수 있는 서블릿으로
			response.sendRedirect(request.getContextPath() + "/select/roommateuserlist");
			
		} else { // 설문조사 안 한 회원
			request.getRequestDispatcher("/views/Roommate/rm_survey.jsp").forward(request, response);
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
