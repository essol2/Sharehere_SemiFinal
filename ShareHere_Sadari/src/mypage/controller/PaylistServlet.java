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

import administrator.model.service.ADM_PayService;
import administrator.model.vo.PageInfoForOut;
import administrator.model.vo.PageInfoForSH;
import administrator.model.vo.RmPay;
import administrator.model.vo.ShPay;
import member.model.vo.Host;
import member.model.vo.User;

/**
 * Servlet implementation class PaylistServlet
 */
@WebServlet("/pay/list")
public class PaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PaylistServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User loginUser = (User)session.getAttribute("loginUser");
		System.out.println("loginUser : " + loginUser);
		
		String uno =  loginUser.getUserNo();
			
			int currentPage = 1;
			
			ADM_PayService ps = new ADM_PayService();
			
			int payListCount = ps.getPayListCount(uno); // 이 회원이 결제한 내역의 총 갯수
			
			int pageLimit = 10;
			int omLimit = 10;
			int maxPage;
			int startPage;
			int endPage;
			
			maxPage = (int)Math.ceil((double)payListCount/omLimit);
			startPage = (currentPage -1 ) / pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfoForOut pi = new PageInfoForOut(currentPage, payListCount, pageLimit, omLimit,
					maxPage, startPage, endPage);
			
			ArrayList<RmPay> userList = new ADM_PayService().selectpaylist(uno, pi);
			
			request.setAttribute("upi", pi);
			request.setAttribute("ulist", userList);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/Mypage/mp_payList.jsp");
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
