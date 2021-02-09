package administrator.model.vo;

import java.sql.Date;

public class Sharehouse {
	/*
	 *  SH_NO	VARCHAR2(5 BYTE)
		SH_TITLE	VARCHAR2(20 BYTE)
		SH_TYPE	VARCHAR2(10 BYTE)
		SH_STR	VARCHAR2(10 BYTE)
		SH_FLOOR	VARCHAR2(20 BYTE)
		SH_INTRO	VARCHAR2(50 BYTE)
		SH_PERS	VARCHAR2(50 BYTE)
		SH_COMS	VARCHAR2(50 BYTE)
		SH_SS	VARCHAR2(50 BYTE)
		SH_ADDRESS	VARCHAR2(50 BYTE)
		SH_LA	VARCHAR2(50 BYTE)
		SH_LO	VARCHAR2(50 BYTE)
		SH_BANK	VARCHAR2(50 BYTE)
		SH_MART	VARCHAR2(50 BYTE)
		SH_PARMACY	VARCHAR2(50 BYTE)
		SH_SUBWAY	VARCHAR2(50 BYTE)
		SH_CAFE	VARCHAR2(50 BYTE)
		SH_STORE	VARCHAR2(50 BYTE)
		SH_STATUS	VARCHAR2(1 BYTE)
		SH_DATE	DATE
		SHP_NO	VARCHAR2(20 BYTE)
		SH_DELDATE DATE
		SH_AREA VARCHAR2(20 BYTE)
		HST_NO	VARCHAR2(15 BYTE)
		
		SHP_NO	VARCHAR2(20 BYTE)
		SH_ITEM	VARCHAR2(15 BYTE)
		SH_PRICE VARCHAR2(10 BYTE)
		SH_PDATE DATE
		HST_NO	VARCHAR2(15 BYTE)
		
		THIS_MONTH	VARCHAR2(10 BYTE)
		HOWMANY	NUMBER(30,0)
		
	 */
	
	private String sh_no;
	private	String sh_title;
	private String sh_type;
	private String sh_str;
	private String sh_floor;
	private String sh_intro;
	private String sh_pers;
	private String sh_coms;
	private String sh_ss;
	private String sh_address;
	private String sh_la;
	private String sh_lo;
	private String sh_bank;
	private String sh_mart;
	private String sh_parmacy;
	private String sh_subway;
	private String sh_cafe;
	private String sh_store;
	private String sh_status;
	private Date sh_date;
	private String sh_area;
	private Date sh_deldate;
	private String shp_no;
	private String sh_item;
	private String hst_no;
	private String this_month;
	private int howmany;
	
	public void Sharehouse() {}
	
	public Sharehouse(String sh_no, String sh_title, String sh_type, String sh_str, String sh_floor, String sh_intro,
			String sh_pers, String sh_coms, String sh_ss, String sh_address, String sh_la, String sh_lo, String sh_bank,
			String sh_mart, String sh_parmacy, String sh_subway, String sh_cafe, String sh_store, String sh_status,
			Date sh_date, String sh_area, Date sh_deldate, String shp_no, String sh_item, String hst_no,
			String this_month, int howmany) {
		super();
		this.sh_no = sh_no;
		this.sh_title = sh_title;
		this.sh_type = sh_type;
		this.sh_str = sh_str;
		this.sh_floor = sh_floor;
		this.sh_intro = sh_intro;
		this.sh_pers = sh_pers;
		this.sh_coms = sh_coms;
		this.sh_ss = sh_ss;
		this.sh_address = sh_address;
		this.sh_la = sh_la;
		this.sh_lo = sh_lo;
		this.sh_bank = sh_bank;
		this.sh_mart = sh_mart;
		this.sh_parmacy = sh_parmacy;
		this.sh_subway = sh_subway;
		this.sh_cafe = sh_cafe;
		this.sh_store = sh_store;
		this.sh_status = sh_status;
		this.sh_date = sh_date;
		this.sh_area = sh_area;
		this.sh_deldate = sh_deldate;
		this.shp_no = shp_no;
		this.sh_item = sh_item;
		this.hst_no = hst_no;
		this.this_month = this_month;
		this.howmany = howmany;
	}
	// 지난달 신규 쉐하 리스트 저장용
	public Sharehouse(String this_month, int howmany) {
		super();
		this.this_month = this_month;
		this.howmany = howmany;
	}


	// 매물상세보기 페이지용
	public Sharehouse(String sh_no, String sh_title, String sh_type, String sh_intro, String sh_address,
			String sh_status, Date sh_date, Date sh_deldate, String hst_no) {
		super();
		this.sh_no = sh_no;
		this.sh_title = sh_title;
		this.sh_type = sh_type;
		this.sh_intro = sh_intro;
		this.sh_address = sh_address;
		this.sh_status = sh_status;
		this.sh_date = sh_date;
		this.sh_deldate = sh_deldate;
		this.hst_no = hst_no;
	}



	// 이건 리스트 출력 객체겠지?
	public Sharehouse(String sh_no, String sh_title, Date sh_date, String hst_no) {
		super();
		this.sh_no = sh_no;
		this.sh_title = sh_title;
		this.sh_date = sh_date;
		this.hst_no = hst_no;
	}


