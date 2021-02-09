package administrator.model.dao;

import static common.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import administrator.model.vo.PageInfoForOut;
import administrator.model.vo.PageInfoForSH;
import administrator.model.vo.RmPay;
import administrator.model.vo.ShPay;

public class ADM_PayDao {
private Properties prop = new Properties();
	
	public ADM_PayDao() {
		String fileName = ADM_MemberDao.class.getResource("/sql/administrator/admin_query.xml").getPath();
	
		try {
			prop.loadFromXML(new FileInputStream(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}

	//페이징 처리를 위한 uno회원 결제내역 전체 갯수구하기
	public int getPayListCount(Connection conn, String uno) {
		int payListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getPayListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, uno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				payListCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return payListCount;
	}

	// 페이징 처리 후 리스트 출력하기
	public ArrayList<RmPay> selectpaylist(Connection conn, String uno, PageInfoForOut pi) {
		
		ArrayList<RmPay> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectpaylist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getOmLimit() + 1;
			int endRow = startRow + pi.getOmLimit() - 1;
			
			pstmt.setString(1, uno);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new RmPay(rset.getString("PAY_NO"),
								   rset.getString("US_NO"),
								   rset.getString("PAY_ITEM"),
								   rset.getString("PRICE"),
								   rset.getDate("PAY_DATE"),
								   rset.getDate("EXPIRY_DATE")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	//페이징 처리를 위한 hno회원 결제내역 전체 갯수구하기
	public int getHsyPayListCount(Connection conn, String hno) {
		int payListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("getHsyPayListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				payListCount = rset.getInt(1);
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return payListCount;
	}

	// 페이징 처리 후 리스트 출력하기
	public ArrayList<ShPay> selectHostPaylist(Connection conn, String hno, PageInfoForSH pi) {
		ArrayList<ShPay> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectHostPaylist");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getShLimit() + 1;
			int endRow = startRow + pi.getShLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new ShPay(rset.getString("SHP_NO"),
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
		return list;
	}
	
	
	
	
}
