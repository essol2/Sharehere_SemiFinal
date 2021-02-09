package administrator.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.service.ADM_SharehouseService;

/**
 * Servlet implementation class RemoveUsermemServlet
 */
@WebServlet("/remove/report")
public class RemoveUsermemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveUsermemServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uno = request.getParameter("delRmNo");
		String shno = request.getParameter("delShNo");
		
		if(uno != null) {
			int mresult = new ADM_MemberService().removeUser(uno);
			
			RequestDispatcher view = request.getRequestDispatcher("/rmreport/list");
			view.forward(request, response);
			
		} else if(shno != null) {
			int sresult = new ADM_SharehouseService().removeSH(shno);
			
			RequestDispatcher view = request.getRequestDispatcher("/shreport/list");
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
