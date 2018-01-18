package cn.edu.ccnu.imd.test.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import cn.edu.ccnu.imd.test.entity.Course;
import cn.edu.ccnu.imd.test.entity.Student;

public class CourseDao {
	
	/**
	 * 通过教工号查询代课信息。
	 * @param tid
	 * @return
	 */
	public List searchCoursesByTid(int  tid){
		List courseList  = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			
			PreparedStatement pStat = conn.prepareStatement("Select * from courses " +
					" where tid = ?");
			pStat.setInt(1, tid);
			ResultSet result = pStat.executeQuery();
			Course course;
			while (result.next()) {
				course = new Course();
				course.setCid(result.getInt("cid"));
				course.setName(result.getString("name"));
				course.setMajor(result.getString("major"));
				course.setType(result.getString("type"));
				course.setPointt(result.getInt("point"));
				course.setTid(tid);
				
				courseList.add(course);
				
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
       return courseList;
		
	}
	
	public List searchCourseBySid(int  sid){
		List courseList  = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			
			PreparedStatement pStat = conn.prepareStatement("Select c.* from studentcourses sc,courses c" +
					" where sc.sid = ? and sc.cid=c.cid");
			pStat.setInt(1, sid);
			ResultSet result = pStat.executeQuery();
			Course course;
			while (result.next()) {
				course = new Course();
				course.setCid(result.getInt("cid"));
				course.setName(result.getString("name"));
				course.setMajor(result.getString("major"));
				course.setType(result.getString("type"));
				course.setPointt(result.getInt("point"));
				course.setTid(result.getInt("tid"));
				courseList.add(course);
				
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
       return courseList;
		
	}
	
	
	
	
	
	
	/**
	 * 通过课程编号查询课程。
	 * @param cid
	 * @return
	 */
	public Course searchCourseByCid(int cid){
		
		Course course = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");		
			PreparedStatement pStat = conn.prepareStatement("Select c.point as point,c.tid as tid,c.name as cname,t.name as tname,c.major as major" +
					" from courses c,teachers t  where c.cid = ? and c.tid = t.tid");
			pStat.setInt(1, cid);
			ResultSet result = pStat.executeQuery();			
			if (result.next()) {
				course = new Course();
				course.setCid(cid);
				course.setName(result.getString("cname"));
				course.setTid(result.getInt("tid"));
				course.setMajor(result.getString("major"));
				course.setTname(result.getString("tname"));
				course.setPointt(result.getInt("point"));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return course;		
	}
	
	
	
	
	
	
	public void ChangeTypeByCid(int cid,int type){
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");		
			PreparedStatement pStat = conn.prepareStatement("Update  courses c,ktest k Set c.TYPE =?,k.TYPE=?,k.Ktype=?" +
					" where c.cid = ? and k.cid=c.cid");
			if(type==1)
					{pStat.setString(1,"考试");
					pStat.setString(2,"考试");
					pStat.setString(3,"closed");
					}
			else if(type==2)
			{pStat.setString(1,"考试");
			pStat.setString(2,"考试");
			pStat.setString(3,"open");
			}
			else if(type==3)
			{pStat.setString(1,"课题论文");
			pStat.setString(2,"课题论文");
			pStat.setString(3,"");
			}
			else if(type==4)
			{pStat.setString(1,"大作业");
			pStat.setString(2,"大作业");
			pStat.setString(3,"");
			}
			pStat.setInt(4, cid);
			int result = pStat.executeUpdate();			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
	}
	
	public int  AddCourse(int cid,int tid,String Cname,String Major,int pointt,int typevalue){
		System.out.println(typevalue);
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			String type = null,ktype=null;
			if(typevalue==1)
			{type="考试";ktype="closed";}
			if(typevalue==2)
			{type="考试";ktype="open";}
			if(typevalue==3)
			{type="课题论文";ktype="";}
			if(typevalue==4)
			{type="大作业";ktype="";}
			
			

			PreparedStatement pStat = conn.prepareStatement("insert into courses "+
			"value(?,?,?,?,?,?)");
			pStat.setInt(1, cid);pStat.setInt(2, tid);pStat.setString(3, Cname);pStat.setString(4, type);pStat.setString(5, Major);pStat.setInt(6, pointt);
			pStat.executeUpdate();
			KtestDao ktdao= new KtestDao();
			int kid=ktdao.searchAvai();
			System.out.println(kid);
			PreparedStatement pStat1 = conn.prepareStatement("insert into ktest(kid,cid,type,ktype) "+
			"value(?,?,?,?)");
			pStat1.setInt(1, kid);pStat1.setInt(2, cid);pStat1.setString(3, type);pStat1.setString(4, ktype);
			pStat1.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return result;		
	}
	
	
	
	public int  UpdateCourse(int cid,int tid,String Cname,String Major,int pointt,int typevalue){
		
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			String type = null,ktype=null;
			if(typevalue==1)
			{type="考试";ktype="closed";}
			if(typevalue==2)
			{type="考试";ktype="open";}
			if(typevalue==3)
			{type="课题论文";ktype="";}
			if(typevalue==4)
			{type="大作业";ktype="";}
			
			
			CourseDao couDao= new CourseDao();
			Course cou=new Course();
			cou=couDao. searchCourseByCid(cid);
			System.out.println(type+"***1***"+ktype);
			if(cou!=null)
			{	PreparedStatement pStat = conn.prepareStatement("update courses  set tid=?,name=?,type=?,major=?,point=? where cid=?");
					pStat.setInt(1, tid);pStat.setString(2, Cname);pStat.setString(3, type);pStat.setString(4,Major);pStat.setInt(5, pointt);pStat.setInt(6, cid);
					System.out.println(type+"***2***"+ktype);
					pStat.executeUpdate();
					PreparedStatement pStat1 = conn.prepareStatement("update ktest k set k.type=?,k.ktype=?  where  k.cid=?");
					pStat1.setString(1, type);pStat1.setString(2, ktype);pStat1.setInt(3, cid);
					System.out.println(type+"***3***"+ktype);
					pStat1.executeUpdate();
					result=1;
			conn.close();}
			else{
				result=0;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}		
		System.out.println(result);
		return result;		
	}
	public void delCourseByCid(int cid){
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement("delete c.*,kt.* from courses c,ktest kt where kt.cid=c.cid and c.cid=?");
				pStat.setInt(1, cid);
				pStat.executeUpdate();
				conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} 
	}
	
	public String GetKtypebyCid(int cid){
		String Ktype=null;
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement("Select kt.ktype from courses c,ktest kt where c.cid=? and c.cid=kt.cid");
				pStat.setInt(1, cid);
				ResultSet result=pStat.executeQuery();
				result.next();
				Ktype=result.getString("ktype");
				conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return Ktype; 
	}
	

	
	
	
	
	
	public int searchAvai(){
		int avaikid=0;
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement("SELECT cid FROM courses");
				ResultSet result = pStat.executeQuery();
				int temp1=1,temp2=2,max=1;
				while (result.next()) {
					temp2=temp1;
					temp1=result.getInt("cid");
					if(temp1>max)
									{max=temp1;}
					if(temp1-temp2>1&&temp2>9000)
									{avaikid=temp2+1;break;}
				}
				if(avaikid==2||avaikid==0){avaikid=max+1;}
					conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} 
       return avaikid;
		
	}
	
	
	
	
	public static void main(String[] args) {
		CourseDao stuDao = new CourseDao();
		//stuDao.AddCourse(2009008,2008003,"magic","maho",5,1);
		int max=stuDao.searchAvai();
		/*Course cou=new Course();
		cou=stuDao. searchCourseByCid(2009008);
		if(cou==null)
			{System.out.println("chun");}*/
		//stuDao.UpdateCourse(2009008,2008002,"da","taiyo",6,2);
		System.out.println(max);
		//stuDao.delCourseByCid(2009008);
		//stuDao.delCourseByCid(2009004);
}
}
