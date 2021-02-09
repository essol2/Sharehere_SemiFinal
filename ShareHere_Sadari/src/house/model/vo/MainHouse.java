package house.model.vo;

public class MainHouse {

	private String shNo;
	private String shTitle;
	private String shIntro;
	private String shStatus;
	private String shIpath;
	private String shItype;
	private String shChName;
	
	
 public MainHouse() {}


public MainHouse(String shNo, String shTitle, String shIntro, String shStatus, String shIpath, String shItype,
		String shChName) {
	super();
	this.shNo = shNo;
	this.shTitle = shTitle;
	this.shIntro = shIntro;
	this.shStatus = shStatus;
	this.shIpath = shIpath;
	this.shItype = shItype;
	this.shChName = shChName;
}


public String getShNo() {
	return shNo;
}


public void setShNo(String shNo) {
	this.shNo = shNo;
}


public String getShTitle() {
	return shTitle;
}


public void setShTitle(String shTitle) {
	this.shTitle = shTitle;
}


public String getShIntro() {
	return shIntro;
}


public void setShIntro(String shIntro) {
	this.shIntro = shIntro;
}


public String getShStatus() {
	return shStatus;
}


public void setShStatus(String shStatus) {
	this.shStatus = shStatus;
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


public String getShChName() {
	return shChName;
}


public void setShChName(String shChName) {
	this.shChName = shChName;
}


@Override
public String toString() {
	return "MainHouse [shNo=" + shNo + ", shTitle=" + shTitle + ", shIntro=" + shIntro + ", shStatus=" + shStatus
			+ ", shIpath=" + shIpath + ", shItype=" + shItype + ", shChName=" + shChName + "]";
}
 
 
	
	
}
