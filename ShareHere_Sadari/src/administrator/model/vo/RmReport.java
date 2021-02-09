package administrator.model.vo;

import java.sql.Date;

public class RmReport {
	/*
	 * 
	 *  US_REPORT_NUM	NUMBER
		RM_REPORT	VARCHAR2(50 BYTE)
		RM_REPORT_DATE	DATE
		US_NO2	VARCHAR2(15 BYTE)
		US_NO	VARCHAR2(15 BYTE)
	 */
	
	private int us_report_num;
	private String rm_report;
	private Date rm_report_date;
	private String rm_report_content;
	private String us_no2;
	private String us_no;
	
	public RmReport() {}
	
	public RmReport(int us_report_num, String rm_report, Date rm_report_date, String rm_report_content, String us_no2,
			String us_no) {
		super();
		this.us_report_num = us_report_num;
		this.rm_report = rm_report;
		this.rm_report_date = rm_report_date;
		this.rm_report_content = rm_report_content;
		this.us_no2 = us_no2;
		this.us_no = us_no;
	}



	public RmReport(int us_report_num, Date rm_report_date, String us_no2) {
		super();
		this.us_report_num = us_report_num;
		this.rm_report_date = rm_report_date;
		this.us_no2 = us_no2;
	}

	public int getUs_report_num() {
		return us_report_num;
	}

	public void setUs_report_num(int us_report_num) {
		this.us_report_num = us_report_num;
	}

	public String getRm_report() {
		return rm_report;
	}

	public void setRm_report(String rm_report) {
		this.rm_report = rm_report;
	}

	public Date getRm_report_date() {
		return rm_report_date;
	}

	public void setRm_report_date(Date rm_report_date) {
		this.rm_report_date = rm_report_date;
	}

	public String getUs_no2() {
		return us_no2;
	}

	public void setUs_no2(String us_no2) {
		this.us_no2 = us_no2;
	}

	public String getUs_no() {
		return us_no;
	}

	public void setUs_no(String us_no) {
		this.us_no = us_no;
	}


	public String getRm_report_content() {
		return rm_report_content;
	}

	public void setRm_report_content(String rm_report_content) {
		this.rm_report_content = rm_report_content;
	}

	@Override
	public String toString() {
		return "RmReport [us_report_num=" + us_report_num + ", rm_report=" + rm_report + ", rm_report_date="
				+ rm_report_date + ", rm_report_content=" + rm_report_content + ", us_no2=" + us_no2 + ", us_no=" + us_no + "]";
	}

	
	
	
}
