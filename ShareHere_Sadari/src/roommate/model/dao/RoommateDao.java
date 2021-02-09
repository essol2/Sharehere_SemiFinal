package roommate.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import static common.JDBCTemplate.close;

import roommate.model.vo.CommentReply;
import roommate.model.vo.RoommateAttachment;
import roommate.model.vo.RoommateComment;
import roommate.model.vo.RoommateJjim;
import roommate.model.vo.RoommateMatching;
import roommate.model.vo.RoommatePay;
import roommate.model.vo.RoommateReport;
import roommate.model.vo.RoommateUser;

public class RoommateDao {
   
    private Properties prop = new Properties();
    
    public RoommateDao() {
       String fileName = RoommateDao.class.getResource("/sql/roommate/roommate-query.xml").getPath();
       
       try {
            prop.loadFromXML(new FileInputStream(fileName));
         } catch (IOException e) {
            e.printStackTrace();
         }
    }

   // 룸메이트 유저 추가용 dao
   public int insertRoommateUser(Connection conn, RoommateUser ru) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertRoommateUser");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, ru.getrUserNo());
         pstmt.setString(2, ru.getrUserResult());
         pstmt.setString(3, ru.getrUserLocal());
         pstmt.setString(4, ru.getrUserIntro());
         pstmt.setString(5, ru.getrUserGender());
         pstmt.setString(6, ru.getRlivingType());
         pstmt.setString(7, ru.getRlivingTerm());
         pstmt.setString(8, ru.getrSnsAddress());
         pstmt.setString(9, ru.getrMoviInDate());
         pstmt.setString(10, ru.getRage());
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 회원리스트 출력용 select
   public ArrayList<RoommateUser> selectRoommateUserList(Connection conn, String survey) {
      
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<RoommateUser> ru = new ArrayList<>();
      String sql = prop.getProperty("selectRoommateUserList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, survey); // 세팅
         
         rset = pstmt.executeQuery(); // 조회
         
         while (rset.next()) {
            ru.add(new RoommateUser(rset.getString(1),
                              rset.getString(2),
                              rset.getString(3),
                              rset.getString(4),
                              rset.getString(5),
                              rset.getString(6),
                              rset.getString(7),
                              rset.getString(8),
                              rset.getString(9),
                              rset.getString(10)
                  ));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return ru;
   }

   // 룸메이트 한명 상세보기
   public RoommateUser selectRoommateOne(Connection conn, String getUserNo) {
      
      RoommateUser ru = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectRoommateUserOne");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, getUserNo);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            ru = new RoommateUser(rset.getString(1),
                           rset.getString(2),
                           rset.getString(3),
                           rset.getString(4),
                           rset.getString(5),
                           rset.getString(6),
                           rset.getString(7),
                           rset.getString(8),
                           rset.getString(9),
                           rset.getString(10));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return ru;
   }

   // 룸메이트 신고 insert
   public int insertRoommateUserReoprt(Connection conn, String loginUserNO, String rUserNo, String reportContent, String reportText) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertRoommateReport");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, reportContent); // 신고 사유
         pstmt.setString(2, rUserNo); // 신고 당한 회원
         pstmt.setString(3, loginUserNO); // 신고한 회원
         pstmt.setString(4, reportText); // 신고 텍스트
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 룸메이트 찜 insert
   public int insertRoommateUserReoprt(Connection conn, String loginUserNO, String rUserNo) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertRoommateKeepUser");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, loginUserNO); // 찜한 회원(로그인 유저)
         pstmt.setString(2, rUserNo); // 찜 당한 회원
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 룸메이트 아이디 체크 확인용
   public int getListCount(Connection conn, String loginUserNO) {
        int listCount = 0;
         PreparedStatement pstmt = null;
         //게시글의 갯수를 조회하는거라서 resultSet 필요
         ResultSet rset = null;
         String sql = prop.getProperty("getListCount");
         
         try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, loginUserNO);
            
            rset = pstmt.executeQuery();
              
            if (rset.next()) {
               // 게시글의 첫번째 숫자는 1 ....105로 늘어나게 하기
              // sql에서 count를 select하는 명령문을 실행했을 때 
              // 결과적으로 조회되는 컬럼의 갯수는 1임 (count = n개)
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

   // 결제 유무 확인
   public int getListPayCkeckCount(Connection conn, String userId) {
      
        int listCount = 0;
         PreparedStatement pstmt = null;

         ResultSet rset = null;
         String sql = prop.getProperty("getPayChkeckListCount");
         
         try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, userId);
            
            rset = pstmt.executeQuery();
              
            if (rset.next()) {
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

   // 룸메이트 결제 insert
   public int insertRoommatePay(Connection conn, RoommatePay rpay) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertRoommatePay");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, rpay.getUs_no()); 
         pstmt.setString(2, rpay.getPay_item()); 
         pstmt.setString(3, rpay.getPrice()); 
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // pay 만기일 조회
   public RoommatePay selectRoommateUserExpiryDate(Connection conn, String userNo) {
      
      RoommatePay rp = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectRoommatePayOne");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userNo);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            rp = new RoommatePay(rset.getString(1),
                           rset.getString(2),
                           rset.getString(3),
                           rset.getString(4),
                           rset.getDate(5),
                           rset.getDate(6));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return rp;
   
   
   }

   // 썸네일 추가
   public int insertRoommateThumbnail(Connection conn, RoommateAttachment rmAt) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertRoommateThumbnail");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, rmAt.getrUserNo()); 
         pstmt.setString(2, rmAt.getImgPath()); 
         pstmt.setString(3, rmAt.getImgName()); 
         pstmt.setString(4, rmAt.getImgChName()); 

         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 썸네일 테이블 모두 가져옴
   public ArrayList<RoommateAttachment> selectRoommateUserList(Connection conn) {
      
      Statement stmt = null;
      ResultSet rset = null;
      ArrayList<RoommateAttachment> list = new ArrayList<>();
      String sql = prop.getProperty("selectRoommateAttachmentList");
      
      try {
         stmt = conn.createStatement(); // 쿼리 세팅
         
         rset = stmt.executeQuery(sql); // 쿼리 수행
         
         while (rset.next()) { // 조회된 결과값 넣어줌
            list.add(new RoommateAttachment(rset.getString(1),
                           rset.getString(2),
                           rset.getString(3),
                           rset.getString(4)));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(stmt);
      }
      
      return list;
   }
   
   
   // 매칭 후기 조회용 dao 메소드
   public ArrayList<RoommateComment> commentList(Connection conn) {
      ArrayList<RoommateComment> comments = new ArrayList<>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("commentList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            comments.add(new RoommateComment(rset.getInt("NNO"),
                                     rset.getString("NTITLE"),
                                     rset.getString("NCONTENT"),
                                     rset.getString("NWRITER"),
                                     rset.getInt("NCOUNT"),
                                     rset.getDate("NDATE"),
                                     rset.getString("STATUS")));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }

      return comments;
   }

   // 조회수 증가용 메소드
   public int increaseCount(Connection conn, int nno) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("increaseCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, nno);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 후기 상세보기
   public RoommateComment selectComment(Connection conn, int nno) {
      RoommateComment c = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectComment");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, nno);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            c = new RoommateComment(rset.getInt("nno"),
                              rset.getString("ntitle"),
                              rset.getString("ncontent"),
                              rset.getString("nwriter"),
                              rset.getInt("ncount"),
                              rset.getDate("ndate"),
                              rset.getString("status"));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return c;
   }
   
   // 후기 게시글 삭제용 dao
   public int deleteComment(Connection conn, int nno) {
      int result = 0 ;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteComment");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, nno);
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      
      return result;
   }

   // 후기 작성 insertComment
      public int insertComment(Connection conn, RoommateComment comments) {

         int result = 0;
         PreparedStatement pstmt = null;
         String sql = prop.getProperty("insertComment");

         try {
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, comments.getnTitle());
            pstmt.setString(2, comments.getnContent());
            pstmt.setString(3, comments.getnWriter());

            result = pstmt.executeUpdate();

         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            close(pstmt);
         }

         return result;
      }

