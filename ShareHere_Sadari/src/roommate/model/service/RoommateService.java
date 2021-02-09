package roommate.model.service;

import static common.JDBCTemplate.*;
import java.sql.Connection;
import java.util.ArrayList;

import roommate.model.dao.RoommateDao;
import roommate.model.vo.CommentReply;
import roommate.model.vo.RoommateAttachment;
import roommate.model.vo.RoommateComment;
import roommate.model.vo.RoommateJjim;
import roommate.model.vo.RoommateMatching;
import roommate.model.vo.RoommatePay;
import roommate.model.vo.RoommateReport;
import roommate.model.vo.RoommateUser;

public class RoommateService {

	 // 룸메이트 추가용
	public int insertRoommateUser(RoommateUser ru) {
		
		Connection conn = getConnection();
		
		int result = new RoommateDao().insertRoommateUser(conn, ru);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 룸메이트 회원 리스트 select
	public ArrayList<RoommateUser> selectList(String survey) {
		
		Connection conn = getConnection();
		
		ArrayList<RoommateUser> ru = new RoommateDao().selectRoommateUserList(conn, survey);
		
		close(conn);
		
		return ru;
	}

	// 룸메이트 회원 한명 select
	public RoommateUser selectRoommateUserOne(String getUserNo) {
		
		Connection conn = getConnection();

		RoommateUser ru = null;
		
		ru = new RoommateDao().selectRoommateOne(conn, getUserNo);
	
		close(conn);
		
		return ru;
	}

	
	// 룸메이트 신고 insert
	public int insertReport(String loginUserNO, String rUserNo, String reportContent, String reportText) {
		
		Connection conn = getConnection();
		
		int result = new RoommateDao().insertRoommateUserReoprt(conn, loginUserNO, rUserNo, reportContent, reportText);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 룸메이트 찜 insert
	public int insertKeepRoommateUser(String loginUserNO, String rUserNo) {
		
		Connection conn = getConnection();
		
		int result = new RoommateDao().insertRoommateUserReoprt(conn, loginUserNO, rUserNo);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 룸메이트 유저 아이디 중복 체크 확인용
	public int getListCount(String loginUserNO) {
		Connection conn = getConnection();
		
		int listCount = new RoommateDao().getListCount(conn, loginUserNO);
		
		close(conn);
		
		return listCount;
	}

	// 룸메이트 결제테이블 결제 유무 체크
	public int listCountPayCheck(String userId) {
		
		Connection conn = getConnection();
		
		int listCount = new RoommateDao().getListPayCkeckCount(conn, userId);
		
		close(conn);
		
		return listCount;
	}

	// 룸메이트 결제 INSERT
	public int insertRmpay(RoommatePay rpay) {
		
		Connection conn = getConnection();
		
		int result = new RoommateDao().insertRoommatePay(conn, rpay);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 결제 만기일 조회
	public RoommatePay selectRoommateUserPayCheckOne(String userNo) {
		
		Connection conn = getConnection();

		RoommatePay rp = null;
		
		rp = new RoommateDao().selectRoommateUserExpiryDate(conn, userNo);
	
		close(conn);
		
		return rp;
	}

	// 썸네일 추가
	public int insertThumbnail(RoommateAttachment rmAt) {
		
		Connection conn = getConnection();
		
		int result = new RoommateDao().insertRoommateThumbnail(conn, rmAt);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}

	// 썸네일 테이블 모두 가져옴
	public ArrayList<RoommateAttachment> selectAttachmentList() {
		
		Connection conn = getConnection();
		
		ArrayList<RoommateAttachment> rmat = new RoommateDao().selectRoommateUserList(conn);
		
		close(conn);
		
		return rmat;
	}
	
	
	// 매칭 후기 게시판 
	public ArrayList<RoommateComment> commentList() {
		Connection conn = getConnection();
		
		ArrayList<RoommateComment> comments = new RoommateDao().commentList(conn);
		close(conn);
		

		return comments;
	}

	// 매칭 후기 디테일 보기
	public RoommateComment selectComment(int nno) {
		
		Connection conn = getConnection();
		
		// 1. 조회수 증가
		int result = new RoommateDao().increaseCount(conn, nno);
		
		System.out.println("result : " + result);
		
		// 2. 해당 후기 조회
		RoommateComment c = null;
		if(result>0) {
			c = new RoommateDao().selectComment(conn, nno);
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return c;
	}
	
	// 후기 글 하나 삭제용
	public int deleteComment(int nno) {
		Connection conn = getConnection();
		
		int result = new RoommateDao().deleteComment(conn, nno);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 후기작성
    public int insertComment(RoommateComment comments) {
       Connection conn = getConnection();
       
       int result = new RoommateDao().insertComment(conn, comments);
       
       if(result > 0) {
          commit(conn);
       } else {
          rollback(conn);
       }
       
       close(conn);
       
       return result;
    }

	// 디테일페이지에서 한명 프로필사진 가져오기
	public RoommateAttachment selectRoommateAttaOne(String getrUserNo) {
		
		Connection conn = getConnection();

		RoommateAttachment raOne = null;
		
		raOne = new RoommateDao().selectRoommateOneAtta(conn, getrUserNo);
	
		close(conn);
		
		return raOne;
	}

	// 매칭 insert
	public int insertMatching(RoommateMatching matching) {
		
		Connection conn = getConnection();
		
		int result = new RoommateDao().insertMatching(conn, matching);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 마이페이지용 로그인유저 신고목록 조회
	public ArrayList<RoommateReport> selectRoommateReportOne(String userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<RoommateReport> rpList = new RoommateDao().selectReportListOne(conn, userNo);
		
		close(conn);
		
		return rpList;
	}

	// 마이페이지용 로그인유저 찜목록 조회
	public ArrayList<RoommateJjim> selectRoommateJjimOne(String userNo) {
		
		Connection conn = getConnection();
		
		ArrayList<RoommateJjim> rjList = new RoommateDao().selectRoommateJjimOne(conn, userNo);
		
		close(conn);
		
		return rjList;
	}
	
	// 마이페이지용 로그인유저 구매목록 조회
	public ArrayList<RoommatePay> selectRoommatePayOne(String userNo) {
		Connection conn = getConnection();
		
		ArrayList<RoommatePay> rPayList = new RoommateDao().selectRoommatePayOne(conn, userNo);
		
		close(conn);
		
		return rPayList;
	}
	
	// 마이페이지용 로그인유저 매칭목록 조회 (내가 매칭 한 데이터)
	public ArrayList<RoommateMatching> selectRoommateMatchingOne(String userNo) {
		Connection conn = getConnection();
		
		ArrayList<RoommateMatching> rmList = new RoommateDao().selectRoommateMatchingOne(conn, userNo);
		
		close(conn);
		
		return rmList;
	}

	// 마이페이지용 로그인유저 매칭목록 조회 (내게 매칭 온 데이터)
	public ArrayList<RoommateMatching> selectRoommateMatchingIntoOne(String userNo) {
		Connection conn = getConnection();
		
		ArrayList<RoommateMatching> rmIntoList = new RoommateDao().selectRoommateMatchingIntoOne(conn, userNo);
		
		close(conn);
		
		return rmIntoList;
	}

	// 내가 신청한 매칭 내가 삭제
	public int deleteMathcing(RoommateMatching rm) {
		
		Connection conn = getConnection();
		
		int result = new RoommateDao().deleteMatching(conn, rm);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 매칭 거절
	public int rejectMathcing(RoommateMatching rm) {
		
		Connection conn = getConnection();
		
		int result = new RoommateDao().rejectMathcing(conn, rm);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 매칭 승인
	public int allowMathcing(RoommateMatching rm) {
		Connection conn = getConnection();
		
		int result = new RoommateDao().allowMathcing(conn, rm);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 매칭 성공
	public ArrayList<RoommateMatching> selectRoommateMatchingAllowOne(String userNo) {
		Connection conn = getConnection();
		
		ArrayList<RoommateMatching> rmAllowList = new RoommateDao().selectRoommateMatchingAllowOne(conn, userNo);
		
		close(conn);
		
		return rmAllowList;
	}
	
	
	// 썸네일 삭제용
	public int deleteThumbnail(String userNo) {
		Connection conn = getConnection();
		
		int result =  new RoommateDao().deleteThumb(conn, userNo);
		System.out.println("service : " + result);
		
		if(result > 0 ) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		return result;
	}

	// 업데이트 룸메이트 유저
	public int updateRoommateUserOne(RoommateUser updateUser) {

		Connection conn = getConnection();
		
		int result = new RoommateDao().updateRoommateUserInfo(conn, updateUser);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 찜 중복 확인
	public int countRoommateKeepUserIdCheck(String loginUserNO, String rUserNo) {
		
		Connection conn = getConnection();
		
		int listCount = new RoommateDao().getListCountKeepUser(conn, loginUserNO, rUserNo);
		
		close(conn);
		
		return listCount;
	}
	
	// 선택한 게시글의 댓글 리스트 조회
	public ArrayList<CommentReply> selectReplyList(int bId) {
		Connection conn = getConnection();
		ArrayList<CommentReply> rList = new RoommateDao().selectReplyList(conn, bId);
		close(conn);
		return rList;
	}


	// 댓글 추가
	public ArrayList<CommentReply> insertReply(CommentReply cr) {
		
		Connection conn = getConnection();
		RoommateDao rd = new RoommateDao();
		
		int result = rd.insertReply(conn, cr);
		
		ArrayList<CommentReply> crList = null;
		
		if (result > 0) {
			commit(conn);
			crList = rd.selectReplyList(conn, cr.getRef_bid());
		} else {
			rollback(conn);
		}
		close(conn);

		return crList;
	}

	// 룸메이트 찜 삭제
	public int deleteJjim(RoommateJjim rj) {
		Connection conn = getConnection();
		
		int result = new RoommateDao().deleteJjim(conn, rj);
		
		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}




	
	
	

}
