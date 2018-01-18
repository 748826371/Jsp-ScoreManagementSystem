package cn.edu.ccnu.imd.test.entity;

public class Ktest {
	private int kid;
	private int cid;
	private String type; //将教师姓名放这里便于操作。
	private String ktype;
	private int PlaceID;
	private String day;
	private String time;
	
	public int getKid() {
		return kid;
	}
	public void setKid(int kid) {
		this.kid = kid;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKtype() {
		return ktype;
	}
	public void setKtype(String ktype) {
		this.ktype = ktype;
	}
	
	
	
	
	public int getPlaceID() {
		return PlaceID;
	}
	public void setPlaceID(int PlaceID) {
		this.PlaceID = PlaceID;
	}
	
	
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	
	
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
