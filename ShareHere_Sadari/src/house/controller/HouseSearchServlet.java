package house.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import house.model.service.HouseService;
import house.model.vo.Search;







/**
 * Servlet implementation class HouseSearchServlet
 */
@WebServlet("/house/search")
public class HouseSearchServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HouseSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // 넘어오는 값  필터값(shGender,hType,shRtype,shCapacity), 키워드값(search)
      //String gender = request.getParameter("shGender");       // 성별이 뭔지 뽑아냄 (room vo)
      //String htype = request.getParameter("hType");            // 주택유형이 뭔지 뽑아냄(house vo)
      //String rtype = request.getParameter("shRtype");         // 룸 형태가 뭔지 뽑아냄(room vo)
      //String capacity = request.getParameter("shCapacity");      // 수용인원이 몇명인지 뽑아냄(room vo)
      //String keyword = request.getParameter("search");         // 주소,지하철 키워드로 뽑아냄(house vo)
      
      // 1. 키워드로 검색 시 리스트 조회 (주소, 지하철 키워드)
      
      String keyword = request.getParameter("search");
      
         
      ArrayList<Search> keywordlist = new HouseService().selectKeywordList(keyword);
      
      System.out.println("키워드 : " + keyword);
      System.out.println("키워드 검색 결과  keywordlist: " + keywordlist);
      
      //검색어 미입력 시 
      if(keyword.isEmpty()) {
         request.setAttribute("msg", "검색어를 입력해주세요.");
         request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
         
      }
      // 검색 결과에 해당하는 페이지로 전송
      if(keywordlist.isEmpty()) {
         request.setAttribute("msg", "검색에 해당하는 하우스가 존재하지 않습니다.");
         request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
         
      } else {
         request.setAttribute("keywordlist", keywordlist);
         request.setAttribute("search",keyword);
         request.getRequestDispatcher("/views/House/search/sh_searchListView.jsp").forward(request, response);
      }
      
      
      /*   // 2. 필터로만 검색 시 리스트 조회 (성별 필터만 사용할 경우) 추후 구현
      String gender = request.getParameter("shGender");
      
      ArrayList<HostInfo> genderlist = new HouseService().selectGenderList(gender);
      //System.out.println("전체 하우스중 방타입이 남성전용인 하우스만 조회 : " + genderlist);   */
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}