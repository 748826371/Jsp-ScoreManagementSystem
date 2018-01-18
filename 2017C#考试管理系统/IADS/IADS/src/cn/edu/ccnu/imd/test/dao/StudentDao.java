package cn.edu.ccnu.imd.test.dao;
import java.util.*;
import java.sql.*;
import cn.edu.ccnu.imd.test.entity.*;
public class StudentDao {
	
	/**
	 * 新增学生。
	 * @param stu
	 * @return 新增学生数据的条数。
	 */
	public int addStudent(Student stu){
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			PreparedStatement pStat = conn.prepareStatement("Insert into students(SID,name," +
					"gender,major,grade,password) values (?,?,?,?,?,?)");
			pStat.setInt(1,stu.getSid());
			pStat.setString(2,stu.getName());
			pStat.setString(3,stu.getGender());
			pStat.setString(4, stu.getMajor());
			pStat.setInt(5,stu.getGrade());
			pStat.setString(6,stu.getPassword());
			result = pStat.executeUpdate();
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;	
		
	}
	
	/**
	 * 修改学生专业。
	 * @param id 学号
	 * @param newMajor 转入专业名
	 * @return
	 */
	public int modifyMajor(int id,String newMajor){
		int result = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			PreparedStatement pStat = conn.prepareStatement("Update students set major = ?" +
					" where id = ?");
			pStat.setString(1,newMajor);
			pStat.setInt(2,id);
			result = pStat.executeUpdate();
			
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;	
		
	}
	
	/**
	 * 通过专业查询学生信息。
	 * @param major
	 * @return 该专业的学生集合。
	 */
	public List searchStudentsByMajor(String major){
		List studentList  = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");		//Statement stat = conn.createStatement();
			//String sql = "Select * from Student where major = '" + major+"'";
			
			//ResultSet result = stat.executeQuery(sql);
			PreparedStatement pStat = conn.prepareStatement("Select * from students " +
					" where major = ?");
			pStat.setString(1, major);
			ResultSet result = pStat.executeQuery();
			Student student;
			while (result.next()) {
				student = new Student();
				student.setSid(result.getInt("sid"));
				student.setName(result.getString("NAME"));
				student.setMajor(major);
				student.setAge(result.getInt("age"));
				student.setGrade(result.getInt("Grade"));
				studentList.add(student);
				
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
       return studentList;
		
	}
	
	/**
	 * 通过学号查询学生信息。
	 * @param sid
	 * @return
	 */
	public Student searchStudentBySid(int sid){
		Student student = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			
			PreparedStatement pStat = conn.prepareStatement("Select * from students " +
					" where sid = ?");
			pStat.setInt(1, sid);
			ResultSet result = pStat.executeQuery();			
			if (result.next()) {
				student = new Student();
				student.setSid(result.getInt("SID"));
				student.setName(result.getString("NAME"));
				student.setMajor(result.getString("MAJOR"));
				student.setAge(result.getInt("AGE"));
				student.setGrade(result.getInt("Grade"));
				student.setGender(result.getString("GENDER"));
				student.setPassword(result.getString("PASSWORD"));
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}		
		return student;		
	}

	public int searchAvai(){
		int avaikid=0;
		List  ktestList  = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			PreparedStatement pStat = conn.prepareStatement("SELECT sid FROM students");
			ResultSet result = pStat.executeQuery();
			int temp1=1,temp2=2,max=1;
			while (result.next()) {
				temp2=temp1;
				temp1=result.getInt("sid");
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
	
	
	public void delstufromsys(int sid){
		try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
				PreparedStatement pStat = conn.prepareStatement("delete s.* FROM students s WHERE s.sid=?");
				pStat.setInt(1, sid);
				pStat.executeUpdate();
					conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		} 	
	}
	
	
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {
		StudentDao stuDao = new StudentDao();
		int max=stuDao.searchAvai();
		System.out.println(max);
		//stuDao.delstufromsys(2014006);
		
		/*if(stu==null)
				{System.out.println("cannot find");}
		else if(stu!=null)
				{System.out.println("others");}*/
		/*List stuList = stuDao.searchStudentsByMajor("Information Management");
		Iterator iter = stuList.iterator();
		Student stu;
		System.out.println("学号        姓名        专业        年龄        年级");
		while(iter.hasNext()){
			stu = (Student)iter.next();
			System.out.println(stu.getId()+"    "+
			             stu.getName()+"    "+stu.getMajor()+"    "+
					    stu.getAge()+"    "+stu.getGrade());
			
		}*/
		
		/*Student stu = new Student();
		stu.setId(3456789);
		stu.setName("Mike");
		stu.setAge(22);
		stu.setMajor("Information Resource Management");
		stu.setGrade(4);
		int result = stuDao.addStudent(stu);
		if(result >0 )
			System.out.println("Add a student record into the database  successfully!");
		*/
		
		/*int result  = stuDao.modifyMajor(2345678, "eBusiness");
		if(result >0 )
			System.out.println("The student's major is modified successfully!");*/
		

	}

}
