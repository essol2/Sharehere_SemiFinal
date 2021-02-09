package member.model.dao;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

// 네이버일 경우 smtp.naver.com, port:587 을 입력합니다. //포트번호 네이버
// Google일 경우 smtp.gmail.com, port:465 을 입력합니다. //포트번호 구글
//  String host = "smtp.gmail.com"; int port = 465; 
//	String host = "smtp.naver.com"; int port = 587; 

public class MailSender {
	private String subject;		// 메일제목
	
	
	/*
	public static void main(String[] args) {
		MailSender("낚시왕", "1234", "jwko0704@gmail.com");
	}
	*/
	
	
	// 사용자 이름, 임시비밀번호, 이메일 매개변수로 전해주기.
	public static int MailSender(String name, String pwd, String recipient) {
		int result = 0;
		String senderEId = "sherehere452";		// 보내는 이메일 아이디 @nave.com은 입력하지 마시구요. 
		String senderEPwd = "sadari452";		// 이메일 비밀번호
		String subject = "Sherehere 임시 비밀번호 입니다."; // 메일 제목 
		
		String body = name + "님의 ShereHere 임시비밀번호는 "; //메일 내용 입력해주세요. 
		Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 
		
		// SMTP 서버 정보 설정 (Google)
		props.put("mail.smtp.host", "smtp.gmail.com"); 
		props.put("mail.smtp.port", 465); 
		props.put("mail.smtp.auth", "true"); 
		props.put("mail.smtp.ssl.enable", "true"); 
		props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); 
		
		//Session 생성 
		
		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(senderEId, senderEPwd); 
			} 
		});
		
		try {
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(senderEId));
			
			// 수신자 메일주소, 제목, 내용
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
			message.setSubject(subject);		// 메일 제목
			message.setText(body + pwd + " 입니다. 로그인하여 비밀번호를 바꿔주세요.");
			
			Transport.send(message);
			System.out.println("메일이 제대로 보내졌습니다.");
			result = 1;
		} catch (MessagingException e) {
			e.printStackTrace();
			return -1;
		}
		return result;
	}
}


