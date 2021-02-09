package mypage.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Host;
import mypage.model.service.MyPageService;
import mypage.model.vo.ShUserResDetail;
import mypage.model.vo.ShUserReservation;

/**
 * Servlet implementation class User_ResDetail
 */
@WebServlet("/Mypage/shResDetail")
public class User_ResDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_ResDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession();
//		ShUserReservation shUserRes = (ShUserReservation)session.getAttribute("shUserRes");
//		String checkRoomNo = shUserRes.getShRVNo();
		String RVNo = request.getParameter("RVNo");
		
	
		//System.out.println("checkRoomNo : " + RVNo);
		
		// 예약 방번호로 호스트 정보 
		ShUserResDetail shusdetail = new MyPageService().selectDetail(RVNo);
		
		System.out.println("Servlet : " + shusdetail);
		request.setAttribute("shusdetail", shusdetail);
		
		//System.out.println("checkRoomNo : "+ checkRoomNo);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/Mypage/mp_shReserDetail.jsp");
		view.forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
