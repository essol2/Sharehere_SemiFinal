package administrator.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.vo.PageInfo;
import administrator.model.vo.Usermember;
import member.model.service.MemberService;

/**
 * Servlet implementation class usermemListServlet
 */
@WebServlet("/usermem/list")
public class UsermemListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UsermemListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ADM_MemberService ms = new ADM_MemberService();
		
		int listCount = ms.getUserListCount(); // 일반회원 총 인원 수
		
		int pageLimit = 10;
		int umLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)Math.ceil((double)listCount/umLimit);
		startPage = (currentPage -1 ) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, umLimit,
				maxPage, startPage, endPage);
		
		ArrayList<Usermember> list = ms.selectUserList(pi);
		//System.out.println("list : " + list);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/adm_usermemList.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
