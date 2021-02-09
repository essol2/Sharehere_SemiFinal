package roommate.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import member.model.service.MemberService;
import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class SurveyResult
 */
@WebServlet("/insert/survey/result")
public class InsertSurveyResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertSurveyResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		/*
		 * 
		<input type="hidden" name="local" value="<%=session.getAttribute("local")%>">
		<input type="hidden" name="survey" value="<%=session.getAttribute("survey")%>">
		<input type="hidden" name="userNo" value="<%=session.getAttribute("userNo")%>">
		<input type="hidden" name="userGender" value="<%=session.getAttribute("userGender")%>">
		<input type="hidden" name="livingTerm" value="<%=session.getAttribute("livingTerm")%>">
		<input type="hidden" name="moveInDate" value="<%=session.getAttribute("moveInDate")%>">
		<input type="hidden" name="livigTypeValue" value="<%=session.getAttribute("livigTypeValue")%>">
		<input type="hidden" name="age" value="<%=session.getAttribute("age")%>">
		<input type="hidden" name="payAmount" value="<%=session.getAttribute("payAmount")%>">
		 * 
		 * */
		
		String local = ((String)request.getSession().getAttribute("local"));
		String survey = ((String)request.getSession().getAttribute("survey"));
		String userNo = ((User)request.getSession().getAttribute("loginUser")).getUserNo();
		String userGender = ((User)request.getSession().getAttribute("loginUser")).getUserGender();
		String livingTerm = ((String)request.getSession().getAttribute("livingTerm"));
		String moveInDate = ((String)request.getSession().getAttribute("moveInDate"));
		String livigTypeValue = ((String)request.getSession().getAttribute("livigTypeValue"));
		String age = ((String)request.getSession().getAttribute("age"));
		String payAmount = ((String)request.getSession().getAttribute("payAmount"));
		String snsAddress = ((String)request.getSession().getAttribute("snsAddress"));
		String intro = request.getParameter("intro");
		
		RoommateUser ru = new RoommateUser(userNo, survey, local, intro, userGender, livigTypeValue, livingTerm, snsAddress, moveInDate, age);
		
		System.out.println(ru.toString());
		
		int result = new RoommateService().insertRoommateUser(ru);
		
		request.getSession().setAttribute("survey", survey);
		
		if (result > 0) {
			response.sendRedirect(request.getContextPath() + "/select/roommateuserlist");
		} else {
			request.setAttribute("msg", "룸메이트 등록에 실패하였습니다.");
			request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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
