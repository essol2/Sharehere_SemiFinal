package administrator.model.vo;

import java.sql.Date;

public class Hostmember {
	/*
	 *  HST_NO	VARCHAR2(15 BYTE)
		HST_ID	VARCHAR2(15 BYTE)
		HST_PWD	VARCHAR2(20 BYTE)
		HST_NAME	VARCHAR2(10 BYTE)
		HST_BIRTH	DATE
		HST_GENDER	VARCHAR2(2 BYTE)
		HST_EMAIL	VARCHAR2(30 BYTE)
		HST_PHONE	VARCHAR2(30 BYTE)
		HST_BSNO	VARCHAR2(30 BYTE)
		HST_BSNAME	VARCHAR2(20 BYTE)
		HST_ACT	VARCHAR2(1 BYTE)
		HST_STOP	DATE
	 */
	private String hst_no;
	private String hst_id;
	private String hst_pwd;
	private String hst_name;
	private Date hst_birth;
	private String hst_gender;
	private String hst_email;
	private String hst_phone;
	private String hst_bsno;
	private String hst_bsname;
	private String hst_act;
	private Date hst_stop;
	
	
	public Hostmember() {}


	public Hostmember(String hst_no, String hst_id, String hst_pwd, String hst_name, Date hst_birth, String hst_gender,
			String hst_email, String hst_phone, String hst_bsno, String hst_bsname, String hst_act, Date hst_stop) {
		super();
		this.hst_no = hst_no;
		this.hst_id = hst_id;
		this.hst_pwd = hst_pwd;
		this.hst_name = hst_name;
		this.hst_birth = hst_birth;
		this.hst_gender = hst_gender;
		this.hst_email = hst_email;
		this.hst_phone = hst_phone;
		this.hst_bsno = hst_bsno;
		this.hst_bsname = hst_bsname;
		this.hst_act = hst_act;
		this.hst_stop = hst_stop;
	}

	// 상세페이 열람용
	public Hostmember(String hst_no, String hst_id, String hst_name, Date hst_birth, String hst_gender,
			String hst_email, String hst_phone, String hst_bsno, String hst_bsname, String hst_act) {
		super();
		this.hst_no = hst_no;
		this.hst_id = hst_id;
		this.hst_name = hst_name;
		this.hst_birth = hst_birth;
		this.hst_gender = hst_gender;
		this.hst_email = hst_email;
		this.hst_phone = hst_phone;
		this.hst_bsno = hst_bsno;
		this.hst_bsname = hst_bsname;
		this.hst_act = hst_act;
	}

	/* 탈퇴회원용 */
	public Hostmember(String hst_no, String hst_id, String hst_name, String hst_email, String hst_act, Date hst_stop) {
		super();
		this.hst_no = hst_no;
		this.hst_id = hst_id;
		this.hst_name = hst_name;
		this.hst_email = hst_email;
		this.hst_act = hst_act;
		this.hst_stop = hst_stop;
	}

	public Hostmember(String hst_no, String hst_id, String hst_name, String hst_bsno, String hst_bsname) {
		super();
		this.hst_no = hst_no;
		this.hst_id = hst_id;
		this.hst_name = hst_name;
		this.hst_bsno = hst_bsno;
		this.hst_bsname = hst_bsname;
	}


	public String getHst_no() {
		return hst_no;
	}


	public void setHst_no(String hst_no) {
		this.hst_no = hst_no;
	}


	public String getHst_id() {
		return hst_id;
	}


	public void setHst_id(String hst_id) {
		this.hst_id = hst_id;
	}


	public String getHst_pwd() {
		return hst_pwd;
	}


	public void setHst_pwd(String hst_pwd) {
		this.hst_pwd = hst_pwd;
	}


	public String getHst_name() {
		return hst_name;
	}


	public void setHst_name(String hst_name) {
		this.hst_name = hst_name;
	}


	public Date getHst_birth() {
		return hst_birth;
	}


	public void setHst_birth(Date hst_birth) {
		this.hst_birth = hst_birth;
	}


	public String getHst_gender() {
		return hst_gender;
	}


	public void setHst_gender(String hst_gender) {
		this.hst_gender = hst_gender;
	}


	public String getHst_email() {
		return hst_email;
	}


	public void setHst_email(String hst_email) {
		this.hst_email = hst_email;
	}


	public String getHst_phone() {
		return hst_phone;
	}


	public void setHst_phone(String hst_phone) {
		this.hst_phone = hst_phone;
	}


	public String getHst_bsno() {
		return hst_bsno;
	}


	public void setHst_bsno(String hst_bsno) {
		this.hst_bsno = hst_bsno;
	}


	public String getHst_bsname() {
		return hst_bsname;
	}


	public void setHst_bsname(String hst_bsname) {
		this.hst_bsname = hst_bsname;
	}


	public String getHst_act() {
		return hst_act;
	}


	public void setHst_act(String hst_act) {
		this.hst_act = hst_act;
	}


	public Date getHst_stop() {
		return hst_stop;
	}


	public void setHst_stop(Date hst_stop) {
		this.hst_stop = hst_stop;
	}


	@Override
	public String toString() {
		return "Hostmember [hst_no=" + hst_no + ", hst_id=" + hst_id + ", hst_pwd=" + hst_pwd + ", hst_name=" + hst_name
				+ ", hst_birth=" + hst_birth + ", hst_gender=" + hst_gender + ", hst_email=" + hst_email
				+ ", hst_phone=" + hst_phone + ", hst_bsno=" + hst_bsno + ", hst_bsname=" + hst_bsname + ", hst_act="
				+ hst_act + ", hst_stop=" + hst_stop + "]";
	}
	
	
	
}
