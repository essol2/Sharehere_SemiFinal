package house.model.dao;

import static common.JDBCTemplate.close;





import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import house.model.vo.HostInfo;
import house.model.vo.HostPay;
import house.model.vo.HostPhoto;
import house.model.vo.HostRoom;
import house.model.vo.HouseInfo;
import house.model.vo.HouseReport;
import house.model.vo.HouseReservation;
import house.model.vo.MainHouse;
import house.model.vo.Search;
import mypage.model.vo.PageInfo;



public class HouseDao {
   
   private Properties prop = new Properties();
   
   public HouseDao() {
      
      String fileName = HouseDao.class.getResource("/sql/house/house-query.xml").getPath();
      try {
         prop.loadFromXML(new FileInputStream(fileName));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

// 예지
   // 주석 이름만 바뀜
   // HOUSE 매물 Insert
   public int insertInfo(Connection conn, HostInfo info) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertInfo");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, info.getShTitle());
         pstmt.setString(2, info.getShType());
         pstmt.setString(3, info.getShStr());
         pstmt.setString(4, info.getShArea());
         pstmt.setString(5, info.getShFloor());
         pstmt.setString(6, info.getShIntro());
         pstmt.setString(7, info.getShPers());
         pstmt.setString(8, info.getShComs());
         pstmt.setString(9, info.getShSs());
         pstmt.setString(10, info.getShAddress());
         pstmt.setString(11, info.getShLa());
         pstmt.setString(12, info.getShLo());
         pstmt.setString(13, info.getShBank());
         pstmt.setString(14, info.getShMart());
         pstmt.setString(15, info.getShParmacy());
         pstmt.setString(16, info.getShSubway());
         pstmt.setString(17, info.getShCafe());
         pstmt.setString(18, info.getShStore());
         pstmt.setString(19, info.getHstNo());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }
   
   // 주석 이름만 바뀜
   // HOUSE 사진 Insert
   public int insertInfo(Connection conn, ArrayList<HostPhoto> photoList) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertPhoto");
      
      for(int i = 0; i < photoList.size(); i++) {
         try {
            pstmt = conn.prepareStatement(sql);
            
            HostPhoto hp = photoList.get(i);
            pstmt.setString(1, hp.getShIname());
            pstmt.setString(2, hp.getShIpath());
            pstmt.setString(3, hp.getShItype());
            pstmt.setString(4, hp.getShChName());
            
            result += pstmt.executeUpdate();
            
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            close(pstmt);
         }
      }
      
      return result;
   }
   
   // 주석 이름만 바뀜
   // HOUSE 방 정보 Insert
   public int insertInfoRoom(Connection conn, ArrayList<HostRoom> roomList) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertRoom");
      
      for(int i = 0; i < roomList.size(); i++) {
         try {
            pstmt = conn.prepareStatement(sql);
            
            HostRoom hr = roomList.get(i);
            pstmt.setString(1, hr.getShRtype());
            pstmt.setString(2, hr.getShGender());
            pstmt.setString(3, hr.getShRarea());
            pstmt.setString(4, hr.getShDeposit());
            pstmt.setString(5, hr.getShAdmcost());
            pstmt.setString(6, hr.getShMonthly());
            pstmt.setDate(7, hr.getShRdate());
            pstmt.setInt(8, hr.getShCapacity());
            pstmt.setString(9, hr.getShRname());
            
            result += pstmt.executeUpdate();
            
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            close(pstmt);
         }
      }
      
