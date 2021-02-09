package roommate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateAttachment;
import roommate.model.vo.RoommateJjim;
import roommate.model.vo.RoommateMatching;
import roommate.model.vo.RoommatePay;
import roommate.model.vo.RoommateReport;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class Select
 */
@WebServlet("/select/roommateuserdata")
public class SelectRoommateUserDataServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectRoommateUserDataServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      User user = (User) request.getSession().getAttribute("loginUser");
      
      // 해당 회원 한명 조회
      RoommateUser ru = new RoommateService().selectRoommateUserOne(user.getUserNo());

      // 해당 회원 한명 썸네일 조회
      RoommateAttachment attOne = new RoommateService().selectRoommateAttaOne(user.getUserNo());
      
      // 해당 회원 신고 목록 조회
      ArrayList<RoommateReport> rp = new RoommateService().selectRoommateReportOne(user.getUserNo());
         
      // 해당 회원 찜 목록 조회
      ArrayList<RoommateJjim> rj = new RoommateService().selectRoommateJjimOne(user.getUserNo());
      
      // 해당 회원 결제 목록 조회
      ArrayList<RoommatePay> rpay = new RoommateService().selectRoommatePayOne(user.getUserNo());
      
      // 해당 회원 매칭 목록 조회 (내가 매칭 한 데이터)
      ArrayList<RoommateMatching> myRm = new RoommateService().selectRoommateMatchingOne(user.getUserNo());
      
      // 해당 회원 매칭 목록 조회(내가 매칭 당한 데이터)
      ArrayList<RoommateMatching> intoRm = new RoommateService().selectRoommateMatchingIntoOne(user.getUserNo());
      
      // 해당 회원 매칭 목록 조회(매칭 성공시 로그인 유저 기준)
      ArrayList<RoommateMatching> allowRm = new RoommateService().selectRoommateMatchingAllowOne(user.getUserNo());
      
      //System.out.println("intoRm : " + intoRm);
      
      if (ru != null) {
         request.setAttribute("ru", ru);
         request.setAttribute("attOne", attOne);
         request.setAttribute("rp", rp);
         request.setAttribute("rj", rj);
         request.setAttribute("rpay", rpay);
         request.setAttribute("myRm", myRm);
         request.setAttribute("intoRm", intoRm);
         request.setAttribute("allowRm", allowRm);
         RequestDispatcher view = request.getRequestDispatcher("/views/Roommate/rm_myPage.jsp");
         view.forward(request, response);
      } 
      
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}