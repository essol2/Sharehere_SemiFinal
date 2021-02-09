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

import administrator.model.service.ADM_IncomeService;
import administrator.model.vo.Income;

/**
 * Servlet implementation class IncomeReportServlet
 */
@WebServlet("/income/report")
public class IncomeReportServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IncomeReportServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date today = new Date();
		
		Calendar cal = Calendar.getInstance();
		int thisYear = cal.get(Calendar.YEAR); // 오늘의 년
		int thisMonth = cal.get(Calendar.MONTH)+1; // 오늘의 월
		int thisDay = cal.get(Calendar.DATE); // 오늘의 일
		int lastMonth = 0; // 저번달 변수 선언
		int lastYear = 0; // 저번해 변수 선언
		int lastMonthRMTotal = 0; // 저번달 룸메이트 전체 수익
		int lastMonthSHTotal = 0; // 저번달 하우스 전체 수익
		
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
		
		// lastMonth, lastYear 문자로 변환시키고 하나로 만들기
		String thisYearS = ""+thisYear;
		String thisMonthS = ""+thisMonth;
		String thisYearMonth = thisYearS+thisMonthS;
		
		// int thisMonthLastDate = cal.getActualMaximum(Calendar.DAY_OF_MONTH); // 이번 달의 마지막 일.
		
		// 룸메이트 이번달 결제내역들 리스트로 가져오기
		ArrayList<Income> paymentsRm = new ADM_IncomeService().paymentByMonthRM(thisMonth);
		// 하우스 이번달 결제내역들 리스트로 가져오기
		ArrayList<Income> paymentsSh = new ADM_IncomeService().paymentByMonthSH(thisMonth);
		
		// 이번달 현재까지의 수익 구하기(룸메이트)
		int thisMonthRMTotal = 0;
		for(int i=0; i<paymentsRm.size(); i++) {
			int atThisPay = Integer.parseInt(paymentsRm.get(i).getPrice());
			thisMonthRMTotal += atThisPay;
		}
		//System.out.println("룸메이트 이번달 결제건 금액 전부 합한 값 : " + thisMonthRMTotal);
		
		// 이번달 현재까지의 수익 구하기(하우스)
		int thisMonthSHTotal = 0;
		for(int i=0; i<paymentsRm.size(); i++) {
			int atThisPay = Integer.parseInt(paymentsSh.get(i).getSh_price());
			thisMonthSHTotal += atThisPay;
		}
		//System.out.println("하우스 이번달 결제건 금액 전부 합한 값 : " + thisMonthSHTotal);
		
		// 이번달 총 수익 합계
		int thisMonthTotal = thisMonthRMTotal + thisMonthSHTotal;
				
		
		// 만약 오늘이 새로운 달의 시작 날이라면 저번달의 총 수익 insert 하기
		if(thisDay == 1) {
			// 지난달 수익 먼저 계산해오기(룸메이트)
			ArrayList<Income> lastMonthRMIncome = new ADM_IncomeService().lastMRMIncome(lastMonth);
			// 지난달 수익 먼저 계산해오기(하우스)
			ArrayList<Income> lastMonthSHIncome = new ADM_IncomeService().lastMSHIncome(lastMonth);
			
			//System.out.println("servlet에서 지난달 결제내역 잘 불러오는가? : " + lastMonthRMIncome);
			//System.out.println("servlet에서 지난달 결제내역 잘 불러오는가? : " + lastMonthSHIncome);
			
			// 저번달 총 수익 구하기(룸메이트)
			if(lastMonthRMIncome != null) {
				for(int i=0; i<lastMonthRMIncome.size(); i++) {
					int atThisPay = Integer.parseInt(lastMonthRMIncome.get(i).getPrice());
					lastMonthRMTotal += atThisPay;
				}
			} else {
				lastMonthRMTotal = 0;
			}
			//System.out.println("저번달 룸메이트 총 수입 : " + lastMonthRMTotal);
			
			// 저번달 총 수익 구하기(하우스)
			if(lastMonthSHIncome != null) {
				for(int i=0; i<lastMonthSHIncome.size(); i++) {
					int atThisPay = Integer.parseInt(lastMonthSHIncome.get(i).getSh_price());
					lastMonthSHTotal += atThisPay;
				}
			}else {
				lastMonthSHTotal = 0;
			}
			//System.out.println("저번달 하우스 총 수입 : " + lastMonthSHTotal);
			
			// 이제 이 값들을 테이블에 인서트 해놓자.
			int rmResult = new ADM_IncomeService().insertRMLastIncome(thisYear, lastMonth ,lastMonthRMTotal);
			int shResult = new ADM_IncomeService().insertSHLastIncome(thisYear, lastMonth, lastMonthSHTotal);
			
			//System.out.println("값들이 잘 들어가고 result들이 잘 반환 됐는가? rmResult : " + rmResult);
			//System.out.println("값들이 잘 들어가고 result들이 잘 반환 됐는가? shResult : " + shResult);
		}
		
		// 이제 과거의 매출들을 달별로 list에 담아서 와야해(DB에서 select 해오기)
		ArrayList<Income> incomeRMList = new ADM_IncomeService().selectRMIncomes();
		ArrayList<Income> incomeSHList = new ADM_IncomeService().selectSHIncomes();
		
		//System.out.println("값들 잘 들어왔는감? incomeRMList : " + incomeRMList);
		//System.out.println("값들 잘 들어왔는감? incomeSHList : " + incomeSHList);
		
		request.setAttribute("thisYear", thisYear);
		request.setAttribute("thisMonth", thisMonth);
		request.setAttribute("thisMonthRMTotal", thisMonthRMTotal);
		request.setAttribute("thisMonthSHTotal", thisMonthSHTotal);
		request.setAttribute("thisMonthTotal", thisMonthTotal);
		request.setAttribute("incomeRMList", incomeRMList);
		request.setAttribute("incomeSHList", incomeSHList);
		
		RequestDispatcher view = request.getRequestDispatcher("/views/admin/admin_incomeFirst.jsp");
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
