package member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.service.MemberService;
import member.model.vo.Host;
import member.model.vo.User;

/**
 * Servlet implementation class DeleteMemberServlet
 */
//@WebServlet("/member/delete")
@WebServlet(name="DeleteMemberServlet", urlPatterns="/member/delete")
public class DeleteMemberServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;

   /**
    * @see HttpServlet#HttpServlet()
    */
   public DeleteMemberServlet() {
      super();
      // TODO Auto-generated constructor stub
   }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // form 태그 안의 값 뽑아와서 하는 방식

      System.out.println("delete서블릿 실행 : " + request.getParameter("user_no"));
      if(request.getParameter("user_no").charAt(0) == 'u') {
         
         String userId = ((User)request.getSession().getAttribute("loginUser")).getUserId();
         String userPwd = request.getParameter("userPwd");
         User u = new User(userId, userPwd);
         
//         System.out.println("User 객체에 제대로 담겼나? 회원탈퇴 서블렛 : " + u);
         int result = new MemberService().deleteMember(u);
         
         
         if(result > 0) {
            // 회원 탈퇴에 성공한 경우 -> loginUser 지워주고 alert
            HttpSession session = request.getSession();
            session.removeAttribute("loginUser");   // 로그인 세션 정보 삭제
            session.setAttribute("msg", "회원탈퇴에 성공했습니다.");
            
            response.sendRedirect(request.getContextPath());
         }else {   // 실패 했다면
            request.setAttribute("result", "fail");
            RequestDispatcher view = request.getRequestDispatcher("/views/Mypage/mp_delete.jsp");
            view.forward(request, response);
         }
         
         
         // host 회원탈퇴
      }else {
         String userId = ((Host)request.getSession().getAttribute("loginHost")).getHst_id();
         String userPwd = request.getParameter("userPwd");
         Host h = new Host(userId, userPwd);
         
         System.out.println("Host 객체에 제대로 담겼나? 회원탈퇴 서블렛 : " + h);
         int result = new MemberService().deleteHMember(h);

         
         if(result > 0) {
            // 회원 탈퇴에 성공한 경우 -> loginHost 지워주고 alert
            HttpSession session = request.getSession();
            session.removeAttribute("loginHost");   // 로그인 세션 정보 삭제
            session.setAttribute("msg", "회원탈퇴에 성공했습니다.");
            
            response.sendRedirect(request.getContextPath());
         }else {   // 실패 했다면
            request.setAttribute("result", "fail");
            RequestDispatcher view = request.getRequestDispatcher("/views/Mypage/mp_delete.jsp");
            view.forward(request, response);
         }
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