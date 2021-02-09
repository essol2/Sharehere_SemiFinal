package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.User;

/**
 * Servlet implementation class InsertUserServlet
 */
//@WebServlet("/member/insertuser")
@WebServlet(name="InsertUserServlet", urlPatterns="/member/insertuser")

public class InsertUserServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public InsertUserServlet() {
         super();
        // TODO Auto-generated constructor stub
    }

    // User 회원가입  
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      String userId = request.getParameter("userId");
      String userPwd = request.getParameter("userPwd");
      String userName = request.getParameter("userName");
      Date birth = Date.valueOf(request.getParameter("birth"));
      String userGender = request.getParameter("gender");
      String userEmail = request.getParameter("email");
      String userPhone = request.getParameter("phone");
      
      User u = new User(userId, userPwd, userName, birth, userGender, userEmail, userPhone);
//      System.out.println("u :" + u);
      
      int result = new MemberService().insertMember(u);
//      System.out.println("result : " + result);
      
      User user = new User(userId, userPwd);
      user = new MemberService().loginMember(user);
      
      
      if(result > 0) {
         request.getSession().setAttribute("msg", "회원가입이 완료되었습니다.");
         request.getSession().setAttribute("loginUser", user);      // 자동로그인
         response.sendRedirect(request.getContextPath());
      }else {
         request.setAttribute("msg", "회원가입에 실패하였습니다.");
         request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
      }
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      doGet(request, response);
   }

}