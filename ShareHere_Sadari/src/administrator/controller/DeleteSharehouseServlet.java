package administrator.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_SharehouseService;

/**
 * Servlet implementation class DeleteSharehouseServlet
 */
@WebServlet("/adm/delete/sh")
public class DeleteSharehouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteSharehouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String method = request.getMethod();
		//System.out.println("method : "+ method);
		
		String shno = request.getParameter("shno");
		String shRno = request.getParameter("shRno");
		//System.out.println("hNo : "+ hNo);
		
		String path = "";
		int result = 0;
		
		if(shno != null) {
			result = new ADM_SharehouseService().deleteSHConfirm(shno);
			path = "/sharehouse/list";
		} else {
			result = new ADM_SharehouseService().deleteSHReport(shRno);
			path = "rmreport/list";
		}
		
		
		if(result > 0){
			request.getSession().setAttribute("msg", "매물이 성공적으로 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + path);
		}else {
			request.setAttribute("msg", "매물 삭제에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher(request.getContextPath()+path);
			view.forward(request, response);
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
