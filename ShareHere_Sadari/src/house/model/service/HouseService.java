package house.model.service;

import java.sql.Connection;




import java.util.ArrayList;

import house.model.dao.HouseDao;
import house.model.vo.HostInfo;
import house.model.vo.HostPay;
import house.model.vo.HostPhoto;
import house.model.vo.HostRoom;
import house.model.vo.HouseInfo;
import house.model.vo.HouseReport;
import house.model.vo.HouseReservation;
import house.model.vo.MainHouse;
import house.model.vo.Search;
import member.model.dao.MemberDao;
import mypage.model.dao.MyPageDao;
import mypage.model.vo.PageInfo;

import static common.JDBCTemplate.*;

public class HouseService {
  
// 예지
   // 매물 등록하기
   public int insertInfo(HostInfo info, ArrayList<HostPhoto> photoList, ArrayList<HostRoom> roomList) {
      Connection conn = getConnection();
      
      HouseDao hd = new HouseDao();
      
      int resultInfo = hd.insertInfo(conn, info);
      int resultPhoto = hd.insertInfo(conn, photoList);
      int resultRoom = hd.insertInfoRoom(conn, roomList);
      
      if(resultInfo > 0 && resultPhoto == photoList.size() && resultRoom  == roomList.size()) {
         commit(conn);
      }else {
         rollback(conn);
      }
      
      close(conn);
      
      return resultInfo;
   }

	// 확인 조회
		public ArrayList<HostInfo> selectInfo(String hstNo) {
	Connection conn = getConnection();
			
			ArrayList<HostInfo> infoList = new HouseDao().selectInfo(conn, hstNo);
			
			close(conn);
			
			return  infoList; 
		}

	// House 확인 삭제
	public int deleteConfirm(String hNo) {
		Connection conn = getConnection();
		int result = new HouseDao().deleteConfirm(conn, hNo);

		if (result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		close(conn);

		return result;
	}

	// 수정 select Info
	public HostInfo selectUpdateInfo(String hNo) {
		Connection conn = getConnection();
		HostInfo info = new HouseDao().selectUpdateInfo(conn, hNo);
		close(conn);
		return info;
	}

	// 수정 select Photo
	public ArrayList<HostPhoto> selectUpdatePhoto(String hNo) {
		Connection conn = getConnection();
		ArrayList<HostPhoto> photo = new HouseDao().selectUpdatePhoto(conn,hNo);
		
		close(conn);
		return photo;
	}
	
	// 수정 select Room
	public ArrayList<HostRoom> selectUpdateRoom(String hNo) {
		Connection conn = getConnection();
		ArrayList<HostRoom> room = new HouseDao().selectUpdateRoom(conn,hNo);
		
		close(conn);
		return room;
	}
	
	
	
	// 수정하기 Update
	public int UpdateInfo(HostInfo info, ArrayList<HostPhoto> photoList, ArrayList<HostRoom> roomList) {
	Connection conn = getConnection();
      
      HouseDao hd = new HouseDao();
      
      int resultInfo = hd.updateInfo(conn, info);
      int resultPhoto = hd.updatephoto(conn, photoList);
      int resultRoom = hd.updateInfoRoom(conn, roomList);
      
      
      if(resultInfo > 0 && resultPhoto == photoList.size() && resultRoom  == roomList.size()) {
         commit(conn);
      }else {
         rollback(conn);
      }
      
      close(conn);
      
      return resultInfo;
}
	// 사진 삭제 delete
	public int deletePhoto(String shNo) {
		Connection conn = getConnection();
		int result = new HouseDao().deletePhoto(conn, shNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 방 사진 뺀 update // 없애도 될 것
	public int UpdateInfo(HostInfo info, ArrayList<HostRoom> roomList) {
		Connection conn = getConnection();
	      
	      HouseDao hd = new HouseDao();
	      
	      int resultInfo = hd.updateInfo(conn, info);
	      int resultRoom = hd.updateInfoRoom(conn, roomList);
	      
	      if(resultInfo > 0 && resultRoom  == roomList.size()) {
	         commit(conn);
	      }else {
	         rollback(conn);
	      }
	      
	      close(conn);
	      
	      return resultInfo;
	}


	// 페이징 처리 된 확인 조회
	public ArrayList<HostInfo> selectInfo(String hstNo, PageInfo pi) {
		Connection conn = getConnection();
		
		ArrayList<HostInfo> infoList = new HouseDao().selectInfo(conn, hstNo, pi);
		
		close(conn);
		
		return  infoList;
	}


	// 하우스 확인 페이징 갯수 구하기
	public int getListCount(String hstNo) {
		Connection conn = getConnection();
		
		int listCount = new HouseDao().getListCount(conn, hstNo);
		
		close(conn);
		
		return listCount;
	}

// 성현
	// 임대인 결제 insert
	public int insertHstpay(HostPay hpay) {
		Connection conn = getConnection();
		
		int result = new HouseDao().insertHstpay(conn, hpay);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 하우스 신고 insert
	public int insertHouseReport(HouseReport r) {
		Connection conn = getConnection();
		
		int result = new HouseDao().insertHouseReport(conn, r);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

	// 키워드로 검색 시 리스트 조회
		public ArrayList<Search> selectKeywordList(String keyword) {

			Connection conn = getConnection();
			
			ArrayList<Search> keywordlist = new HouseDao().selectKeywordList(conn, keyword);
			
			close(conn);
			
			return keywordlist;
		}

		
		//신고할 하우스정보 불러오는 서비스
		public ArrayList<HouseInfo> selectReportHouse(String shNo) {
			Connection conn = getConnection();
			
			ArrayList<HouseInfo> houseinfo = new HouseDao().selectReportHouse(conn, shNo);
			
			close(conn);
			
			return houseinfo;
		}

		//예약할 집 정보 불러오는 서비스
		public ArrayList<HouseInfo> selectReservationHouse(String shNo) {
			Connection conn = getConnection();
			
			ArrayList<HouseInfo> houseinfo = new HouseDao().selectReservationHouse(conn, shNo);
			
			close(conn);
			
			return houseinfo;
		}

		//예약페이지 테이블 세팅
		public ArrayList<HostRoom> selectReservationRoom(String shNo) {
			Connection conn = getConnection();
			ArrayList<HostRoom> room = new HouseDao().selectReservationRoom(conn, shNo);
		
			close(conn);
			return room;
			
		}

		//방 예약하기
		public int insertHouseReservation(HouseReservation hr) {
			Connection conn = getConnection();
			
			int result = new HouseDao().insertHouseReservation(conn, hr);
			
			if(result > 0) {
				commit(conn);
			} else {
				rollback(conn);
			}
			
			close(conn);
			
			return result;
		}

	// 키워드로 검색 시 리스트 조회
	/*public ArrayList<HostInfo> selectKeywordList(String keyword) {
		Connection conn = getConnection();
		
		ArrayList<HostInfo> keywordlist = new HouseDao().selectKeywordList(conn, keyword);
		
		close(conn);
		
		return keywordlist;
	}*/

		//네비바 하우스 버튼
		public ArrayList<MainHouse> selectMainHouse(String mainhouse) {
			Connection conn = getConnection();
			
			ArrayList<MainHouse> mainhouseList = new HouseDao().selectMainHouse(conn, mainhouse);
			return mainhouseList;
		}


		
// ES(?)
	// 확인 페이지 결제 조회
   public ArrayList<HostPay> selectpay() {
      
      Connection conn = getConnection();
      
      ArrayList<HostPay> payList = new HouseDao().selectPay(conn);
      
      close(conn);
      
      return  payList; 
   }

}