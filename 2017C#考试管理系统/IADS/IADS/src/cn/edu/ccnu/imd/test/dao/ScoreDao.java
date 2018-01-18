package cn.edu.ccnu.imd.test.dao;

import java.util.*;
import java.sql.*;
import cn.edu.ccnu.imd.test.entity.*;
import cn.edu.ccnu.imd.test.dao.*;


public class ScoreDao {

	/**
	 * ͨ���γ̱�Ų�ѯ����Ҫѡ�޸ÿγ̵�ѧ��ѧ�ź������б�
	 * 
	 * @param cid
	 *            �γ̱��
	 * @return
	 */
	public List searchInputScoresByCid(int cid) {
		List scoreList = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			// ע�������ϲ�ѯsql���ı�д�������ڲ�ѯ��������ʹ�ù�ͬ�ֶ��Ƕ�����ϵĹؼ������籾���е�sc.sid = s.sid
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
	
	/**���ѧ��***/
	public int DelStudent(String sid,String cid) {
		int result=0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			// ע�������ϲ�ѯsql���ı�д�������ڲ�ѯ��������ʹ�ù�ͬ�ֶ��Ƕ�����ϵĹؼ������籾���е�sc.sid = s.sid
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
			// ע�������ϲ�ѯsql���ı�д�������ڲ�ѯ��������ʹ�ù�ͬ�ֶ��Ƕ�����ϵĹؼ������籾���е�sc.sid = s.sid
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
	 * ����ɼ���
	 * 
	 * @param hm
	 *            ѧ����ɼ���ӳ��
	 * @param cid
	 *            �γ̱��
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

			Set sidSet = hm.keySet();//ȡ����ϣ��ļ����ϡ�
			Iterator iter = sidSet.iterator();
			int sid;
			float score;

			while (iter.hasNext()) {//�Լ���ѧ�ţ����е�����ͨ����ȡ����Ӧ��ֵ���ɼ�����
				Object key = iter.next();
				sid = ((Integer) key).intValue();//ȡ����ϣ����ļ���ѧ�š�ע���ϣ����ļ���ֵ����Object���ͣ������Ҫǿ��ת������ͬ��
				score = ((Float) hm.get(key)).floatValue();//ͨ����ȡ����ѧ������Ӧ�ĳɼ���
				pStat.setFloat(1, score);
				pStat.setInt(2, sid);
				pStat.setInt(3, cid);
				pStat.addBatch();//��������ִ�и�����䡣
			}
			pStat.executeBatch();//ִ������������䡣

			conn.close();
		} catch (Exception e) {
			result = false;
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * ͨ���γ̱�Ų�ѯ�Ѿ�¼��ĳɼ���
	 * @param cid
	 * @return
	 */
	public List searchScoresByCid(int cid) {
		List scoreList = new ArrayList();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test", "root", "ccnuccnu");
			// ע�������ϲ�ѯsql���ı�д�������ڲ�ѯ��������ʹ�ù�ͬ�ֶ��Ƕ�����ϵĹؼ������籾���е�sc.sid = s.sid
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
