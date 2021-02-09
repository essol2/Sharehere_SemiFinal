package member.model.dao;

import java.util.Date;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import member.controller.FindPwdToMail;
import member.model.vo.RandomPassword;

/**
* J2SDK 1.4 이상에서 동작, String class의 replaceAll메소드 사용.
*/

public class HTMLMailSenderU {
	
	/*
   private String to;			// 받는사람
   private String name;			// 받는사람 이름
   private String temPwd;		// 임시 비번
   private boolean istext;		// 텍스트 메일의 경우 true, html형식일경우 false
   
   // 받는사람 이메일, 받는사람이름, 임시비번, false
   public HTMLMailSenderU(String to, String name, String temPwd, boolean istext){
	   this.to = to;					// 받는사람
	   this.name = name;				// 받는사람  이름
	   this.temPwd = temPwd;			// 임시 비번
	   this.istext = istext;			// 텍스트 메일의 경우 true, html형식일경우 false
	   
   }
	 */
	public HTMLMailSenderU() {}
   /**
    * 메일을 전송한다.
    * @return 메일을 성공적으로 전송하였을 경우 true, 그렇지 않을 경우 false
    */
   
   // (String to, String name, String temPwd, boolean istext)
   // 받는사람 이메일, null, 받는사람이름, 임시비번, false
	
   public boolean send(String to, String name, String temPwd, boolean istext){
	   // Properties props = new Properties();
	   System.out.println("to, name : " + to + ", " + name);
	   System.out.println("HTMLMailSender 전달받은 pwd : " + temPwd);
	   
	   Properties props = System.getProperties(); // 정보를 담기 위한 객체 생성 
	   props.put("mail.smtp.host", "smtp.gmail.com"); 
	   props.put("mail.smtp.port", 465); 
	   props.put("mail.smtp.auth", "true"); 
	   props.put("mail.smtp.ssl.enable", "true"); 
	   props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); 

	   String subject = "Sherehere 임시비밀번호 입니다."; // 이메일 제목
	   
