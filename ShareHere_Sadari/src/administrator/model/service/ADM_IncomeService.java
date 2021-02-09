package administrator.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import administrator.model.dao.ADM_IncomeDao;
import administrator.model.vo.Income;
import administrator.model.vo.PageInfoForIS;
import administrator.model.vo.PageInfoForRm;
import administrator.model.vo.Sharehouse;

public class ADM_IncomeService {

	//페이징 처리를 위한 rm 전체 갯수구하기
	public int getRmListCount() {
		Connection conn = getConnection();
		
		int listCount = new ADM_IncomeDao().getRmListCount(conn);
				
		close(conn);
				
		return listCount;
	}

	// 페이징 처리 후 리스트 출력
	public ArrayList<Income> selectRmList(PageInfoForRm pi) {
		Connection conn = getConnection();
		
		ArrayList<Income> list = new ADM_IncomeDao().selectRmList(conn, pi); 
			
		close(conn);
			
		return list;
	}
	
	// 페이징 처리를 위한 총 갯수구하기
	public int getIsListCount() {
		Connection conn = getConnection();
		
		int listCount = new ADM_IncomeDao().getIsListCount(conn);
				
		close(conn);
				
		return listCount;
	}

	// 페이징 처리 후 리스트 출력
	public ArrayList<Income> selectIsList(PageInfoForIS pi) {
		Connection conn = getConnection();
		
		ArrayList<Income> list = new ADM_IncomeDao().selectIsList(conn, pi); 
			
		close(conn);
			
		return list;
	}

	// 차트 만들기 위한 달별 결제내역 가져오기(룸메이트)
	public ArrayList<Income> paymentByMonthRM(int thisMonth) {
		Connection conn = getConnection();
		
		ArrayList<Income> paymentsRm = new ADM_IncomeDao().paymentByMonthRM(conn, thisMonth);
		
		close(conn);
		return paymentsRm;
	}

	// 차트 만들기 위한 달별 결제내역 가져오기(하우스)
	public ArrayList<Income> paymentByMonthSH(int thisMonth) {
		Connection conn = getConnection();
		
		ArrayList<Income> paymentsSh = new ADM_IncomeDao().paymentByMonthSH(conn, thisMonth);
		
		close(conn);
		return paymentsSh;
	}

	// 저번 달의 총 수익 구하기 위한 결제내역 가져오기(룸메이트)
	public ArrayList<Income> lastMRMIncome(int lastMonth) {
		Connection conn = getConnection();
		
		ArrayList<Income> lastMonthRMIncome = new ADM_IncomeDao().lastMRMIncome(conn, lastMonth);
		
		close(conn);
		return lastMonthRMIncome;
	}
	// 저번 달의 총 수익 구하기 위한 결제내역 가져오기(하우스)
	public ArrayList<Income> lastMSHIncome(int lastMonth) {
		Connection conn = getConnection();
		
		ArrayList<Income> lastMonthSHIncome = new ADM_IncomeDao().lasMSHIncome(conn, lastMonth);
		
		close(conn);
		return lastMonthSHIncome;	
	}

	// 저번달 총 수익을 테이블에 insert 하러가기(룸메이트)
	public int insertRMLastIncome(int thisYear, int lastMonth, int lastMonthRMTotal) {
		Connection conn = getConnection();
		
		int rmResult = new ADM_IncomeDao().insertRMLastIncome(conn, thisYear, lastMonth, lastMonthRMTotal);
		
		if(rmResult>0) {
			close(conn);
		} else {
			rollback(conn);
		}
		return rmResult;
	}

	// 저번달 총 수익을 테이블에 insert 하러가기(하우스)
	public int insertSHLastIncome(int thisYear, int lastMonth, int lastMonthSHTotal) {
		Connection conn = getConnection();
		
		int shResult = new ADM_IncomeDao().insertSHLastIncome(conn, thisYear, lastMonth, lastMonthSHTotal);
		
		if(shResult>0) {
			close(conn);
		} else {
			rollback(conn);
		}
		return shResult;
	}

	// 현재 달부터 -5개 달까지의 매출 가져오기(룸메이트)
	public ArrayList<Income> selectRMIncomes() {
		Connection conn = getConnection();
		
		ArrayList<Income> incomeRMList = new ADM_IncomeDao().selectRMIncomes(conn);
		
		close(conn);
		return incomeRMList;
	}

	// 현재 달부터 -5개 달까지의 매출 가져오기(하우스)
	public ArrayList<Income> selectSHIncomes() {
		Connection conn = getConnection();
		
		ArrayList<Income> incomeSHList = new ADM_IncomeDao().selectSHIncomes(conn);
		
		close(conn);
		return incomeSHList;
	}

	

}
