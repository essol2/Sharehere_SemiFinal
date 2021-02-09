package mypage.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import house.model.service.HouseService;
import mypage.model.service.MyPageService;

/**
 * Servlet implementation class User_ResDelete
 */
@WebServlet("/Mypage/shResdelete")
public class User_ResDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_ResDelete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String RVNo = request.getParameter("RVNo");
		System.out.println(RVNo);
		
		int result = new MyPageService().deleteUsRes(RVNo);
		System.out.println("resultDelete : "+ result);
		
		if(result > 0){
			request.getSession().setAttribute("msg", "예약이 취소되었습니다.");
			response.sendRedirect(request.getContextPath() + "/Mypage/User/ReservationList");
		}else {
			request.setAttribute("msg", "예약 취소에 실패했습니다.");
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
