package cn.edu.ccnu.imd.test.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;

import cn.edu.ccnu.imd.test.entity.Student;
import cn.edu.ccnu.imd.test.entity.Teacher;

public class TeacherDao {

	/**
	 * 通过教工号查询教工信息。
	 * 
	 * @param sid
	 * @return
	 */
	public Teacher searchTeacherByTid(int tid) {
		Teacher teacher = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");

			PreparedStatement pStat = conn
					.prepareStatement("Select * from teachers "
							+ " where tid = ?");
			pStat.setInt(1, tid);
			ResultSet result = pStat.executeQuery();
			if (result.next()) {
				teacher = new Teacher();
				teacher.setTid(result.getInt("TID"));
				teacher.setName(result.getString("NAME"));
				teacher.setMajor(result.getString("MAJOR"));
//				teacher.setAge(result.getInt("AGE"));
//				teacher.setGrade(result.getInt("Grade"));
//				teacher.setGender(result.getString("GENDER"));
				teacher.setPassword(result.getString("PASSWORD"));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return teacher;
	}
	
	public int searchAvai(){
		int avaikid=0;
		List  ktestList  = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			PreparedStatement pStat = conn.prepareStatement("SELECT tid FROM teachers");
			ResultSet result = pStat.executeQuery();
			int temp1=1,temp2=2,max=1;
			while (result.next()) {
				temp2=temp1;
				temp1=result.getInt("tid");
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
	
	
	public void delteacher(int tid){
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement("delete t.* FROM teachers t WHERE t.tid=?");
				pStat.setInt(1, tid);
				pStat.executeUpdate();
					conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} 	
	}
	

	
	
	
			public int AddTeacher(int tid,String Tname,int age,String major,String title,String password,String gender){
				int result=0;
				try {
						Class.forName("com.mysql.jdbc.Driver");
						Connection conn = DriverManager.getConnection(
								"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
						PreparedStatement pStat = conn.prepareStatement("insert into teachers "+
								"value(?,?,?,?,?,?,?)");
								pStat.setInt(1, tid);pStat.setString(2, Tname);pStat.setInt(3, age);pStat.setString(4, major);pStat.setString(5, title);pStat.setString(6, password);pStat.setString(7,gender);
								pStat.executeUpdate();
								conn.close();
								result=1;
				}catch (Exception e) {
					e.printStackTrace();
				} 
		       return result;
				
			}
	

	public static void main(String[] args) {
		TeacherDao teaDao = new TeacherDao();
		int max=teaDao.searchAvai();
		System.out.println(max);
		/*Teacher tea=teaDao. searchTeacherByTid(2006001);
		if(tea==null)
				{System.out.println("cannot find");}
		else if(tea!=null)
				{System.out.println("others");}*/
		//teaDao.AddTeacher(2008004,"test",85,"magic","pro","123456","f");
		teaDao.delteacher(2008005);
}
}
