package administrator.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.service.ADM_SharehouseService;
import administrator.model.vo.Outmember;
import administrator.model.vo.Sharehouse;

/**
 * Servlet implementation class backShareHouseServlet
 */
@WebServlet("/back/sharehouse")
public class BackShareHouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackShareHouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//request.setCharacterEncoding("UTF-8");
				//System.out.println("서블렛으로 이동 완료.");
				
				String shno = request.getParameter("sh_no");
				//System.out.println("sh_no가 서블렛에 잘 넘어왔나? : " + shno);
				int result = 0;
				
				result = new ADM_SharehouseService().combackSharehouse(shno);
				
				 //System.out.println("result : " + result);
				
				if(result>0) {
					//System.out.println("result>0로 들어옴 ");
					
					ArrayList<Sharehouse> hList = new ADM_SharehouseService().selectDelList();
					request.setAttribute("hList", hList);
					response.sendRedirect(request.getContextPath() + "/delsharehouse/list");
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
