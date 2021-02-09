package administrator.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.vo.Hostmember;
import administrator.model.vo.Outmember;
import administrator.model.vo.Usermember;

/**
 * Servlet implementation class ComebackMemberServlet
 */
@WebServlet("/comeback")
public class ComebackMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComebackMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8");
		//System.out.println("서블렛으로 이동 완료.");
		
		String mno = request.getParameter("mem_no");
		//System.out.println("mem_no가 서블렛에 잘 넘어왔나? : " + mno);
		int result = 0;
		
		if(mno.charAt(0) == 'h') {
			result = new ADM_MemberService().combackHostMember(mno);
			
		}else {
			result = new ADM_MemberService().comebackUserMember(mno);
		}
		
		 //System.out.println("result : " + result);
		
		if(result>0) {
			//System.out.println("result>0로 들어옴 ");
			
			ArrayList<Outmember> list = new ADM_MemberService().selectOutList();
			request.setAttribute("list", list);
			response.sendRedirect(request.getContextPath() + "/outmem/list");
		} else {
			//System.out.println("else로 들어옴");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "복구에 실패했습니다.");
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
