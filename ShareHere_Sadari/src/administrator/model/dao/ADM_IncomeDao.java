package administrator.model.dao;

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

import administrator.model.vo.Income;
import administrator.model.vo.PageInfoForIS;
import administrator.model.vo.PageInfoForRm;
import administrator.model.vo.Sharehouse;

public class ADM_IncomeDao {
	
private Properties prop = new Properties();
	
	public ADM_IncomeDao() {
		String fileName = ADM_SharehouseDao.class.getResource("/sql/administrator/admin_query.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}


	// 페이징을 위한 룸메이트 결제 내역 전체 갯수 구하기
	public int getRmListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getRmListCount");
		
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

	// 페이징 처리 후 리스트 출력
	public ArrayList<Income> selectRmList(Connection conn, PageInfoForRm pi) {
		ArrayList<Income> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRmListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getRmLimit() + 1;
			int endRow = startRow + pi.getRmLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Income(rset.getString("PAY_NO"),
									rset.getString("US_NO"),
									rset.getString("PAY_ITEM"),
									rset.getDate("PAY_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	// 매물 결제 내역 총 갯수 구하기
	public int getIsListCount(Connection conn) {
		int listCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getIsListCount");
		
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

	public ArrayList<Income> selectIsList(Connection conn, PageInfoForIS pi) {
		ArrayList<Income> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectIsListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getIsLimit() + 1;
			int endRow = startRow + pi.getIsLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Income(rset.getString("SHP_NO"),
									rset.getString("SH_ITEM"),
									rset.getDate("SH_PDATE"),
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

	// 차트 만들기 위한 달별 결제내역 가져오기(룸메이트)
	public ArrayList<Income> paymentByMonthRM(Connection conn, int thisMonth) {
		ArrayList<Income> paymentsRm = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("paymentByMonthRM");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, thisMonth);
			//System.out.println("dao 안에서 thisMonth 값이 잘 넘어왔는가? : " + thisMonth);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				paymentsRm.add(new Income(rset.getString("PAY_NO"),
										  rset.getString("US_NO"),
										  rset.getString("PAY_ITEM"),
										  rset.getString("PRICE"),
										  rset.getDate("PAY_DATE")));
			}
			//System.out.println("dao 안에서 객체에 값이 잘 담겼을까? : " + paymentsRm);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return paymentsRm;
	}

	// 차트 만들기 위한 달별 결제내역 가져오기(하우스)
	public ArrayList<Income> paymentByMonthSH(Connection conn, int thisMonth) {
		ArrayList<Income> paymentsSh = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("paymentByMonthSH");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, thisMonth);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				paymentsSh.add(new Income(rset.getString("SHP_NO"),
										  rset.getString("SH_ITEM"),
										  rset.getString("SH_PRICE"),
										  rset.getDate("SH_PDATE"),
										  rset.getString("HST_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return paymentsSh;
	}


	// 저번 달의 총 수익 구하기 위한 결제내역 가져오기(룸메이트)
	public ArrayList<Income> lastMRMIncome(Connection conn, int lastMonth) {
		ArrayList<Income> lastMonthRMIncome = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("paymentByMonthRM");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, lastMonth);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				lastMonthRMIncome.add(new Income(rset.getString("PAY_NO"),
												 rset.getString("US_NO"),
												 rset.getString("PAY_ITEM"),
												 rset.getString("PRICE"),
												 rset.getDate("PAY_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return lastMonthRMIncome;
	}

	// 저번 달의 총 수익 구하기 위한 결제내역 가져오기(하우스)
	public ArrayList<Income> lasMSHIncome(Connection conn, int lastMonth) {
		ArrayList<Income> lastMonthSHIncome = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("paymentByMonthSH");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, lastMonth);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				lastMonthSHIncome.add(new Income(rset.getString("SHP_NO"),
												 rset.getString("SH_ITEM"),
												 rset.getString("SH_PRICE"),
												 rset.getDate("SH_PDATE"),
												 rset.getString("HST_NO")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return lastMonthSHIncome;
	}

	// 저번달 총 수익을 테이블에 insert 하러가기(룸메이트)
	public int insertRMLastIncome(Connection conn, int thisYear, int lastMonth,  int lastMonthRMTotal) {
		int rmResult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertRMLastIncome");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, thisYear);
			pstmt.setInt(2, lastMonth);
			pstmt.setInt(3, lastMonthRMTotal);
			
			rmResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return rmResult;
	}

	// 저번달 총 수익을 테이블에 insert 하러가기(하우스)
	public int insertSHLastIncome(Connection conn, int thisYear, int lastMonth, int lastMonthSHTotal) {
		int shResult = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertSHLastIncome");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, thisYear);
			pstmt.setInt(2, lastMonth);
			pstmt.setInt(3, lastMonthSHTotal);
			
			shResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return shResult;
	}

	// 현재 달부터 -5개 달까지의 매출 가져오기(룸메이트)
	public ArrayList<Income> selectRMIncomes(Connection conn) {
		ArrayList<Income> incomeRMList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectRMIncomes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				incomeRMList.add(new Income(rset.getString("THIS_MONTH"),
											rset.getInt("HOWMUCH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return incomeRMList;
	}

	// 현재 달부터 -5개 달까지의 매출 가져오기(하우스)
	public ArrayList<Income> selectSHIncomes(Connection conn) {
		ArrayList<Income> incomeSHList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSHIncomes");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				incomeSHList.add(new Income(rset.getString("THIS_MONTH"),
											rset.getInt("HOWMUCH")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return incomeSHList;
	}

}
