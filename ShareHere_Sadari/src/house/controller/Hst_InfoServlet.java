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
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.MyFileRenamePolicy;
import house.model.service.HouseService;
import house.model.vo.HostInfo;
import house.model.vo.HostPhoto;
import house.model.vo.HostRoom;
import member.model.vo.Host;

/**
 * Servlet implementation class hst_InfoServlet
 */
@WebServlet("/hst/info")
public class Hst_InfoServlet extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Hst_InfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      

      // enctype이 multipart/form-data로 전송되었는지 확인
      if (ServletFileUpload.isMultipartContent(request)) {
         // 전송 파일 용량 제한 : 100Mbyte로 제한
         int maxSize = 1024 * 1024 * 100;

         // 웹 서버 컨테이너 경로 추출
         String root = request.getSession().getServletContext().getRealPath("/");
         System.out.println("root : " + root);
         
         // 파일이 실제로 저장 될 경로
         String savePath = root + "resources//House//uploadHouseImg//";
         
         // HttpServletRequest --> MultipartRequest 변경
         //MultipartRequest multiRequest = new MultipartRequest(request, savePath, 
         //      maxSize, "UTF-8", new DefaultFileRenamePolicy());
         
         // 위의 MultipareRequest 객체 생성과 동시에  업로드한 파일들이 서버에 업로드 된다
         // 즉, 이후 프로세스에 문제가 있던 없던 우선 서버에 업로드가 되므로 
         // 추후에 프로세스에서 문제가 생길 경우 업로드 된 파일을 삭제할 것
         
         // DefaultFileRenamePolicy는 cos.jar가 제공하는 클래스로
         // 사용자가 올린 파일명을 그대로 저장할 경우 이전 파일을 엎어쓰거나
         // 한글 파일명 특수 기호 띄어쓰기 등은 서버에 문제가 생길 수 있어
         // 파일명을 수정하여 저장하는 것이 일반적
         
         // DefaultFileRenamePolicy는 cos.jar가 제공하는 클래스로
         // 같은 파일명이 있을 경우 파일명 뒤에 카운팅 된 숫자를 붙여줌
         // user.png -> user1.png -> user2.png
         
         MultipartRequest multiRequest = new MultipartRequest(request, savePath, 
               maxSize, "UTF-8", new MyFileRenamePolicy());
         // multipartRequest 객체가 생성되는 순간 전달된 매개변수에 맞게
         // (MyFileRenamePolicy에서 정의한 파일 리네임 규칙, 저장 경로, 용량 제한 등)
         // 파일이 서버에 저장됨
         
         
         // DB의 SH_INFO, SH_PHOTO, SH_ROOM에 데이터 저장
         
         // <SH_PHOTO>
         // DB에 저장하기 위해 change_name과 origin_name 각각의 리스트를 만들어 주는 작업
         // 다중 파일을 묶어서 업로드하기에 컬렉션을 사용
         
         // 전송 된 파일의 원래 이름을 저장할 리스트
         ArrayList<String> originFiles = new ArrayList<String>();
         // 전송 된 파일의 리네임 된 이름(실제 저장 된 이름)을 저장할 리스트
         ArrayList<String> changeFiles = new ArrayList<String>();
         
         // multipartRequest로부터 파일에 관한 정보 추출
         // Enumeration은 Iterator의 자바 초기 버전
         // input type ="file" 엘리먼트의 name 속성값 -> getFileNames()
         Enumeration<String> files = multiRequest.getFileNames();
         
         // String name = files.nextElement();
         ArrayList<HostPhoto> photoList = new ArrayList<>();
         
         while(files.hasMoreElements()) {
            String name = files.nextElement();
            // System.out.println("while name: " + name);
   
            HostPhoto hp = new HostPhoto();
            
            // 파일이 null이 아닌 경우(input 태그에 파일이 첨부되어서 넘어온 경우)
            if(multiRequest.getFilesystemName(name) != null) {
               // getFilesystemName("name속성값")
               // -> MyRenamePolicy의 rename 메소드에서 작성한 대로 rename 된 파일
               changeFiles.add(multiRequest.getFilesystemName(name));
               // getOriginalFileName("name속성값")
               // -> 실제 사용자가 업로드 할 떄의 파일명
               originFiles.add(multiRequest.getOriginalFileName(name));   
            }    
            
            hp.setShIpath("/resources/House/uploadHouseImg/");
            int i = originFiles.size() - 1;
            if(i >= 0) {
               System.out.println(i);
               System.out.println(originFiles.get(i));
               hp.setShIname(originFiles.get(i));
               hp.setShChName(changeFiles.get(i));
               
               System.out.println("name : " + name);
               if(name.equals("thumbnailImg")) {
                   hp.setShItype("T");
                }else if(name.equals("shareImg")) {
                   hp.setShItype("S");
                }else if(name.equals("amenImg")) {
                   hp.setShItype("A");
                }else if(name.equals("etcImg")) {
                   hp.setShItype("E");
                }else if(name.equals("roomImg")){
                   hp.setShItype("R");
                }else {
                	hp.setShItype("RI");
                }
               //System.out.println(hp.getShItype());
            }
            i--;
            //System.out.println("hp: " + hp);
            photoList.add(hp);
            //System.out.println("while photoList"+ photoList);
         }
         
//         System.out.println("사진경로" + savePath);
         
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
         
		 //Host loginHost = (Host) request.getSession().getAttribute("loginHost");
		 //String hstNo = loginHost.getHst_no();
         String hstNo = multiRequest.getParameter("hId");
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
         
         HostInfo info = new HostInfo(shTitle, shType, shStr, shArea, shFloor, shIntro,
                 shPers, shComs, shSs, shAddress, shLa, shLo, shBank,
                 shMart, shParmacy, shSubway, shCafe, shStore, hstNo);
           System.out.println("등록 후 값 넘어오는지 확인 : " + info);
         
         // Room
         ArrayList<HostRoom> RoomList = new ArrayList<>();
         //Enumeration params = multiRequest.getParameterNames();
          
          String[] shRname = multiRequest.getParameterValues("shRname");
          String[] shRtype = multiRequest.getParameterValues("shRtype");
          String[] shGender = multiRequest.getParameterValues("shGender");
          String[] shRarea = multiRequest.getParameterValues("shRarea");
          String[] shDeposit = multiRequest.getParameterValues("shDeposit");
          String[] shAdmcost = multiRequest.getParameterValues("shAdmcost");
          String[] shMonthly = multiRequest.getParameterValues("shMonthly");
          String[] shRdate = multiRequest.getParameterValues("shRdate");
          String[] shCapacity = multiRequest.getParameterValues("shCapacity");
          
          
//          Enumeration<String> fileRoom = multiRequest.getFileNames();
//          ArrayList<String> roomOrigin = new ArrayList<String>();
//          ArrayList<String> roomChange = new ArrayList<String>();
//          
//          while(fileRoom.hasMoreElements()) {
//             String name = fileRoom.nextElement();
//             if(multiRequest.getFilesystemName(name) != null) {
//                roomOrigin .add(multiRequest.getOriginalFileName(name));
//                roomChange.add(multiRequest.getFilesystemName(name));
//             }
//          }
         
          //int p = roomOrigin.size() - 1;
          for(int i = 0; i < shRname.length; i++) {
             HostRoom hp = new HostRoom();
             
             String name = shRname[i];;
             String type = shRtype[i];
             String gender = shGender[i];
             String area = shRarea[i];
             String deposit = shDeposit[i];
             String admcost = shAdmcost[i];
             String monthly = shMonthly[i];
             Date date = Date.valueOf(shRdate[i]);
             int cap = Integer.parseInt(shCapacity[i]);
             
             hp.setShRname(name);
             hp.setShRtype(type);
             hp.setShGender(gender);
             hp.setShRarea(area);
             hp.setShDeposit(deposit);
             hp.setShAdmcost(admcost);
             hp.setShMonthly(monthly);
             hp.setShRdate(date);
             hp.setShCapacity(cap);
            // hp.setShRImgPath("/resources/uploadRoomImg/");
             
             
//             System.out.println("size : " + p);
//             if(p >= 0){
//                System.out.println("P : " + p);
//                System.out.println("RoomOrigin.get(p) : " + roomOrigin.get(p));
//                hp.setShRImg(roomOrigin .get(p));
//                hp.setShRImgCh(roomChange.get(p));
//             }
             // System.out.println(hp);
             //p--;
             RoomList.add(hp);
            System.out.println("RoomList"+ RoomList);
          }


         // 비즈니스 로직을 처리할 서비스 요청
         int result = new HouseService().insertInfo(info, photoList, RoomList);
         // System.out.println(photoList);
         
         if(result > 0) {
        	 // 하우스 정보로 요청
             request.getSession().setAttribute("msg", "매물이 등록되었습니다.");
              response.sendRedirect(request.getContextPath() + "/hst/confirm");
         }else {
            // 실패 시 저장 된 사진 삭제
            for(int i = 0; i < changeFiles.size(); i++) {
               // 서버에 저장 된 이름 목록을 통해 반복문을 수행하면서
               File failedFile = new File(savePath + changeFiles.get(i));
               failedFile.delete();
              
//               File failedFile2 = new File(root + "resources\\uploadRoomImg\\" + changeFiles.get(i));
//               failedFile.delete();

            }
            request.setAttribute("msg", "HOUSE 매물 등록에 실패하였습니다.");
            request.getRequestDispatcher("/views/common/errorPage.jsp").forward(request, response);
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