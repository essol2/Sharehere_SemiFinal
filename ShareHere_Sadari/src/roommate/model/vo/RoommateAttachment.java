package roommate.model.vo;

public class RoommateAttachment {
	
	/*
	 *  USER_NO
		IMG_PATH
		IMG_NAME
		IMG_CHNAME
	 * */
	private String rUserNo;
	private String imgPath;
	private String imgName;
	private String imgChName;
	
	public RoommateAttachment() {}

	public RoommateAttachment(String rUserNo, String imgPath, String imgName, String imgChName) {
		super();
		this.rUserNo = rUserNo;
		this.imgPath = imgPath;
		this.imgName = imgName;
		this.imgChName = imgChName;
	}

	public String getrUserNo() {
		return rUserNo;
	}

	public void setrUserNo(String rUserNo) {
		this.rUserNo = rUserNo;
	}

	public String getImgName() {
		return imgName;
	}

	public void setImgName(String imgName) {
		this.imgName = imgName;
	}

	public String getImgChName() {
		return imgChName;
	}

	public void setImgChName(String imgChName) {
		this.imgChName = imgChName;
	}

	public String getImgPath() {
		return imgPath;
	}

	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}

	@Override
	public String toString() {
		return "RoommateAttachment [rUserNo=" + rUserNo + ", imgName=" + imgName + ", imgChName=" + imgChName
				+ ", imgPath=" + imgPath + "]";
	}

	
}