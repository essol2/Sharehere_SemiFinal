package member.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import member.model.service.MemberService;
import member.model.vo.Admin;
import member.model.vo.Host;
import member.model.vo.User;

public class MemberDao {
	private Properties prop = new Properties();

	public MemberDao() {
		String fileName = MemberDao.class.getResource("/sql/member/member-query.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 로그인(현재까진 일반)
	public User loginMember(Connection conn, User u) {
		User loginUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u.getUserId());
			pstmt.setString(2, u.getUserPwd());

			rset = pstmt.executeQuery();
			if (rset.next()) {
				loginUser = new User(rset.getString("US_NO"), rset.getString("US_ID"), rset.getString("US_PWD"),
						rset.getString("US_NAME"), rset.getDate("US_BIRTH"), rset.getString("US_GENDER"),
						rset.getString("US_EMAIL"), rset.getString("US_PHONE"), rset.getString("US_ACT"),
						rset.getDate("US_STOP"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return loginUser;
	}

	// 로그인(호스트)
	public Host loginMember(Connection conn, Host h) {
		Host loginHost = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginHMember");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, h.getHst_id());
			pstmt.setString(2, h.getHst_pwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginHost = new Host(rset.getString("HST_NO"), rset.getString("HST_ID"), rset.getString("HST_PWD"),
						rset.getString("HST_NAME"), rset.getDate("HST_BIRTH"), rset.getString("HST_GENDER"),
						rset.getString("HST_EMAIL"), rset.getString("HST_PHONE"), rset.getString("HST_BSNO"),
						rset.getString("HST_BSNAME"), rset.getString("HST_ACT"), rset.getDate("HST_STOP"));
				 System.out.println("loginHost if문값 : " + loginHost);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		 System.out.println("loginHost dao최종값 : " + loginHost);
		return loginHost;
	}

	// 로그인(관리자)
	public Admin loginMember(Connection conn, Admin a) {
		Admin loginAdmin = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("loginAMember");
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, a.getAdm_id());
			pstmt.setString(2, a.getAdm_pwd());

			rset = pstmt.executeQuery();

			if (rset.next()) {
				loginAdmin = new Admin(rset.getString("adm_num"), rset.getString("adm_id"), rset.getString("adm_pwd"),
						rset.getString("adm_depart"));
				System.out.println("loginAdmin if문값 : " + loginAdmin);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		// System.out.println("loginHost dao최종값 : " + loginHost);
		return loginAdmin;
	}

	// 회원가입 user dao
	public int insertMember(Connection conn, User u) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertMember");

		// 마지막에 호스트와 아이디 중복 확인 한번 더
		int idCheck = new MemberService().idCheck(u.getUserId());
		if (idCheck > 0) {
			result = 0;
			// 아이디 중복이 안될경우만 실행
		} else {
			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, u.getUserId());
				pstmt.setString(2, u.getUserPwd());
				pstmt.setString(3, u.getUserName());
				pstmt.setDate(4, u.getUserBirth());
				pstmt.setString(5, u.getUserGender());
				pstmt.setString(6, u.getUserEmail());
				pstmt.setString(7, u.getUserPhone());

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}

	// 회원가입 Host dao
	public int insertHMember(Connection conn, Host h) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHMember");

		// 마지막에 중복확인 한번 더
		int idCheck = new MemberService().idCheck(h.getHst_id());
		if (idCheck > 0) {
			result = 0;
			// 아이디 중복이 안될경우만 실행
		} else {
			try {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, h.getHst_id());
				pstmt.setString(2, h.getHst_pwd());
				pstmt.setString(3, h.getHst_name());
				pstmt.setDate(4, h.getHst_birth());
				pstmt.setString(5, h.getHst_gender());
				pstmt.setString(6, h.getHst_email());
				pstmt.setString(7, h.getHst_phone());
				pstmt.setString(8, h.getHst_bsno());
				pstmt.setString(9, h.getHst_bsname());

				result = pstmt.executeUpdate();

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
		}
		return result;
	}

	// 일반회원 정보 수정용 dao
	public int updateMember(Connection conn, User u) {
		int result = 0;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, u.getUserName());
			pstmt.setString(2, u.getUserEmail());
			pstmt.setString(3, u.getUserPhone());
			pstmt.setString(4, u.getUserId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// Host회원 정보 수정용 dao
	public int updateMember(Connection conn, Host h) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, h.getHst_name());
			pstmt.setString(2, h.getHst_email());
			pstmt.setString(3, h.getHst_phone());
			pstmt.setString(4, h.getHst_id());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 일반회원 1명 조회용 dao
	public User selectMember(Connection conn, String userId) {
		User updateUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(sql);

			// 아이디 넣음
			pstmt.setString(1, userId);

			// 결과값 저장
			rset = pstmt.executeQuery();

			if (rset.next()) {
				updateUser = new User(rset.getString("US_NO"), rset.getString("US_ID"), rset.getString("US_PWD"),
						rset.getString("US_NAME"), rset.getDate("US_BIRTH"), rset.getString("US_GENDER"),
						rset.getString("US_EMAIL"), rset.getString("US_PHONE"), rset.getString("US_ACT"),
						rset.getDate("US_STOP"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		// System.out.println("Dao 에서 select 한 updateUser 결과 : " + updateUser);
		return updateUser;
	}

	// Host회원 1명 조회용 dao
	public Host selectHMember(Connection conn, String hst_id) {
		Host updateUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectHMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, hst_id);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				updateUser = new Host(rset.getString("HST_NO"), rset.getString("HST_ID"), rset.getString("HST_PWD"),
						rset.getString("HST_NAME"), rset.getDate("HST_BIRTH"), rset.getString("HST_GENDER"),
						rset.getString("HST_EMAIL"), rset.getString("HST_PHONE"), rset.getString("HST_BSNO"),
						rset.getString("HST_BSNAME"), rset.getString("HST_ACT"), rset.getDate("HST_STOP"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		// System.out.println("Dao 에서 select 한 updateUser 결과 : " + updateUser);
		return updateUser;
	}

	// 아이디 중복시 중복된 인원수 리턴
	public int idCheck(Connection conn, String userId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		// 셀렉이지만 0명, 1명이기때문에 int값으로 리턴
		int result = 0;
		String apartId = "";
		String sql1 = prop.getProperty("idCheck1");
		String sql2 = prop.getProperty("idCheck2");

		// USER_DB ID 중복 쿼리문
		try {
			pstmt = conn.prepareStatement(sql1);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result += rset.getInt(1);
			}
			// userid라면 2를 리턴
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		if(result > 0) {
			return 2;
		}
		// HST_DB ID 중복 쿼리문
		try {
			pstmt = conn.prepareStatement(sql2);
			pstmt.setString(1, userId);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				result += rset.getInt(1);
			}
			// hostid라면 3를 리턴
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		if(result > 0) {
			return 3;
		}
		// 2,3이 아니면 0 리턴
		return result;
	}

	// 일반회원 탈퇴
	   public int deleteMember(Connection conn, String userId) {
	      int result = 0;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("deleteMember");

	      try {
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, userId);
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;

	   }

	   // 호스트회원 탈퇴
	   public int deleteHMember(Connection conn, String userId) {
	      int result = 0;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("deleteHMember");

	      try {
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, userId);
	         result = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	      }
	      return result;
	   }

	// 일반- 비밀번호 변경 dao
	public int updatePwd(Connection conn, String userId, String userPwd, String newPwd) {
		// 커넥션이 넘어왔으니 쿼리문 실행
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");

		// 실행
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 호스트-비밀번호 변경 dao
	public int updateHPwd(Connection conn, String userId, String userPwd, String newPwd) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateHPwd");

		// 실행
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, newPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userPwd);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// username, userphone으로 USER_DB에서 ID조회
	public String findUserId(Connection conn, String user_name, String user_phone) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findUserId");
		ResultSet rset = null;
		String userId = "";
		int result = 0;

		// 일반회원에 찾고 없다면 호스트회원에서 찾기(result로 판별) 
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_name);
			pstmt.setString(2, user_phone);

			rset = pstmt.executeQuery();
			if (rset.next()) {
				userId = rset.getString("US_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return userId;
	}
	// username, userphone으로 HST_DB에서 ID조회
	public String findHostId(Connection conn, String user_name, String user_phone) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findHostId");
		ResultSet rset = null;
		String userId = "";
		int result = 0;

		// 일반회원에 찾고 없다면 호스트회원에서 찾기(result로 판별) 
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, user_name);
			pstmt.setString(2, user_phone);

			rset = pstmt.executeQuery();
			if(rset.next()) {
				userId = rset.getString("HST_ID");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}

		return userId;
	}

	// 회원정보찾기 (아이디, 이메일, 휴대전화번호로 User 조회하기)
	public User selectPwdMember(Connection conn, User findUser) {
		User selectPwdUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectPwdMember");

		try {
			pstmt = conn.prepareStatement(sql);

			// 아이디 넣음
			pstmt.setString(1, findUser.getUserId());
			pstmt.setString(2, findUser.getUserEmail());
			pstmt.setString(3, findUser.getUserPhone());

			// 결과값 저장
			rset = pstmt.executeQuery();

			if (rset.next()) {
				selectPwdUser = new User(rset.getString("US_NO"), rset.getString("US_ID"), rset.getString("US_PWD"),
						rset.getString("US_NAME"), rset.getDate("US_BIRTH"), rset.getString("US_GENDER"),
						rset.getString("US_EMAIL"), rset.getString("US_PHONE"), rset.getString("US_ACT"),
						rset.getDate("US_STOP"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		// System.out.println("Dao 에서 select 한 updateUser 결과 : " + updateUser);
		return selectPwdUser;
	}
	// 회원정보찾기 (아이디, 이메일, 휴대전화번호로 User 조회하기)
	public Host selectPwdMember(Connection conn, Host findUser) {
		Host selectPwdUser = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String sql = prop.getProperty("selectPwdHMember");

		try {
			pstmt = conn.prepareStatement(sql);

			// 아이디 넣음
			pstmt.setString(1, findUser.getHst_id());
			pstmt.setString(2, findUser.getHst_email());
			pstmt.setString(3, findUser.getHst_phone());
			System.out.println("selectPwdMember : " + findUser);
			
			// 결과값 저장
			rset = pstmt.executeQuery();

			if (rset.next()) {
				selectPwdUser = new Host(rset.getString("HST_NO"), rset.getString("HST_ID"), rset.getString("HST_PWD"),
						rset.getString("HST_NAME"), rset.getDate("HST_BIRTH"), rset.getString("HST_GENDER"),
						rset.getString("HST_EMAIL"), rset.getString("HST_PHONE"), rset.getString("HST_BSNO"),
						rset.getString("HST_BSNAME"), rset.getString("HST_ACT"), rset.getDate("HST_STOP"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
		}

		 System.out.println("Dao 에서 select 한 updateUser 결과 : " + selectPwdUser);
		return selectPwdUser;
	}
//----------------------------------------------------------------
}
