package administrator.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.vo.RmReport;

/**
 * Servlet implementation class DetailMemberReportServlet
 */
@WebServlet("/memreport/detail")
public class DetailMemberReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailMemberReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String rrno = request.getParameter("rrno");
		
		RmReport RRDetail= new ADM_MemberService().selectReportMem(rrno);
		
		String page = "";
		if(RRDetail != null) {
			request.setAttribute("RRDetail", RRDetail);
			page = "/views/admin/adm_detailRoommateReport.jsp";
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
