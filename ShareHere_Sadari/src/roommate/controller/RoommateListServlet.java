package roommate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class RoommateListServlet
 */
@WebServlet("/select/roommateuserlist")
public class RoommateListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		User user = (User) request.getSession().getAttribute("loginUser");
				
		String survey = (String) request.getSession().getAttribute("survey");
		
		ArrayList<RoommateUser> list = new RoommateService().selectList(survey);
		ArrayList<RoommateAttachment> rmatlist = new RoommateService().selectAttachmentList();
		
		System.out.println("list : " + list);
		System.out.println("rmatlist : " + rmatlist);
		System.out.println("로그인유저 세션 : " + user.getUserNo());
		
		if (list != null && rmatlist != null) { // 값이 잘 왔다면
			request.setAttribute("roommateUserList", list); // 회원리스트
			request.setAttribute("roommateAttachmentList", rmatlist); // 썸네일리스트
			RequestDispatcher view = request.getRequestDispatcher("/views/Roommate/rm_userlist.jsp");
			view.forward(request, response);
		}  else { // 값이 오지 안았다면
			request.setAttribute("msg", "룸메이트 리스트를 불러오는데 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
