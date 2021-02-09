package mypage.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import administrator.model.vo.ShReport;
import house.model.dao.HouseDao;
import house.model.vo.HostInfo;
import house.model.vo.HostPay;
import house.model.vo.HouseReservation;
import mypage.model.vo.HstReservation;
import mypage.model.vo.PageInfo;
import mypage.model.vo.ResToday;
import mypage.model.vo.ShUserResDetail;
import mypage.model.vo.ShUserReservation;

public class MyPageDao {
	
	   private Properties prop = new Properties();
	   
	   public MyPageDao() {
	      
	      String fileName = HouseDao.class.getResource("/sql/mypage/mypage-query.xml").getPath();
	      try {
	         prop.loadFromXML(new FileInputStream(fileName));
	      } catch (IOException e) {
	         e.printStackTrace();
	      }
	   }

	// 호스트 결제 내역 확인
	public ArrayList<HostPay> selectInfo(Connection conn, String hstNo) {
		ArrayList<HostPay> hostPay = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		String sql = prop.getProperty("selectPay"); 
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hstNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				hostPay.add(new HostPay(rset.getString("SHP_NO"),
										  rset.getString("SH_ITEM"),
										  rset.getString("SH_PRICE"),
										  rset.getDate("SH_PDATE"),
										  rset.getString("HST_NO")
										  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hostPay;
	}

	// 게시글 총 개수 조회
	public int getListCount(Connection conn, String hstNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("getListCount");
	      
	      try {
	    	  pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, hstNo);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            listCount = rset.getInt(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return listCount;
	}

	// 페이징 처리 된 호스트 결제 내역 조회
	public ArrayList<HostPay> selectInfo(Connection conn, String hstNo, PageInfo pi) {
		ArrayList<HostPay> hostPay = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
	    String sql = prop.getProperty("selectPayPaging");
	      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() - 1) * pi.getObjectLimit() + 1;
         int endRow = startRow + pi.getObjectLimit() - 1;
         
         pstmt.setString(1, hstNo);
         pstmt.setInt(2, startRow);
         pstmt.setInt(3, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
				hostPay.add(new HostPay(rset.getString("SHP_NO"),
										  rset.getString("SH_ITEM"),
										  rset.getString("SH_PRICE"),
										  rset.getDate("SH_PDATE"),
										  rset.getString("HST_NO")
										  ));
		}
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return hostPay;
	}

	// 페이징 처리된 일반회원 예약 리스트
	public ArrayList<ShUserReservation> selectUserRes(Connection conn, String userNo, PageInfo pi) {
		ArrayList<ShUserReservation> shUserRes = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
	    String sql = prop.getProperty("selectUserResPaging");
	      
      try {
         pstmt = conn.prepareStatement(sql);
         
         int startRow = (pi.getCurrentPage() - 1) * pi.getObjectLimit() + 1;
         int endRow = startRow + pi.getObjectLimit() - 1;
         
         pstmt.setString(1, userNo);
         pstmt.setInt(2, startRow);
         pstmt.setInt(3, endRow);
         
         rset = pstmt.executeQuery();
         
         
         while(rset.next()) {
        	 shUserRes.add(new ShUserReservation(rset.getString("SH_RVNO"),
										  rset.getString("SH_RV_CHKRM"),
										  rset.getString("SH_RV_PERIOD"),
										  rset.getDate("SH_RV_DATE"),
										  rset.getString("US_NO"),
										  rset.getDate("SH_RV_TD"),
										  rset.getString("SH_NO"),
										  rset.getString("SH_RV_STATUS"),
										  rset.getString("SH_RTYPE"),
										  rset.getString("SH_GENDER"),
										  rset.getString("SH_RAREA"),
										  rset.getString("SH_DEPOSIT"),
										  rset.getString("SH_ADMCOST"),
										  rset.getString("SH_MONTHLY"),
										  rset.getDate("SH_RDATE"),
										  rset.getInt("SH_CAPACITY"),
										  rset.getString("SH_RNAME")
										  ));
        	 System.out.println("shUserRes: " + shUserRes);
		}
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return shUserRes;
	}

	// 일반회원 예약 페이징 갯수 구하기
	public int getListUserResCount(Connection conn, String userNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("getUserResListCount");
	      
	      try {
	    	  pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, userNo);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            listCount = rset.getInt(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return listCount;
	}

	// 일반회원 예약 상세 페이지 
	public ShUserResDetail selectUserResDetail(Connection conn, String RVNo) {
		ShUserResDetail resDetail = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUserResDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, RVNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				resDetail = new ShUserResDetail(
								rset.getString("SH_RVNO"),
								rset.getString("SH_RV_CHKRM"),
								rset.getString("US_NO"),
								rset.getString("SH_NO"),
								rset.getString("SH_RV_STATUS"),
								rset.getString("SH_RNO"),
								rset.getString("SH_I"),
								rset.getString("SH_INAME"),
								rset.getString("SH_IPATH"),
								rset.getString("SH_ITYPE"),
								rset.getString("SH_CHNAME"),
								rset.getString("SH_TITLE"),
								rset.getString("SH_ADDRESS"),
								rset.getString("SH_LA"),
								rset.getString("SH_LO"),
								rset.getString("SH_STATUS"),
								rset.getString("HST_NO"),
								rset.getString("HST_NAME"),
								rset.getString("HST_EMAIL"),
								rset.getString("HST_PHONE"),
								rset.getString("HST_BSNO"),
								rset.getString("HST_BSNAME")
						);
				System.out.println("Dao : " + resDetail);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return resDetail;
	}

	// 페이징 처리 된 유저 예약 리스트 조회(호스트 목록)
	public ArrayList<HstReservation> selectReservationList(Connection conn, String hstNo, PageInfo ph) {
		ArrayList<HstReservation> hstRes = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		String sql = prop.getProperty("selectHstResPaging"); 
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (ph.getCurrentPage() - 1) * ph.getObjectLimit() + 1;
	        int endRow = startRow + ph.getObjectLimit() - 1;
			
			pstmt.setString(1, hstNo);
			pstmt.setInt(2, startRow);
	        pstmt.setInt(3, endRow);
	         
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				hstRes.add(new HstReservation(rset.getString("US_NAME"),
										  rset.getString("US_EMAIL"),
										  rset.getString("US_PHONE"),
										  rset.getString("US_ACT"),
										  rset.getString("SH_RV_CHKRM"),
										  rset.getString("SH_RV_PERIOD"),
										  rset.getDate("SH_RV_DATE"),
										  rset.getString("SH_NO"),
										  rset.getString("SH_RV_STATUS"),
										  rset.getString("US_NO"),
										  rset.getDate("SH_RV_TD"),
										  rset.getString("HST_NO")
										  ));
			}
			
			//System.out.println("servicehstRes: "+ hstRes);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return hstRes;
	}

	// 호스트 유저 갯수
	public int getHstResListCount(Connection conn, String hstNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("getHstResListCount");
	      
	      try {
	    	  pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, hstNo);
	         
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            listCount = rset.getInt(1);
	         }
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return listCount;
	}

	// User 예약 취소
	public int deleteUsRes(Connection conn, String RVNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteUsRes");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, RVNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 오늘 들어간 예약인지 확인 alert
	public ArrayList<ResToday> selectResToday(Connection conn, String hno) {
		ArrayList<ResToday> resToday =  new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectShAlerResToday");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hno);
			
			rset = pstmt.executeQuery();
			// System.out.println("dao에서 hno 확인 : " + hno);
			while(rset.next()) {
				resToday.add(new ResToday( rset.getString("SH_RVNO"),
										 rset.getString("SH_RV_CHKRM"),
										 rset.getString("SH_RV_PERIOD"),
										 rset.getDate("SH_RV_DATE"),
										 rset.getString("US_NO"),
										 rset.getString("SH_NO"),
										 rset.getString("SH_RV_STATUS"),
										 rset.getDate("SH_RV_TD"),
										 rset.getString("US_NAME")));  
				//System.out.println("dao안에서 객체 들어가는지 확인 : " + raList);
			}
			//System.out.println("dao안에서 객체 들어가는지 확인 : " + shList);

			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return resToday;
	}
	


}
