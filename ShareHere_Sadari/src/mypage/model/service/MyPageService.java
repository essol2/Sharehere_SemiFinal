package mypage.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import administrator.model.dao.ADM_SharehouseDao;
import administrator.model.vo.ShReport;
import house.model.dao.HouseDao;
import house.model.vo.HostInfo;
import house.model.vo.HostPay;
import house.model.vo.HouseReservation;
import mypage.model.dao.MyPageDao;
import mypage.model.vo.HstReservation;
import mypage.model.vo.PageInfo;
import mypage.model.vo.ResToday;
import mypage.model.vo.ShUserResDetail;
import mypage.model.vo.ShUserReservation;

public class MyPageService {

	// 게시글 페이징을 위해 총 게시글 갯수 구하기
	public int getListCount(String hstNo) {
		Connection conn = getConnection();
		
		int listCount = new MyPageDao().getListCount(conn, hstNo);
		
		close(conn);
		
		return listCount;
	}
	
	// 호스트 결제 내역 확인
	public ArrayList<HostPay> selectPay(String hstNo, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<HostPay> hostPay = new MyPageDao().selectInfo(conn, hstNo, pi);
		
		close(conn);
		
		return  hostPay;
	}
	
	// 일반회원 예약 리스트
	public ArrayList<ShUserReservation> selectUserRes(String userNo, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<ShUserReservation> shUserRes = new MyPageDao().selectUserRes(conn, userNo, pi);
		
		close(conn);
		
		return  shUserRes;
	}
	// 일반회원 예약 페이징 갯수 구하기
	public int getUserReservationListCount(String userNo) {
		Connection conn = getConnection();
		
		int listCount = new MyPageDao().getListUserResCount(conn, userNo);
		
		close(conn);
		
		return listCount;
	}
	// 일반 회원 예약 세부페이지
	public ShUserResDetail selectDetail(String RVNo) {
		Connection conn = getConnection();
		
		ShUserResDetail shResDetail = new MyPageDao().selectUserResDetail(conn, RVNo);
		System.out.println("shResDetail : " + shResDetail);
		close(conn);
		
		return  shResDetail;
	}
	
	//  호스트 예약 회원 리스트 조회
	public ArrayList<HstReservation> selectReservationList(String hstNo, PageInfo ph) {
		Connection conn = getConnection();
		
		ArrayList<HstReservation> hstList = new MyPageDao().selectReservationList(conn, hstNo, ph);
		
		close(conn);
		
		return  hstList;
	}

	public int getHstResListCount(String hstNo) {
		Connection conn = getConnection();
		
		int listCount = new MyPageDao().getHstResListCount(conn, hstNo);
		
		close(conn);
		
		return listCount;
	}

	// User 예약 취소하기
	public int deleteUsRes(String RVNo) {
		Connection conn = getConnection();
		int result = new MyPageDao().deleteUsRes(conn, RVNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	// 호스트 오늘 날짜 ALERT
	public ArrayList<ResToday> selectResToday(String hno) {
		Connection conn = getConnection();
		
		ArrayList<ResToday> resToday = new MyPageDao().selectResToday(conn, hno);
	
		close(conn);
		
		return resToday;
	}
	
	
	
	

}
