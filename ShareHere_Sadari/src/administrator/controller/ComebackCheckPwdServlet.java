package administrator.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import administrator.model.service.ADM_MemberService;
import administrator.model.service.ADM_SharehouseService;
import member.model.vo.Admin;
import administrator.model.vo.Outmember;
import administrator.model.vo.PageInfoForDS;
import administrator.model.vo.PageInfoForOut;
import administrator.model.vo.Sharehouse;

/**
 * Servlet implementation class ComebackCheckPwdServlet
 */
@WebServlet("/comeback/checkpwd")
public class ComebackCheckPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComebackCheckPwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Admin loginAdm = (Admin)session.getAttribute("loginAdmin");
		//System.out.println("ComebackCheckPWDServlet 안에서의 loginAdmin : " + loginAdm);
		String admPwd =loginAdm.getAdm_pwd();
		//ArrayList<Outmember> list = new ADM_MemberService().selectOutList();
		//ArrayList<Sharehouse> hList = new ADM_SharehouseService().selectDelList();
		
		String[] twoList = null;
		String[] twoHouseList = null;
	
		twoList = request.getParameterValues("twoList");
		twoHouseList = request.getParameterValues("twoHouseList");
		
		if(twoList != null) {
			String twoList2 = "";
			
			if(twoList != null) 
				twoList2 = String.join(", ", twoList);
			
				int currentPage = 1;
				
				ADM_MemberService ms = new ADM_MemberService();
				
				int listCount = ms.getOutListCount(); // 일반회원 총 인원 수
				
				int pageLimit = 10;
				int omLimit = 10;
				int maxPage;
				int startPage;
				int endPage;
				
				maxPage = (int)Math.ceil((double)listCount/omLimit);
				startPage = (currentPage -1 ) / pageLimit * pageLimit + 1;
				endPage = startPage + pageLimit - 1;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				PageInfoForOut pi = new PageInfoForOut(currentPage, listCount, pageLimit, omLimit,
						maxPage, startPage, endPage);
				
				ArrayList<Outmember> list = ms.selectOutList(pi);
				
//				System.out.println("로그인 되어있는 admin :" + admPwd);
//				System.out.println("checkPwd 서블렛에서 다시 outmemList로 보내는 list :" + list);
//				System.out.println("checkPwd 서블렛으로 넘어온 twoList : " + twoList2);
				
				request.setAttribute("twoList2", twoList2);
				request.setAttribute("admPwd", admPwd);
				//request.setAttribute("list", list);
				request.setAttribute("pi", pi);
				request.setAttribute("list", list);
				
				RequestDispatcher view = request.getRequestDispatcher("/views/admin/admin_outmemList.jsp");
				view.forward(request, response);
		} else {
			String twoHouseList2 = "";
			
			if(twoHouseList != null) 
				twoHouseList2 = String.join(", ", twoHouseList);
			
			int currentPage = 1;
			
			if(request.getParameter("currentPage")!=null) {
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
			
			ADM_SharehouseService ss = new ADM_SharehouseService();
			
			int listCount = ss.getDSListCount(); // 일반회원 총 인원 수
			
			int pageLimit = 10;
			int dsLimit = 10;
			int maxPage;
			int startPage;
			int endPage;
			
			maxPage = (int)Math.ceil((double)listCount/dsLimit);
			startPage = (currentPage -1 ) / pageLimit * pageLimit + 1;
			endPage = startPage + pageLimit - 1;
			
			if(maxPage < endPage) {
				endPage = maxPage;
			}
			
			PageInfoForDS pi = new PageInfoForDS(currentPage, listCount, pageLimit, dsLimit,
					maxPage, startPage, endPage);
			
			ArrayList<Sharehouse> hList = ss.selectDSList(pi);

//			ArrayList<Sharehouse> hList = new ADM_SharehouseService().selectDelList();
			
//			System.out.println("로그인 되어있는 admin :" + admPwd);
//			System.out.println("checkPwd 서블렛에서 다시 delShareHouseList로 보내는 hList :" + hList);
//			System.out.println("checkPwd 서블렛으로 넘어온 twoHouseList : " + twoHouseList2);
			
			request.setAttribute("twoHouseList2", twoHouseList2);
			request.setAttribute("admPwd", admPwd);
			request.setAttribute("hList", hList);
			request.setAttribute("pi", pi);
			request.setAttribute("hList", hList);
			
			RequestDispatcher view = request.getRequestDispatcher("/views/admin/admin_delShareHouseList.jsp");
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
