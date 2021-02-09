package member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.service.MemberService;
import member.model.vo.Host;
import member.model.vo.User;

/**
 * Servlet implementation class InsertHostServlet
 */
//@WebServlet("/member/inserthost")
@WebServlet(name="InsertHostServlet", urlPatterns="/member/inserthost")

public class InsertHostServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertHostServlet() {
         super();
    }
 
   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      
      String userId = request.getParameter("userId");
      String userPwd = request.getParameter("userPwd");
      String userName = request.getParameter("userName");
      Date birth = Date.valueOf(request.getParameter("birth"));
      String userGender = request.getParameter("gender");
      String userEmail = request.getParameter("email");
      String userPhone = request.getParameter("phone");
      String bsnum = request.getParameter("bsnum");
      String bsname = request.getParameter("bsname");
      
      Host h = new Host(userId, userPwd, userName, birth, userGender, userEmail, userPhone, bsnum, bsname);
      System.out.println("h :" + h);
      
      int result = new MemberService().insertHMember(h);
      System.out.println("result : " + result);
      
      Host upHost = new Host(userId, userPwd);
      upHost = new MemberService().loginMember(upHost);
      
      if(result > 0) {
         request.getSession().setAttribute("msg", "회원가입이 완료되었습니다.");
         request.getSession().setAttribute("loginHost", upHost);
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