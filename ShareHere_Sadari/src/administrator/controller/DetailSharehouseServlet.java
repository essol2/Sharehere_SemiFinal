package administrator.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_SharehouseService;
import administrator.model.vo.Sharehouse;

/**
 * Servlet implementation class DetailSharehouseServlet
 */
@WebServlet("/sharehouse/datail")
public class DetailSharehouseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DetailSharehouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String shno = request.getParameter("shno");
		
		Sharehouse houseDetail= new ADM_SharehouseService().selectShareHouse(shno);
		
		// System.out.println("notice 상세 : " + notice);
		
		String page = "";
		if(houseDetail != null) {
			request.setAttribute("houseDetail", houseDetail);
			page = "/views/admin/adm_detailShareHouse.jsp";
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
