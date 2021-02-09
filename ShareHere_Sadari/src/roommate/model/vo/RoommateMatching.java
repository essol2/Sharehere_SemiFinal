package roommate.model.vo;

import java.sql.Connection;

import member.model.vo.User;

public class RoommateMatching {
	
	/*
	USER_NO	VARCHAR2(10 BYTE)
	USER_NO2	VARCHAR2(50 BYTE)
	TEL	VARCHAR2(50 BYTE)
	TEXT	VARCHAR2(300 BYTE)
	STATUS	VARCHAR2(5 BYTE)
	*/
	
	private String userNo;
	private String userNo2;
	private String tel;
	private String text;
	private String status;
	
	public RoommateMatching () {}

	public RoommateMatching(String userNo, String userNo2, String tel, String text, String status) {
		super();
		this.userNo = userNo;
		this.userNo2 = userNo2;
		this.tel = tel;
		this.text = text;
		this.status = status;
	}

	// no status
	public RoommateMatching(String userNo, String userNo2, String tel, String text) {
		super();
		this.userNo = userNo;
		this.userNo2 = userNo2;
		this.tel = tel;
		this.text = text;
	}

	public String getUserNo() {
		return userNo;
	}

	public void setUserNo(String userNo) {
		this.userNo = userNo;
	}

	public String getUserNo2() {
		return userNo2;
	}

	public void setUserNo2(String userNo2) {
		this.userNo2 = userNo2;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "RoommateMatching [userNo=" + userNo + ", userNo2=" + userNo2 + ", tel=" + tel + ", text=" + text
				+ ", status=" + status + "]";
	}

	
}
