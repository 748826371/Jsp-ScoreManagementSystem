package cn.edu.ccnu.imd.test.dao;

import java.util.*;
import java.sql.*;
import cn.edu.ccnu.imd.test.entity.*;
import cn.edu.ccnu.imd.test.dao.*;


public class ScoreDao {

	/**
	 * 通过课程编号查询出需要选修该课程的学生学号和姓名列表
	 * 
	 * @param cid
	 *            课程编号
	 * @return
	 */
	public List searchInputScoresByCid(int cid) {
		List scoreList = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			// 注意多表联合查询sql语句的编写方法，在查询子条件中使用共同字段是多表联合的关键，比如本例中的sc.sid = s.sid
			PreparedStatement pStat = conn
					.prepareStatement("Select s.name as sname,s.sid as sid from studentcourses sc,students s "
							+ "where sc.cid = ? and sc.sid = s.sid");
			pStat.setInt(1, cid);
			ResultSet result = pStat.executeQuery();
			Score score;
			while (result.next()) {
				score = new Score();
				score.setSname(result.getString("sname"));
				score.setSid(result.getInt("sid"));
				//score.setScore(result.getFloat("score"));
				scoreList.add(score);

			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return scoreList;

	}
	
	/**添加学生***/
	public int DelStudent(String sid,String cid) {
		int result=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			// 注意多表联合查询sql语句的编写方法，在查询子条件中使用共同字段是多表联合的关键，比如本例中的sc.sid = s.sid
			PreparedStatement pStat = conn
					.prepareStatement("DELETE FROM studentcourses WHERE sid =?  AND cid = ? ");
			pStat.setString(1,sid);
			pStat.setString(2, cid);
			result = pStat.executeUpdate();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int AddStudent(int sid,int cid) {
		int result=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			// 注意多表联合查询sql语句的编写方法，在查询子条件中使用共同字段是多表联合的关键，比如本例中的sc.sid = s.sid
			PreparedStatement pStat = conn
					.prepareStatement("INSERT INTO studentcourses VALUES (?,?,NULL)");
			pStat.setInt(1,sid);
			pStat.setInt(2, cid);
			StudentDao studentDao=new StudentDao();
			Student stu=studentDao.searchStudentBySid(sid);
			if(stu==null){
				
				result=0;
			}
			else{
				
				pStat.executeUpdate();
				
				result=1;
			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	

	/**
	 * 保存成绩。
	 * 
	 * @param hm
	 *            学号与成绩的映射
	 * @param cid
	 *            课程编号
	 * @return
	 */
	public boolean saveScores(Map hm, int cid) {
		boolean result = true;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			PreparedStatement pStat = conn
					.prepareStatement("Update studentcourses set score = ? where sid = ? and cid=?");

			Set sidSet = hm.keySet();//取出哈希表的键集合。
			Iterator iter = sidSet.iterator();
			int sid;
			float score;

			while (iter.hasNext()) {//对键（学号）进行迭代，通过键取出对应的值（成绩）。
				Object key = iter.next();
				sid = ((Integer) key).intValue();//取出哈希表里的键即学号。注意哈希表里的键和值都是Object类型，因此需要强制转换，下同。
				score = ((Float) hm.get(key)).floatValue();//通过键取出该学号所对应的成绩。
				pStat.setFloat(1, score);
				pStat.setInt(2, sid);
				pStat.setInt(3, cid);
				pStat.addBatch();//增加批量执行更新语句。
			}
			pStat.executeBatch();//执行批量更新语句。

			conn.close();
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 通过课程编号查询已经录入的成绩。
	 * @param cid
	 * @return
	 */
	public List searchScoresByCid(int cid) {
		List scoreList = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			// 注意多表联合查询sql语句的编写方法，在查询子条件中使用共同字段是多表联合的关键，比如本例中的sc.sid = s.sid
			PreparedStatement pStat = conn
					.prepareStatement("Select s.name as sname,s.sid as sid,sc.score as score from studentcourses sc,students s "
							+ "where sc.cid = ? and sc.sid = s.sid");
			pStat.setInt(1, cid);
			ResultSet result = pStat.executeQuery();
			Score score;
			while (result.next()) {
				score = new Score();
				score.setSname(result.getString("sname"));
				score.setSid(result.getInt("sid"));
				score.setScore(result.getFloat("score"));
				scoreList.add(score);

			}
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return scoreList;

	}
	public static void main(String[] args) {
		ScoreDao stuDao = new ScoreDao();
		stuDao.AddStudent(2014008,2009001);
}
}