	// 삭제객체겠지?
	public Sharehouse(String sh_no, String sh_title, String sh_status, Date sh_date, Date sh_deldate, String hst_no) {
		super();
		this.sh_no = sh_no;
		this.sh_title = sh_title;
		this.sh_status = sh_status;
		this.sh_date = sh_date;
		this.sh_deldate = sh_deldate;
		this.hst_no = hst_no;
	}



	public String getSh_no() {
		return sh_no;
	}



	public void setSh_no(String sh_no) {
		this.sh_no = sh_no;
	}



	public String getSh_title() {
		return sh_title;
	}



	public void setSh_title(String sh_title) {
		this.sh_title = sh_title;
	}



	public String getSh_type() {
		return sh_type;
	}



	public void setSh_type(String sh_type) {
		this.sh_type = sh_type;
	}



	public String getSh_str() {
		return sh_str;
	}



	public void setSh_str(String sh_str) {
		this.sh_str = sh_str;
	}



	public String getSh_floor() {
		return sh_floor;
	}



	public void setSh_floor(String sh_floor) {
		this.sh_floor = sh_floor;
	}



	public String getSh_intro() {
		return sh_intro;
	}



	public void setSh_intro(String sh_intro) {
		this.sh_intro = sh_intro;
	}



	public String getSh_pers() {
		return sh_pers;
	}



	public void setSh_pers(String sh_pers) {
		this.sh_pers = sh_pers;
	}



	public String getSh_coms() {
		return sh_coms;
	}



	public void setSh_coms(String sh_coms) {
		this.sh_coms = sh_coms;
	}



	public String getSh_ss() {
		return sh_ss;
	}



	public void setSh_ss(String sh_ss) {
		this.sh_ss = sh_ss;
	}



	public String getSh_address() {
		return sh_address;
	}



	public void setSh_address(String sh_address) {
		this.sh_address = sh_address;
	}



	public String getSh_la() {
		return sh_la;
	}



	public void setSh_la(String sh_la) {
		this.sh_la = sh_la;
	}



	public String getSh_lo() {
		return sh_lo;
	}



	public void setSh_lo(String sh_lo) {
		this.sh_lo = sh_lo;
	}



	public String getSh_bank() {
		return sh_bank;
	}



	public void setSh_bank(String sh_bank) {
		this.sh_bank = sh_bank;
	}



	public String getSh_mart() {
		return sh_mart;
	}



	public void setSh_mart(String sh_mart) {
		this.sh_mart = sh_mart;
	}



	public String getSh_parmacy() {
		return sh_parmacy;
	}



	public void setSh_parmacy(String sh_parmacy) {
		this.sh_parmacy = sh_parmacy;
	}



	public String getSh_subway() {
		return sh_subway;
	}



	public void setSh_subway(String sh_subway) {
		this.sh_subway = sh_subway;
	}



	public String getSh_cafe() {
		return sh_cafe;
	}



	public void setSh_cafe(String sh_cafe) {
		this.sh_cafe = sh_cafe;
	}



	public String getSh_store() {
		return sh_store;
	}



	public void setSh_store(String sh_store) {
		this.sh_store = sh_store;
	}



	public String getSh_status() {
		return sh_status;
	}



	public void setSh_status(String sh_status) {
		this.sh_status = sh_status;
	}



	public Date getSh_date() {
		return sh_date;
	}



	public void setSh_date(Date sh_date) {
		this.sh_date = sh_date;
	}



	public String getSh_area() {
		return sh_area;
	}



	public void setSh_area(String sh_area) {
		this.sh_area = sh_area;
	}



	public Date getSh_deldate() {
		return sh_deldate;
	}



	public void setSh_deldate(Date sh_deldate) {
		this.sh_deldate = sh_deldate;
	}



	public String getShp_no() {
		return shp_no;
	}



	public void setShp_no(String shp_no) {
		this.shp_no = shp_no;
	}



	public String getSh_item() {
		return sh_item;
	}



	public void setSh_item(String sh_item) {
		this.sh_item = sh_item;
	}



	public String getHst_no() {
		return hst_no;
	}



	public void setHst_no(String hst_no) {
		this.hst_no = hst_no;
	}



	public String getThis_month() {
		return this_month;
	}



	public void setThis_month(String this_month) {
		this.this_month = this_month;
	}



	public int getHowmany() {
		return howmany;
	}



	public void setHowmany(int howmany) {
		this.howmany = howmany;
	}



	@Override
	public String toString() {
		return "Sharehouse [sh_no=" + sh_no + ", sh_title=" + sh_title + ", sh_type=" + sh_type + ", sh_str=" + sh_str
				+ ", sh_floor=" + sh_floor + ", sh_intro=" + sh_intro + ", sh_pers=" + sh_pers + ", sh_coms=" + sh_coms
				+ ", sh_ss=" + sh_ss + ", sh_address=" + sh_address + ", sh_la=" + sh_la + ", sh_lo=" + sh_lo
				+ ", sh_bank=" + sh_bank + ", sh_mart=" + sh_mart + ", sh_parmacy=" + sh_parmacy + ", sh_subway="
				+ sh_subway + ", sh_cafe=" + sh_cafe + ", sh_store=" + sh_store + ", sh_status=" + sh_status
				+ ", sh_date=" + sh_date + ", sh_area=" + sh_area + ", sh_deldate=" + sh_deldate + ", shp_no=" + shp_no
				+ ", sh_item=" + sh_item + ", hst_no=" + hst_no + ", this_month=" + this_month + ", howmany=" + howmany
				+ "]";
	}
	

		}	