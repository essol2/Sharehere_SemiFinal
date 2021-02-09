package member.model.vo;

public class Admin {
//	ADM_NUM	NUMBER
//	ADM_ID	VARCHAR2(10 BYTE)
//	ADM_PWD	VARCHAR2(20 BYTE)
//	ADM_DEPART	VARCHAR2(5 BYTE)	
	private String adm_num;		// 관리자번호
	private String adm_id;		// 관리아아이디
	private String adm_pwd;		// 비밀번호
	private String adm_depart;	// 부서
	
	public Admin() {}
	
	
	// 관리자 로그인용
	public Admin(String adm_id, String adm_pwd) {
		super();
		this.adm_id = adm_id;
		this.adm_pwd = adm_pwd;
	}

	public Admin(String adm_num, String adm_id, String adm_pwd, String adm_depart) {
		super();
		this.adm_num = adm_num;
		this.adm_id = adm_id;
		this.adm_pwd = adm_pwd;
		this.adm_depart = adm_depart;
	}

	public String getAdm_num() {
		return adm_num;
	}

	public void setAdm_num(String adm_num) {
		this.adm_num = adm_num;
	}

	public String getAdm_id() {
		return adm_id;
	}

	public void setAdm_id(String adm_id) {
		this.adm_id = adm_id;
	}

	public String getAdm_pwd() {
		return adm_pwd;
	}

	public void setAdm_pwd(String adm_pwd) {
		this.adm_pwd = adm_pwd;
	}

	public String getAdm_depart() {
		return adm_depart;
	}

	public void setAdm_depart(String adm_depart) {
		this.adm_depart = adm_depart;
	}

	@Override
	public String toString() {
		return "Admin [adm_num=" + adm_num + ", adm_id=" + adm_id + ", adm_pwd=" + adm_pwd + ", adm_depart="
				+ adm_depart + "]";
	}
	
}
