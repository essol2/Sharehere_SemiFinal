package roommate.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import member.model.vo.User;

/**
 * Servlet implementation class InsertIntroServlet
 */
@WebServlet("/roommate/insert/intro")
public class InsertIntroServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertIntroServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1. 한글 인코딩 처리
		request.setCharacterEncoding("UTF-8");
		
		// 2. 입력 데이터 처리

		
//        <form id="goIntroForm" action="<%= request.getContextPath() %>/roommate/insert/intro" method="post">
//        <input id="localString" name="localString" type="hidden">
//        <input id="surveyResult" name="surveyResult" type="hidden">
//        <input id="livigTypeValue" name="livigTypeValue" type="hidden">
//        <input id="payAmount" name="payAmount" type="hidden">
//        <input id="livingTerm" name="livingTerm" type="hidden">
//        <input id="moveInDate" name="moveInDate" type="hidden">
//        <input id="age" name="age" type="hidden">
//        <input id="snsAddress" name="snsAddress" type="hidden">              
//        </form>
        System.out.println("(User)request.getSession().getAttribute(\"loginUser\") : " + (User)request.getSession().getAttribute("loginUser") );
		String local = request.getParameter("localString");
		String survey = request.getParameter("surveyResult");
		String livigTypeValue = request.getParameter("livigTypeValue");
		String payAmount = request.getParameter("payAmount");
		String livingTerm = request.getParameter("livingTerm");
		String moveInDate = request.getParameter("moveInDate");
		String age = request.getParameter("age");
		String snsAddress = request.getParameter("snsAddress");
		String userNo = ((User)request.getSession().getAttribute("loginUser")).getUserNo();
		String userGender = ((User)request.getSession().getAttribute("loginUser")).getUserGender();
		
		System.out.println("local : " + local + " survey : " + survey + " userNo : " + userNo + " gender : " + userGender + " term : " + livingTerm  + " moveInDate : "  + moveInDate + " livingType : " + livigTypeValue + " sns : " + snsAddress + " age : " + age + " pay : " + payAmount);
		
		request.getSession().setAttribute("local", local);
		request.getSession().setAttribute("survey", survey);
		request.getSession().setAttribute("userNo", userNo);
		request.getSession().setAttribute("userGender", userGender);
		request.getSession().setAttribute("livingTerm", livingTerm);
		request.getSession().setAttribute("moveInDate", moveInDate);
		request.getSession().setAttribute("livigTypeValue", livigTypeValue);
		request.getSession().setAttribute("snsAddress", snsAddress);
		request.getSession().setAttribute("age", age);
		request.getSession().setAttribute("payAmount", payAmount);
		
		response.sendRedirect(request.getContextPath() + "/views/Roommate/rm_introPage.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
