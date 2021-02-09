package house.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import house.model.service.HouseService;
import house.model.vo.MainHouse;

/**
 * Servlet implementation class MainHouseServlet
 */
@WebServlet("/main/house")
public class MainHouseServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainHouseServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
   
      String mainhouse = request.getParameter("house");
      ArrayList<MainHouse> mainhouseList =  new HouseService().selectMainHouse(mainhouse);
      
      System.out.println("mainhouselist : " + mainhouseList);
      
      request.setAttribute("mainhouseList", mainhouseList);
      request.getRequestDispatcher("/views/House/search/mainhouse.jsp").forward(request, response);
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
      doGet(request, response);
   }

}