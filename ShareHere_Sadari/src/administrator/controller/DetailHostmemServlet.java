package administrator.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.vo.Hostmember;
import administrator.model.vo.Usermember;

/**
 * Servlet implementation class DetailHostmemServlet
 */
@WebServlet("/hostmem/detail")
public class DetailHostmemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailHostmemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String hno = request.getParameter("hno");
		
		Hostmember hostDetail= new ADM_MemberService().selectHostMem(hno);
		
		//System.out.println("hostDetail 상세 : " + hostDetail);
		
		String page = "";
		if(hostDetail != null) {
			request.setAttribute("hostDetail", hostDetail);
			page = "/views/admin/adm_detailHostMember.jsp";
		} else {
			request.setAttribute("msg", "회원 상세페이지를 불러오는데 실패하였습니다.");
			page = "/views/common/errorPage.jsp";
		}
		
		request.getRequestDispatcher(page).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
