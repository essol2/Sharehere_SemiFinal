package mypage.model.vo;

import java.sql.Date;

public class ResToday {
	
	/*SH_RVNO
	SH_RV_CHKRM
	SH_RV_PERIOD
	SH_RV_DATE
	US_NO
	SH_NO
	SH_RV_STATUS
	SH_RV_TD
	 * */
	private  String shRVNo;
	private String shRVchkrm;
	private String shRVPeriod;
	private Date shRVdate;
	private String usNo;
	private String shNo;
	private String shRVstatus;
	private Date shRVtd;
	private String usName;
	
	public ResToday() {}
	
	
	public ResToday(String shRVNo, String shRVchkrm, String shRVPeriod, Date shRVdate, String usNo, String shNo,
			String shRVstatus, Date shRVtd, String usName) {
		super();
		this.shRVNo = shRVNo;
		this.shRVchkrm = shRVchkrm;
		this.shRVPeriod = shRVPeriod;
		this.shRVdate = shRVdate;
		this.usNo = usNo;
		this.shNo = shNo;
		this.shRVstatus = shRVstatus;
		this.shRVtd = shRVtd;
		this.usName = usName;
	}


	public String getShRVNo() {
		return shRVNo;
	}


	public void setShRVNo(String shRVNo) {
		this.shRVNo = shRVNo;
	}


	public String getShRVchkrm() {
		return shRVchkrm;
	}


	public void setShRVchkrm(String shRVchkrm) {
		this.shRVchkrm = shRVchkrm;
	}


	public String getShRVPeriod() {
		return shRVPeriod;
	}


	public void setShRVPeriod(String shRVPeriod) {
		this.shRVPeriod = shRVPeriod;
	}


	public Date getShRVdate() {
		return shRVdate;
	}


	public void setShRVdate(Date shRVdate) {
		this.shRVdate = shRVdate;
	}


	public String getUsNo() {
		return usNo;
	}


	public void setUsNo(String usNo) {
		this.usNo = usNo;
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


	public Date getShRVtd() {
		return shRVtd;
	}


	public void setShRVtd(Date shRVtd) {
		this.shRVtd = shRVtd;
	}


	public String getUsName() {
		return usName;
	}


	public void setUsName(String usName) {
		this.usName = usName;
	}


	@Override
	public String toString() {
		return "ResToday [shRVNo=" + shRVNo + ", shRVchkrm=" + shRVchkrm + ", shRVPeriod=" + shRVPeriod + ", shRVdate="
				+ shRVdate + ", usNo=" + usNo + ", shNo=" + shNo + ", shRVstatus=" + shRVstatus + ", shRVtd=" + shRVtd
				+ ", usName=" + usName + "]";
	}
	
	
	
	
	
	

}
