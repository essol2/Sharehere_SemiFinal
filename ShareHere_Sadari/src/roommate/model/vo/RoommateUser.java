package roommate.model.vo;

import java.util.Date;

public class RoommateUser {
	
	/*
	 *  US_NO	VARCHAR2(15 BYTE)
		RM_RESULT	VARCHAR2(50 BYTE)
		RM_LOCAL	VARCHAR2(100 BYTE)
		RM_INTRO	VARCHAR2(500 BYTE)
		RM_GENDER	VARCHAR2(5 BYTE)
		LIVING_TYPE	VARCHAR2(100 BYTE)
		LIVING_TERM	VARCHAR2(20 BYTE)
		SNS_ADDRESS	VARCHAR2(70 BYTE)
		MOVE_IN_DATE	VARCHAR2(20 BYTE)
		AGE	VARCHAR2(10 BYTE)
		IMG_NAME	VARCHAR2(50 BYTE)
		IMG_CHNAME	VARCHAR2(50 BYTE)
		IMG_PATH	VARCHAR2(50 BYTE)
	*/
	
	private String rUserNo;
	private String rUserResult;
	private String rUserLocal;
	private String rUserIntro;
	private String rUserGender;
	private String rlivingType;
	private String rlivingTerm;
	private String rSnsAddress;
	private String rMoviInDate;
	private String rage;
	
	public RoommateUser() {}

	// 썸네일 미포함 생성자
	public RoommateUser(String rUserNo, String rUserResult, String rUserLocal, String rUserIntro, String rUserGender,
			String rlivingType, String rlivingTerm, String rSnsAddress, String rMoviInDate, String rage) {
		super();
		this.rUserNo = rUserNo;
		this.rUserResult = rUserResult;
		this.rUserLocal = rUserLocal;
		this.rUserIntro = rUserIntro;
		this.rUserGender = rUserGender;
		this.rlivingType = rlivingType;
		this.rlivingTerm = rlivingTerm;
		this.rSnsAddress = rSnsAddress;
		this.rMoviInDate = rMoviInDate;
		this.rage = rage;
	}

	// 유저 업데이트 생성자
	public RoommateUser(String rUserNo, String rUserLocal, String rUserIntro, String rlivingType, String rlivingTerm,
			String rSnsAddress, String rMoviInDate, String rage) {
		super();
		this.rUserNo = rUserNo;
		this.rUserLocal = rUserLocal;
		this.rUserIntro = rUserIntro;
		this.rlivingType = rlivingType;
		this.rlivingTerm = rlivingTerm;
		this.rSnsAddress = rSnsAddress;
		this.rMoviInDate = rMoviInDate;
		this.rage = rage;
	}

	public String getrUserNo() {
		return rUserNo;
	}

	

	public void setrUserNo(String rUserNo) {
		this.rUserNo = rUserNo;
	}

	public String getrUserResult() {
		return rUserResult;
	}

	public void setrUserResult(String rUserResult) {
		this.rUserResult = rUserResult;
	}

	public String getrUserLocal() {
		return rUserLocal;
	}

	public void setrUserLocal(String rUserLocal) {
		this.rUserLocal = rUserLocal;
	}

	public String getrUserIntro() {
		return rUserIntro;
	}

	public void setrUserIntro(String rUserIntro) {
		this.rUserIntro = rUserIntro;
	}

	public String getrUserGender() {
		return rUserGender;
	}

	public void setrUserGender(String rUserGender) {
		this.rUserGender = rUserGender;
	}

	public String getRlivingType() {
		return rlivingType;
	}

	public void setRlivingType(String rlivingType) {
		this.rlivingType = rlivingType;
	}

	public String getRlivingTerm() {
		return rlivingTerm;
	}

	public void setRlivingTerm(String rlivingTerm) {
		this.rlivingTerm = rlivingTerm;
	}

	public String getrSnsAddress() {
		return rSnsAddress;
	}

	public void setrSnsAddress(String rSnsAddress) {
		this.rSnsAddress = rSnsAddress;
	}

	public String getrMoviInDate() {
		return rMoviInDate;
	}

	public void setrMoviInDate(String rMoviInDate) {
		this.rMoviInDate = rMoviInDate;
	}

	public String getRage() {
		return rage;
	}

	public void setRage(String rage) {
		this.rage = rage;
	}

	@Override
	public String toString() {
		return "RoommateUser [rUserNo=" + rUserNo + ", rUserResult=" + rUserResult + ", rUserLocal=" + rUserLocal
				+ ", rUserIntro=" + rUserIntro + ", rUserGender=" + rUserGender + ", rlivingType=" + rlivingType
				+ ", rlivingTerm=" + rlivingTerm + ", rSnsAddress=" + rSnsAddress + ", rMoviInDate=" + rMoviInDate
				+ ", rage=" + rage + "]";
	}
	

	
	

}