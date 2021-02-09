package house.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import house.model.service.HouseService;
import house.model.vo.HostInfo;
import house.model.vo.HostPhoto;
import house.model.vo.HostRoom;
import member.model.vo.Host;

/**
 * Servlet implementation class SearchDetailServlet
 */
@WebServlet("/search/detail")
public class Sh_DetailServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sh_DetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
      String hNo = request.getParameter("shNo");
      
      HostInfo info = new HouseService().selectUpdateInfo(hNo);
	  ArrayList<HostPhoto> photo = new HouseService().selectUpdatePhoto(hNo); 
	  ArrayList<HostRoom> room = new HouseService().selectUpdateRoom(hNo);
	  
	  
	  //System.out.println("하우스번호 : " + hNo);
	  
	  String page= "";
		if(info != null & photo != null & room != null) {
			HttpSession session = request.getSession();
			session.setAttribute("info", info);
			
			request.setAttribute("info", info);
			request.setAttribute("photo", photo);
			request.setAttribute("room", room);
			page = "/views/House/search/sh_detail.jsp";
		}else {
			request.setAttribute("msg", "매물 수정 페이지 이동에 실패하였습니다.");
			page = "/views/common/errorPage.jsp";
		}
		request.getRequestDispatcher(page).forward(request,response);
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}