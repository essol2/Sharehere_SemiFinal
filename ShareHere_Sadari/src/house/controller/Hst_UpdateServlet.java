package house.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;

import common.MyFileRenamePolicy;
import house.model.service.HouseService;
import house.model.vo.HostInfo;
import house.model.vo.HostPhoto;
import house.model.vo.HostRoom;
import member.model.vo.Host;

/**
 * Servlet implementation class Hst_UpdateServlet
 */
@WebServlet("/hst/update")
public class Hst_UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hst_UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		 
	      if (ServletFileUpload.isMultipartContent(request)) {
	        
	    	  
	         int maxSize = 1024 * 1024 * 100;

	         String root = request.getSession().getServletContext().getRealPath("/");
	         System.out.println("root : " + root);
	         
	         // 파일이 실제로 저장 될 경로
	         String savePath = root + "resources//House//uploadHouseImg//";
	         
	         
	         MultipartRequest multiRequest = new MultipartRequest(request, savePath, 
	               maxSize, "UTF-8", new MyFileRenamePolicy());
	      
	         // 하우스 번호
	         String shNo = multiRequest.getParameter("shno");

	         // input type ="file" 엘리먼트의 name 속성값 -> getFileNames()
	         Enumeration<String> files = multiRequest.getFileNames();
	         
	         
	         // 원래 사진 photo 세션 값
	         ArrayList<HostPhoto> photoList = (ArrayList<HostPhoto>) request.getSession().getAttribute("photo");
	         System.out.println("photoSession값 :" + photoList);
	         
	         //String name = files.nextElement();
	         
	         while(files.hasMoreElements()) {
	        	 String name = files.nextElement();
	        	 System.out.println("name : " + name);
	        	 
	        	 HostPhoto hp = null;
	        	 
	        	 if(multiRequest.getFilesystemName(name) != null) {
		        	 
	        		 hp = new HostPhoto();
		        	 
		        		switch(name) {
		        		case "thumbnailImg" :
		        			for(int p = 0; p < photoList.size(); p++) {
		        				if(photoList.get(p).getShItype().equals("T")) {
		        					photoList.get(p).setShI(photoList.get(p).getShI());
		        					photoList.get(p).setShIname(multiRequest.getOriginalFileName(name));
		        					photoList.get(p).setShChName(multiRequest.getFilesystemName(name));
		        					photoList.get(p).setShIpath("/resources/House/uploadHouseImg/");
		        					photoList.get(p).setShItype("T");
		        					photoList.get(p).setShNo(shNo);
		        				}
		        			}
		        			break;
		        		case "shareImg" :
		        			for(int p = 0; p < photoList.size(); p++) {
		        				if(photoList.get(p).getShItype().equals("S")) {
		        					photoList.get(p).setShI(photoList.get(p).getShI());
		        					photoList.get(p).setShIname(multiRequest.getOriginalFileName(name));
		        					photoList.get(p).setShChName(multiRequest.getFilesystemName(name));
		        					photoList.get(p).setShIpath("/resources/House/uploadHouseImg/");
		        					photoList.get(p).setShItype("S");
		        					photoList.get(p).setShNo(shNo);
		        				}
		        			}
		        			break;
		        		case "roomImg" :
		        			for(int p = 0; p < photoList.size(); p++) {
		        				if(photoList.get(p).getShItype().equals("R")) {
		        					photoList.get(p).setShI(photoList.get(p).getShI());
		        					photoList.get(p).setShIname(multiRequest.getOriginalFileName(name));
		        					photoList.get(p).setShChName(multiRequest.getFilesystemName(name));
		        					photoList.get(p).setShIpath("/resources/House/uploadHouseImg/");
		        					photoList.get(p).setShItype("R");
		        					photoList.get(p).setShNo(shNo);
		        				}
		        			}
		        			break;
		        		case "amenImg" :
		        			for(int p = 0; p < photoList.size(); p++) {
		        				if(photoList.get(p).getShItype().equals("A")) {
		        					photoList.get(p).setShI(photoList.get(p).getShI());
		        					photoList.get(p).setShIname(multiRequest.getOriginalFileName(name));
		        					photoList.get(p).setShChName(multiRequest.getFilesystemName(name));
		        					photoList.get(p).setShIpath("/resources/House/uploadHouseImg/");
		        					photoList.get(p).setShItype("A");
		        					photoList.get(p).setShNo(shNo);
		        				}
		        			}
		        			break;
		        		case "shRImg0" :
		        			for(int p = 0; p < photoList.size(); p++) {
		        				if(photoList.get(p).getShItype().equals("RI")) {
		        					photoList.get(p).setShI(photoList.get(p).getShI());
		        					photoList.get(p).setShIname(multiRequest.getOriginalFileName(name));
		        					photoList.get(p).setShChName(multiRequest.getFilesystemName(name));
		        					photoList.get(p).setShIpath("/resources/House/uploadHouseImg/");
		        					photoList.get(p).setShItype("RI");
		        					photoList.get(p).setShNo(shNo);
		        				}
		        			}
		        			break;
		        		case "shRImg1" :
		        			for(int p = 0; p < photoList.size(); p++) {
		        				if(photoList.get(p).getShItype().equals("RI")) {
		        					photoList.get(p).setShI(photoList.get(p).getShI());
		        					photoList.get(p).setShIname(multiRequest.getOriginalFileName(name));
		        					photoList.get(p).setShChName(multiRequest.getFilesystemName(name));
		        					photoList.get(p).setShIpath("/resources/House/uploadHouseImg/");
		        					photoList.get(p).setShItype("RI");
		        					photoList.get(p).setShNo(shNo);
		        				}
		        			}
		        			break;
		        		case "shRImg2" :
		        			for(int p = 0; p < photoList.size(); p++) {
		        				if(photoList.get(p).getShItype().equals("RI")) {
		        					photoList.get(p).setShI(photoList.get(p).getShI());
		        					photoList.get(p).setShIname(multiRequest.getOriginalFileName(name));
		        					photoList.get(p).setShChName(multiRequest.getFilesystemName(name));
		        					photoList.get(p).setShIpath("/resources/House/uploadHouseImg/");
		        					photoList.get(p).setShItype("RI");
		        					photoList.get(p).setShNo(shNo);
		        				}
		        			}
		        			break;
		        		case "shRImg3" :
		        			for(int p = 0; p < photoList.size(); p++) {
		        				if(photoList.get(p).getShItype().equals("RI")) {
		        					photoList.get(p).setShI(photoList.get(p).getShI());
		        					photoList.get(p).setShIname(multiRequest.getOriginalFileName(name));
		        					photoList.get(p).setShChName(multiRequest.getFilesystemName(name));
		        					photoList.get(p).setShIpath("/resources/House/uploadHouseImg/");
		        					photoList.get(p).setShItype("RI");
		        					photoList.get(p).setShNo(shNo);
		        				}
		        			}
		        			break;

	        				
		        				
		        			
		        		}
		        		
		        	 
	        		 //photoList.add(hp);
		         }
	         
	         }
	         System.out.println("photoList : "+ photoList);

	        
	    	  
	    	  // status, date
	    	  String shStatus = multiRequest.getParameter("shStatus");
	    	  Date shDate = Date.valueOf(multiRequest.getParameter("shDate"));
	         
	         // SH_INFO 테이블에 삽입할 내용 추출
	         String shTitle = multiRequest.getParameter("hName");
	         String shType = multiRequest.getParameter("hType");
	         String shStr = multiRequest.getParameter("hStructure");
	         String shArea = multiRequest.getParameter("hArea");
	         String shFloor = multiRequest.getParameter("hFloor");
	         
	         String shIntro = multiRequest.getParameter("hIntro");
	         String[] shPersArr = multiRequest.getParameterValues("hPers");
	         String[] shCommonArr = multiRequest.getParameterValues("hCommon");
	         String[] shServiceArr = multiRequest.getParameterValues("hService");
	         String[] shAddressArr = multiRequest.getParameterValues("hAddress");
	         String shLa = multiRequest.getParameter("la");
	         String shLo = multiRequest.getParameter("lo");
	         String[] shBankArr = multiRequest.getParameterValues("hBank");
	         String[] shMartArr = multiRequest.getParameterValues("hMart");
	         String[] shPhaArr = multiRequest.getParameterValues("hPha");
	         String[] shSubwayArr = multiRequest.getParameterValues("hSubway");
	         String[] shCafeArr = multiRequest.getParameterValues("hCafe");
	         String[] shConArr = multiRequest.getParameterValues("hCon");
	         
			 Host loginHost = (Host) request.getSession().getAttribute("loginHost");
			 String hstNo = loginHost.getHst_no();
	         //String hstNo = multiRequest.getParameter("hId");
	         System.out.println("hstNo :"+ hstNo);
	         
	         String shPers = "";
	         String shComs = "";
	         String shSs = "";
	         String shAddress = "";
	         String shBank = "";
	         String shMart = "";
	         String shParmacy = "";
	         String shSubway = "";
	         String shCafe = "";
	         String shStore = "";
	         
	         
	         if(shPersArr != null) 
	            shPers = String.join(",", shPersArr);
	         if(shCommonArr != null)
	            shComs = String.join(",", shCommonArr);
	         if(shServiceArr != null)
	            shSs = String.join(",", shServiceArr);
	         if(shAddressArr != null)
	            shAddress = String.join(",", shAddressArr);
	         if(shBankArr != null)
	            shBank = String.join(",", shBankArr);
	         if(shMartArr != null)
	            shMart = String.join(",", shMartArr);
	         if(shPhaArr != null)
	            shParmacy = String.join(",", shPhaArr);
	         if(shSubwayArr != null)
	            shSubway = String.join(",", shSubwayArr);
	         if(shCafeArr != null)
	            shCafe = String.join(",", shCafeArr);
	         if(shConArr != null)
	            shStore = String.join(",", shConArr);
	         
	         HostInfo info = new HostInfo(shNo, shTitle, shType, shStr, shArea, shFloor,
	         shIntro, shPers, shComs, shSs,  shAddress, shLa, shLo,
	         shBank, shMart, shParmacy, shSubway, shCafe, shStore,
	         shStatus, shDate, hstNo);
	           System.out.println("등록 후 값 넘어오는지 확인 : " + info);
	         
	         // Room
	         ArrayList<HostRoom> RoomList = new ArrayList<>();
	          
	          String[] shRno = multiRequest.getParameterValues("shRno");
	          String[] shRname = multiRequest.getParameterValues("shRname");
	          String[] shRtype = multiRequest.getParameterValues("shRtype");
	          String[] shGender = multiRequest.getParameterValues("shGender");
	          String[] shRarea = multiRequest.getParameterValues("shRarea");
	          String[] shDeposit = multiRequest.getParameterValues("shDeposit");
	          String[] shAdmcost = multiRequest.getParameterValues("shAdmcost");
	          String[] shMonthly = multiRequest.getParameterValues("shMonthly");
	          String[] shRdate = multiRequest.getParameterValues("shRdate");
	          String[] shCapacity = multiRequest.getParameterValues("shCapacity");
	          

	          for(int i = 0; i < shRno.length; i++) {
	        	  HostRoom hr = new HostRoom();
	             
	             String shRNo = shRno[i];
	             String Rname = shRname[i];
	             String type = shRtype[i];
	             String gender = shGender[i];
	             String area = shRarea[i];
	             String deposit = shDeposit[i];
	             String admcost = shAdmcost[i];
	             String monthly = shMonthly[i];
	             Date date = Date.valueOf(shRdate[i]);
	             int cap = Integer.parseInt(shCapacity[i]);
	             
	             hr.setShRno(shRNo);
	             hr.setShRtype(type);
	             hr.setShGender(gender);
	             hr.setShRarea(area);
	             hr.setShDeposit(deposit);
	             hr.setShAdmcost(admcost);
	             hr.setShMonthly(monthly);
	             hr.setShRdate(date);
	             hr.setShCapacity(cap);
	             hr.setShRname(Rname);
	             hr.setShNo(shNo);

	             RoomList.add(hr);
	          }
	          System.out.println("RoomList"+ RoomList);

	         // 비즈니스 로직을 처리할 서비스 요청
	         int delete = new HouseService().deletePhoto(shNo);
	         int result = new HouseService().UpdateInfo(info, photoList, RoomList);
	         
	         if(result > 0) {
	        	 // 하우스 정보로 요청
	             request.getSession().setAttribute("msg", "매물이 수정되었습니다.");
	              response.sendRedirect(request.getContextPath() + "/hst/confirm");
	         }else {
	            // 실패 시 저장 된 사진 삭제
//	            for(int i = 0; i < changeFiles.size(); i++) {
//	               // 서버에 저장 된 이름 목록을 통해 반복문을 수행하면서
//	               File failedFile = new File(savePath + changeFiles.get(i));
//	               failedFile.delete();
//	            }
	            request.setAttribute("msg", "HOUSE 매물 수정에 실패하였습니다.");
	            request.getRequestDispatcher("/views/common/errorPageHost.jsp").forward(request, response);
	         }
	         
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
