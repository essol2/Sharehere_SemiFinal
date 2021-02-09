package roommate.controller;

import java.io.File;
import java.io.IOException;
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
import member.model.vo.User;
import roommate.model.service.RoommateService;
import roommate.model.vo.RoommateAttachment;
import roommate.model.vo.RoommateUser;

/**
 * Servlet implementation class InsertThumbnailServlet
 */
@WebServlet("/insert/thumbnail")
public class InsertThumbnailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertThumbnailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		User user = (User) request.getSession().getAttribute("loginUser");
		
		// String title = request.getParameter("title");
		// System.out.println("title : " + title);
		// -> form 전송 시 enctype 을 multipart/form-data로 전송하는 경우
		// 	    기존 방식으로 request.getParameter("name속성값")와 같이 값을 추출할 수 없음
		
		// com.orelilly.servlet의 약자로 cos.jar 라이브러리를 다운받아 사용해야 값 추출 가능 (WEB-INF > lib 폴더에 추가)
		// http://www.servlets.com
		
		// 1. enctype이 multipart/form-data로 전송 되었는지 확인
		if (ServletFileUpload.isMultipartContent(request)) {
			// 전송파일 용량제한 : 10Mbyte로 제한
			int maxSize = 1024*1024*10;
			
			// 웹 서버 컨테이너 경로 추출
			String root = request.getSession().getServletContext().getRealPath("/"); // WebContent
			System.out.println("root : " + root);
			
			// 파일이 실제로 저장 될 경로
			String savePath = root + "resources//roommate//img//uploadFiles//";
			
			// HttpServletRequest --> MultipartRequest 변경
			// MultipartRequest multiRequest = new MultipartRequest(request, savePath,
			// 		maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			// 위의 MultipartRequest 객체 생성과 동시에 업로드한 파일들이 서버에 업로드 된다.
			// 즉, 이후 프로세스에 문제가 있던 없던 우선 서버에 업로드가 되므로
			// 추후 프로세스에서 문제가 생길 경우 업로드 된 파일을 삭제할 것
			
			// 사용자가 올린 파일명을 그대로 저장할 경우 같은 파일명이 있을 경우 이전 파일을 덮어쓰거나
			// 한글 파일명 특수기호 띄어쓰기 등은 서버에 따라 문제가 생길 수 있어
			// 파일명을 수정하여 저장하는 것이 일반적
			
			// DefaultFileRenamePolicy는 cos.jar가 제공하는 클래스로
			// 같은 파일명이 있을 경우 파일명 뒤에 카운팅 된 숫자를 붙여줌
			// 만약, user.png를 저장하려고 했으나 같은 이름의 파일이 있다면 -> user1.png로 규칙을 정해 지어줌
			
			// DB에 저장
			MultipartRequest multiRequest = new MultipartRequest(request, savePath,
					maxSize, "UTF-8", new MyFileRenamePolicy());
			// multipartRequest 객체가 생성 되는 순간 전달 된 매개변수에 맞게
			// (MyFileRenamePloicy에서 정의한 파일 리네임 규칙, 저장 경로, 용량 제한 등)
			// 파일이 서버에 저장 됨
			
			// DB의 Board와 Attachment에 데이터 저장
			
			// DB에 저장하기 위해 change_name과 origin_name 각각의 리스트를 만들어주는 작업
			// 다중 파일을 묶어서 업로드하기에 컬렉션을 사용
			
			// 전송 된 파일의 원래 이름을 저장할 리스트
			String originFiles = "";
			// 전송 된 파일의 리네임 된 이름(실제 저장 된 이름)을 저장할 리스트
			String changeFiles = "";
			
			// multipartRequest로부터 파일에 관한 정보 추출
			// Enumeration은 Iterator의 자바 초기 버전
			// input type="file" 엘리먼트들의 name 속성값 -> getFileNames()
			Enumeration<String> files = multiRequest.getFileNames();
			
			while(files.hasMoreElements()) {
				String name = files.nextElement();
				System.out.println("name : " + name);
				
				// 파일이 null이 아닌 경우 (input 태그에 파일이 첨부되어서 넘어온 경우)
				if (multiRequest.getFilesystemName(name) != null) {
					// getFilesystemName("name속성값")
					// -> MyRenamePolicy의 rename 메소드에서 작성 한대로 rename된 파일명
					changeFiles = (multiRequest.getFilesystemName(name));
					
					// getOriginalFileName("name속성값")
					// -> 실제 사용자가 업로드 할 때의 파일명
					originFiles = (multiRequest.getOriginalFileName(name));
				}
			}
			
			// Attachment 테이블에 값 삽입을 위한 작업
			RoommateAttachment rmAt = new RoommateAttachment();
			// 1. 먼저 해당 회원의 정보 조회해와서 가져옴
			RoommateUser rmUser = new RoommateService().selectRoommateUserOne(user.getUserNo());
			
			// 2. 가져온 해당 회원에 아래 값 넣어줌
			rmAt.setrUserNo(user.getUserNo());
			rmAt.setImgPath("/resources/roommate/img/uploadFiles/");
			rmAt.setImgName(originFiles);
			rmAt.setImgChName(changeFiles);
	
			// 썸네일 insert
			int result = new RoommateService().insertThumbnail(rmAt);	
			
			if (result > 0) {
				// 목록으로 재요청
				request.getSession().setAttribute("msg", "프로필 등록 완료!");
				response.sendRedirect(request.getContextPath() + "/select/roommateuserdata");
			} else {
				// 실패시 저장 된 사진 삭제
				File failedFile = new File(savePath + changeFiles);
				failedFile.delete();	
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
