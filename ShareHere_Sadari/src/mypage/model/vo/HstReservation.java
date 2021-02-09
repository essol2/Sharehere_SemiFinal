package mypage.model.vo;

import java.sql.Date;

public class HstReservation {
	
	private String usName;
	private String usEmail;
	private String usPhone;
	private String usAct;
	private String shRVchkrm;
	private String shRVperiod;
	private Date shRVdate;
	private String shNo;
	private String shRVstatus;
	private String usNo;
	private Date shRVtd;
	private String hstNo;
	
	public HstReservation() {}

	public HstReservation(String usName, String usEmail, String usPhone, String usAct, String shRVchkrm,
			String shRVperiod, Date shRVdate, String shNo, String shRVstatus, String usNo, Date shRVtd, String hstNo) {
		super();
		this.usName = usName;
		this.usEmail = usEmail;
		this.usPhone = usPhone;
		this.usAct = usAct;
		this.shRVchkrm = shRVchkrm;
		this.shRVperiod = shRVperiod;
		this.shRVdate = shRVdate;
		this.shNo = shNo;
		this.shRVstatus = shRVstatus;
		this.usNo = usNo;
		this.shRVtd = shRVtd;
		this.hstNo = hstNo;
	}

	public String getUsName() {
		return usName;
	}

	public void setUsName(String usName) {
		this.usName = usName;
	}

	public String getUsEmail() {
		return usEmail;
	}

	public void setUsEmail(String usEmail) {
		this.usEmail = usEmail;
	}

	public String getUsPhone() {
		return usPhone;
	}

	public void setUsPhone(String usPhone) {
		this.usPhone = usPhone;
	}

	public String getUsAct() {
		return usAct;
	}

	public void setUsAct(String usAct) {
		this.usAct = usAct;
	}

	public String getShRVchkrm() {
		return shRVchkrm;
	}

	public void setShRVchkrm(String shRVchkrm) {
		this.shRVchkrm = shRVchkrm;
	}

	public String getShRVperiod() {
		return shRVperiod;
	}

	public void setShRVperiod(String shRVperiod) {
		this.shRVperiod = shRVperiod;
	}

	public Date getShRVdate() {
		return shRVdate;
	}

	public void setShRVdate(Date shRVdate) {
		this.shRVdate = shRVdate;
	}

	public String getShNo() {
		return shNo;
	}

	public void setShNo(String shNo) {
		this.shNo = shNo;
	}

	public String getShRVstatus() {
		return shRVstatus;
	}

	public void setShRVstatus(String shRVstatus) {
		this.shRVstatus = shRVstatus;
	}

	public String getUsNo() {
		return usNo;
	}

	public void setUsNo(String usNo) {
		this.usNo = usNo;
	}

	public Date getShRVtd() {
		return shRVtd;
	}

	public void setShRVtd(Date shRVtd) {
		this.shRVtd = shRVtd;
	}

	public String getHstNo() {
		return hstNo;
	}

	public void setHstNo(String hstNo) {
		this.hstNo = hstNo;
	}

	@Override
	public String toString() {
		return "HstReservation [usName=" + usName + ", usEmail=" + usEmail + ", usPhone=" + usPhone + ", usAct=" + usAct
				+ ", shRVchkrm=" + shRVchkrm + ", shRVperiod=" + shRVperiod + ", shRVdate=" + shRVdate + ", shNo="
				+ shNo + ", shRVstatus=" + shRVstatus + ", usNo=" + usNo + ", shRVtd=" + shRVtd + ", hstNo=" + hstNo
				+ "]";
	}
	
	
	
	


	
	
	

}
