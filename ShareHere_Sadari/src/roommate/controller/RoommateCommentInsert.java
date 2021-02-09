package roommate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateComment;

/**
 * Servlet implementation class RoommateCommentInsert
 */
@WebServlet("/comment/insert")
public class RoommateCommentInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateCommentInsert() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = request.getParameter("writer");
		
		RoommateComment comments = new RoommateComment(title, content, writer);

		int result = new RoommateService().insertComment(comments);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "후기글이 성공적으로 등록되었습니다.");
			response.sendRedirect(request.getContextPath() + "/roommate/comment");
		} /*else {
			request.setAttribute("msg", "공지사항 등록에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
		}*/
		
		System.out.println(comments);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
