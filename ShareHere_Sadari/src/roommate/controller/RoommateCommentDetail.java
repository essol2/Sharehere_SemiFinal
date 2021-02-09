package roommate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import roommate.model.service.RoommateService;
import roommate.model.vo.CommentReply;
import roommate.model.vo.RoommateComment;

/**
 * Servlet implementation class RoommateCommentDetail
 */
@WebServlet("/comment/detail")
public class RoommateCommentDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateCommentDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int nno = Integer.parseInt(request.getParameter("nno"));	/*getParameter : 리턴값 스트링*/
		
		System.out.println("nno : " + nno);
		RoommateComment comments = new RoommateService().selectComment(nno);
		
		// AJAX 학습 후 댓글 조회 추가
		ArrayList<CommentReply> crList = new RoommateService().selectReplyList(nno);
		System.out.println("comments : " + comments);
		
		String page = "";
		if(comments != null) {
			request.setAttribute("crList", crList);
			// forwarding 시 crList도 포함시키기
			request.setAttribute("comments", comments);
			page = "/views/Roommate/rm_commentDetailView.jsp";
			request.getRequestDispatcher(page).forward(request, response);
		} /*else {
			request.setAttribute("msg", "에러!");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}*/
		
		
	
		
	
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
