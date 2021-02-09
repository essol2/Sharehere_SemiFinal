package house.controller;

import java.io.IOException;

import java.sql.Date;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import house.model.service.HouseService;
import house.model.vo.HostInfo;
import house.model.vo.HouseReservation;
import member.model.vo.User;

/**
 * Servlet implementation class InsertReservationServlet
 */
@WebServlet("/insert/reservation")
public class InsertReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//한글 값 인코딩 처리
				request.setCharacterEncoding("UTF-8");
				
				// 추출해야 하는 값(예약번호, 예약한 방번호, 희망거주기간, 예약날짜, 예약한 회원번호, 예약한 방을 포함하고있는 하우스번호(참조))
				String check = request.getParameter("check");			 	// 선택한 방 번호
				String period = request.getParameter("period");				// 희망 거주기간
				String rvdate = request.getParameter("rvdate");				// 예약한 날짜
				
				String usNo = ((User)request.getSession().getAttribute("loginUser")).getUserNo(); // 예약한 회원번호
				String shNo = request.getParameter("shNo");				// 하우스 번호
				
				System.out.println(rvdate);
			     	
			   HouseReservation hr = new HouseReservation(check, period, rvdate, usNo, shNo);
			   System.out.println("예약내역 넘어오는지 확인 : " + hr);
				
			   int result = new HouseService().insertHouseReservation(hr);
			   

			    // 받은 결과에 따라 성공 / 실패 페이지 내보내기
				if (result > 0) {
					// 예약 완료시 인덱스 페이지로 이동
					request.getSession().setAttribute("msg", "예약이 접수되었습니다.");
					response.sendRedirect(request.getContextPath()+"/Mypage/User/ReservationList");
				} else {
					request.setAttribute("msg", "예약에 실패하였습니다.");
					request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
