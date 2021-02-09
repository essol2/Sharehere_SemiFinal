package house.model.vo;

public class HostPhoto {
	
	private String shI;
	private String shIname;
	private String shIpath;
	private String shItype;
	private String shNo;
	private String shChName;
	
	public HostPhoto() {}
	
	
	
	public HostPhoto(String shIname, String shIpath, String shItype, String shNo, String shChName) {
		super();
		this.shIname = shIname;
		this.shIpath = shIpath;
		this.shItype = shItype;
		this.shNo = shNo;
		this.shChName = shChName;
	}



	public HostPhoto(String shI, String shIname, String shChName, String shIpath, String shItype, String shNo) {
		super();
		this.shI = shI;
		this.shIname = shIname; // 원본 이름
		this.shChName = shChName;
		this.shIpath = shIpath;
		this.shItype = shItype;
		this.shNo = shNo;
	}


	public String getShI() {
		return shI;
	}

	public void setShI(String shI) {
		this.shI = shI;
	}

	public String getShIname() {
		return shIname;
	}

	public void setShIname(String shIname) {
		this.shIname = shIname;
	}

	public String getShChName() {
		return shChName;
	}

	public void setShChName(String shChName) {
		this.shChName = shChName;
	}

	public String getShIpath() {
		return shIpath;
	}

	public void setShIpath(String shIpath) {
		this.shIpath = shIpath;
	}

	public String getShItype() {
		return shItype;
	}

	public void setShItype(String shItype) {
		this.shItype = shItype;
	}

	public String getShNo() {
		return shNo;
	}

	public void setShNo(String shNo) {
		this.shNo = shNo;
	}

	@Override
	public String toString() {
		return "HostPhoto [shI=" + shI + ", shIname=" + shIname + ", shChName=" + shChName + ", shIpath=" + shIpath
				+ ", shItype=" + shItype + ", shNo=" + shNo + "]";
	}
	
	
	
	
}
