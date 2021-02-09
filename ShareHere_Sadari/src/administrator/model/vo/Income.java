package administrator.model.vo;

import java.sql.Date;

public class Income {
	/* 룸메이트
	 *  PAY_NO	VARCHAR2(20 BYTE)
		US_NO	VARCHAR2(15 BYTE)
		PAY_ITEM	VARCHAR2(20 BYTE)
		PRICE	VARCHAR2(20 BYTE)
		PAY_DATE	DATE
		EXPIRY_DATE	DATE
		
		하우스
		SHP_NO	VARCHAR2(20 BYTE)
		SH_ITEM	VARCHAR2(20 BYTE)
		SH_PRICE	VARCHAR2(10 BYTE)
		SH_PDATE	DATE
		HST_NO	DATE
		
		RM_INCOMES
		THIS_MONTH VARCHAR2(15)
		HOWMUCH	NUMBER(30,0)
		
		SH_INCOMES
		THIS_MONTH	VARCHAR2(15)
		HOWMUCH	NUMBER(30,0)
	 */
	
	private String pay_no;
	private String us_no;
	private String pay_item;
	private String price;
	private Date pay_date;
	private Date expiry_date;
	private String shp_no;
	private String sh_item;
	private String sh_price;
	private Date sh_pdate;
	private String hst_no;
	private String this_month;
	private int howmuch;
	
	public Income(){}

	public Income(String pay_no, String us_no, String pay_item, String price, Date pay_date, Date expiry_date,
			String shp_no, String sh_item, String sh_price, Date sh_pdate, String hst_no, String this_month, int howmuch) {
		super();
		this.pay_no = pay_no;
		this.us_no = us_no;
		this.pay_item = pay_item;
		this.price = price;
		this.pay_date = pay_date;
		this.expiry_date = expiry_date;
		this.shp_no = shp_no;
		this.sh_item = sh_item;
		this.sh_price = sh_price;
		this.sh_pdate = sh_pdate;
		this.hst_no = hst_no;
		this.this_month = this_month;
		this.howmuch = howmuch;
	}
	// 달별 수익 arraylist 넣을 생성자

	public Income(String this_month, int howmuch) {
		super();
		this.this_month = this_month;
		this.howmuch = howmuch;
	}


	// 룸메이트용
	public Income(String pay_no, String us_no, String pay_item, Date pay_date) {
		super();
		this.pay_no = pay_no;
		this.us_no = us_no;
		this.pay_item = pay_item;
		this.pay_date = pay_date;
	}
	

	// 하우스용
	public Income(String shp_no, String sh_item, Date sh_pdate, String hst_no) {
		super();
		this.shp_no = shp_no;
		this.sh_item = sh_item;
		this.sh_pdate = sh_pdate;
		this.hst_no = hst_no;
	}
	
	// 한번에 리스트 출력하는 합친 용
	public Income(String pay_no, String us_no, String pay_item, Date pay_date, String shp_no, String sh_item,
			Date sh_pdate, String hst_no) {
		super();
		this.pay_no = pay_no;
		this.us_no = us_no;
		this.pay_item = pay_item;
		this.pay_date = pay_date;
		this.shp_no = shp_no;
		this.sh_item = sh_item;
		this.sh_pdate = sh_pdate;
		this.hst_no = hst_no;
	}
	
	// 매출기록용 _ 룸메이트
	public Income(String pay_no, String us_no, String pay_item, String price, Date pay_date) {
		super();
		this.pay_no = pay_no;
		this.us_no = us_no;
		this.pay_item = pay_item;
		this.price = price;
		this.pay_date = pay_date;
	}

	// 매출기록용_하우스
	public Income(String shp_no, String sh_item, String sh_price, Date sh_pdate, String hst_no) {
		super();
		this.shp_no = shp_no;
		this.sh_item = sh_item;
		this.sh_price = sh_price;
		this.sh_pdate = sh_pdate;
		this.hst_no = hst_no;
	}

	public String getPay_no() {
		return pay_no;
	}

	public void setPay_no(String pay_no) {
		this.pay_no = pay_no;
	}

	public String getUs_no() {
		return us_no;
	}

	public void setUs_no(String us_no) {
		this.us_no = us_no;
	}

	public String getPay_item() {
		return pay_item;
	}

	public void setPay_item(String pay_item) {
		this.pay_item = pay_item;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public Date getPay_date() {
		return pay_date;
	}

	public void setPay_date(Date pay_date) {
		this.pay_date = pay_date;
	}

	public Date getExpiry_date() {
		return expiry_date;
	}

	public void setExpiry_date(Date expiry_date) {
		this.expiry_date = expiry_date;
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

	public String getSh_price() {
		return sh_price;
	}

	public void setSh_price(String sh_price) {
		this.sh_price = sh_price;
	}

	public Date getSh_pdate() {
		return sh_pdate;
	}

	public void setSh_pdate(Date sh_pdate) {
		this.sh_pdate = sh_pdate;
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

	public int getHowmuch() {
		return howmuch;
	}

	public void setHowmuch(int howmuch) {
		this.howmuch = howmuch;
	}

	@Override
	public String toString() {
		return "Income [pay_no=" + pay_no + ", us_no=" + us_no + ", pay_item=" + pay_item + ", price=" + price
				+ ", pay_date=" + pay_date + ", expiry_date=" + expiry_date + ", shp_no=" + shp_no + ", sh_item="
				+ sh_item + ", sh_price=" + sh_price + ", sh_pdate=" + sh_pdate + ", hst_no=" + hst_no + ", this_month="
				+ this_month + ", howmuch=" + howmuch + "]";
	}

	
	
}
