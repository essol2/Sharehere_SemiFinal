package administrator.model.service;

import static common.JDBCTemplate.close;
import static common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import administrator.model.dao.ADM_PayDao;
import administrator.model.vo.PageInfoForOut;
import administrator.model.vo.PageInfoForSH;
import administrator.model.vo.RmPay;
import administrator.model.vo.ShPay;

public class ADM_PayService {
		
		//페이징 처리를 위한 uno회원 결제내역 전체 갯수구하기
		public int getPayListCount(String uno) {
			Connection conn = getConnection();
			
			int payListCount = new ADM_PayDao().getPayListCount(conn, uno);
					
			close(conn);
					
			return payListCount;
		}

		// 페이징 후 리스트 출력하기
		public ArrayList<RmPay> selectpaylist(String uno, PageInfoForOut pi) {
			Connection conn = getConnection();
			
			ArrayList<RmPay> list = new ADM_PayDao().selectpaylist(conn, uno, pi); 
				
			close(conn);
				
			return list;
		}

		//페이징 처리를 위한 hno회원 결제내역 전체 갯수구하기
		public int getHsyPayListCount(String hno) {
			Connection conn = getConnection();
			
			int payListCount = new ADM_PayDao().getHsyPayListCount(conn, hno);
					
			close(conn);
					
			return payListCount;
		}

		// 페이징 후 리스트 출력하기
		public ArrayList<ShPay> selectHostPaylist(String hno, PageInfoForSH pi) {
			Connection conn = getConnection();
			
			ArrayList<ShPay> list = new ADM_PayDao().selectHostPaylist(conn, hno, pi); 
				
			close(conn);
				
			return list;
		}


}
