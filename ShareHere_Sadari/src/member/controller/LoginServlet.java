package member.controller;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import administrator.model.service.ADM_MemberService;
import administrator.model.service.ADM_SharehouseService;
import administrator.model.vo.RmReport;
import administrator.model.vo.ShReport;
import member.model.service.MemberService;
import member.model.vo.Admin;
import member.model.vo.Host;
import member.model.vo.User;
import mypage.model.service.MyPageService;
import mypage.model.vo.ResToday;

/**
 * Servlet implementation class LoginServlet
 */
//@WebServlet("/member/login")
@WebServlet(name="LoginServlet", urlPatterns="/member/login")

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
    }

	/** 
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("userId");
		String userPwd = request.getParameter("userPwd");
		String membertype = request.getParameter("mtype");
//		String user = request.getParameter("u");
//		String host = request.getParameter("h");
		
		System.out.println("request.getParameter(\"userId\") : " + request.getParameter("userId"));
		System.out.println("request.getParameter(\"userPwd\") : " + request.getParameter("userPwd"));
		
		
		
		// user선택했을 경우 로그인 로직
		if(membertype.charAt(0) == 'u') {

			User u = new User(userId, userPwd);

			User loginUser = new MemberService().loginMember(u);
			System.out.println("loginUser 값 : " + loginUser);

			if(loginUser != null) {
				
				String uno = loginUser.getUserNo();

				ArrayList<RmReport> raList = new ADM_MemberService().selectRrAlertMem(uno);
				//System.out.println("alert servlet에서 raList 확인 : " + raList);
				
				request.getSession().setAttribute("rmlist", raList);
				request.getSession().setAttribute("loginUser", loginUser);
				response.sendRedirect(request.getContextPath());
			}else {
//				request.setAttribute("msg", "일반회원 로그인에 실패하였습니다.");
//				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
				
				request.setAttribute("msg", "일치하는 정보가 없습니다.");
				request.getRequestDispatcher("/views/Login/login_Nnavi.jsp").forward(request, response);
			}
			
			
			// host 로그인 로직
		}else if(membertype.charAt(0) == 'h'){
			Host h = new Host(userId, userPwd);

			System.out.println("값 넘기기 : " + h);
			Host loginHost = new MemberService().loginMember(h);
			System.out.println("loginHost 최종값 : " + loginHost);

			if(loginHost != null) {
				
				String hno = loginHost.getHst_no();
				
				ArrayList<ShReport> shList = new ADM_SharehouseService().selectShAlertMem(hno);
				
				//YJ 
				ArrayList<ResToday> resToday = new MyPageService().selectResToday(hno);
				
				SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd");
				ArrayList<ResToday> rt = new ArrayList();
				Date currentTime = new Date ();
				String mTime = sdf.format ( currentTime );
				String mToday = "";
				
				if(resToday != null) {
					for(int i = 0; i < resToday.size(); i++) {
						mToday = sdf.format(resToday.get(i).getShRVdate());
					}
				}
				
				if(mToday.equals(currentTime)) {
					rt.addAll(resToday);
				}
				
				
				System.out.println("servletRt : " + rt);
				
				request.getSession().setAttribute("resToday", resToday);
				request.getSession().setAttribute("rt", rt);
				request.getSession().setAttribute("shlist", shList);
				request.getSession().setAttribute("loginHost", loginHost);
				response.sendRedirect(request.getContextPath());
			}else {
				/*원본
				request.setAttribute("msg", "호스트 로그인에 실패하였습니다.");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
				*/
				
				
				request.setAttribute("msg", "일치하는 정보가 없습니다.");
				request.getRequestDispatcher("/views/Login/login_Nnavi.jsp").forward(request, response);
			}

			
			// admin 로그인 로직
		}else if(membertype.charAt(0) == 'a'){
			Admin a = new Admin(userId, userPwd);
			System.out.println("값 넘기기 : " + a);
			
			Admin loginAdmin = new MemberService().loginMember(a);
			System.out.println("loginAdmin 값 : " + loginAdmin);

			if(loginAdmin != null) {
				request.getSession().setAttribute("loginAdmin", loginAdmin);
				response.sendRedirect(request.getContextPath());
			}else {
				request.setAttribute("msg", "로그인에 실패하였습니다.");
				request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
			}
			
		}else {
			request.setAttribute("msg", "일치하는 정보가 없습니다.");
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
