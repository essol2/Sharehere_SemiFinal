
package house.model.vo;

import java.sql.Date;

public class HouseReport {
	
	private String reportNo;		// 신고번호
	private String rReason;			// 신고이유
	private String rContent;		// 신고내용
	private Date rDate;				// 신고날짜
	private String shNo;			// 하우스번호
	private String usNo;			// 일반회원번호
	
	public HouseReport() {}
	
	

	public HouseReport(String rReason, String rContent, String usNo) {
		super();
		this.rReason = rReason;
		this.rContent = rContent;
		this.usNo = usNo;
	}



	public HouseReport(String rReason, String rContent, String shNo, String usNo) {
		super();
		this.rReason = rReason;
		this.rContent = rContent;
		this.shNo = shNo;
		this.usNo = usNo;
	}



	public HouseReport(String reportNo, String rReason, String rContent, Date rDate, String shNo, String usNo) {
		super();
		this.reportNo = reportNo;
		this.rReason = rReason;
		this.rContent = rContent;
		this.rDate = rDate;
		this.shNo = shNo;
		this.usNo = usNo;
	}

	public String getReportNo() {
		return reportNo;
	}

	public void setReportNo(String reportNo) {
		this.reportNo = reportNo;
	}

	public String getrReason() {
		return rReason;
	}

	public void setrReason(String rReason) {
		this.rReason = rReason;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public Date getrDate() {
		return rDate;
	}

	public void setrDate(Date rDate) {
		this.rDate = rDate;
	}

	public String getShNo() {
		return shNo;
	}

	public void setShNo(String shNo) {
		this.shNo = shNo;
	}

	public String getUsNo() {
		return usNo;
	}

	public void setUsNo(String usNo) {
		this.usNo = usNo;
	}

	@Override
	public String toString() {
		return "HouseReport [reportNo=" + reportNo + ", rReason=" + rReason + ", rContent=" + rContent + ", rDate="
				+ rDate + ", shNo=" + shNo + ", usNo=" + usNo + "]";
	}
	
	

	
	
}

