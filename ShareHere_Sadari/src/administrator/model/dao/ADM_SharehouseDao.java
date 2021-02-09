package administrator.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import administrator.model.vo.Outmember;
import administrator.model.vo.PageInfoForDS;
import administrator.model.vo.PageInfoForSH;
import administrator.model.vo.PageInfoForSR;
import administrator.model.vo.RmReport;
import administrator.model.vo.ShReport;
import administrator.model.vo.Sharehouse;

public class ADM_SharehouseDao {
	
	private Properties prop = new Properties();
	
	public ADM_SharehouseDao() {
		String fileName = ADM_SharehouseDao.class.getResource("/sql/administrator/admin_query.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	
	// 삭제 매물 리스트 출력 메소드
	public ArrayList<Sharehouse> selectDelList(Connection conn) {
		ArrayList<Sharehouse> hList = new ArrayList<Sharehouse>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDelList");
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				hList.add(new Sharehouse(rset.getString("SH_NO"),
	 								   	rset.getString("SH_TITLE"),
		 								rset.getString("SH_STATUS"),
		 								rset.getDate("SH_DATE"),
		 								rset.getDate("SH_DELDATE"),
		 								rset.getString("HST_NO")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hList;
	}

	// 삭제된 매물 복구하기 메소드
	public int comebackSharehouse(Connection conn, String shno) {
			System.out.println("dao로 들어옴");
				int result = 0;
				PreparedStatement pstmt = null;
				String sql = prop.getProperty("comebackSH");
				
				try {
					pstmt = conn.prepareStatement(sql);
					
					pstmt.setNString(1, shno);
					
					result = pstmt.executeUpdate();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(pstmt);
				}
				System.out.println("dao에서 service으로 주는 result");
				return result;
	}

	// 리스트 페이징을 위한 매물 총 갯수 구하기
	public int getShListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getShListCount");
		
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

	// 페이징 후 매물 리스트 출력하기
	public ArrayList<Sharehouse> selectShList(Connection conn, PageInfoForSH pi) {
		ArrayList<Sharehouse> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getShLimit() + 1;
			int endRow = startRow + pi.getShLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Sharehouse(rset.getString("SH_NO"),
										rset.getString("SH_TITLE"),
										rset.getDate("SH_DATE"),
										rset.getString("HST_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 페이징 처리를 위한 총 삭제매물 갯수 구하기
	public int getDSListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getDSListCount");
		
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

	// 페이징 처리 후 삭제 매물 리스트 출력하기
	public ArrayList<Sharehouse> selectDSList(Connection conn, PageInfoForDS pi) {
		ArrayList<Sharehouse> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectDSListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getDsLimit() + 1;
			int endRow = startRow + pi.getDsLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Sharehouse(rset.getString("SH_NO"),
									   	rset.getString("SH_TITLE"),
										rset.getString("SH_STATUS"),
										rset.getDate("SH_DATE"),
										rset.getDate("SH_DELDATE"),
										rset.getString("HST_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	// 페이징 처리를 위한 신고 매물 총 갯수 구하기
	public int getSRListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getSRListCount");
		
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


	// 페이징 처리 후 신고 매물 리스트 출력
	public ArrayList<ShReport> selectSRList(Connection conn, PageInfoForSR pi) {
		ArrayList<ShReport> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSRListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getSrLimit() + 1;
			int endRow = startRow + pi.getSrLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			//System.out.println("dao안에 있는 신고매물 startRow : " + startRow);
			//System.out.println("dao안에 있는 신고매물 endRow : " + endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ShReport(rset.getString("SH_REPORTNUM"),
									  rset.getString("SH_REASON"),
									  rset.getString("SH_CONTENT"),
									  rset.getDate("SH_REPORT_DATE"),
									  rset.getString("US_NO"),
									  rset.getString("SH_NO")));
			}
			System.out.println("dao안에 있는 신고매물 list : " + list);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}


	// 상세 매물정보 보기용
	public Sharehouse selectShareHouse(Connection conn, String shno) {
		Sharehouse sh = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShareHouse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setNString(1, shno);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				sh = new Sharehouse(rset.getString("SH_NO"),
									rset.getString("SH_TITLE"),
									rset.getString("SH_TYPE"),
									rset.getString("SH_INTRO"),
									rset.getString("SH_ADDRESS"),
									rset.getString("SH_STATUS"),
									rset.getDate("SH_DATE"),
									rset.getDate("SH_DELDATE"),
									rset.getString("HST_NO"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return sh;
	}


	// 신고 메세지 보내면 check = 'N'으로 바꿔주는 메소드(하우스)
	public int updateCheck(Connection conn, String shNo) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("updateCheckSH");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, shNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 신고당해서 alert 띄어줘야 하는 회원한테 경고장 띄우기 메소드

	public ArrayList<ShReport> selectShAlertMem(Connection conn, String hno) {
		ArrayList<ShReport> shList =  new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShAlertMem");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hno);
			
			rset = pstmt.executeQuery();
			System.out.println("dao에서 hno 확인 : " + hno);
			while(rset.next()) {
				shList.add(new ShReport( rset.getString("SH_REPORTNUM"),
										 rset.getString("SH_REASON"),
										 rset.getString("SH_CONTENT"),
										 rset.getDate("SH_REPORT_DATE"),
										 rset.getString("US_NO"),
										 rset.getString("SH_NO")));  
				//System.out.println("dao안에서 객체 들어가는지 확인 : " + raList);
			}
			//System.out.println("dao안에서 객체 들어가는지 확인 : " + shList);

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return shList;
	}

	// 신고당한 쉐하 강제삭제하기
	public int removeSH(Connection conn, String shno) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("removeSH");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, shno);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}


	// 오늘 업로드된 신규 매물 갯수
	public int countNewShDaily(Connection conn, String thisYearMonthDay) {
		PreparedStatement pstmt = null;
		int howManyToday  = 0;
		ResultSet rset = null;

		String query = prop.getProperty("countNewShDaily");

		//System.out.println("dao안에서 확인해보는 thisYearMonthDay : " + thisYearMonthDay);
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1,thisYearMonthDay);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				howManyToday  = rset.getInt(1);
				//System.out.println("dao) count(*)로 추출해온 갯수는? : " + howManyToday);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return howManyToday ;
	}

	// 이번달 올라온 매물 갯수
	public int countNewShMonthly(Connection conn, String thisYearMonth) {
		PreparedStatement pstmt = null;
		int howManyThisMonth = 0;
		ResultSet rset = null;

		String query = prop.getProperty("countNewShMonthly");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, thisYearMonth);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				howManyThisMonth  = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return howManyThisMonth;
	}

	// 저번달 올라온 매물 갯수
	public int countNewShLastMonth(Connection conn, String lastYearMonth) {
		PreparedStatement pstmt = null;
		int howManyLastMonth = 0;
		ResultSet rset = null;

		String query = prop.getProperty("countNewShLastMonth");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lastYearMonth);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				howManyLastMonth  = rset.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return howManyLastMonth;
	}

	// 저번달 매물 갯수 DB에 저장
	public int insertLastMonthNewSh(Connection conn, String lastYearMonth, int howManyLastMonth) {
		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("insertLastMonthNewSh");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, lastYearMonth);
			pstmt.setInt(2, howManyLastMonth);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 저번달 신규 쉐하 갯수 리스트에 담아 가져오기
	public ArrayList<Sharehouse> selectLastNewSh(Connection conn) {
		ArrayList<Sharehouse> preNewSh = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectLastNewSh");
		
		try {
			pstmt = conn.prepareStatement(sql);

			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				preNewSh.add(new Sharehouse(rset.getString("THIS_MONTH"),
										 	rset.getInt("HOWMANY")));  
			}

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return preNewSh;
	}


	// 신고받은 매물 삭제 메소드
	public int deleteSHConfirm(Connection conn, String shno) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;

		String query = prop.getProperty("deleteSHConfirm");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, shno);

			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 상세 매물보기에서 삭제 메소드
	public int deleteSHReport(Connection conn, String shRno) {
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rset = null;

		String query = prop.getProperty("deleteSHConfirm");

		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, shRno);

			result = pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	
	
}

