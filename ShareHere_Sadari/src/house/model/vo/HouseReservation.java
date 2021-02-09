package house.model.vo;

import java.sql.Date;

public class HouseReservation {

	private String rvNo;		// 예약번호(pk)
	private String check;		// 예약한 방번호
	private String period;		// 희망 거주기간
	private String rvDate;		// 예약한 날짜
	private String usNo;		// 예약한 일반회원번호(fk)
	private String shNo;		// 참조 하우스번호(fk)

	public HouseReservation() {}
	
	

	// 
	public HouseReservation(String check, String period, String rvDate, String usNo, String shNo) {
		super();
		this.check = check;
		this.period = period;
		this.rvDate = rvDate;
		this.usNo = usNo;
		this.shNo = shNo;
	}



	public HouseReservation(String rvNo, String check, String period, String rvDate, String usNo, String shNo) {
		super();
		this.rvNo = rvNo;
		this.check = check;
		this.period = period;
		this.rvDate = rvDate;
		this.usNo = usNo;
		this.shNo = shNo;
	}

	public String getRvNo() {
		return rvNo;
	}

	public void setRvNo(String rvNo) {
		this.rvNo = rvNo;
	}

	public String getCheck() {
		return check;
	}

	public void setCheck(String check) {
		this.check = check;
	}

	public String getPeriod() {
		return period;
	}

	public void setPeriod(String period) {
		this.period = period;
	}

	public String getRvDate() {
		return rvDate;
	}

	public void setRvDate(String rvDate) {
		this.rvDate = rvDate;
	}

	public String getUsNo() {
		return usNo;
	}

	public void setUsNo(String usNo) {
		this.usNo = usNo;
	}

	public String getShNo() {
		return shNo;
	}

	public void setShNo(String shNo) {
		this.shNo = shNo;
	}

	@Override
	public String toString() {
		return "HouseReservation [rvNo=" + rvNo + ", check=" + check + ", period=" + period + ", rvDate=" + rvDate
				+ ", usNo=" + usNo + ", shNo=" + shNo + "]";
	}

	
	
	
	
}


