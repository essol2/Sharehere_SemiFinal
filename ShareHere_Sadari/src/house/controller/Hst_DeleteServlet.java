package house.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import house.model.service.HouseService;

/**
 * Servlet implementation class Hst_deleteServlet
 */
@WebServlet("/hst/delete")
public class Hst_DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hst_DeleteServlet() {
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
		
		String hNo = request.getParameter("hNo");
		//System.out.println("hNo : "+ hNo);
		
		int result = new HouseService().deleteConfirm(hNo);
		
		if(result > 0){
			request.getSession().setAttribute("msg", "매물이 성공적으로 삭제 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/hst/confirm");
		}else {
			request.setAttribute("msg", "매물 삭제에 실패했습니다.");
			RequestDispatcher view = request.getRequestDispatcher("/views/common/errorPage.jsp");
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
