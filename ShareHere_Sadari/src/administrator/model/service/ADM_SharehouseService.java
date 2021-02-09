package administrator.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.Date;
import java.util.ArrayList;

import administrator.model.dao.ADM_MemberDao;
import administrator.model.dao.ADM_SharehouseDao;
import administrator.model.vo.Hostmember;
import administrator.model.vo.Outmember;
import administrator.model.vo.PageInfo;
import administrator.model.vo.PageInfoForDS;
import administrator.model.vo.PageInfoForSH;
import administrator.model.vo.PageInfoForSR;
import administrator.model.vo.RmReport;
import administrator.model.vo.ShReport;
import administrator.model.vo.Sharehouse;

public class ADM_SharehouseService {


	// 삭제 매물 리스트 출력 메소드
	public ArrayList<Sharehouse> selectDelList() {
		Connection conn = getConnection();
		ArrayList<Sharehouse> hList = new ADM_SharehouseDao().selectDelList(conn);
		
		close(conn);
		return hList;
	}

	// 삭제된 매물 복구하기 메소드
	public int combackSharehouse(String shno) {
		Connection conn = getConnection();
		
		int result = new ADM_SharehouseDao().comebackSharehouse(conn, shno);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		//System.out.println("service에서 servlet으로 주는 result");
		return result;
	}

	// 리스트 페이징을 위한 매물 총 갯수 구하기
	public int getShListCount() {
		Connection conn = getConnection();
		
		int listCount = new ADM_SharehouseDao().getShListCount(conn);
				
		close(conn);
				
		return listCount;
	}

	// 페이징 처리 후 매물 리스트 조회하기
	public ArrayList<Sharehouse> selectShList(PageInfoForSH pi) {
		Connection conn = getConnection();
		
		ArrayList<Sharehouse> list = new ADM_SharehouseDao().selectShList(conn, pi); 
			
		close(conn);
			
		return list;
	}
	
	// 페이징 처리를 위한 삭제매물 총 갯수 구하기
	public int getDSListCount() {
		Connection conn = getConnection();
		
		int listCount = new ADM_SharehouseDao().getDSListCount(conn);
				
		close(conn);
				
		return listCount;
	}
	

	// 페이징 처리후 삭제 매물 리스트 조회하기
	public ArrayList<Sharehouse> selectDSList(PageInfoForDS pi) {
		Connection conn = getConnection();
		
		ArrayList<Sharehouse> list = new ADM_SharehouseDao().selectDSList(conn, pi); 
			
		close(conn);
			
		return list;
	}
	
    // 페이징 처리를 위한 신고 매물 총 갯수 구하기
	public int getSRListCount() {
		Connection conn = getConnection();
		
		int listCount = new ADM_SharehouseDao().getSRListCount(conn);
				
		close(conn);
				
		return listCount;
	}

	public ArrayList<ShReport> selectSRList(PageInfoForSR pi) {
		Connection conn = getConnection();
		
		ArrayList<ShReport> list = new ADM_SharehouseDao().selectSRList(conn, pi); 
			
		close(conn);
			
		return list;
	}

	// 매물 상세보기 페이지용
	public Sharehouse selectShareHouse(String shno) {
		Connection conn = getConnection();
		
		Sharehouse sh = null;
		sh = new ADM_SharehouseDao().selectShareHouse(conn, shno);
	
		close(conn);
		
		return sh;
	}

	//경고메세지 보내면 check 를 'N'으로 바꾸기(하우스)
	public int updateCheck(String shNo) {
		Connection conn = getConnection();
		
		int result = new ADM_SharehouseDao().updateCheck(conn, shNo);
	
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}
	
	// 신고당해서 alert 띄어줘야 하는 회원한테 경고장 띄우기 메소드
	public ArrayList<ShReport> selectShAlertMem(String hno) {
		Connection conn = getConnection();
		
		ArrayList<ShReport> src = new ADM_SharehouseDao().selectShAlertMem(conn, hno);
	
		close(conn);
		
		return src;
	}

	// 신고당한 쉐하 강제삭제하기
	public int removeSH(String shno) {
		Connection conn = getConnection();
		
		int sresult = new ADM_SharehouseDao().removeSH(conn, shno);
	
		if (sresult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return sresult;
	}

	// 오늘 업로드된 신규 매물 갯수
	public int countNewShDaily(String thisYearMonthDay) {
		Connection conn = getConnection();
		
		int howManyToday  = new ADM_SharehouseDao().countNewShDaily(conn, thisYearMonthDay);
	
		close(conn);

		return howManyToday ;
	}

	// 이번달 올라온 매물 갯수
	public int countNewShMonthly(String thisYearMonth) {
		Connection conn = getConnection();
		
		int howManyThisMonth = new ADM_SharehouseDao().countNewShMonthly(conn, thisYearMonth);
	
		close(conn);

		return howManyThisMonth;	
	}

	// 저번달 올라온 매물 갯수
	public int countNewShLastMonth(String lastYearMonth) {
		Connection conn = getConnection();
		
		int howManyLastMonth = new ADM_SharehouseDao().countNewShLastMonth(conn, lastYearMonth);
	
		close(conn);

		return howManyLastMonth;	
	}

	// 저번달 매물 갯수 DB에 저장
	public int insertLastMonthNewSh(String lastYearMonth, int howManyLastMonth) {
		Connection conn = getConnection();
		
		int result = new ADM_SharehouseDao().insertLastMonthNewSh(conn, lastYearMonth, howManyLastMonth);
	
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 저번달 신규 쉐하 갯수 리스트에 담아 가져오기
	public ArrayList<Sharehouse> selectLastNewSh() {
		Connection conn = getConnection();
		
		ArrayList<Sharehouse> preNewSh = new ADM_SharehouseDao().selectLastNewSh(conn);
	
		close(conn);
		
		return preNewSh;
	}

	// 신고받은 매물 삭제 메소드
	public int deleteSHConfirm(String shno) {
		Connection conn = getConnection();
		
		int result = new ADM_SharehouseDao().deleteSHConfirm(conn, shno);
	
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 상세 매물보기에서 삭제 메소드
	public int deleteSHReport(String shRno) {
		Connection conn = getConnection();
		
		int result = new ADM_SharehouseDao().deleteSHReport(conn, shRno);
	
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	


	
}
