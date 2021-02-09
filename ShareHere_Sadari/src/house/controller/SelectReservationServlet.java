package house.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import house.model.service.HouseService;
import house.model.vo.HostRoom;
import house.model.vo.HouseInfo;

/**
 * Servlet implementation class SelectReservationServlet
 */
@WebServlet("/select/reservation")
public class SelectReservationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectReservationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				//한글 값 인코딩 처리
				request.setCharacterEncoding("UTF-8");
				//요청 값 불러오기
				String shNo = request.getParameter("shNo");
				System.out.println(shNo);
				
				ArrayList<HouseInfo> houseinfo = new HouseService().selectReservationHouse(shNo);
				ArrayList<HostRoom> room = new HouseService().selectReservationRoom(shNo);
				
				// 예약페이지로 하우스 정보 전송
			
				request.setAttribute("houseinfo", houseinfo);
				request.setAttribute("shNo", shNo);
				request.setAttribute("room", room);
				request.getRequestDispatcher("/views/House/search/sh_reservation.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
