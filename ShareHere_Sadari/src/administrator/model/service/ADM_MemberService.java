package administrator.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import administrator.model.dao.ADM_MemberDao;
import administrator.model.vo.Hostmember;
import administrator.model.vo.Outmember;
import administrator.model.vo.PageInfo;
import administrator.model.vo.PageInfoForHst;
import administrator.model.vo.PageInfoForOut;
import administrator.model.vo.PageInfoForRR;
import administrator.model.vo.PageInfoForSH;
import administrator.model.vo.RmReport;
import administrator.model.vo.ShReport;
import administrator.model.vo.Usermember;

public class ADM_MemberService {

	
	// 3. 탈퇴 회원 리스트 조회용 메소드
	public ArrayList<Outmember> selectOutList() {
		Connection conn = getConnection();
		ArrayList<Outmember> list = new ADM_MemberDao().selectOutList(conn);
		
		close(conn);
		return list;
	}

	// 4.임대인 회원 복구시키기 메소드
	public int combackHostMember(String mno) {
		//System.out.println("service 들어옴");
		Connection conn = getConnection();
		
		int result = new ADM_MemberDao().comebackHostMember(conn, mno);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		//System.out.println("service에서 servlet으로 주는 result");
		return result;
	}

	// 5. 일반 회원 복구시키기 메소드
	public int comebackUserMember(String mno) {
		//System.out.println("service 들어옴");
		Connection conn = getConnection();
		
		int result = new ADM_MemberDao().comebackUserMember(conn, mno);
		
		if(result>0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		//System.out.println("service에서 servlet으로 주는 result : " + result);
		return result;
	}

	// 신고 매물 리스트 출력 메소드
	public ArrayList<ShReport> selectSRList() {
		Connection conn = getConnection();
		ArrayList<ShReport> list = new ADM_MemberDao().selectSRList(conn);
		
		close(conn);
		return list;
	}

	
	// 리스트 페이징을 위한 총 회원수 구하기
	public int getUserListCount() {
		Connection conn = getConnection();
			
		int listCount = new ADM_MemberDao().getUserListCount(conn);
			
		close(conn);
			
		return listCount;
	}
	// 일반 회원 리스트 출력
	public ArrayList<Usermember> selectUserList(PageInfo pi) {
		Connection conn = getConnection();
			
		ArrayList<Usermember> list = new ADM_MemberDao().selectUserList(conn, pi); 
			
		close(conn);
			
		return list;
	}

	// 리스트 페이징을 위한 호스트 멤버 총 회원 수 구하기
	public int getHstListCount() {
		Connection conn = getConnection();
			
		int listCount = new ADM_MemberDao().getHstListCount(conn);
				
		close(conn);
				
		return listCount;
	}

	// 임대인 회원 리스트 출력
	public ArrayList<Hostmember> selectHstList(PageInfoForHst pi) {
		Connection conn = getConnection();
		
		ArrayList<Hostmember> list = new ADM_MemberDao().selectHstList(conn, pi); 
			
		close(conn);
			
		return list;
	}

	// 리스트 페이징을 위한 탈퇴회원 총 회원 수 구하기
	public int getOutListCount() {
		Connection conn = getConnection();
		
		int listCount = new ADM_MemberDao().getOutListCount(conn);
				
		close(conn);
				
		return listCount;
	}
	
	// 탈퇴 회원 리스트 출력
	public ArrayList<Outmember> selectOutList(PageInfoForOut pi) {
		Connection conn = getConnection();
		
		ArrayList<Outmember> list = new ADM_MemberDao().selectOutList(conn, pi); 
			
		close(conn);
			
		return list;
	}

	// 페이징처리를 위한 신고회원 총 수 구하기
	public int getRRListCount() {
		Connection conn = getConnection();
		
		int listCount = new ADM_MemberDao().getRRListCount(conn);
				
		close(conn);
				
		return listCount;
	}

	// 페이징처리후 신고회원 리스트 출력
	public ArrayList<RmReport> selectRRList(PageInfoForRR pi) {
		Connection conn = getConnection();
		
		ArrayList<RmReport> list = new ADM_MemberDao().selectRRList(conn, pi); 
			
		close(conn);
			
		return list;
	}

	// 일반 회원 상세보기용 서블렛
	public Usermember selectUser(String uno) {
		Connection conn = getConnection();
		
		Usermember u = new ADM_MemberDao().selectUser(conn, uno);
	
		return u;
		
	}

	// 일반 회원 상세보기
	public Usermember selectUerMem(String uno) {
		Connection conn = getConnection();
		
		Usermember u = null;
		u = new ADM_MemberDao().selectUserMem(conn, uno);
	
		close(conn);
		
		return u;
	}

	// 호스트 회원 상세보기
	public Hostmember selectHostMem(String hno) {
		Connection conn = getConnection();
		
		Hostmember h = null;
		h = new ADM_MemberDao().selectHostMem(conn, hno);
	
		close(conn);
		
		return h;
	}

	// 회원 신고 상세보기
	public RmReport selectReportMem(String rrno) {
		Connection conn = getConnection();
		
		RmReport rr = null;
		rr = new ADM_MemberDao().selectReportMem(conn, rrno);
	
		close(conn);
		
		return rr;
	}

	//경고메세지 보내면 check 를 'N'으로 바꾸기(룸메이트)
	public int updateCheck(int rmNo) {
		Connection conn = getConnection();
		
		int result = new ADM_MemberDao().updateCheck(conn, rmNo);
	
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return result;
	}

	// 신고당해서 alert 띄어줘야 하는 회원한테 경고장 띄우기 메소드
	public ArrayList<RmReport> selectRrAlertMem(String uno) {
		Connection conn = getConnection();
		
		ArrayList<RmReport> rrc = new ADM_MemberDao().selectRrAlertMem(conn, uno);
	
		close(conn);
		
		return rrc;
	}

	//사용자가 확인 후 check 를 'Y'으로 바꾸기
	// public int updateCheckClose(String uno) {
	// 	Connection conn = getConnection();
		
	// 	int result = new ADM_MemberDao().updateCheckClose(conn, uno);
	
	// 	if (result > 0) {
	// 		commit(conn);
	// 	} else {
	// 		rollback(conn);
	// 	}

	// 	close(conn);

	// 	return result;
	// }

	// 신고받은 회원 강제탈퇴시키기
	public int removeUser(String uno) {
		Connection conn = getConnection();
		
		int mresult = new ADM_MemberDao().removeUser(conn, uno);
	
		if (mresult > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}

		close(conn);

		return mresult;
	}

	



}
