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

import house.model.service.HouseService;
import house.model.vo.HostInfo;
import house.model.vo.HostPay;
import member.model.vo.Host;
import mypage.model.service.MyPageService;
import mypage.model.vo.PageInfo;

/**
 * Servlet implementation class Hst_PayConfirm
 */
@WebServlet("/Mypage/hstPay")
public class Hst_PayConfirm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hst_PayConfirm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Host loginHost = (Host) session.getAttribute("loginHost");
		String hstNo = loginHost.getHst_no();
		//System.out.println("confirm : " + hstNo);
		
		// * currentPage : 현재 요청 페이지
		// 기본적으로 게시판은 1페이지부터 시작함
		int currentPage = 1;
		
		// 하지만 페이지 전환 시 전달 받은 현재 페이지가 있을 경우 해당 페이지를 currentPage로 적용
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		
		MyPageService mp = new MyPageService();
		
		
		// 1_1. 게시글 총 갯수 구하기
		int listCount = mp.getListCount(hstNo);
		//System.out.println("listCount : " + listCount);
		
		// 1_2. 페이징 처리를 위한 변수 선언 및 연산
		int pageLimit = 5; // 한 페이지 하단에 보여질 페이지 수
		int objectLimit = 5; // 한 페이지에 보여질 게시글 최대 수
		int maxPage; // 전체 페이지에서 가장 마지막 페이지
		int startPage; // 한 페이지 하단에 보여질 시작 페이지
		int endPage; // 한 페이지 하단에 보여질 끝 페이지
		
		// * maxPage : 총 페이지의 마지막 수
		// 전체 게시글 수 / 한 페이지에 보여질 개수 결과를 올림 처리
		maxPage = (int)Math.ceil((double)listCount / objectLimit);
		
		// * startPage : 현재 페이지에 보여지는 페이징 바의 시작 숫자
		// 나의 현재 페이지(currentPage)에서 pageLimit만큼을 나누고 다시 곱한 뒤 1을 더한다
		// 1 / 10 * 10 + 1 -> 1
		// 5 / 10 * 10 + 1 -> 1
		// 11 / 10 * 10 + 1 -> 11
		// 15 / 10 * 10 + 1 -> 11
		// 21 / 10 * 10 + 1 -> 21
		// 25 / 10 * 10 + 1 -> 21
		// 한 가지 예외 상황(10, 20, 30 ..)은 딱 떨어지는 숫자의 경우로 몫이 하나 더 늘어남
		// 10 / 10 * 10 + 1 -> 11
		// 예외 상황 방지를 위해 currentPage - 1을 함
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * endPage : 현재 페이지에서 보여지는 페이징 바의 마지막 숫자
		endPage = startPage + pageLimit -1;
		
		// 하지만 마지막 페이지 수가 총 페이지 수보다 클 경우는 있을 수 없으므로
		// (maxPage)가 11인데 endPage가 20일 수 없음
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		// 페이징 처리와 관련된 변수를 클래스 형식으로 만들어 담기
		PageInfo pi = new PageInfo(currentPage, listCount, pageLimit, objectLimit, 
					maxPage, startPage, endPage);
		
		// 호스트번호로 결제 조회
		ArrayList<HostPay> hpay =  mp.selectPay(hstNo, pi);
		
		
		request.setAttribute("pi", pi);
		request.setAttribute("hpay", hpay);
		
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