   // 디테일페이지에서 한명 프로필사진 가져오기
   public RoommateAttachment selectRoommateOneAtta(Connection conn, String getrUserNo) {
      
      RoommateAttachment ruOneAtt = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      String sql = prop.getProperty("selectRoommateUserOneAtta");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, getrUserNo);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            ruOneAtt = new RoommateAttachment(rset.getString(1),
                                       rset.getString(2),
                                       rset.getString(3),
                                       rset.getString(4));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return ruOneAtt;
   }

   // 매칭 insert
   public int insertMatching(Connection conn, RoommateMatching matching) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("insertMatching");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, matching.getUserNo()); 
         pstmt.setString(2, matching.getUserNo2()); 
         pstmt.setString(3, matching.getTel()); 
         pstmt.setString(4, matching.getText());
         // STATUS 값은 XML에서 입력
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 마이페이지용 로그인유저 신고 목록 조회
   public ArrayList<RoommateReport> selectReportListOne(Connection conn, String userNo) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<RoommateReport> rpList = new ArrayList<>();
      String sql = prop.getProperty("selectReportListOne");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userNo); // 세팅
         
         rset = pstmt.executeQuery(); // 조회
         
         while (rset.next()) {
            rpList.add(new RoommateReport(rset.getInt(1),      // 신고번호
                                    rset.getString(2),  // 신고사유
                                    rset.getDate(3),   // 신고일자
                                    rset.getString(4),   // 신고당한 회원번호
                                    rset.getString(5))); // 로그인유저 회원번호(신고한 회원)
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return rpList;
   }

   // 마이페이지용 로그인유저 찜 목록 조회
   public ArrayList<RoommateJjim> selectRoommateJjimOne(Connection conn, String userNo) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<RoommateJjim> rjList = new ArrayList<>();
      String sql = prop.getProperty("selectRoommateJjimOne");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userNo); // 세팅
         
         rset = pstmt.executeQuery(); // 조회
         
         while (rset.next()) {
            rjList.add(new RoommateJjim(rset.getString(1),    // 로그인유저 회원번호(찜한 회원)
                                 rset.getString(2))); // 찜 당한 회원번호
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return rjList;
   }

   // 마이페이지용 로그인유저 결제 목록 조회
   public ArrayList<RoommatePay> selectRoommatePayOne(Connection conn, String userNo) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<RoommatePay> rPayList = new ArrayList<>();
      String sql = prop.getProperty("selectRoommatePayOne");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userNo); // 세팅
         
         rset = pstmt.executeQuery(); // 조회
         
         while (rset.next()) {
            rPayList.add(new RoommatePay(rset.getString(1),    // 결제번호 (시퀀스)
                                 rset.getString(2),  // 로그인유저 회원번호(결재한 회원)
                                 rset.getString(3),  // 결제항목
                                 rset.getString(4),  // 결제금액
                                 rset.getDate(5),    // 결제날짜
                                 rset.getDate(6)));     // 만기날짜
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return rPayList;
   }

   // 마이페이지용 로그인유저 매칭 목록 조회 (내가 보낸 매칭)
   public ArrayList<RoommateMatching> selectRoommateMatchingOne(Connection conn, String userNo) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<RoommateMatching> rmList = new ArrayList<>();
      String sql = prop.getProperty("selectRoommateMatchingOne");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userNo); // 세팅
         
         rset = pstmt.executeQuery(); // 조회
         
         while (rset.next()) {
            rmList.add(new RoommateMatching(rset.getString(1),    // 로그인유저 회원번호(매칭 회원)
                                 rset.getString(2),     // 매칭 당하는 회원
                                 rset.getString(3),        // 매칭 회원 연락처
                                 rset.getString(4),       // 매칭 회원 컨텐츠
                                 rset.getString(5)));     // 상태 (상대방 수락 전 까지 'N')
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return rmList;
   }

   // 마이페이지용 로그인유저 매칭 목록 조회 (내게 온 매칭)
   public ArrayList<RoommateMatching> selectRoommateMatchingIntoOne(Connection conn, String userNo) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<RoommateMatching> rmIntoList = new ArrayList<>();
      String sql = prop.getProperty("selectRoommateMatchingIntoOne");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userNo); // 세팅
         
         rset = pstmt.executeQuery(); // 조회
         
         while (rset.next()) {
            rmIntoList.add(new RoommateMatching(rset.getString(1),        // 로그인유저 회원번호(매칭 당한 회원)
                                       rset.getString(2),      // 매칭 한 회원
                                       rset.getString(3),        // 매칭 회원 연락처
                                       rset.getString(4),       // 매칭 회원 컨텐츠
                                       rset.getString(5)));     // 상태 (내가 수락 전 까지 'N')
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return rmIntoList;
   }

   // 내가 신청한 매칭 삭제 
   public int deleteMatching(Connection conn, RoommateMatching rm) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("deleteMatching");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, rm.getUserNo());
         pstmt.setString(2, rm.getUserNo2()); 
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 나에게 온 매칭 거절
   public int rejectMathcing(Connection conn, RoommateMatching rm) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("rejectMatching");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, rm.getUserNo()); // 내게 매칭 신청한 사람
         pstmt.setString(2, rm.getUserNo2());  // 나
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 매칭 승인
   public int allowMathcing(Connection conn, RoommateMatching rm) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("allowMatching");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, rm.getUserNo()); // 내게 매칭 신청한 사람
         pstmt.setString(2, rm.getUserNo2());  // 나
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 로그인 유저의 성공 매칭 조회
   public ArrayList<RoommateMatching> selectRoommateMatchingAllowOne(Connection conn, String userNo) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<RoommateMatching> rmAllowMatchingList = new ArrayList<>();
      String sql = prop.getProperty("selectRoommateSuccessMatching");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setString(1, userNo); // 세팅
         pstmt.setString(2, userNo); // 세팅
         
         rset = pstmt.executeQuery(); // 조회
         
         while (rset.next()) {
            rmAllowMatchingList.add(new RoommateMatching(rset.getString(1),    
                                 rset.getString(2),  
                                 rset.getString(3),       
                                 rset.getString(4),      
                                 rset.getString(5)));    
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return rmAllowMatchingList;
   }
   
   // 썸네일 삭제용 dao
   public int deleteThumb(Connection conn, String userNo) {
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteThumb");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, userNo);
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      //System.out.println("dao : " + result);
      return result;
   }

   // 룸메이트 유저 업데이트용
   public int updateRoommateUserInfo(Connection conn, RoommateUser updateUser) {
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("updateRoommateUserInfo");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, updateUser.getrUserLocal());
         pstmt.setString(2, updateUser.getrUserIntro());
         pstmt.setString(3, updateUser.getRlivingType());
         pstmt.setString(4, updateUser.getRlivingTerm());
         pstmt.setString(5, updateUser.getrSnsAddress());
         pstmt.setString(6, updateUser.getrMoviInDate());
         pstmt.setString(7, updateUser.getRage());
         pstmt.setString(8, updateUser.getrUserNo());
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }

   // 찜 중복 확인
   public int getListCountKeepUser(Connection conn, String loginUserNO, String rUserNo) {
      
       int listCount = 0;
         PreparedStatement pstmt = null;
         //게시글의 갯수를 조회하는거라서 resultSet 필요
         ResultSet rset = null;
         String sql = prop.getProperty("getListKeepUserIdCheckCount");
         
         try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, loginUserNO);
            pstmt.setString(2, rUserNo);
            
            rset = pstmt.executeQuery();
              
            if (rset.next()) {
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

   // 댓글 추가
   public int insertReply(Connection conn, CommentReply cr) {
      PreparedStatement pstmt = null;
      int result = 0;
      String sql = prop.getProperty("insertReply");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, cr.getUser_no());
         pstmt.setInt(2, cr.getRef_bid());
         pstmt.setString(3, cr.getContent());
         pstmt.setString(4, cr.getUser_id());
         
         result = pstmt.executeUpdate();
         
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         close(pstmt);
      }
      
      return result;
   }

   // 해당 게시글에 대한 모든 댓글 가져오기
   public ArrayList<CommentReply> selectReplyList(Connection conn, int ref_bid) {
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      ArrayList<CommentReply> crList = new ArrayList<CommentReply>();
      String sql = prop.getProperty("selectReplyList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, ref_bid);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            crList.add(new CommentReply(rset.getInt(1),
                                 rset.getString(2),
                                 rset.getInt(3),
                                 rset.getString(4),
                                 rset.getDate(5),
                                 rset.getString(6)));
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return crList;
   }

   // 룸메이트 찜 삭제
   public int deleteJjim(Connection conn, RoommateJjim rj) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("deleteJjim");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         // 쿼리 세팅
         pstmt.setString(1, rj.getUsNo());
         pstmt.setString(2, rj.getUsNo2()); 
         
         // 쿼리수행
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }


}