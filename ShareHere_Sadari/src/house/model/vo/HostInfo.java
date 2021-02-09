package house.model.vo;

import java.sql.Date;

public class HostInfo {
	/* 	SH_NO	VARCHAR2(5 BYTE)
		SH_TITLE	VARCHAR2(20 BYTE)
		SH_TYPE	VARCHAR2(20 BYTE)
		SH_STR	VARCHAR2(20 BYTE)
		SH_AREA	VARCHAR2(10 BYTE)
		SH_FLOOR	VARCHAR2(20 BYTE)
		SH_INTRO	VARCHAR2(150 BYTE)
		SH_PERS	VARCHAR2(50 BYTE)
		SH_COMS	VARCHAR2(50 BYTE)
		SH_SS	VARCHAR2(50 BYTE)
		SH_ADDRESS	VARCHAR2(50 BYTE)
		SH_LA	VARCHAR2(20 BYTE)
		SH_LO	VARCHAR2(20 BYTE)
		SH_BANK	VARCHAR2(50 BYTE)
		SH_MART	VARCHAR2(50 BYTE)
		SH_PARMACY	VARCHAR2(50 BYTE)
		SH_SUBWAY	VARCHAR2(50 BYTE)
		SH_CAFE	VARCHAR2(50 BYTE)
		SH_STORE	VARCHAR2(50 BYTE)
		SH_STATUS	VARCHAR2(1 BYTE)
		SH_DATE	DATE
		HST_NO	VARCHAR2(20 BYTE) 
		SH_DELDATE	DATE */
	

	private String shNo;
	private String shTitle;
	private String shType;
	private String shStr;
	private String shArea;
	private String shFloor;
	private String shIntro;
	private String shPers;
	private String shComs;
	private String shSs;
	private String shAddress;
	private String shLa;
	private String shLo;
	private String shBank;
	private String shMart;
	private String shParmacy;
	private String shSubway;
	private String shCafe;
	private String shStore;
	private String shStatus;
	private Date shDate;
	private Date shDeldate;
	private String hstNo;
	
	public HostInfo() {}
	
	// HOUSE 확인
	public HostInfo(String shNo, String shTitle, String shType, String shStr, String shArea, String shAddress,
			Date shDate, String hstNo) {
		super();
		this.shNo = shNo;
		this.shTitle = shTitle;
		this.shType = shType;
		this.shStr = shStr;
		this.shArea = shArea;
		this.shAddress = shAddress;
		this.shDate = shDate;
		this.hstNo = hstNo;
	}
//	public HostInfo(String shNo, String shTitle, String shType, String shStr, String shArea, String shAddress,
//			Date shDate, String shpNo, String hstNo) {
//		super();
//		this.shNo = shNo;
//		this.shTitle = shTitle;
//		this.shType = shType;
//		this.shStr = shStr;
//		this.shArea = shArea;
//		this.shAddress = shAddress;
//		this.shDate = shDate;
//		this.shpNo = shpNo;
//		this.hstNo = hstNo;
//	}
	


	// 전체 조회 search detail
	public HostInfo(String shNo, String shTitle, String shType, String shStr, String shArea, String shFloor,
			String shIntro, String shPers, String shComs, String shSs, String shAddress, String shLa, String shLo,
			String shBank, String shMart, String shParmacy, String shSubway, String shCafe, String shStore, Date shDate,
			Date shDeldate, String hstNo) {
		super();
		this.shNo = shNo;
		this.shTitle = shTitle;
		this.shType = shType;
		this.shStr = shStr;
		this.shArea = shArea;
		this.shFloor = shFloor;
		this.shIntro = shIntro;
		this.shPers = shPers;
		this.shComs = shComs;
		this.shSs = shSs;
		this.shAddress = shAddress;
		this.shLa = shLa;
		this.shLo = shLo;
		this.shBank = shBank;
		this.shMart = shMart;
		this.shParmacy = shParmacy;
		this.shSubway = shSubway;
		this.shCafe = shCafe;
		this.shStore = shStore;
		this.shDate = shDate;
		this.shDeldate = shDeldate;
		this.hstNo = hstNo;
	}
	
	

	// HOUSE 매물 등록 
	public HostInfo(String shTitle, String shType, String shStr, String shArea, String shFloor, String shIntro,
			String shPers, String shComs, String shSs, String shAddress, String shLa, String shLo, String shBank,
			String shMart, String shParmacy, String shSubway, String shCafe, String shStore, String hstNo) {
		super();
		this.shTitle = shTitle;
		this.shType = shType;
		this.shStr = shStr;
		this.shArea = shArea;
		this.shFloor = shFloor;
		this.shIntro = shIntro;
		this.shPers = shPers;
		this.shComs = shComs;
		this.shSs = shSs;
		this.shAddress = shAddress;
		this.shLa = shLa;
		this.shLo = shLo;
		this.shBank = shBank;
		this.shMart = shMart;
		this.shParmacy = shParmacy;
		this.shSubway = shSubway;
		this.shCafe = shCafe;
		this.shStore = shStore;
		this.hstNo = hstNo;
	}
	

