package administrator.model.vo;

import java.sql.Date;

public class Usermember {
	/*
	 *  US_NO	VARCHAR2(15 BYTE)
		US_ID	VARCHAR2(15 BYTE)
		US_PWD	VARCHAR2(20 BYTE)
		US_NAME	VARCHAR2(20 BYTE)
		US_BIRTH	DATE
		US_GENDER	VARCHAR2(2 BYTE)
		US_EMAIL	VARCHAR2(30 BYTE)
		US_PHONE	VARCHAR2(30 BYTE)
		US_ACT	VARCHAR2(1 BYTE)
		US_STOP	DATE
	 * 
	 */
	
	private String us_no;
	private String us_id;
	private String us_pwd;
	private String us_name;
	private Date us_birth;
	private String us_gender;
	private String us_email;
	private String us_phone;
	private String us_act;
	private Date us_stop;
	
	public Usermember() {}
	
	public Usermember(String us_no, String us_id, String us_pwd, String us_name, Date us_birth, String us_gender,
			String us_email, String us_phone, String us_act, Date us_stop) {
		super();
		this.us_no = us_no;
		this.us_id = us_id;
		this.us_pwd = us_pwd;
		this.us_name = us_name;
		this.us_birth = us_birth;
		this.us_gender = us_gender;
		this.us_email = us_email;
		this.us_phone = us_phone;
		this.us_act = us_act;
		this.us_stop = us_stop;
	}
	
	/* 일반 회원 상세보기용*/
	public Usermember(String us_no, String us_id, String us_name, Date us_birth, String us_gender,
			String us_email, String us_phone, String us_act) {
		super();
		this.us_no = us_no;
		this.us_id = us_id;
		this.us_name = us_name;
		this.us_birth = us_birth;
		this.us_gender = us_gender;
		this.us_email = us_email;
		this.us_phone = us_phone;
		this.us_act = us_act;
	}
	
	/* 탈퇴 회원용 */
	public Usermember(String us_no, String us_id, String us_name, String us_email, String us_act, Date us_stop) {
		super();
		this.us_no = us_no;
		this.us_id = us_id;
		this.us_name = us_name;
		this.us_email = us_email;
		this.us_act = us_act;
		this.us_stop = us_stop;
	}

	public Usermember(String us_no, String us_id, String us_name, Date us_birth, String us_email) {
		super();
		this.us_no = us_no;
		this.us_id = us_id;
		this.us_name = us_name;
		this.us_birth = us_birth;
		this.us_email = us_email;
	}
	public String getUs_no() {
		return us_no;
	}
	public void setUs_no(String us_no) {
		this.us_no = us_no;
	}
	public String getUs_id() {
		return us_id;
	}
	public void setUs_id(String us_id) {
		this.us_id = us_id;
	}
	public String getUs_pwd() {
		return us_pwd;
	}
	public void setUs_pwd(String us_pwd) {
		this.us_pwd = us_pwd;
	}
	public String getUs_name() {
		return us_name;
	}
	public void setUs_name(String us_name) {
		this.us_name = us_name;
	}
	public Date getUs_birth() {
		return us_birth;
	}
	public void setUs_birth(Date us_birth) {
		this.us_birth = us_birth;
	}
	public String getUs_gender() {
		return us_gender;
	}
	public void setUs_gender(String us_gender) {
		this.us_gender = us_gender;
	}
	public String getUs_email() {
		return us_email;
	}
	public void setUs_email(String us_email) {
		this.us_email = us_email;
	}
	public String getUs_phone() {
		return us_phone;
	}
	public void setUs_phone(String us_phone) {
		this.us_phone = us_phone;
	}
	public String getUs_act() {
		return us_act;
	}
	public void setUs_act(String us_act) {
		this.us_act = us_act;
	}
	public Date getUs_stop() {
		return us_stop;
	}
	public void setUs_stop(Date us_stop) {
		this.us_stop = us_stop;
	}
	@Override
	public String toString() {
		return "Usermember [us_no=" + us_no + ", us_id=" + us_id + ", us_pwd=" + us_pwd + ", us_name=" + us_name
				+ ", us_birth=" + us_birth + ", us_gender=" + us_gender + ", us_email=" + us_email + ", us_phone="
				+ us_phone + ", us_act=" + us_act + ", us_stop=" + us_stop + "]";
	}
	
	
}
