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
import roommate.model.vo.RoommateMatching;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class InsertMatchingServlet
 */
@WebServlet("/insert/matching")
public class InsertMatchingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertMatchingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		User user = (User) request.getSession().getAttribute("loginUser");
		String userNo = user.getUserNo();
		
		String getUserNo = request.getParameter("rUserNo");
		String tel = request.getParameter("tel");
		String text = request.getParameter("text");
		
		RoommateMatching matching = new RoommateMatching(userNo, getUserNo, tel, text);
		
		int result = new RoommateService().insertMatching(matching);
		
		if (result > 0) {
			RoommateUser roommateUser = new RoommateService().selectRoommateUserOne(getUserNo);
			RoommateAttachment attOne = new RoommateService().selectRoommateAttaOne(roommateUser.getrUserNo());
			request.setAttribute("ru", roommateUser);
			request.setAttribute("attOne", attOne);
			request.getSession().setAttribute("msg", "매칭 요청 완료!");
			request.getRequestDispatcher("/views/Roommate/rm_userDetail.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("javascript:history.back();").forward(request, response);
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
