package administrator.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.vo.Usermember;

/**
 * Servlet implementation class DetailUsermemServlet
 */
@WebServlet("/user/detail")
public class DetailUsermemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailUsermemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uno = request.getParameter("uno");
		
		Usermember userDetail= new ADM_MemberService().selectUerMem(uno);
		
		// System.out.println("notice 상세 : " + notice);
		
		String page = "";
		if(userDetail != null) {
			request.setAttribute("userDetail", userDetail);
			page = "/views/admin/adm_detailMember.jsp";
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
