package roommate.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateAttachment;
import roommate.model.vo.RoommatePay;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class RoommateInsertPayServlet
 */
@WebServlet("/insert/rmpay")
public class RoommateInsertPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoommateInsertPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글 값 인코딩 처리
				request.setCharacterEncoding("UTF-8");
				
				// request에 담겨 있는 값을 꺼내서 변수에 저장 및 객체 생성 (결제항목, 결제금액, 임대인회원번호)
				
				// 결제항목 불러오기
				String ritem = request.getParameter("name");
				
				// 결제금액 불러오기
				String rprice = request.getParameter("amount");
			
				User user = (User) request.getSession().getAttribute("loginUser");
				
				RoommatePay rpay = new RoommatePay(user.getUserNo(), ritem, rprice);
				
				System.out.println("잘 넘어오는지 확인 : " + rpay);
				
				// 비즈니스 로직을 수행할 서비스 메소드 호출하고 결과 값 받기
				int result = new RoommateService().insertRmpay(rpay);
				
				System.out.println("인서트페이서블릿 result : " + result);
				
				ArrayList<RoommateUser> rulist = new ArrayList<RoommateUser>();
				ArrayList<RoommateAttachment> rmatlist = new RoommateService().selectAttachmentList();
				
				RoommateUser ru = new RoommateService().selectRoommateUserOne(user.getUserNo());
				rulist = new RoommateService().selectList(ru.getrUserResult());
				
				// 받은 결과에 따라 성공 / 실패 페이지 내보내기
				if(result > 0) {                           
					request.setAttribute("roommateAttachmentList", rmatlist); // 썸네일리스트
					request.setAttribute("roommateUserList", rulist); // 서베이 결과 같은 회원 리스트
				} else {
					request.setAttribute("msg", "결제에 실패하였습니다.");	
					request.setAttribute("roommateAttachmentList", rmatlist); // 썸네일리스트
					request.setAttribute("roommateUserList", rulist); // 서베이 결과 같은 회원 리스트
				}
		
				request.getRequestDispatcher("/views/Roommate/rm_userlist.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
