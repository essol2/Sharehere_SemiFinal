package roommate.model.vo;

public class RoommateJjim {
	
	/*
	 US_NO	VARCHAR2(15 BYTE)
	 US_NO2	VARCHAR2(15 BYTE)
	 */
	
	private String usNo; // 찜한 회원
	private String usNo2; // 찜 당한 회원
	
	public RoommateJjim () {}

	public RoommateJjim(String usNo, String usNo2) {
		super();
		this.usNo = usNo;
		this.usNo2 = usNo2;
	}

	public String getUsNo() {
		return usNo;
	}

	public void setUsNo(String usNo) {
		this.usNo = usNo;
	}

	public String getUsNo2() {
		return usNo2;
	}

	public void setUsNo2(String usNo2) {
		this.usNo2 = usNo2;
	}

	@Override
	public String toString() {
		return "RoommateJjim [usNo=" + usNo + ", usNo2=" + usNo2 + "]";
	}

}
