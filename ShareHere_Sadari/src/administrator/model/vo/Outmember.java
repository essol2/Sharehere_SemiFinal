package administrator.model.vo;

import java.sql.Date;

public class Outmember {

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
	
	public Outmember() {}
	

	public Outmember(String us_no, String us_id, String us_pwd, String us_name, Date us_birth, String us_gender,
			String us_email, String us_phone, String us_act, Date us_stop, String hst_no, String hst_id, String hst_pwd,
			String hst_name, Date hst_birth, String hst_gender, String hst_email, String hst_phone, String hst_bsno,
			String hst_bsname, String hst_act, Date hst_stop) {
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
	/* 탈퇴 회원 리스트업 출력 용 */
	

	public Outmember(String us_no, String us_id, String us_name, String us_email, String us_act, Date us_stop,
			String hst_no, String hst_id, String hst_name, String hst_email, String hst_act, Date hst_stop) {
		super();
		this.us_no = us_no;
		this.us_id = us_id;
		this.us_name = us_name;
		this.us_email = us_email;
		this.us_act = us_act;
		this.us_stop = us_stop;
		this.hst_no = hst_no;
		this.hst_id = hst_id;
		this.hst_name = hst_name;
		this.hst_email = hst_email;
		this.hst_act = hst_act;
		this.hst_stop = hst_stop;
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
		return "Outmember [us_no=" + us_no + ", us_id=" + us_id + ", us_pwd=" + us_pwd + ", us_name=" + us_name
				+ ", us_birth=" + us_birth + ", us_gender=" + us_gender + ", us_email=" + us_email + ", us_phone="
				+ us_phone + ", us_act=" + us_act + ", us_stop=" + us_stop + ", hst_no=" + hst_no + ", hst_id=" + hst_id
				+ ", hst_pwd=" + hst_pwd + ", hst_name=" + hst_name + ", hst_birth=" + hst_birth + ", hst_gender="
				+ hst_gender + ", hst_email=" + hst_email + ", hst_phone=" + hst_phone + ", hst_bsno=" + hst_bsno
				+ ", hst_bsname=" + hst_bsname + ", hst_act=" + hst_act + ", hst_stop=" + hst_stop + "]";
	}
	
	
}
