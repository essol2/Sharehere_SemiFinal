package administrator.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_SharehouseService;
import administrator.model.vo.PageInfoForSR;
import administrator.model.vo.ShReport;
import administrator.model.vo.Sharehouse;

/**
 * Servlet implementation class ShReportServlet
 */
@WebServlet("/shreport/list")
public class ShReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 신규매물 카운트 */
		Date today = new Date();
		
		Calendar cal = Calendar.getInstance();
		int thisYear = cal.get(Calendar.YEAR); // 오늘의 년
		int thisMonth = cal.get(Calendar.MONTH)+1; // 오늘의 월
		int thisDay = cal.get(Calendar.DATE); // 오늘의 일
		int lastMonth = 0; // 저번달 변수 선언
		int lastYear = 0; // 저번해 변수 선언
		int lastMonthRMTotal = 0; // 저번달 룸메이트 전체 수익
		int lastMonthSHTotal = 0; // 저번달 하우스 전체 수익
		String thisYearS = ""; // 올해 문자형
		String thisMonthS = ""; // 이번달 문자형
		String thisYearMonth = ""; // 이번해의 이번달 문자형
		String thisDayS = ""; // 오늘 날짜 문자형
		String thisYearMonthDay = ""; // 오늘 년월일 문자형
		String lastYearS = ""; //지난해 문자형
		String lastMonthS = "";// 지난달 문자형
		String lastYearMonth = "";//지난해 지난달 문자형
		
		//System.out.println(thisYear);
		//System.out.println(thisMonth);

		
		// 저번해, 저번달 구하기
		if(thisMonth == 1) { // 이번달이 1월달인 경우 전 달은 12월
			lastMonth = 12;
			lastYear = thisYear-1;
		} else { // 나머지 달들은 이번달의 -1
			lastMonth = thisMonth-1;
			lastYear = thisYear;
		}
		
		// 날자 포맷 맞춰주기_오늘의 날짜
		//System.out.println("올해 : " + thisYear);
		thisYearS = "" + thisYear;
		//System.out.println("올해 문자형 : " + thisYearS);
		thisYearS = thisYearS.substring(2); //4자리 년도에서 두자리 두개만 추출하기 
		//System.out.println("subString(2)의 thisYearS : " + thisYearS); // ex)2021 -> 21
		
		if (thisMonth < 10 && thisDay < 10) { // 이번 달이 한자리, 오늘의 날이 한자리 일 때.
			thisMonthS = "0"+thisMonth; // ex) 2 -> 02
			thisDayS = "0"+thisDay; // ex) 4 -> 04
			thisYearMonth = thisYearS + thisMonthS; // ex) 2102
			thisYearMonthDay = thisYearMonth + thisDayS; // ex) 210204
			//System.out.println(thisYearMonthDay);
		}else if (thisMonth < 10 && thisDay > 9) { // 이번 달이 한자리, 오늘의 날이 두자리 일 때.
			thisMonthS = "0"+thisMonth; // ex) 2 -> 02
			thisYearMonth = thisYearS + thisMonthS; // ex) 2102
			thisYearMonthDay = thisYearMonth + thisDay; // ex) 210212
			//System.out.println(thisYearMonthDay);
		}else if (lastMonth > 9 && thisDay <10) { // 이번 달이 두자리, 오늘의 날이 한자리 일 때.
			thisDayS = "0" + thisDay; // ex) 4 -> 04
			thisYearMonth = thisYearS + thisMonth; // ex) 2111 
			thisYearMonthDay = thisYearMonth + thisDayS; // ex) 211104
			//System.out.println(thisYearMonthDay);
		}else if (lastMonth >9 && thisDay > 9) { // 이번 달이 두자리, 오늘의 날이 두자리 일 때.
			thisYearMonth = thisYearS + thisMonth; // ex) 2111
			thisYearMonthDay = thisYearMonth + thisDay; // ex) 211112
			//System.out.println(thisYearMonthDay);
		}
	
		// 날자 포맷 맞추기 _ 저번달
		lastYearS = "" + lastYear;
		lastYearS = lastYearS.substring(2);
		//System.out.println("subString(2)의 lastYearS : " +lastYearS);
		
		if(lastMonth < 10) 
			lastMonthS = "0"+lastMonth;
		if(lastMonth >= 10) 
			lastMonthS = "" + lastMonth;

		lastYearMonth = lastYearS+lastMonthS;
		
		//System.out.println(lastYearMonth);
		
		// 오늘의 신규 매물수 구하기
		int howManyToday = new ADM_SharehouseService().countNewShDaily(thisYearMonthDay);
		//System.out.println("servlet으로 돌아온 howManyToday : " + howManyToday);
		
		// 이번달 업로드된 매물 수 구하기
		int howManyThisMonth = new ADM_SharehouseService().countNewShMonthly(thisYearMonth);
		//System.out.println("servlet으로 돌아온 howManyThisMonth : " + howManyThisMonth);
		
		// 저번달 업로드된 매물 수 구하기
		int howManyLastMonth = new ADM_SharehouseService().countNewShLastMonth(lastYearMonth);
		//System.out.println("servlet으로 돌아온 howManyLastMonth : " + howManyLastMonth);
		
		if(thisDay == 1) {

			// 저번달 업로드된 매물 DB에 저장하기
			int resultInput = new ADM_SharehouseService().insertLastMonthNewSh(lastYearMonth, howManyLastMonth);
			//System.out.println("insurt결과인 result 값 : " + resultInput);
			
		}
		
		// 달별 업로드 매물 갯수 
		ArrayList<Sharehouse> preNewSh = new ADM_SharehouseService().selectLastNewSh();
		//System.out.println("달별 업로드 매물 갯수 preNewSh : " + preNewSh);

		
		/* 신고회원 페이징 처리*/
		
		int currentPage = 1;
		
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		ADM_SharehouseService ss = new ADM_SharehouseService();
		
		int listCount = ss.getSRListCount(); // 일반회원 총 인원 수
		
		int pageLimit = 10;
		int srLimit = 5;
		int maxPage;
		int startPage;
		int endPage;
		
		maxPage = (int)Math.ceil((double)listCount/srLimit);
		startPage = (currentPage -1 ) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit - 1;
		
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		PageInfoForSR pi = new PageInfoForSR(currentPage, listCount, pageLimit, srLimit,
				maxPage, startPage, endPage);
		
		ArrayList<ShReport> list = ss.selectSRList(pi);
		//System.out.println("list : " + list);
		
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.setAttribute("howManyToday", howManyToday);
		request.setAttribute("howManyThisMonth", howManyThisMonth);
		request.setAttribute("howManyLastMonth", howManyLastMonth);
		request.setAttribute("preNewSh", preNewSh);
		
		
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/adm_sharehouse.jsp");
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
