package administrator.model.vo;

public class ADM_Admin {
	/*
	 *  ADM_NUM	VARCHAR2(10 BYTE)
		ADM_ID	VARCHAR2(10 BYTE)
		ADM_PWD	VARCHAR2(20 BYTE)
		ADM_DEPART	VARCHAR2(20 BYTE)
	 
	 */
	
	public String adm_num;
	public String adm_id;
	public String adm_pwd;
	public String adm_depart;
	
	public ADM_Admin() {}

	public ADM_Admin(String adm_num, String adm_id, String adm_pwd, String adm_depart) {
		super();
		this.adm_num = adm_num;
		this.adm_id = adm_id;
		this.adm_pwd = adm_pwd;
		this.adm_depart = adm_depart;
	}

	public ADM_Admin(String admId, String admPwd) {
		this.adm_id = adm_id;
		this.adm_pwd = adm_pwd;
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
