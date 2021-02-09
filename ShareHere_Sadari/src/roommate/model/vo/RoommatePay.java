package roommate.model.vo;

import java.util.Date;

public class RoommatePay {
	
	/*
	 *  PAY_NO	VARCHAR2(20 BYTE)
		US_NO	VARCHAR2(15 BYTE)
		PAY_ITEM	VARCHAR2(20 BYTE)
		PRICE	VARCHAR2(20 BYTE)
		PAY_DATE	DATE
	 *  EXPIRY_DATE	DATE
	 * */
	
	private String pay_no;
	private String us_no;
	private String pay_item;
	private String price;
	private Date pay_date;
	private Date expiry_Date;
	
	public RoommatePay () {}

	public RoommatePay(String pay_no, String us_no, String pay_item, String price, Date pay_date, Date expiry_Date) {
		super();
		this.pay_no = pay_no;
		this.us_no = us_no;
		this.pay_item = pay_item;
		this.price = price;
		this.pay_date = pay_date;
		this.expiry_Date = expiry_Date;
	}

	public RoommatePay(String us_no, String pay_item, String price) {
		super();
		this.us_no = us_no;
		this.pay_item = pay_item;
		this.price = price;
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

	public Date getExpiry_Date() {
		return expiry_Date;
	}

	public void setExpiry_Date(Date expiry_Date) {
		this.expiry_Date = expiry_Date;
	}

	@Override
	public String toString() {
		return "RoommatePay [pay_no=" + pay_no + ", us_no=" + us_no + ", pay_item=" + pay_item + ", price=" + price
				+ ", pay_date=" + pay_date + ", expiry_Date=" + expiry_Date + "]";
	}	

}