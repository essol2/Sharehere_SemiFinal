package administrator.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.service.ADM_SharehouseService;
import administrator.model.vo.RmReport;

/**
 * Servlet implementation class SendWarningServlet
 */
@WebServlet("/send/warning")
public class SendWarningServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SendWarningServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int rmNo = Integer.parseInt(request.getParameter("rmNo"));
		String shNo = request.getParameter("shNo");
		//System.out.println("서블렛에는 잘 오뉘...?");
		
		if(rmNo==0 || shNo!=null) {
			int result = new ADM_SharehouseService().updateCheck(shNo);
			//System.out.println("서블렛에서 jsp로 넘겨주기만 하면 된다! 거의다 왔따! : " + result);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/shreport/list");
			} else {
				request.setAttribute("msg", "게시글 수정에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
		} else if(rmNo != 0 || shNo==null){
			int result = new ADM_MemberService().updateCheck(rmNo);
			
			if(result > 0) {
				response.sendRedirect(request.getContextPath()+"/rmreport/list");
			} else {
				request.setAttribute("msg", "게시글 수정에 실패했습니다.");
				request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			}
			
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