	   String senderEId = "sherehere453";		// 보내는 이메일 아이디 @nave.com은 입력하지 마시구요. 
	   String senderEPwd = "sadari452";			// 이메일 비밀번호
	   // 이메일 내용 (예지님)
	   String msg = 				
			   "  <body class=\"\" style=\"background-color: #f6f6f6; font-family: sans-serif; -webkit-font-smoothing: antialiased; font-size: 14px; line-height: 1.4; margin: 0; padding: 0; -ms-text-size-adjust: 100%; -webkit-text-size-adjust: 100%;\">\r\n" + 
			   "    <span class=\"preheader\" style=\"color: transparent; display: none; height: 0; max-height: 0; max-width: 0; opacity: 0; overflow: hidden; mso-hide: all; visibility: hidden; width: 0;\">This is preheader text. Some clients will show this text as a preview.</span>\r\n" + 
			   "    <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"body\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background-color: #f6f6f6;\">\r\n" + 
			   "      <tr>\r\n" + 
			   "        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>\r\n" + 
			   "        <td class=\"container\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; display: block; Margin: 0 auto; max-width: 580px; padding: 10px; width: 580px;\">\r\n" + 
			   "\r\n" + 
			   "\r\n" + 
			   "            <!-- START CENTERED WHITE CONTAINER -->\r\n" + 
			   "            <table class=\"main\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; background: #ffffff; border-radius: 3px;\">\r\n" + 
			   "\r\n" + 
			   "              <!-- START MAIN CONTENT AREA -->\r\n" + 
			   "              <tr>\r\n" + 
			   "                <td class=\"wrapper\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; box-sizing: border-box; padding: 20px;\">\r\n" + 
			   "                  <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n" + 
			   // 이미지
//			   "                    <tr><th><img src=\"https://imgur.com/a/VnwceKL\" alt=\"ShereHereLogo\"></th></tr>\r\n" + 
//			   "                    <tr><th><img src=\"https://imgur.com/eYpdvAh\" alt=\"ShereHereLogo\"></th></tr>\r\n" + 
//			   "                    <tr><th><a href=\"http://localhost:8667/SDR_ShareHere/\"><img src=\"https://i.ibb.co/php3bG8/nlogo.png\" alt=\"nlogo\" border=\"0\"></a></th></tr>\r\n" + 
			   "                    <tr><th><a href=\"http://localhost:8667/SDR_ShareHere/\"><img src=\"https://i.ibb.co/41xjK9G/nlogo.png\" alt=\"nlogo\" border=\"0\"></a></th></tr>\r\n" + 
			   "                    <tr>\r\n" + 
			   "                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">\r\n" + 
			   //받는사람 이름
			   "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">" + name + "님</p>\r\n" + 
			   "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">저희 ShereHere를 이용해주셔서 감사합니다.</p>\r\n" + 
			   "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">임시비밀번호는 아래와 같습니다.</p>\r\n" + 
			   "                        <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"btn btn-primary\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%; box-sizing: border-box;\">\r\n" + 
			   "                          <tbody>\r\n" + 
			   "                            <tr>\r\n" + 
			   "                              <td align=\"left\" style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; padding-bottom: 15px;\">\r\n" + 
			   "                                <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: auto;\">\r\n" + 
			   "                                  <tbody>\r\n" + 
			   "                                    <tr>\r\n" + 
			   "                                      <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top; background-color: #3498db; border-radius: 5px; text-align: center;\"> \r\n" + 
			   // 클릭하면 우리 사이트, 임시비번
			   "                                        <a href=\"http://localhost:8667/SDR_ShareHere/views/Login/login_Nnavi.jsp\" target=\"_blank\" style=\"display: inline-block; color: #ffffff; background-color: #000000; border: solid 1px #717577; border-radius: 5px; box-sizing: border-box; cursor: pointer; text-decoration: none; font-size: 14px; font-weight: bold; margin: 0; padding: 12px 25px; border-color: #6d6f70;\">" + " "+ temPwd + "\r\n" + 
			   "                                        </a> \r\n" + 
			   "                                    </td>\r\n" + 
			   "                                    </tr>\r\n" + 
			   "                                  </tbody>\r\n" + 
			   "                                </table>\r\n" + 
			   "                              </td>\r\n" + 
			   "                            </tr>\r\n" + 
			   "                          </tbody>\r\n" + 
			   "                        </table>\r\n" + 
			   "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">발급 받은 임시 비밀번호는 신속히 변경해주시기 바랍니다.</p>\r\n" + 
			   "                        <p style=\"font-family: sans-serif; font-size: 14px; font-weight: normal; margin: 0; Margin-bottom: 15px;\">오늘도 좋은 하루 되세요! (*´▽`*)</p>\r\n" + 
			   "                      </td>\r\n" + 
			   "                    </tr>\r\n" + 
			   "                  </table>\r\n" + 
			   "                </td>\r\n" + 
			   "              </tr>\r\n" + 
			   "\r\n" + 
			   "            <!-- END MAIN CONTENT AREA -->\r\n" + 
			   "            </table>\r\n" + 
			   "\r\n" + 
			   "            <!-- START FOOTER -->\r\n" + 
			   "\r\n" + 
			   "              <table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" style=\"border-collapse: separate; mso-table-lspace: 0pt; mso-table-rspace: 0pt; width: 100%;\">\r\n" + 
			   "                <tr>\r\n" + 
			   "                  <td class=\"content-block\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: center;\">\r\n" + 
			   "                    <span class=\"apple-link\" style=\"color: #999999; font-size: 12px; text-align: center;\">© Sadari Inc. 2020.</span>\r\n" + 
			   "                    <br>We link you and your house \r\n" + 
			   "                  </td>\r\n" + 
			   "                </tr>\r\n" + 
			   "                <tr>\r\n" + 
			   "                  <td class=\"content-block powered-by\" style=\"font-family: sans-serif; vertical-align: top; padding-bottom: 10px; padding-top: 10px; font-size: 12px; color: #999999; text-align: center;\">\r\n" + 
			   "                    Powered by <a href=\"http://localhost:8667/SDR_ShareHere/\" style=\"color: #999999; font-size: 12px; text-align: center; text-decoration: none;\">sharehere</a>.\r\n" + 
			   "                  </td>\r\n" + 
			   "                </tr>\r\n" + 
			   "              </table>\r\n" + 
			   "\r\n" + 
			   "            <!-- END FOOTER -->\r\n" + 
			   "\r\n" + 
			   "          <!-- END CENTERED WHITE CONTAINER -->\r\n" + 
			   "\r\n" + 
			   "        </td>\r\n" + 
			   "        <td style=\"font-family: sans-serif; font-size: 14px; vertical-align: top;\">&nbsp;</td>\r\n" + 
			   "      </tr>\r\n" + 
			   "    </table>\r\n" + 
			   "  </body>";
	   
	   // 자바 메일세션
	   Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(senderEId, senderEPwd); 
			} 
		});
 
      try {
         //  create a message
         Message message = new MimeMessage(session);		// 세션에 
         message.setFrom(new InternetAddress(senderEId));		// 보내는 사람
         message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
         message.setSubject(subject);
         message.setSentDate(new Date());
         

         if(!istext) {
            message.setContent(msg,"text/html; charset=euc-kr"); // HTML 형식
         }
         else {
            message.setText(msg); // TEXT 형식
         }
         Transport.send(message);

      } catch (MessagingException mex) {
    	  
         System.out.println("error msg :" + mex.toString());
         
         return false;
      }       
      return true;
   }

   
   
//   public static void main(String[] args) {
//	   String to, String name, String temPwd, boolean istext){
//	   new HTMLMailSenderU().send("jwko0704@gmail.com", "a@a#a4a", "aa!a@aAa!A~a#a$a%a^a&a*a", false);
//	   System.out.println();
//	   RandomPassword pwd = new RandomPassword();
//	   String testpwd = pwd.getRandomPassword(16);
//	   
//	   // (String to, String name, String temPwd, boolean istext)
//	   // 받는사람 이메일, null, 받는사람이름, 임시비번, false(html)
//	   HTMLMailSenderU sendMail = new HTMLMailSenderU(
//													   "jwko0704@gmail.com",
//													   "낚시왕",
//													   testpwd,
//													   false);
//      if(sendMail.send())
//         System.out.println("전송이 성공하였습니다.");
//      
//      else
//         System.out.println("전송이 실패하였습니다.");
//   }
}