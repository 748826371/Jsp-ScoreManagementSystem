package cn.edu.ccnu.imd.test.entity;

public class Course {
	private int cid;
	private String name;
	private int tid;
	private String tname; //将教师姓名放这里便于操作。
	private String major;
	private String type;
	private int pointt;
	
	
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public int  getPointt() {
		return pointt;
	}
	public void setPointt(int pointt) {
		this.pointt = pointt;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

}
