package member.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.commit;
import static common.JDBCTemplate.getConnection;
import static common.JDBCTemplate.rollback;

import java.sql.Connection;

import member.model.dao.MemberDao;
import member.model.vo.Admin;
import member.model.vo.Host;
import member.model.vo.User;
public class MemberService {

	 // 로그인 (아직 일반)
	public User loginMember(User u) {
		Connection conn = getConnection();
		
		User loginUser = new MemberDao().loginMember(conn, u);
		
		close(conn);
		return loginUser;
	}
	// 로그인 호스트(오버 로딩?라이딩?)
	public Host loginMember(Host h) {
		Connection conn = getConnection();
		System.out.println("h 서비스값 : " + h);
		
		Host loginHost = new MemberDao().loginMember(conn, h);
		close(conn);
		return loginHost;
	}
	
	// 관리자 로그인용 
		public Admin loginMember(Admin a) {
			Connection conn = getConnection();
			
			Admin loginAdmin = new MemberDao().loginMember(conn, a);
			
			close(conn);
			return loginAdmin;
		}
	
		// 일반회원가입
	public int insertMember(User u) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, u);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	// 호스트 회원가입
	public int insertHMember(Host h) {
		Connection conn = getConnection();
		
		int result = new MemberDao().insertHMember(conn, h);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}
	
	// 유저 회원정보수정 (수정중
	public User updateMember(User u) {
		Connection conn = getConnection();
		User updateMember = null;
		
		int result = new MemberDao().updateMember(conn, u);
		System.out.println("서비스 updateMember (결과) " + result);
		
		if(result > 0) {
			updateMember = new MemberDao().selectMember(conn, u.getUserId());
			System.out.println("업데이트 성공 시 updateMember : " + updateMember);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMember;
	}
	// 호스트 회원정보수정
	public Host updateMember(Host h) {
		Connection conn = getConnection();
		Host updateMember = null;
		
		int result = new MemberDao().updateMember(conn, h);
		System.out.println("서비스 updateMember (결과) " + result);
		
		if(result > 0) {
			updateMember = new MemberDao().selectHMember(conn, h.getHst_id());
			System.out.println("업데이트 성공 시 updateHMember : " + updateMember);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMember;
	}
	
	// id 중복체크 + 회원타입판별기능
	public int idCheck(String userId) {
		Connection conn = getConnection();
		int result = new MemberDao().idCheck(conn, userId);
		close(conn);
		
		// 중복값 없으면 0, 
		// 중복값 있으면 1이상, --> user라면 2, host라면 3
		return result;
	}
	
	   // User 회원 탈퇴 
	   public int deleteMember(User u) {
	      Connection conn = getConnection();
	      User isVali = null;
	      int result = 0;
	      
	      // User 객체 만들고 
	      isVali = new MemberDao().loginMember(conn, u);
	      System.out.println("isVali User(회원탈퇴 서비스) : " + isVali);
	      // 로그인이 가능하다면
	      if(isVali != null) {
	         result = new MemberDao().deleteMember(conn, isVali.getUserId());
	System.out.println("isVali가 != null, result값 : " + result);
	         // 삭제 됐다면 1리턴, 저장
	         if(result > 0) {
	            commit(conn);
	         }else {
	            rollback(conn);
	         }
	      }
	      close(conn);
	      System.out.println("최종 result 값 : " + result);
	      // 삭제됐다면 1, 아니면 0 리턴
	      return result;
	   }
	   
	   // Host 회원 탈퇴 
	   public int deleteHMember(Host h) {
	      Connection conn = getConnection();
	      Host isVali = null;
	      int result = 0;
	      
	      // Host 객체 만들고 
	      isVali = new MemberDao().loginMember(conn, h);
	      System.out.println("isVali Host(회원탈퇴 서비스) : " + isVali);
	      // 로그인이 가능하다면
	      if(isVali != null) {
	         result = new MemberDao().deleteHMember(conn, isVali.getHst_id());
	System.out.println("isVali가 != null, result값 : " + result);
	         // 삭제 됐다면 1리턴, 저장
	         if(result > 0) {
	            commit(conn);
	         }else {
	            rollback(conn);
	         }
	      }
	      close(conn);
	      System.out.println("최종 result 값 : " + result);
	      // 삭제됐다면 1, 아니면 0 리턴
	      return result;
	   }
	
	
	// 유저--암호화 비밀번호 수정
	public User updatePwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		User updateMember = null;
		int result = new MemberDao().updatePwd(conn, userId, userPwd, newPwd);
		// 넘어온 값을 바탕으로 판별 가능
		if(result > 0) {
			updateMember = new MemberDao().selectMember(conn, userId);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMember;
	}
	// 호스트 암호화 비밀번호 수정
	public Host updateHPwd(String userId, String userPwd, String newPwd) {
		Connection conn = getConnection();
		Host updateMember = null;
		int result = new MemberDao().updateHPwd(conn, userId, userPwd, newPwd);
		// 넘어온 값을 바탕으로 판별 가능
		if(result > 0) {
			updateMember = new MemberDao().selectHMember(conn, userId);
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return updateMember;
	}
	
	// 아이디 찾기 (회원타입, userid 리턴)--> userId = "xx회원이시며, 아이디는 xxx" 리턴
	public String findId(String user_name, String user_phone) {
		 Connection conn = getConnection();
		 
		 String userId = new MemberDao().findUserId(conn, user_name, user_phone);
		 System.out.println("MemberService 1 userId : " + userId);
		 
		 // userId가 빈값이면 HostId도 조회해보기
		 if(userId == "") {
			 userId = new MemberDao().findHostId(conn, user_name, user_phone); 
			 System.out.println("MemberService 2 userId : " + userId);
		 }else {
		 }
		 close(conn);
		 
		 // 회원 타입판별
		 int result = new MemberService().idCheck(userId);
		 if(result == 2) {
			 String type = "일반회원이시며, 아이디는 ";
			 return (type + userId);
		 }
		 if(result == 3) {
			 String type = "호스트회원이시며, 아이디는 ";
			 return (type +userId);
		 }
		 return userId;
	}
	/*
	// userId받아서 User객체 셀렉해오기
		public User updatePwdMember(String userId) {
			Connection conn = getConnection();
			User selectMember = null;
			
			selectMember = new MemberDao().selectMember(conn, userId);
			
			close(conn);
			return selectMember;
		}
		
		// userId받아서 Host 객체 셀렉해오기
		public Host updatePwdHMember(String userId) {
			Connection conn = getConnection();
			Host selectMember = null;
			
			selectMember = new MemberDao().selectHMember(conn, userId);
			
			close(conn);
			return selectMember;
		}
 */
		
		// 회원정보 찾기(패스워드) --> 입력받으 아이디 휴대전화 이메일 유효한지 확인.
		public User selectPwdMember(User findUser) {
			Connection conn = getConnection();
			findUser = new MemberDao().selectPwdMember(conn, findUser);
			
			close(conn);
			return findUser;
		}
		// 회원정보 찾기(패스워드) --> 입력받은 아이디 휴대전화 이메일 유효한지 확인.
		public Host selectPwdMember(Host findUser) {
			Connection conn = getConnection();
			findUser = new MemberDao().selectPwdMember(conn, findUser);
			
			close(conn);
			return findUser;
		}
//--------------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
