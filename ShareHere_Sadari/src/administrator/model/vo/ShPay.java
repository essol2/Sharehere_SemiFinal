package administrator.model.vo;

import java.sql.Date;

public class ShPay {
	/*
	 *  SHP_NO	VARCHAR2(20 BYTE)
		SH_ITEM	VARCHAR2(20 BYTE)
		SH_PRICE	VARCHAR2(10 BYTE)
		SH_PDATE	DATE
		HST_NO	VARCHAR2(15 BYTE)
	 * */
	
	private String shp_no;
	private String sh_item;
	private String sh_price;
	private Date sh_pdate;
	private String hst_no;
	
	public ShPay() {}

	public ShPay(String shp_no, String sh_item, String sh_price, Date sh_pdate, String hst_no) {
		super();
		this.shp_no = shp_no;
		this.sh_item = sh_item;
		this.sh_price = sh_price;
		this.sh_pdate = sh_pdate;
		this.hst_no = hst_no;
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

	@Override
	public String toString() {
		return "ShPay [shp_no=" + shp_no + ", sh_item=" + sh_item + ", sh_price=" + sh_price + ", hst_no=" + hst_no
				+ "]";
	}
	
	
}
