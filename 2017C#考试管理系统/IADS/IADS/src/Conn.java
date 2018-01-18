import java.sql.*;

import cn.edu.ccnu.imd.test.dao.StudentDao;
import cn.edu.ccnu.imd.test.entity.Student;

public class Conn {
		Connection con;
		public Connection getConnection(){
			try{
				Class.forName("com.mysql.jdbc.Driver");
				System.out.println("driver load successful.");
			}catch(ClassNotFoundException e){
				e.printStackTrace();
			}
			String url ="jdbc:mysql://127.0.0.1:3306/test";
			String username="root";
			String password ="ccnuccnu";
			try{
				con = DriverManager.getConnection(url,username,password);
				System.out.println("connect successful");
			//	Statement stat = con.createStatement();

				// 4.ִ��sql���,�˴�ִ�в�ѯ��䣬����һ��ResultSet���󣬼����������
				//ResultSet result = stat.executeQuery("select * from students");

				// 5.�Խ�������е�����ȡ�����ݡ�
			//	System.out.println("�û���        " + "����");
		/*		while (result.next()) {
					System.out.println(
							result.getString("Username") + "    " + result.getString("password") );
				}*/

			}catch(SQLException e){
				e.printStackTrace();
				System.out.println("connect fail");
			}
			
			return con;
		}
		
		/*public boolean change(String sex,String password) {
			boolean result=false;
			try{
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "ccnuccnu");
			PreparedStatement stat = conn.prepareStatement("update tesp set sex=?  when password=?");
			stat.setString(1, sex);
			stat.setString(2, password);
			int res = stat.executeUpdate();
			if(res>0)
				{System.out.println("success");
				result=true;}
			else
				{System.out.println("false");
				result=false;}
					} catch(ClassNotFoundException ce){
						ce.printStackTrace();
					}catch (SQLException ee) {
				ee.printStackTrace();
			}
			return result;
		}
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
		public static void main(String[] args){
				Conn c = new Conn();
				c.getConnection();
				int sid = 2014001;
				StudentDao stuDao = new StudentDao();
				Student stu = stuDao.searchStudentBySid(sid);
				String message="123";
				if (stu == null) {
					message = "ѧ������������������룡";}
				else {
					message = "��¼�ɹ���";
				System.out.println(message);
			//	c.change("male","undead");
		}
}}