      return result;
   }
    
   // House 확인 페이지 select // 없애도 됨
   public ArrayList<HostInfo> selectInfo(Connection conn) {
		ArrayList<HostInfo> infoList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		String sql = prop.getProperty("selectInfo"); 
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				infoList.add(new HostInfo(rset.getString("SH_NO"),
										  rset.getString("SH_TITLE"),
										  rset.getString("SH_TYPE"),
										  rset.getString("SH_STR"),
										  rset.getString("SH_AREA"),
										  rset.getString("SH_ADDRESS"),
										  rset.getDate("SH_DATE"),
										  rset.getString("HST_NO")
										  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return infoList;
	}

   // 없애야 할 것
	public ArrayList<HostInfo> selectInfo(Connection conn, String hstNo) {
		ArrayList<HostInfo> infoList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		String sql = prop.getProperty("selectInfo"); 
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hstNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				infoList.add(new HostInfo(rset.getString("SH_NO"),
										  rset.getString("SH_TITLE"),
										  rset.getString("SH_TYPE"),
										  rset.getString("SH_STR"),
										  rset.getString("SH_AREA"),
										  rset.getString("SH_ADDRESS"),
										  rset.getDate("SH_DATE"),
										  rset.getString("HST_NO")
										  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return infoList;
	}

	// 주석 이름만 바뀜
	// House 확인 삭제
	public int deleteConfirm(Connection conn, String hNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteInfo");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, hNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	// 매물 select 수정 
	public HostInfo selectUpdateInfo(Connection conn, String hNo) {
		HostInfo i = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectUpdateInfo");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				i = new HostInfo(
								rset.getString("SH_NO"),
								rset.getString("SH_TITLE"),
								rset.getString("SH_TYPE"),
								rset.getString("SH_STR"),
								rset.getString("SH_AREA"),
								rset.getString("SH_FLOOR"),
								rset.getString("SH_INTRO"),
								rset.getString("SH_PERS"),
								rset.getString("SH_COMS"),
								rset.getString("SH_SS"),
								rset.getString("SH_ADDRESS"),
								rset.getString("SH_LA"),
								rset.getString("SH_LO"),
								rset.getString("SH_BANK"),
								rset.getString("SH_MART"),
								rset.getString("SH_PARMACY"),
								rset.getString("SH_SUBWAY"),
								rset.getString("SH_CAFE"),
								rset.getString("SH_STORE"),
								rset.getString("SH_STATUS"),
								rset.getDate("SH_DATE"),
								rset.getString("HST_NO")
						);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return i;
	}

	// 수정  select Photo
	public ArrayList<HostPhoto> selectUpdatePhoto(Connection conn, String hNo) {
		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		ArrayList<HostPhoto> photo = new ArrayList<HostPhoto>();
 		String sql = prop.getProperty("selectUpdatePhoto");
 		
 		try {
 			pstmt = conn.prepareStatement(sql);
 			
 			pstmt.setString(1, hNo);
 			
 			rset = pstmt.executeQuery();
 			while(rset.next()) {
 				photo.add(new HostPhoto(
 										rset.getString("SH_INAME"),
 										rset.getString("SH_IPATH"),
 										rset.getString("SH_ITYPE"),
 										rset.getString("SH_NO"),
 										rset.getString("SH_CHNAME")
 										));
 				
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			close(rset);
 			close(pstmt);
 		}
 		return photo;
	}

	// 수정 select Room
	public ArrayList<HostRoom> selectUpdateRoom(Connection conn, String hNo) {
		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		ArrayList<HostRoom> room = new ArrayList<HostRoom>();
 		String sql = prop.getProperty("selectUpdateRoom");
 		
 		try {
 			pstmt = conn.prepareStatement(sql);
 			
 			pstmt.setString(1, hNo);
 			
 			rset = pstmt.executeQuery();
 			while(rset.next()) {
 				room.add(new HostRoom(rset.getString("SH_RNO"),
 									 rset.getString("SH_RTYPE"),
 									 rset.getString("SH_GENDER"),
 									 rset.getString("SH_RAREA"),
 									 rset.getString("SH_DEPOSIT"),
 									 rset.getString("SH_ADMCOST"),
 									 rset.getString("SH_MONTHLY"),
 									 rset.getDate("SH_RDATE"),
 									 rset.getInt("SH_CAPACITY"),
 									 rset.getString("SH_RNAME"),
 									 rset.getString("SH_NO")));
 				
 			}
 		} catch (SQLException e) {
 			e.printStackTrace();
 		}finally {
 			close(rset);
 			close(pstmt);
 		}
 		return room;
	}
	
	// 수정 Info
	public int updateInfo(Connection conn, HostInfo info) {
		int result = 0;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("updateInfo");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, info.getShTitle());
	         pstmt.setString(2, info.getShType());
	         pstmt.setString(3, info.getShStr());
	         pstmt.setString(4, info.getShArea());
	         pstmt.setString(5, info.getShFloor());
	         pstmt.setString(6, info.getShIntro());
	         pstmt.setString(7, info.getShPers());
	         pstmt.setString(8, info.getShComs());
	         pstmt.setString(9, info.getShSs());
	         pstmt.setString(10, info.getShAddress());
	         pstmt.setString(11, info.getShLa());
	         pstmt.setString(12, info.getShLo());
	         pstmt.setString(13, info.getShBank());
	         pstmt.setString(14, info.getShMart());
	         pstmt.setString(15, info.getShParmacy());
	         pstmt.setString(16, info.getShSubway());
	         pstmt.setString(17, info.getShCafe());
	         pstmt.setString(18, info.getShStore());
	         pstmt.setString(19, info.getHstNo());
	         pstmt.setString(20, info.getShNo());
	         
	         result = pstmt.executeUpdate();
	         
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      return result;
	}
	
	
	
	// 수정  Insert photo
	public int updatephoto(Connection conn, ArrayList<HostPhoto> photoList) {
		  int result = 0;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("updateInsertPhoto");
	      
	      for(int i = 0; i < photoList.size(); i++) {
	    	  
	         try {
	        	 
	            pstmt = conn.prepareStatement(sql);
	            
	            HostPhoto hp = photoList.get(i);
	            pstmt.setString(1, hp.getShIname());
	            pstmt.setString(2, hp.getShIpath());
	            pstmt.setString(3, hp.getShNo());
	            pstmt.setString(4, hp.getShItype());
	            pstmt.setString(5, hp.getShChName());
	            
	           
	            result += pstmt.executeUpdate();
	           
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }finally {
	            close(pstmt);
	         }
	      }

	      return result;
	}

	// 수정 Room
	public int updateInfoRoom(Connection conn, ArrayList<HostRoom> roomList) {
		int result = 0;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("updateRoom");
	      
	      for(int i = 0; i < roomList.size(); i++) {
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            HostRoom hr = roomList.get(i);
	            //pstmt.setString(1, hr.getShRno());
	            pstmt.setString(1, hr.getShRtype());
	            pstmt.setString(2, hr.getShGender());
	            pstmt.setString(3, hr.getShRarea());
	            pstmt.setString(4, hr.getShDeposit());
	            pstmt.setString(5, hr.getShAdmcost());
	            pstmt.setString(6, hr.getShMonthly());
	            pstmt.setDate(7, hr.getShRdate());
	            pstmt.setInt(8, hr.getShCapacity());
	            pstmt.setString(9, hr.getShRname());
	            pstmt.setString(10, hr.getShNo());
	            
	            System.out.println("updateRoom 안에 :" + hr);
	            result += pstmt.executeUpdate();
	            System.out.println("updatephoto 안에 :" + result);
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }finally {
	            close(pstmt);
	         }
	      }
	      
	      return result;
	}
	
	// Update 사진 삭제
	public int deletePhoto(Connection conn, String shNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateDeletePhoto");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, shNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	// 페이징 처리 된 Host 매물 내역 조회
	public ArrayList<HostInfo> selectInfo(Connection conn, String hstNo, PageInfo pi) {
		ArrayList<HostInfo> infoList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		String sql = prop.getProperty("selectInfoPaging"); 
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getObjectLimit() + 1;
	        int endRow = startRow + pi.getObjectLimit() - 1;
			
			pstmt.setString(1, hstNo);
			pstmt.setInt(2, startRow);
	        pstmt.setInt(3, endRow);
	         
			rset = pstmt.executeQuery();
			
			
			while(rset.next()) {
				infoList.add(new HostInfo(rset.getString("SH_NO"),
										  rset.getString("SH_TITLE"),
										  rset.getString("SH_TYPE"),
										  rset.getString("SH_STR"),
										  rset.getString("SH_AREA"),
										  rset.getString("SH_ADDRESS"),
										  rset.getDate("SH_DATE"),
										  rset.getString("HST_NO")
										  ));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return infoList;
	}

	// 하우스 확인 페이징 갯수 구하기
	public int getListCount(Connection conn, String hstNo) {
		int listCount = 0;
		PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("HouseConfirmListCount");
	      
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

// 성현
	// 임대인 결제 insert
	public int insertHstpay(Connection conn, HostPay hpay) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHstpay");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hpay.getShItem());
			pstmt.setString(2, hpay.getShPrice());
			pstmt.setString(3, hpay.getHstNo());
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	//하우스 신고
	public int insertHouseReport(Connection conn, HouseReport r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHouseReport");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, r.getrReason());
			pstmt.setString(2, r.getrContent());
			pstmt.setString(3, r.getShNo());
			pstmt.setString(4, r.getUsNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



	   // 키워드로 검색 시 리스트 조회 수정
	   public ArrayList<Search> selectKeywordList(Connection conn, String keyword) {
	      ArrayList<Search> keywordlist = new ArrayList<>();
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	   
	      String sql = prop.getProperty("selectKeywordList");
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, keyword);
	         pstmt.setString(2, keyword);
	         
	         rset = pstmt.executeQuery();
	         
	         while(rset.next()) {
	            keywordlist.add(new Search(rset.getString("SH_NO"),
	                                       rset.getString("SH_TITLE"),
	                                       rset.getString("SH_TYPE"),
	                                       rset.getString("SH_ADDRESS"),
	                                       rset.getString("SH_LA"),
	                                       rset.getString("SH_LO"),
	                                       rset.getString("SH_SUBWAY"),
	                                       rset.getString("SH_STATUS"),
	                                       rset.getString("SH_ITYPE"),
	                                       rset.getString("SH_IPATH"),
	                                       rset.getString("SH_CHNAME")));
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      
	      return keywordlist;
	   }
	
	
	//신고페이지 첫번째 섹션 하우스정보 불러오는 서비스
	public ArrayList<HouseInfo> selectReportHouse(Connection conn, String shNo) {
		ArrayList<HouseInfo> houseinfo = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReportHouse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, shNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				houseinfo.add(new HouseInfo(rset.getString("SH_NO"),
	   				   					   rset.getString("SH_TITLE"),
	   				   					   rset.getString("SH_TYPE"),
	   				   					   rset.getString("SH_ADDRESS"),
	   				   					   rset.getDate("SH_DATE"),
	   				   					   rset.getString("SH_STR"),
	   				   					   rset.getString("HST_NAME"),
	   				   					   rset.getString("HST_PHONE"),
	   				   					   rset.getString("SH_IPATH"),
	   				   					   rset.getString("SH_ITYPE"),
	   				   					   rset.getString("SH_CHNAME")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return houseinfo;
	}

	public ArrayList<HouseInfo> selectReservationHouse(Connection conn, String shNo) {
		ArrayList<HouseInfo> houseinfo = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectReservationHouse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, shNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				houseinfo.add(new HouseInfo(rset.getString("SH_NO"),
	   				   					   rset.getString("SH_TITLE"),
	   				   					   rset.getString("SH_TYPE"),
	   				   					   rset.getString("SH_ADDRESS"),
	   				   					   rset.getDate("SH_DATE"),
	   				   					   rset.getString("SH_STR"),
	   				   					   rset.getString("HST_NAME"),
	   				   					   rset.getString("HST_PHONE"),
	   				   					   rset.getString("SH_IPATH"),
	   				   					   rset.getString("SH_ITYPE"),
	   				   					   rset.getString("SH_CHNAME")));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return houseinfo;
	}

	// 예약 페이지 테이블 세팅
	public ArrayList<HostRoom> selectReservationRoom(Connection conn, String shNo) {
		PreparedStatement pstmt = null;
 		ResultSet rset = null;
 		ArrayList<HostRoom> room = new ArrayList<HostRoom>();
 		String sql = prop.getProperty("selectReservationRoom");
 		
 		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, shNo);
 			
 			rset = pstmt.executeQuery();
 			while(rset.next()) {
 				room.add(new HostRoom(rset.getString("SH_RNO"),
 									 rset.getString("SH_RTYPE"),
 									 rset.getString("SH_GENDER"),
 									 rset.getString("SH_RAREA"),
 									 rset.getString("SH_DEPOSIT"),
 									 rset.getString("SH_ADMCOST"),
 									 rset.getString("SH_MONTHLY"),
 									 rset.getDate("SH_RDATE"),
 									 rset.getInt("SH_CAPACITY"),
 									 rset.getString("SH_RNAME"),
 									 rset.getString("SH_NO")));
 				
 			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
 		return room;
	}

	// 방 예약하기
	public int insertHouseReservation(Connection conn, HouseReservation hr) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertHouseReservation");
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, hr.getCheck());
			pstmt.setString(2, hr.getPeriod());
			pstmt.setString(3, hr.getRvDate());
			pstmt.setString(4, hr.getUsNo());
			pstmt.setString(5, hr.getShNo());
			
			result = pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//네비바 하우스 버튼
		public ArrayList<MainHouse> selectMainHouse(Connection conn, String mainhouse) {
			ArrayList<MainHouse> mainhouseList = new ArrayList<>();
			  PreparedStatement pstmt = null;
		      ResultSet  rset = null;
		      String sql = prop.getProperty("selectMainHouse");
		      
		      try {
				pstmt = conn.prepareStatement(sql);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					mainhouseList.add(new MainHouse(rset.getString(2),
												rset.getString(3),
												rset.getString(4),
												rset.getString(5),
												rset.getString(6),
												rset.getString(7),
												rset.getString(8)));
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(pstmt);
			}
		      
			return mainhouseList;
		}
	
// ES(?)
   // 확인페이지 결제
	public ArrayList<HostPay> selectPay(Connection conn) {
      ArrayList<HostPay> payList = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet  rset = null;
      String sql = prop.getProperty("selectPay"); 
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            payList.add(new HostPay(rset.getString("PAY_NO"),
                                rset.getString("SH_PERIOD"),
                                rset.getString("HST_NO")));
         }
         
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return payList;
   }


		

		

		


		
		
		

		
















}

		
		
		
		
		
		
		

		
