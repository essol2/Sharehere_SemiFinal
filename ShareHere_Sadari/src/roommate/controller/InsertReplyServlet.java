package roommate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.CommentReply;

/**
 * Servlet implementation class InsertReplyServlet
 */
@WebServlet("/comment/reply")
public class InsertReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = (User) request.getSession().getAttribute("loginUser");
		// 넘어온 파라미터 값 추출 -> Reply 객체화
		// data : {writerNo : writerNo, writerName : writerName, bId : bId, content : content},
		String writerNo = request.getParameter("writerNo");
		int bId = Integer.parseInt(request.getParameter("bId"));
		String content = request.getParameter("content");
		
		CommentReply cr = new CommentReply();
		cr.setUser_no(writerNo);
		cr.setRef_bid(bId);
		cr.setContent(content);	
		cr.setUser_id(user.getUserId());
		
		ArrayList<CommentReply> crList = new RoommateService().insertReply(cr);
		
		// JSON 또는 GSON 라이브러리 추가 후 rList 응답
		// GSON 사용 시 날짜 값은 Date 포맷에 대한 컨트롤이 필요함(GsonBuilder 객체가 가진 기능)
		// Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		// gson.toJson(rList, response.getWriter());
		response.setContentType("application/json; charset=utf-8"); 
		Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd").create();
		gson.toJson(crList, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
