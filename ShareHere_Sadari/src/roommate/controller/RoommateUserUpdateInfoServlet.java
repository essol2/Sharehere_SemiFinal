package roommate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class RoommateUserUpdateInfoServlet
 */
@WebServlet("/update/rmuserinfo")
public class RoommateUserUpdateInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateUserUpdateInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		
		User user = (User) request.getSession().getAttribute("loginUser");
		String rUserNo = user.getUserNo();
		
		String rUserLocal = request.getParameter("rmlocal");
		String rage = request.getParameter("rmage");
		String rlivingType = request.getParameter("rmlivingtype");
		String rlivingTerm = request.getParameter("rmlivingterm");
		String rSnsAddress = request.getParameter("rmsns");
		String rMoviInDate = request.getParameter("moveindate");
		String rUserIntro = request.getParameter("rmintro");
		
		RoommateUser updateUser = new RoommateUser(rUserNo, rUserLocal, rUserIntro, rlivingType, rlivingTerm, rSnsAddress, rMoviInDate, rage);

		int result = new RoommateService().updateRoommateUserOne(updateUser);
		
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
