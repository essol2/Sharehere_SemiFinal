package mypage.model.vo;

import java.sql.Date;

public class ShUserReservation {
	
	private String shRVNo;
	private String shRVchkrm;
	private String shRVPeriod;
	private Date shRVDate;
	private String usNo;
	private Date shRVtd;
	private String shNo;
	private String shRVStatus;
	private String shRtype;
	private String shGender;
	private String shRarea;
	private String shDeposit;
	private String shAdmcost;
	private String shMonthly;
	private Date shRDate;
	private int shCapacity;
	private String shRname;
	
	public ShUserReservation() {}

	public ShUserReservation(String shRVNo, String shRVchkrm, String shRVPeriod, Date shRVDate, String usNo,
			Date shRVtd, String shNo, String shRVStatus, String shRtype, String shGender, String shRarea,
			String shDeposit, String shAdmcost, String shMonthly, Date shRDate, int shCapacity, String shRname) {
		super();
		this.shRVNo = shRVNo;
		this.shRVchkrm = shRVchkrm;
		this.shRVPeriod = shRVPeriod;
		this.shRVDate = shRVDate;
		this.usNo = usNo;
		this.shRVtd = shRVtd;
		this.shNo = shNo;
		this.shRVStatus = shRVStatus;
		this.shRtype = shRtype;
		this.shGender = shGender;
		this.shRarea = shRarea;
		this.shDeposit = shDeposit;
		this.shAdmcost = shAdmcost;
		this.shMonthly = shMonthly;
		this.shRDate = shRDate;
		this.shCapacity = shCapacity;
		this.shRname = shRname;
	}

	public String getShRVNo() {
		return shRVNo;
	}

	public void setShRVNo(String shRVNo) {
		this.shRVNo = shRVNo;
	}

	public String getShRVchkrm() {
		return shRVchkrm;
	}

	public void setShRVchkrm(String shRVchkrm) {
		this.shRVchkrm = shRVchkrm;
	}

	public String getShRVPeriod() {
		return shRVPeriod;
	}

	public void setShRVPeriod(String shRVPeriod) {
		this.shRVPeriod = shRVPeriod;
	}

	public Date getShRVDate() {
		return shRVDate;
	}

	public void setShRVDate(Date shRVDate) {
		this.shRVDate = shRVDate;
	}

	public String getUsNo() {
		return usNo;
	}

	public void setUsNo(String usNo) {
		this.usNo = usNo;
	}

	public Date getShRVtd() {
		return shRVtd;
	}

	public void setShRVtd(Date shRVtd) {
		this.shRVtd = shRVtd;
	}

	public String getShNo() {
		return shNo;
	}

	public void setShNo(String shNo) {
		this.shNo = shNo;
	}

	public String getShRVStatus() {
		return shRVStatus;
	}

	public void setShRVStatus(String shRVStatus) {
		this.shRVStatus = shRVStatus;
	}

	public String getShRtype() {
		return shRtype;
	}

	public void setShRtype(String shRtype) {
		this.shRtype = shRtype;
	}

	public String getShGender() {
		return shGender;
	}

	public void setShGender(String shGender) {
		this.shGender = shGender;
	}

	public String getShRarea() {
		return shRarea;
	}

	public void setShRarea(String shRarea) {
		this.shRarea = shRarea;
	}

	public String getShDeposit() {
		return shDeposit;
	}

	public void setShDeposit(String shDeposit) {
		this.shDeposit = shDeposit;
	}

	public String getShAdmcost() {
		return shAdmcost;
	}

	public void setShAdmcost(String shAdmcost) {
		this.shAdmcost = shAdmcost;
	}

	public String getShMonthly() {
		return shMonthly;
	}

	public void setShMonthly(String shMonthly) {
		this.shMonthly = shMonthly;
	}

	public Date getShRDate() {
		return shRDate;
	}

	public void setShRDate(Date shRDate) {
		this.shRDate = shRDate;
	}

	public int getShCapacity() {
		return shCapacity;
	}

	public void setShCapacity(int shCapacity) {
		this.shCapacity = shCapacity;
	}

	public String getShRname() {
		return shRname;
	}

	public void setShRname(String shRname) {
		this.shRname = shRname;
	}

	@Override
	public String toString() {
		return "ShUserReservation [shRVNo=" + shRVNo + ", shRVchkrm=" + shRVchkrm + ", shRVPeriod=" + shRVPeriod
				+ ", shRVDate=" + shRVDate + ", usNo=" + usNo + ", shRVtd=" + shRVtd + ", shNo=" + shNo
				+ ", shRVStatus=" + shRVStatus + ", shRtype=" + shRtype + ", shGender=" + shGender + ", shRarea="
				+ shRarea + ", shDeposit=" + shDeposit + ", shAdmcost=" + shAdmcost + ", shMonthly=" + shMonthly
				+ ", shRDate=" + shRDate + ", shCapacity=" + shCapacity + ", shRname=" + shRname + "]";
	}

	
	
}
