package roommate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateComment;

/**
 * Servlet implementation class RoommateCommentServlet
 */
@WebServlet("/roommate/comment")
public class RoommateCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateCommentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<RoommateComment> comments = new RoommateService().commentList();
		System.out.println("후기 리스트 : " + comments);
		
		if (comments != null) {
			request.setAttribute("comments", comments);
			RequestDispatcher view = request.getRequestDispatcher("/views/Roommate/rm_comment.jsp");
			view.forward(request, response);
		} else {
			request.setAttribute("msg", "에러!");
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
