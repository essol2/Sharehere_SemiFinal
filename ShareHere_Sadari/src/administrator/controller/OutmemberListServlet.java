package administrator.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import administrator.model.service.ADM_MemberService;
import administrator.model.vo.ADM_Admin;
import administrator.model.vo.Outmember;
import administrator.model.vo.PageInfoForOut;
import member.model.vo.Admin;

/**
 * Servlet implementation class OutmemberListServlet
 */
@WebServlet("/outmem/list")
public class OutmemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OutmemberListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		Admin loginAdm = (Admin)session.getAttribute("loginAdmin");
//		String admPwd =loginAdm.getAdm_pwd();
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ADM_MemberService ms = new ADM_MemberService();
		
		int listCount = ms.getOutListCount(); // 일반회원 총 인원 수
		
		int pageLimit = 10;
		int omLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)Math.ceil((double)listCount/omLimit);
		startPage = (currentPage -1 ) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfoForOut pi = new PageInfoForOut(currentPage, listCount, pageLimit, omLimit,
				maxPage, startPage, endPage);
		
		ArrayList<Outmember> list = ms.selectOutList(pi);
	
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
//		request.setAttribute("admPwd", admPwd);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/admin_outmemList.jsp");
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
