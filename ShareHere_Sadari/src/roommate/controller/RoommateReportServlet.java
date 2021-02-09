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
 * Servlet implementation class RoommateReportServlet
 */
@WebServlet("/roommate/report")
public class RoommateReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateReportServlet() {
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
		String rUserNo = request.getParameter("rUserNo");
		String reportContent = request.getParameter("reportContent");
		String reportText = request.getParameter("reportText");
	
		int result = new RoommateService().insertReport(loginUserNO, rUserNo, reportContent, reportText);

		if (result > 0) {
			RoommateUser ru = new RoommateService().selectRoommateUserOne(rUserNo);
			RoommateAttachment attOne = new RoommateService().selectRoommateAttaOne(ru.getrUserNo());
			request.setAttribute("ru", ru);
			request.setAttribute("attOne", attOne);
			request.getSession().setAttribute("msg", "신고 완료되었습니다. 처리까지 3일 소요됩니다.");
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
