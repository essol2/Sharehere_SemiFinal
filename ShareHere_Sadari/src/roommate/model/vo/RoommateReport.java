package roommate.model.vo;

import java.util.Date;

public class RoommateReport {
	
	/*
	 US_REPORT_NUM	NUMBER
	 RM_REPORT	VARCHAR2(50 BYTE) // 신고사유
	 RM_REPORT_DATE	DATE
	 US_NO2	VARCHAR2(15 BYTE) // 신고 당한 회원
	 US_NO	VARCHAR2(15 BYTE) // 신고 한 회원
	*/
	
	private int reportNum;
	private String report;
	private Date reportDate;
	private String userNo2;
	private String userNo;
	
	public RoommateReport() {}

	public RoommateReport(int reportNum, String report, Date reportDate, String userNo2, String userNo) {
		super();
		this.reportNum = reportNum;
		this.report = report;
		this.reportDate = reportDate;
		this.userNo2 = userNo2;
		this.userNo = userNo;
	}

	public int getReportNum() {
		return reportNum;
	}

	public void setReportNum(int reportNum) {
		this.reportNum = reportNum;
	}

	public String getReport() {
		return report;
	}

	public void setReport(String report) {
		this.report = report;
	}

	public Date getReportDate() {
		return reportDate;
	}

	public void setReportDate(Date reportDate) {
		this.reportDate = reportDate;
	}

	public String getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(String userNo2) {
		this.userNo2 = userNo2;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	@Override
	public String toString() {
		return "RoommateReport [reportNum=" + reportNum + ", report=" + report + ", reportDate=" + reportDate
				+ ", userNo2=" + userNo2 + ", userNo=" + userNo + "]";
	}
	
	
}
