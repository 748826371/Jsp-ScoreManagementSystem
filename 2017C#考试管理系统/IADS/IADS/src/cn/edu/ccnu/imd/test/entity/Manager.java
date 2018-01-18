package cn.edu.ccnu.imd.test.entity;

public class Manager {
	private int Mid;
	private String Password;
	private String Rank;

	
	public int getMid() {
		return Mid;
	}
	public void setMid(int id) {
		this.Mid = id;
	}
	/*public String getName() {
		return Name;
	}
	public void setName(String name) {
		this.Name = name;
	}
	public String getMajor() {
		return Major;
	}
	public void setMajor(String major) {
		this.Major = major;
	}*/
	public String getRank() {
		return Rank;
	}
	public void setRank(String Rank) {
		this.Rank=Rank;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		this.Password = password;
	}

}
