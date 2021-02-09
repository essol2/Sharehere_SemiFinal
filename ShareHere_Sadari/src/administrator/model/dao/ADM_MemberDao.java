package administrator.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;
import java.util.Properties;
import static common.JDBCTemplate.*;

import administrator.model.vo.Hostmember;
import administrator.model.vo.Outmember;
import administrator.model.vo.PageInfo;
import administrator.model.vo.PageInfoForHst;
import administrator.model.vo.PageInfoForOut;
import administrator.model.vo.PageInfoForRR;
import administrator.model.vo.RmReport;
import administrator.model.vo.ShReport;
import administrator.model.vo.Usermember;

public class ADM_MemberDao {
	
	private Properties prop = new Properties();
	
	public ADM_MemberDao() {
		String fileName = ADM_MemberDao.class.getResource("/sql/administrator/admin_query.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
	// 3. 탈퇴 회원 리스트 출력용 메소드
			public ArrayList<Outmember> selectOutList(Connection conn) {
				ArrayList<Outmember> list = new ArrayList<Outmember>();
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				String sql = prop.getProperty("selectOutList");
				
				try {
					pstmt = conn.prepareStatement(sql);

					rset = pstmt.executeQuery();
					
					while(rset.next()) {
						
						list.add(new Outmember(rset.getString("US_NO"),
			 								   rset.getString("US_ID"),
			 								   rset.getString("US_NAME"),
			 								   rset.getString("US_EMAIL"),
			 								   rset.getString("US_ACT"),
			 								   rset.getDate("US_STOP"),
			 								   rset.getString("HST_NO"),
											   rset.getString("HST_ID"),
											   rset.getString("HST_NAME"),
								 			   rset.getString("HST_EMAIL"),
								 			   rset.getString("HST_ACT"),
											   rset.getDate("HST_STOP")));
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
				return list;
			}

	
	// 4. 임대인 회원 복구 메소드
	public int comebackHostMember(Connection conn, String mno) {
		//System.out.println("dao로 들어옴");
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("comebackHost");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setNString(1, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		//System.out.println("dao에서 service으로 주는 result");
		return result;
	}

	// 5. 일반 회원 복구 메소드
	public int comebackUserMember(Connection conn, String mno) {
		//System.out.println("dao로 들어옴");
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("comebackUser");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		//System.out.println("dao에서 service으로 주는 result : " + result);
		return result;
	}

	// 신고 매물 리스트 출력 메소드
	public ArrayList<ShReport> selectSRList(Connection conn) {
		ArrayList<ShReport> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShReportList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ShReport(rset.getString("SH_REPORTNUM"),
									  rset.getDate("SH_REPORT_DATE"),
									  rset.getString("SH_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}
	// 신고 유저 리스트 출력 메소드
	public ArrayList<RmReport> selecRRList(Connection conn) {
		ArrayList<RmReport> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRmReportList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new RmReport(rset.getInt("US_REPORT_NUM"),
									  rset.getDate("RM_REPORT_DATE"),
									  rset.getString("US_NO2")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	// 일반회원 총 인원수 조회
	public int getUserListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getUserListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}

	// 페이징 처리된 일반회원 list 조회
	public ArrayList<Usermember> selectUserList(Connection conn, PageInfo pi) {
		ArrayList<Usermember> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getUmLimit() + 1;
			int endRow = startRow + pi.getUmLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Usermember(rset.getString("US_NO"),
										rset.getString("US_NAME"),
										rset.getString("US_ID"),
										rset.getDate("US_BIRTH"),
										rset.getString("US_EMAIL")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 임대인회원 총 인원수 조회
	public int getHstListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getHstListCount");
		
		try {
			stmt = conn.createStatement();
			
			rset = stmt.executeQuery(sql);
			
			if(rset.next()) {
				listCount = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return listCount;
	}
	
	// 페이징 처리된 임대인회원 list 조회
		public ArrayList<Hostmember> selectHstList(Connection conn, PageInfoForHst pi) {
			ArrayList<Hostmember> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectHstListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getRmLimit() + 1;
				int endRow = startRow + pi.getRmLimit() - 1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Hostmember(rset.getString("HST_NO"),
										 	rset.getString("HST_NAME"),
										 	rset.getString("HST_ID"),
										 	rset.getString("HST_BSNO"),
											rset.getString("HST_BSNAME")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}

		// 탈퇴회원 총 인원수 구하기
		public int getOutListCount(Connection conn) {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getOutListCount");
			
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return listCount;
		}

		//페이징 처리된 탈퇴회원 list 조회
		public ArrayList<Outmember> selectOutList(Connection conn, PageInfoForOut pi) {
			ArrayList<Outmember> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectOutListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getOmLimit() + 1;
				int endRow = startRow + pi.getOmLimit() - 1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Outmember(rset.getString("US_NO"),
										   rset.getString("US_ID"),
										   rset.getString("US_NAME"),
										   rset.getString("US_EMAIL"),
										   rset.getString("US_ACT"),
										   rset.getDate("US_STOP"),
										   rset.getString("HST_NO"),
										   rset.getString("HST_ID"),
										   rset.getString("HST_NAME"),
							 			   rset.getString("HST_EMAIL"),
							 			   rset.getString("HST_ACT"),
										   rset.getDate("HST_STOP")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}


		// 페이징처리를 위한 신고회원 총 갯수 구하기
		public int getRRListCount(Connection conn) {
			int listCount = 0;
			Statement stmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("getRRListCount");
			
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					listCount = rset.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(stmt);
			}
			return listCount;
		}


		// 페이징처리 후 신고회원 리스트 출력
		public ArrayList<RmReport> selectRRList(Connection conn, PageInfoForRR pi) {
			ArrayList<RmReport> list = new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectRRListCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				int startRow = (pi.getCurrentPage() - 1) * pi.getRrLimit() + 1;
				int endRow = startRow + pi.getRrLimit() - 1;
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new RmReport(rset.getInt("US_REPORT_NUM"),
										  rset.getString("RM_REPORT"),
										  rset.getDate("RM_REPORT_DATE"),
										  rset.getString("RM_REPORT_CONTENT"),
										  rset.getString("US_NO2"),
										  rset.getString("US_NO")));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return list;
		}


		// 일반 회원 상세보기용 DAO 메소드
		public Usermember selectUser(Connection conn, String uno) {
			Usermember u = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectUser");
			
			try {
				pstmt.getConnection().prepareStatement(sql);
				pstmt.setString(1, uno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					u = new Usermember(rset.getString("US_NO"),
									   rset.getString("US_ID"),
									   rset.getString("US_PWD"),
									   rset.getString("US_NAME"),
									   rset.getDate("US_BIRTH"),
									   rset.getString("US_GENDER"),
									   rset.getString("US_EMAIL"),
									   rset.getString("US_PHONE"),
									   rset.getString("US_ACT"),
									   rset.getDate("US_STOP"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			return u;
		}

		// 일반 회원 상세보기 
		public Usermember selectUserMem(Connection conn, String uno) {
			Usermember u = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectUserMem");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, uno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					u = new Usermember(rset.getString("US_NO"),
									   rset.getString("US_ID"),
									   rset.getString("US_NAME"),
									   rset.getDate("US_BIRTH"),
									   rset.getString("US_GENDER"),
									   rset.getString("US_EMAIL"),
									   rset.getString("US_PHONE"),
									   rset.getString("US_ACT"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return u;
		}

		// 임대인 회원 상세페이지용
		public Hostmember selectHostMem(Connection conn, String hno) {
			Hostmember h = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectHostMem");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, hno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					h = new Hostmember(rset.getString("HST_NO"),
									   rset.getString("HST_ID"),
									   rset.getString("HST_NAME"),
									   rset.getDate("HST_BIRTH"),
									   rset.getString("HST_GENDER"),
									   rset.getString("HST_EMAIL"),
									   rset.getString("HST_PHONE"),
									   rset.getString("HST_BSNO"),
									   rset.getString("HST_BSNAME"),
									   rset.getString("HST_ACT"));
					//System.out.println("Hostmember 객체 담기 성공! 이제 서비스로 돌아간다~");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return h;
		}

		// 신고 회원 상세보기
		public RmReport selectReportMem(Connection conn, String rrno) {
			RmReport rr = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectReportMem");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, rrno);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					rr = new RmReport(rset.getInt("US_REPORT_NUM"),
									   rset.getString("RM_REPORT"),
									   rset.getDate("RM_REPORT_DATE"),
									   rset.getString("RM_REPORT_CONTENT"),
									   rset.getString("US_NO2"),
									   rset.getString("USE_NO"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return rr;
		}
		// 신고 메세지 보내면 check = 'N'으로 바꿔주는 메소드
		public int updateCheck(Connection conn, int rmNo) {
			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("updateCheck");

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, rmNo);

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}
		
		// 신고당해서 alert 띄어줘야 하는 회원한테 경고장 띄우기 메소드

		public ArrayList<RmReport> selectRrAlertMem(Connection conn, String uno) {
			ArrayList<RmReport> raList =  new ArrayList<>();
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String sql = prop.getProperty("selectRrAlertMem");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, uno);
				
				rset = pstmt.executeQuery();
				System.out.println("dao에서 uno 확인 : " + uno);
				while(rset.next()) {
					raList.add(new RmReport( rset.getInt("US_REPORT_NUM"),
											 rset.getString("RM_REPORT"),
											 rset.getDate("RM_REPORT_DATE"),
											  rset.getString("RM_REPORT_CONTENT"),
											 rset.getString("US_NO2"),
											 rset.getString("US_NO"))); 
				}
				System.out.println("dao안에서 객체 들어가는지 확인 : " + raList);

				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
			
			return raList;
		}
		
		// 사용자가 확인하고 x 누르면 Y로 바꾸기
		public int updateCheckClose(Connection conn, String uno) {
			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("updateRmCheckClose");

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, uno);

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}
		
		// 신고받은 회원 강퇴시키기
		public int removeUser(Connection conn, String uno) {
			PreparedStatement pstmt = null;
			int result = 0;

			String query = prop.getProperty("removeUser");

			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, uno);

				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}

			return result;
		}
	

}