	// 수정 select
	// 매물 수정
	//  성현님 조회
	public HostInfo(String shNo, String shTitle, String shType, String shStr, String shArea, String shFloor,
	         String shIntro, String shPers, String shComs, String shSs, String shAddress, String shLa, String shLo,
	         String shBank, String shMart, String shParmacy, String shSubway, String shCafe, String shStore,
	         String shStatus, Date shDate, String hstNo) {
	      super();
	      this.shNo = shNo;
	      this.shTitle = shTitle;
	      this.shType = shType;
	      this.shStr = shStr;
	      this.shArea = shArea;
	      this.shFloor = shFloor;
	      this.shIntro = shIntro;
	      this.shPers = shPers;
	      this.shComs = shComs;
	      this.shSs = shSs;
	      this.shAddress = shAddress;
	      this.shLa = shLa;
	      this.shLo = shLo;
	      this.shBank = shBank;
	      this.shMart = shMart;
	      this.shParmacy = shParmacy;
	      this.shSubway = shSubway;
	      this.shCafe = shCafe;
	      this.shStore = shStore;
	      this.shStatus = shStatus;
	      this.shDate = shDate;
	      this.hstNo = hstNo;
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

	public String getShStr() {
		return shStr;
	}

	public void setShStr(String shStr) {
		this.shStr = shStr;
	}

	public String getShArea() {
		return shArea;
	}

	public void setShArea(String shArea) {
		this.shArea = shArea;
	}

	public String getShFloor() {
		return shFloor;
	}

	public void setShFloor(String shFloor) {
		this.shFloor = shFloor;
	}

	public String getShIntro() {
		return shIntro;
	}

	public void setShIntro(String shIntro) {
		this.shIntro = shIntro;
	}

	public String getShPers() {
		return shPers;
	}

	public void setShPers(String shPers) {
		this.shPers = shPers;
	}

	public String getShComs() {
		return shComs;
	}

	public void setShComs(String shComs) {
		this.shComs = shComs;
	}

	public String getShSs() {
		return shSs;
	}

	public void setShSs(String shSs) {
		this.shSs = shSs;
	}

	public String getShAddress() {
		return shAddress;
	}

	public void setShAddress(String shAddress) {
		this.shAddress = shAddress;
	}

	public String getShLa() {
		return shLa;
	}

	public void setShLa(String shLa) {
		this.shLa = shLa;
	}

	public String getShLo() {
		return shLo;
	}

	public void setShLo(String shLo) {
		this.shLo = shLo;
	}

	public String getShBank() {
		return shBank;
	}

	public void setShBank(String shBank) {
		this.shBank = shBank;
	}

	public String getShMart() {
		return shMart;
	}

	public void setShMart(String shMart) {
		this.shMart = shMart;
	}

	public String getShParmacy() {
		return shParmacy;
	}

	public void setShParmacy(String shParmacy) {
		this.shParmacy = shParmacy;
	}

	public String getShSubway() {
		return shSubway;
	}

	public void setShSubway(String shSubway) {
		this.shSubway = shSubway;
	}

	public String getShCafe() {
		return shCafe;
	}

	public void setShCafe(String shCafe) {
		this.shCafe = shCafe;
	}

	public String getShStore() {
		return shStore;
	}

	public void setShStore(String shStore) {
		this.shStore = shStore;
	}

	public String getShStatus() {
		return shStatus;
	}

	public void setShStatus(String shStatus) {
		this.shStatus = shStatus;
	}

	public Date getShDate() {
		return shDate;
	}

	public void setShDate(Date shDate) {
		this.shDate = shDate;
	}


	public String getHstNo() {
		return hstNo;
	}

	public void setHstNo(String hstNo) {
		this.hstNo = hstNo;
	}

	public Date getShDeldate() {
		return shDeldate;
	}

	public void setShDeldate(Date shDeldate) {
		this.shDeldate = shDeldate;
	}

	@Override
	public String toString() {
		return "HostInfo [shNo=" + shNo + ", shTitle=" + shTitle + ", shType=" + shType + ", shStr=" + shStr
				+ ", shArea=" + shArea + ", shFloor=" + shFloor + ", shIntro=" + shIntro + ", shPers=" + shPers
				+ ", shComs=" + shComs + ", shSs=" + shSs + ", shAddress=" + shAddress + ", shLa=" + shLa + ", shLo="
				+ shLo + ", shBank=" + shBank + ", shMart=" + shMart + ", shParmacy=" + shParmacy + ", shSubway="
				+ shSubway + ", shCafe=" + shCafe + ", shStore=" + shStore + ", shStatus=" + shStatus + ", shDate="
				+ shDate + ", shDeldate=" + shDeldate + ", hstNo=" + hstNo + "]";
	}

		

}