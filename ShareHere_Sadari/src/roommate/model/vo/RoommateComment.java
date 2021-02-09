package roommate.model.vo;

import java.sql.Date;

public class RoommateComment {
	
	
//	NNO	NUMBER(38,0)
//	NTITLE	VARCHAR2(100 BYTE)
//	NCONTENT	VARCHAR2(1000 BYTE)
//	NWRITER	VARCHAR2(100 BYTE)
//	NCOUNT	NUMBER(38,0)
//	NDATE	DATE
//	STATUS	VARCHAR2(10 BYTE)

	private int nNo;
	private String nTitle;
	private String nContent;
	private String nWriter;
	private int nCount;
	private Date nDate;
	private String status;
	
	public RoommateComment() {}

	public RoommateComment(int nNo, String nTitle, String nContent, String nWriter, int nCount, Date nDate,
			String status) {
		super();
		this.nNo = nNo;
		this.nTitle = nTitle;
		this.nContent = nContent;
		this.nWriter = nWriter;
		this.nCount = nCount;
		this.nDate = nDate;
		this.status = status;
	}

   public RoommateComment(String nTitle, String nContent, String nWriter) {
	      super();
	      this.nTitle = nTitle;
	      this.nContent = nContent;
	      this.nWriter = nWriter;
	   }

	public int getnNo() {
		return nNo;
	}

	public void setnNo(int nNo) {
		this.nNo = nNo;
	}

	public String getnTitle() {
		return nTitle;
	}

	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}

	public String getnContent() {
		return nContent;
	}

	public void setnContent(String nContent) {
		this.nContent = nContent;
	}

	public String getnWriter() {
		return nWriter;
	}

	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}

	public int getnCount() {
		return nCount;
	}

	public void setnCount(int nCount) {
		this.nCount = nCount;
	}

	public Date getnDate() {
		return nDate;
	}

	public void setnDate(Date nDate) {
		this.nDate = nDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RoommateComment [nNo=" + nNo + ", nTitle=" + nTitle + ", nContent=" + nContent + ", nWriter=" + nWriter
				+ ", nCount=" + nCount + ", nDate=" + nDate + ", status=" + status + "]";
	}
	
	
	
	
}
