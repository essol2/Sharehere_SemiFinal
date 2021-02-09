package house.model.vo;

import java.sql.Date;

public class HostPay {
	 /*
	   SHP_NO	VARCHAR2(15 BYTE)
	   SH_ITEM	VARCHAR2(20 BYTE)
       SH_PRICE	VARCHAR2(10 BYTE)
       SH_PDATE	DATE
       HST_NO	VARCHAR2(15 BYTE)
       */
	
	private String payNo;		// 결제번호
	private String shItem;		// 결제항목
	private String shPrice;		// 결제금액
	private Date shPdate;		// 결제날짜
	private String hstNo;		// 임대인회원번호
	
	public HostPay() {}

	public HostPay(String shItem, String shPrice, String hstNo) {
		super();
		this.shItem = shItem;
		this.shPrice = shPrice;
		this.hstNo = hstNo;
	}



	public HostPay(String payNo, String shItem, String shPrice, Date shPdate, String hstNo) {
		super();
		this.payNo = payNo;
		this.shItem = shItem;
		this.shPrice = shPrice;
		this.shPdate = shPdate;
		this.hstNo = hstNo;
	}

	public String getPayNo() {
		return payNo;
	}

	public void setPayNo(String payNo) {
		this.payNo = payNo;
	}

	public String getShItem() {
		return shItem;
	}

	public void setShItem(String shItem) {
		this.shItem = shItem;
	}

	public String getShPrice() {
		return shPrice;
	}

	public void setShPrice(String shPrice) {
		this.shPrice = shPrice;
	}

	public Date getShPdate() {
		return shPdate;
	}

	public void setShPdate(Date shPdate) {
		this.shPdate = shPdate;
	}

	public String getHstNo() {
		return hstNo;
	}

	public void setHstNo(String hstNo) {
		this.hstNo = hstNo;
	}

	@Override
	public String toString() {
		return "HostPay [payNo=" + payNo + ", shItem=" + shItem + ", shPrice=" + shPrice + ", shPdate=" + shPdate
				+ ", hstNo=" + hstNo + "]";
	}	
	
}

