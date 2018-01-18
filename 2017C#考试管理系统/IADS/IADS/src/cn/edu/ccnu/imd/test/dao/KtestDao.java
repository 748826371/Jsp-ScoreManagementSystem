package cn.edu.ccnu.imd.test.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import cn.edu.ccnu.imd.test.entity.*;
import cn.edu.ccnu.imd.test.dao.*;

public class KtestDao {
	public Ktest searchKtestByKid(int  kid){
			Ktest ktest=null;
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement(" SELECT * from ktest WHERE kid = ?");
				pStat.setInt(1, kid);
				ResultSet result = pStat.executeQuery();
				while (result.next()) {
					ktest = new Ktest();
					ktest.setKid(result.getInt("Kid"));
					ktest.setCid(result.getInt("cid"));
					//System.out.println(result.getInt("cid"));
					ktest.setType(result.getString("type"));
					ktest.setKtype(result.getString("ktype"));
					ktest.setPlaceID(result.getInt("PlaceID"));
					ktest.setDay(result.getString("day"));
					ktest.setTime(result.getString("time"));
					
				}
				
					conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} 
       return ktest;
		
	}
	
		public int  checkKid(int  kid){
				int ret=0;
			try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection conn = DriverManager.getConnection(
							"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
					PreparedStatement pStat = conn.prepareStatement(" SELECT * from place_time  WHERE kid = ?");
					pStat.setInt(1, kid);
					ResultSet result = pStat.executeQuery();
					
					if(result.next())
							{ret=1;}//place_time中有考试安排，
					else 
							{ret=2;}//该场考试没有安排。	
						conn.close();
			}catch (Exception e) {
				e.printStackTrace();
			} 
			return ret;
			
		}
	
		
		public int  checkTime(int  PlaceID,int Kday,int Ktime){
			int ret=0;
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement(" SELECT * from place_time  WHERE  PlaceID=? and Kday = ? and Ktime = ?");
				pStat.setInt(1, PlaceID);
				pStat.setInt(2, Kday);
				pStat.setInt(3, Ktime);
				ResultSet result = pStat.executeQuery();
				
				if(result.next())
						{ret=1;}//place_time中当前时间有考试安排，
				else 
						{ret=2;}//该场时间没有安排。	
					conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} 
		return ret;
		
	}
	
	
	
	
	
	public List searchKtestByTid(int  tid){
		List  ktestList  = new ArrayList();
		CourseDao couDao = new CourseDao();
		List courseList = couDao.searchCoursesByTid(tid); 
		Iterator iter = courseList.iterator();
		Course course;
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement(" SELECT ktest.Kid,ktest.CID,ktest.TYPE,ktest.Ktype"
						+ ",ktest.PlaceID,ktest.Time,ktest.Day FROM ktest,courses WHERE ktest.CID=courses.CID AND courses.TID = ?");
				pStat.setInt(1, tid);
				ResultSet result = pStat.executeQuery();
				Ktest ktest;
				while (result.next()) {
					ktest = new Ktest();
					ktest.setKid(result.getInt("Kid"));
					ktest.setCid(result.getInt("cid"));
					ktest.setType(result.getString("type"));
					ktest.setKtype(result.getString("ktype"));
					ktest.setPlaceID(result.getInt("PlaceID"));
					ktest.setDay(result.getString("day"));
						//System.out.println(result.getString("day"));
					ktest.setTime(result.getString("time"));
					ktestList.add(ktest);
				}
				
					conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} 
       return ktestList;
		
	}
	
	public List searchKtestBySid(int  sid){
		List  ktestList  = new ArrayList();
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement("SELECT kt.* FROM studentcourses sc,ktest kt WHERE sc.SID=? AND sc.CID=kt.CID");
				pStat.setInt(1, sid);
				ResultSet result = pStat.executeQuery();
				Ktest ktest;
				while (result.next()) {
					ktest = new Ktest();
					ktest.setKid(result.getInt("Kid"));
					ktest.setCid(result.getInt("cid"));
					ktest.setType(result.getString("type"));
					ktest.setKtype(result.getString("ktype"));
					ktest.setPlaceID(result.getInt("PlaceID"));
					ktest.setDay(result.getString("day"));
						//System.out.println(result.getString("day"));
					ktest.setTime(result.getString("time"));
					ktestList.add(ktest);
				}
				
					conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} 
       return ktestList;
		
	}
	
	public int searchAvai(){
		int avaikid=0;
		List  ktestList  = new ArrayList();
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement("SELECT kid FROM ktest");
				ResultSet result = pStat.executeQuery();
				int temp1=1,temp2=2,max=1;
				while (result.next()) {
					temp2=temp1;
					temp1=result.getInt("kid");
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
	
	
	
	
	
	public int Change(Ktest  ktest){
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			PreparedStatement pStat = conn.prepareStatement(" Update Ktest k set k.Ktype = ?,k.Time=?,k.day=?,k.PlaceID=? where Kid = ?");
			pStat.setString(1, ktest.getKtype());
			pStat.setString(2, ktest.getTime());
			pStat.setString(3, ktest.getDay());
			pStat.setInt(4, ktest.getPlaceID());
			pStat.setInt(4, ktest.getKid());
			result = pStat.executeUpdate();

				conn.close();
	}catch (Exception e) {
		e.printStackTrace();
	} 
   return result;
	
}
	

	
	public int Search(Ktest  ktest){
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			PreparedStatement pStat = conn.prepareStatement("SELECT place_time.Kid from place_time WHERE place_time.PlaceID=? AND place_time.Kday=? AND place_time.Ktime=?");
			pStat.setInt(1, ktest.getPlaceID());
			pStat.setString(2, ktest.getDay());
			pStat.setString(3, ktest.getTime());
			result = pStat.executeUpdate();
			//System.out.println(result);
			conn.close();
	}catch (Exception e) {
		e.printStackTrace();
	} 
   return result;
	
}
	
	public int SaveTest(int Kid,int PlaceID,int Kday,int Ktime){
		int result = 0;
		try {
			KtestDao kt = new KtestDao();
			int anw=kt.checkKid(Kid);
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			
			int anw2=kt.checkTime(PlaceID,Kday,Ktime);
			if(anw2==1)
						{result=0;}
			if(anw2==2)
			{
					if(anw==1)//有考试安排
									{PreparedStatement pStat = conn.prepareStatement("Update  place_time   set  PlaceID=?,Kday=?,Ktime=?  where  kid=? ");
									pStat.setInt(1, PlaceID);
									pStat.setInt(2, Kday);
									pStat.setInt(3, Ktime);
									pStat.setInt(4, Kid);
									result = pStat.executeUpdate();}
					else if(anw==2)//没有考试安排
									{PreparedStatement pStat = conn.prepareStatement(" Insert into  place_time   (Kid,PlaceID,Kday,Ktime) values (?,?,?,?)  ");
									pStat.setInt(1, Kid);
									pStat.setInt(2, PlaceID);
									pStat.setInt(3, Kday);
									pStat.setInt(4, Ktime);
									result = pStat.executeUpdate();}
			
						PreparedStatement pStat1 = conn.prepareStatement(
									"UPDATE place_time,ktest   SET ktest.`Day`=place_time.Kday,ktest.Time=place_time.Ktime,ktest.PlaceID=place_time.PlaceID  WHERE ktest.Kid=place_time.Kid");
						result = pStat1.executeUpdate();
						result=1;
						conn.close();}
	}catch (Exception e) {
		e.printStackTrace();
	} 
			return result;
	
}
	
	public static void main(String[] args) {
		//List KtestList =stuDao.searchKtestByKid(9001);
		KtestDao ktDao= new KtestDao();
		//int result=ktDao.SaveTest(9003,3,5,5);
		//List KtestList=ktDao.searchKtestBySid(2014001);
		//if(result==0){System.out.println("wrong");}
		int max=ktDao.searchAvai();
		System.out.println(max);
	//	System.out.println(max);
}
	
}
