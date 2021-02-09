package member.model.vo;

import java.sql.Date;

public class User  {
/*
		US_NO	VARCHAR2(15 BYTE)
		US_PWD	VARCHAR2(20 BYTE)
		US_NAME	VARCHAR2(20 BYTE)
		US_BIRTH	DATE
		US_GENDER	VARCHAR2(5 BYTE)
		US_EMAIL	VARCHAR2(30 BYTE)
		US_PHONE	NUMBER
		US_ACT	VARCHAR2(1 BYTE)
		US_STOP	DATE 
 */
	
	private String userNo;		// u || 시퀀스(user_no).nextval
	private String userId;
	private String userPwd;
	private String userName;	// 이름
	private Date userBirth;		// 생일 
	private String userGender;	// 성별 (M,F)
	private String userEmail;	// 이메일
	private String userPhone;	// 휴대전화번호
	private String userAct;		// Y,N,B (활동중,탈퇴,블랙리스트)
	private Date userStop;		// 탈퇴일 or null
	
	public User() {}
	
	

	// 로그인
	public User(String userId, String userPwd) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
	}

	// 회원 정보 찾기(아이디 폰 이메일)
	public User(String userId, String userEmail, String userPhone) {
		super();
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
	}
	
	// 미사용
//	public User(String userPwd, String userName, String userEmail, String userPhone) {
//		super();
//		this.userName = userName;
//		this.userPwd = userPwd;
//		this.userEmail = userEmail;
//		this.userPhone = userPhone;
//	}

	// 마이페이지 수정 UpdateMemberServlet
	public User(String userId, String userName, String userPwd, String userEmail, String userPhone) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
	}

	// 회원가입 값입력서블릿
	public User(String userId, String userPwd, String userName, Date userBirth, String userGender, String userEmail,
			String userPhone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
	}



	// 로그인 dao
	public User(String userNo, String userId, String userPwd, String userName, Date userBirth, String userGender,
			String userEmail, String userPhone, String userAct, Date userStop) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.userGender = userGender;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userAct = userAct;
		this.userStop = userStop;
	}




	public String getUserNo() {
		return userNo;
	}
	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public Date getUserBirth() {
		return userBirth;
	}
	public void setUserBirth(Date userBirth) {
		this.userBirth = userBirth;
	}
	public String getUserGender() {
		return userGender;
	}
	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserAct() {
		return userAct;
	}
	public void setUserAct(String userAct) {
		this.userAct = userAct;
	}
	public Date getUserStop() {
		return userStop;
	}
	public void setUserStop(Date userStop) {
		this.userStop = userStop;
	}
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", userGender=" + userGender + ", userEmail=" + userEmail
				+ ", userPhone=" + userPhone + ", userAct=" + userAct + ", userStop=" + userStop + "]";
	}
	
	
}
