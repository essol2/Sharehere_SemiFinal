package administrator.model.vo;

import java.sql.Date;

public class ShReport {
	/*
	 *  SH_REPORTNUM	VARCHAR2(15 BYTE)
		SH_REASON	VARCHAR2(20 BYTE)
		SH_CONTENT	VARCHAR2(50 BYTE)
		SH_REPORT_DATE	DATE
		US_NO	VARCHAR2(15 BYTE)
		SH_NO	VARCHAR2(5 BYTE)
	 * 
	 */
	
	private String sh_reportnum;
	private String sh_reason;
	private String sh_content;
	private Date sh_report_date;
	private String us_no;
	private String sh_no;
	
	public ShReport() {}
	
	public ShReport(String sh_reportnum, String sh_reason, String sh_content, Date sh_report_date, String us_no,
			String sh_no) {
		super();
		this.sh_reportnum = sh_reportnum;
		this.sh_reason = sh_reason;
		this.sh_content = sh_content;
		this.sh_report_date = sh_report_date;
		this.us_no = us_no;
		this.sh_no = sh_no;
	}
	
	
	// 출력메소드용
	
	public ShReport(String sh_reportnum, Date sh_report_date, String sh_no) {
		super();
		this.sh_reportnum = sh_reportnum;
		this.sh_report_date = sh_report_date;
		this.sh_no = sh_no;
	}


	public String getSh_reportnum() {
		return sh_reportnum;
	}


	public void setSh_reportnum(String sh_reportnum) {
		this.sh_reportnum = sh_reportnum;
	}


	public String getSh_reason() {
		return sh_reason;
	}


	public void setSh_reason(String sh_reason) {
		this.sh_reason = sh_reason;
	}


	public String getSh_content() {
		return sh_content;
	}


	public void setSh_content(String sh_content) {
		this.sh_content = sh_content;
	}


	public Date getSh_report_date() {
		return sh_report_date;
	}


	public void setSh_report_date(Date sh_report_date) {
		this.sh_report_date = sh_report_date;
	}


	public String getUs_no() {
		return us_no;
	}


	public void setUs_no(String us_no) {
		this.us_no = us_no;
	}


	public String getSh_no() {
		return sh_no;
	}


	public void setSh_no(String sh_no) {
		this.sh_no = sh_no;
	}


	@Override
	public String toString() {
		return "ShReport [sh_reportnum=" + sh_reportnum + ", sh_report_reason=" + sh_reason + ", sh_content="
				+ sh_content + ", sh_date=" + sh_report_date + ", us_no=" + us_no + ", sh_no=" + sh_no + "]";
	}
	
	
}
