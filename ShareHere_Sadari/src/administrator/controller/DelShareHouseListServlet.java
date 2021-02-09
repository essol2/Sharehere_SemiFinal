package administrator.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_SharehouseService;
import administrator.model.vo.PageInfoForDS;
import administrator.model.vo.Sharehouse;

/**
 * Servlet implementation class DelShareHouseListServlet
 */
@WebServlet("/delsharehouse/list")
public class DelShareHouseListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DelShareHouseListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ADM_SharehouseService ss = new ADM_SharehouseService();
		
		int listCount = ss.getDSListCount(); // 일반회원 총 인원 수
		
		int pageLimit = 10;
		int dsLimit = 10;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)Math.ceil((double)listCount/dsLimit);
		startPage = (currentPage -1 ) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfoForDS pi = new PageInfoForDS(currentPage, listCount, pageLimit, dsLimit,
				maxPage, startPage, endPage);
		
		ArrayList<Sharehouse> hList = ss.selectDSList(pi);
		
		request.setAttribute("pi", pi);
		request.setAttribute("hList", hList);
		//request.setAttribute("admPwd", admPwd);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/admin_delShareHouseList.jsp");
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
