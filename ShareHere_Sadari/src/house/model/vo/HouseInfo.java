package house.model.vo;

import java.sql.Date;

public class HouseInfo {

	private String shNo;				// 선택한 하우스번호
	private String shTitle;				// 선택한 하우스 이름
	private String shType;				// 선택한 하우스 주택유형
	private String shAddress;			// 선택한 하우스 주소
	private Date shDate;				// 선택한 하우스 등록날짜
	private String shStr;				// 선택한 하우스 주택구조
	private String hstName;				// 선택한 하우스 관리자
	private String hstPhone;			// 선택한 하우스 관리자 연락처
	private String shIpath;				// 선택한 하우스 사진경로
	private String shItype;				// 선택한 하우스 사진타입
	private String shChName;			// 선택한 하우스 변경된사진이름
	
	public HouseInfo() {}
	
	public HouseInfo(String shNo, String shTitle, String shType, String shAddress, Date shDate, String shStr,
			String hstName, String hstPhone, String shIpath, String shItype, String shChName) {
		super();
		this.shNo = shNo;
		this.shTitle = shTitle;
		this.shType = shType;
		this.shAddress = shAddress;
		this.shDate = shDate;
		this.shStr = shStr;
		this.hstName = hstName;
		this.hstPhone = hstPhone;
		this.shIpath = shIpath;
		this.shItype = shItype;
		this.shChName = shChName;
	}

	public String getShNo() {
		return shNo;
	}

	public void setShNo(String shNo) {
		this.shNo = shNo;
	}

	public String getShTitle() {
		return shTitle;
	}

	public void setShTitle(String shTitle) {
		this.shTitle = shTitle;
	}

	public String getShType() {
		return shType;
	}

	public void setShType(String shType) {
		this.shType = shType;
	}

	public String getShAddress() {
		return shAddress;
	}

	public void setShAddress(String shAddress) {
		this.shAddress = shAddress;
	}

	public Date getShDate() {
		return shDate;
	}

	public void setShDate(Date shDate) {
		this.shDate = shDate;
	}

	public String getShStr() {
		return shStr;
	}

	public void setShStr(String shStr) {
		this.shStr = shStr;
	}

	public String getHstName() {
		return hstName;
	}

	public void setHstName(String hstName) {
		this.hstName = hstName;
	}

	public String getHstPhone() {
		return hstPhone;
	}

	public void setHstPhone(String hstPhone) {
		this.hstPhone = hstPhone;
	}

	public String getShIpath() {
		return shIpath;
	}

	public void setShIpath(String shIpath) {
		this.shIpath = shIpath;
	}

	public String getShItype() {
		return shItype;
	}

	public void setShItype(String shItype) {
		this.shItype = shItype;
	}

	public String getShChName() {
		return shChName;
	}

	public void setShChName(String shChName) {
		this.shChName = shChName;
	}

	@Override
	public String toString() {
		return "HouseInfo [shNo=" + shNo + ", shTitle=" + shTitle + ", shType=" + shType + ", shAddress=" + shAddress
				+ ", shDate=" + shDate + ", shStr=" + shStr + ", hstName=" + hstName + ", hstPhone=" + hstPhone
				+ ", shIpath=" + shIpath + ", shItype=" + shItype + ", shChName=" + shChName + "]";
	}
	
	
	
	
	
	
	
}
