package cn.edu.ccnu.imd.test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.ccnu.imd.test.dao.*;
import cn.edu.ccnu.imd.test.entity.*;


public class TestServlet extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
			response.setContentType("text/html;charset=UTF-8"); //如果不指定UTF-8,页面显示乱码,但后台输出正确
			//设置request请求过来的编码格式
			request.setCharacterEncoding("UTF-8");
	}
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String service = request.getParameter("service");// 请求类型，通过该变量判断前台不同的请求。
		
		HttpSession session=request.getSession();
		/*****************************登录模块**********************************/
		if (service.equals("login")) {// 登录请求
		String inputid = request.getParameter("id");
		String password = request.getParameter("password");
		String role = request.getParameter("role");
		
		/*****************学生登录模块*************************/
		if (role.equals("1")) {// role==1,学生登录。
			int sid = Integer.parseInt(inputid);
			StudentDao stuDao = new StudentDao();
			Student stu = stuDao.searchStudentBySid(sid);
			String message;
		if (stu == null) {
			message = "学号输入错误，请重新输入！";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);}
		else if(password != null&& !password.equals(stu.getPassword())){
			message = "密码错误,请重新输入！";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);}
		else {
			session.setAttribute("message",null);
			int name1 = stu.getSid();
			String name2 = stu.getName();
			String name3 = stu.getMajor();
			request.setAttribute("id",name1);
			request.setAttribute("name",name2);
			request.setAttribute("major",name3);
			session.setAttribute("stu",stu);
			KtestDao ktdao = new KtestDao();
			List TestList=ktdao.searchKtestBySid(sid);
			session.setAttribute("TestList",TestList);
			CourseDao couDao=new CourseDao();
			List CourseList=couDao.searchCourseBySid(sid);
			session.setAttribute("CourseList",CourseList);
			session.setAttribute("role","student");
			request.getRequestDispatcher("/Stu_course.jsp").forward(
			request, response);}
		}
		/*****************教师登录模块*************************/
		
		else if (role.equals("2")) {// role==2,教师登录
			int tid = Integer.parseInt(inputid);

			TeacherDao teachDao = new TeacherDao();
			Teacher teach = teachDao.searchTeacherByTid(tid);

			String message;
			if (teach == null) {
				if(tid==2008002||tid==2006001)
				{message="数据库连接错误";}
				else
				{message = "教工号错误，请重新输入！";}
				request.setAttribute("message", message);
				request.getRequestDispatcher("/login.jsp").forward(request,
						response);
			} else if (password != null
					&& !password.equals(teach.getPassword())) {
				message = "密码错误,请重新输入！";
				request.setAttribute("message", message);
				request.getRequestDispatcher("/login.jsp").forward(request,
						response);
			} else {
				message = "成功登录";
				int name1 = teach.getTid();
				String name2 = teach.getName();
				String name3 =teach.getMajor();
				request.setAttribute("id",name1);
				request.setAttribute("name",name2);
				request.setAttribute("major",name3);	
				request.setAttribute("message", message);
				CourseDao courseDao = new CourseDao();
				List courseList = courseDao.searchCoursesByTid(tid);
				session.setAttribute("courses", courseList);
				session.setAttribute("ter", teach);
				session.setAttribute("role","teacher");
				request.getRequestDispatcher("/Tea_Main.jsp").forward(
						request, response);
					}
				}//教师登录模块
		/*****************管理员登录模块*************************/	
		
		if (role.equals("3")) {
			int sid = Integer.parseInt(inputid);
			ManDao stuDao = new ManDao();
			Manager mana = stuDao.searchManaByMid(sid);
			String message;
		if (mana == null) {
			message = "管理员账号输入错误，请重新输入！";
			request.setAttribute("message", message);
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);}
		else if(password != null&& !password.equals(mana.getPassword())){
			message = "密码错误,请重新输入！"+mana.getPassword();
			request.setAttribute("message", message);
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);}
		else {
			session.setAttribute("message","");
			int name1 = mana.getMid();
			String name2 = mana.getRank();
			request.setAttribute("mid",name1);
			request.setAttribute("rank",name2);
			ManDao manDao = new ManDao();
			List CourseList=manDao.GetCourseList();
			List StudentList=manDao.GetStudentList();
			List TeacherList= manDao.GetTeacherList();
			session.setAttribute("mana",mana);
			session.setAttribute("CourseList",CourseList);
			session.setAttribute("StudentList",StudentList);
			session.setAttribute("TeacherList",TeacherList);
			session.setAttribute("role","manager");
			request.getRequestDispatcher("/Admin_Admin.jsp").forward(
			request, response);}
		}
		}
		/*****************************登录模块结束*************************************/
		
		else if (service.equals("inputScore")) {// 分数录入请求
			String inputCid = request.getParameter("cid");
			int cid = Integer.parseInt(inputCid);
			CourseDao courseDao = new CourseDao();
			Course course = courseDao.searchCourseByCid(cid);
			ScoreDao scoreDao = new ScoreDao();
			List scoreList = scoreDao.searchInputScoresByCid(cid);
			request.setAttribute("inputscores", scoreList);
			request.setAttribute("course", course);
			request.getRequestDispatcher("/Tea_InputScore.jsp").forward(request,
					response);

		}	
		
		else if (service.equals("Coursss")) {// 分数录入请求
			String inputCid = request.getParameter("cid");
			int cid = Integer.parseInt(inputCid);
			CourseDao courseDao = new CourseDao();
			Course course = courseDao.searchCourseByCid(cid);
			session.setAttribute("course",course);
			request.getRequestDispatcher("/Coursss.jsp").forward(request,
					response);

		}	
		else if (service.equals("SaveCourseChange")) {// 修改课程信息
			String role = (String)session.getAttribute("role");
			String inputCid = request.getParameter("cid");
			String inputTid = request.getParameter("tid");
			//String Cname = request.getParameter("Cname");
			String Cname = new String(request.getParameter("Cname").getBytes("ISO-8859-1"),"UTF-8");
			//String Major = request.getParameter("major");
			String Major = new String(request.getParameter("major").getBytes("ISO-8859-1"),"UTF-8");
			String inputpointt = request.getParameter("inputPointt");
			String inputtype = request.getParameter("type");
			int cid = Integer.parseInt(inputCid);
			int tid = Integer.parseInt(inputTid);
			int pointt= Integer.parseInt(inputpointt);
			System.out.println(inputpointt);
			System.out.println(Cname);
			System.out.println(Major);
			int type=Integer.parseInt(inputtype);
			CourseDao courseDao = new CourseDao();
			courseDao.UpdateCourse(cid,tid,Cname,Major,pointt,type);
			if(role.equals("teacher")){
				
			List courseList = courseDao.searchCoursesByTid(tid);
			session.setAttribute("courses", courseList);//重新载入课程列
			request.getRequestDispatcher("/Tea_CourseList.jsp").forward(request,
					response);
			}
			else if(role.equals("manager")){
				ManDao manDao = new ManDao();
				List CourseList=manDao.GetCourseList();
				session.setAttribute("CourseList",CourseList);
				request.getRequestDispatcher("/Admin_CourseList.jsp").forward(request,
						response);}
		}	
		
		
		else if (service.equals("searchScore")) {// 分数录入请求
			String cidStr = request.getParameter("cid");
			int cid = Integer.parseInt(cidStr);
			ScoreDao scoreDao = new ScoreDao();
			CourseDao courseDao = new CourseDao();
			Course course = courseDao.searchCourseByCid(cid);
			List scoreList = scoreDao.searchScoresByCid(cid);
			request.setAttribute("scores", scoreList);
			request.setAttribute("course", course);
			request.getRequestDispatcher("/Tea_ScoreList.jsp").forward(request,
					response);

		}
		else if (service.equals("ChangeStudent")) {// 分数录入请求
			String cidStr = request.getParameter("cid");
			int cid = Integer.parseInt(cidStr);
			ScoreDao scoreDao = new ScoreDao();
			CourseDao courseDao = new CourseDao();
			Course course = courseDao.searchCourseByCid(cid);
			List scoreList = scoreDao.searchScoresByCid(cid);
			session.setAttribute("scores", scoreList);
			session.setAttribute("course", course);
			session.setAttribute("message","" );
			/******session定义***********/
			
			request.getRequestDispatcher("/Tea_StuMana2.jsp").forward(request,
					response);}
		
		else if (service.equals("AddStudent")) {// 分数录入请求
			String inputSid = request.getParameter("sid");
			String inputCid = request.getParameter("cid");
			int sid = Integer.parseInt(inputSid);
			int cid = Integer.parseInt(inputCid);
			ScoreDao scoreDao = new ScoreDao();
			int result=scoreDao.AddStudent(sid,cid);
			session.setAttribute("message", "");
			if(result == 0)	
				{
				String message="学号错误，请重新输入";
				session.setAttribute("message",message);
				List scoreList = scoreDao.searchScoresByCid(cid);
				CourseDao courseDao = new CourseDao();
				Course course = courseDao.searchCourseByCid(cid);
				request.setAttribute("scores", scoreList);
				session.setAttribute("course", course);
				request.getRequestDispatcher("/Tea_StuMana2.jsp").forward(request,
				response);}
			else{
				String message="添加成功";
				session.setAttribute("message",message);
				request.getRequestDispatcher("/Tea_StuMana2.jsp").forward(request,
					response);
			}
		
		}
		
		else if (service.equals("DelStudent")) {// 分数录入请求
			String inputSid = request.getParameter("sid");
	    	Course course = (Course)session.getAttribute("course");
	    	int cid=course.getCid();
	    	String inputCid=Integer.toString(cid);
	    	ScoreDao scoreDao = new ScoreDao();
			scoreDao.DelStudent( inputSid,inputCid);
			request.getRequestDispatcher("/Tea_StuMana2.jsp").forward(request,
					response);
		
		}
		

		else if (service.equals("signin")) {
			String inputsid = request.getParameter("inputsid");
			String inputname = request.getParameter("inputname");
			String gender = request.getParameter("gender");
			String inputmajor = request.getParameter("inputmajor");
			String inputgrade = request.getParameter("inputgrade");
			String inputpassword = request.getParameter("inputpassword");
			Student stu=new Student();
			int sid = Integer.parseInt(inputsid);
			int grade = Integer.parseInt(inputgrade);
			stu.setSid(sid);
			stu.setName(inputname);
			stu.setGender(gender);
			stu.setMajor(inputmajor);
			stu.setGrade(grade);
			stu.setPassword(inputpassword);
			StudentDao studao = new StudentDao();
	    	studao.addStudent(stu);
			request.getRequestDispatcher("/login.jsp").forward(request,
					response);
		
		}
		
		
		else if (service.equals("KtestChange")) {
			String inputKid = request.getParameter("Kid");
			String inputKtype = request.getParameter("inputKtype");
			String inputTime = request.getParameter("inputTime");
			String inputpid = request.getParameter("inputAddress");
			Ktest ktest= new Ktest();
			int kid = Integer.parseInt(inputKid);
			int inputPlaceID = Integer.parseInt(inputpid);
			ktest.setKid(kid);
			ktest.setKtype(inputKtype);
			ktest.setTime(inputTime);
			ktest.setPlaceID(inputPlaceID);
			KtestDao ktDao= new KtestDao();
			ktDao.Change(ktest);
			request.getRequestDispatcher("/Tea_TestList.jsp").forward(request,
					response);
		
		}
		
		else if (service.equals("ChangeTest")) {// 分数录入请求
			String kidStr = request.getParameter("kid");
			int kid = Integer.parseInt(kidStr);
			KtestDao testDao = new KtestDao();
			Ktest ktest = testDao.searchKtestByKid(kid);
			session.setAttribute("Ktest",ktest);
			session.setAttribute("message","" );
			request.getRequestDispatcher("/Admin_AssignTest2.jsp").forward(request,
					response);}
		

		else if (service.equals("SaveTest")) {// 保存考试修改信息
			String kidStr = request.getParameter("kid");
			String szhou=request.getParameter("zhou");
			String sday=request.getParameter("day");
			String stime=request.getParameter("time");
			String sval=request.getParameter("role");
			
			int kid = Integer.parseInt(kidStr);
			int zhou = Integer.parseInt(szhou);
			int fday = Integer.parseInt(sday);
			int time  = Integer.parseInt(stime);
			int tday=(zhou-1)*5+fday;
			int val = Integer.parseInt(sval);
			KtestDao testDao = new KtestDao();
			int anw=testDao.SaveTest(kid,val,tday,time);
			System.out.println(anw);
			if(anw==1)
			{request.getRequestDispatcher("/Admin_AssignTest.jsp").forward(request,
					response);}
			else if(anw==0){
				String message = "错误，添加失败";
				session.setAttribute("message",message );
				request.getRequestDispatcher("/Admin_AssignTest2.jsp").forward(request,
						response);}
			
		
		}		
		
		
		else if (service.equals("saveScore")) {// 保存成绩请求
			Enumeration pNames = request.getParameterNames();// 获取前台表单的参数名列表，是一个枚举器。
			Map hm = new HashMap();// 用来保存学号和成绩的哈希表
			while (pNames.hasMoreElements()) {
				String name = (String) pNames.nextElement();// 获取第一个参数名，学号
				float score = 0;
				if (name.startsWith("2")) {// 如果参数名字符串以“2”开头，那么就是学号，即用来对应成绩的参数名。
					String scoreStr = request.getParameter(name);// 通过参数名（学号）获取该参数的值（分数）。
					int sid = Integer.parseInt(name);
					
					if (scoreStr != null)
						if(scoreStr.equals(""))
								scoreStr="0";
						score = Float.parseFloat(scoreStr);
					hm.put(sid, score);// 将“学号-分数”作为键-值保存在哈希表。
				}
			}
			String cidStr = request.getParameter("cid");// 获取课程编号
			int cid = Integer.parseInt(cidStr);
			ScoreDao scoreDao = new ScoreDao();
			scoreDao.saveScores(hm, cid);// 调用相应的DAO方法保存成绩。

			// 重新定向到scoreList.jsp页面用来显示成绩。查询过程和inputScore请求中的查询类似，只不过多了个“分数”字段的值。
			
			CourseDao courseDao = new CourseDao();
			Course course = courseDao.searchCourseByCid(cid);

			List scoreList = scoreDao.searchScoresByCid(cid);
			request.setAttribute("scores", scoreList);
			request.setAttribute("course", course);
			request.getRequestDispatcher("/Tea_ScoreList.jsp").forward(request,
					response);

		}

		/*****************************管理员端********************************************/
		
		else if (service.equals("ChangeTest")) {
			String kidStr = request.getParameter("kid");
			int kid = Integer.parseInt(kidStr);
			KtestDao testDao = new KtestDao();
			Ktest ktest = testDao.searchKtestByKid(kid);
			session.setAttribute("Ktest",ktest);
			session.setAttribute("message","" );
			request.getRequestDispatcher("/Admin_AssignTest2.jsp").forward(request,
					response);}
		
		else if (service.equals("AddCourse")) {
			String CidStr = request.getParameter("inputCid");
			String Cname = request.getParameter("inputCname");
			String Major = request.getParameter("inputMajor");
			String TidStr = request.getParameter("inputTid");
			String PointStr = request.getParameter("inputPoint");
			String TypeStr = request.getParameter("inputType");
			int cid = Integer.parseInt(CidStr);
			int tid = Integer.parseInt(TidStr);
			int point = Integer.parseInt(PointStr);
			int typevalue = Integer.parseInt(TypeStr);
			//if(typevalue==1||typevalue==2){String type="考试(闭卷)";}else if(typevalue==3){String type="课题论文";}else if(typevalue==4){String type="大作业";}
			CourseDao couDao = new CourseDao();
			couDao.AddCourse(cid,tid,Cname,Major,point,typevalue);
			ManDao manDao = new ManDao();
			List CourseList=manDao.GetCourseList();
			List StudentList=manDao.GetStudentList();
			List TeacherList= manDao.GetTeacherList();
			session.setAttribute("CourseList",CourseList);
			session.setAttribute("StudentList",StudentList);
			session.setAttribute("TeacherList",TeacherList);
			request.getRequestDispatcher("/Admin_CourseList.jsp").forward(request,
					response);}
		
		else if (service.equals("AddTeacher")) {
			String TidStr = request.getParameter("inputTid");
			String Tname = request.getParameter("inputTname");
			String Major = request.getParameter("inputMajor");
			String AgeStr = request.getParameter("inputAge");
			String Title = request.getParameter("inputTitle");
			String Gender = request.getParameter("inputGender");
			String Password = request.getParameter("inputPassword");
			int tid = Integer.parseInt(TidStr);
			int age = Integer.parseInt(AgeStr);
			TeacherDao teaDao= new TeacherDao();
			teaDao. AddTeacher(tid,Tname,age,Major,Title,Password,Gender);
			ManDao manDao = new ManDao();
			List CourseList=manDao.GetCourseList();
			List StudentList=manDao.GetStudentList();
			List TeacherList= manDao.GetTeacherList();
			session.setAttribute("CourseList",CourseList);
			session.setAttribute("StudentList",StudentList);
			session.setAttribute("TeacherList",TeacherList);
			request.getRequestDispatcher("/Admin_TeacherList.jsp").forward(request,
					response);}
		
		
		
		else if (service.equals("DelClass")) {
			String cidStr = request.getParameter("cid");
			int cid = Integer.parseInt(cidStr);
			CourseDao coudao= new  CourseDao();
			coudao.delCourseByCid(cid);
			//刷新数据
			ManDao manDao = new ManDao();
			List CourseList=manDao.GetCourseList();
			List StudentList=manDao.GetStudentList();
			List TeacherList= manDao.GetTeacherList();
			session.setAttribute("CourseList",CourseList);
			session.setAttribute("StudentList",StudentList);
			session.setAttribute("TeacherList",TeacherList);
			request.getRequestDispatcher("/Admin_CourseList.jsp").forward(request,
					response);}
		
		else if (service.equals("DelStuFromSys")) {
			String sidStr = request.getParameter("sid");
			int sid = Integer.parseInt(sidStr);
			StudentDao studao = new StudentDao();
			studao.delstufromsys(sid);
			//刷新数据
			ManDao manDao = new ManDao();
			List CourseList=manDao.GetCourseList();
			List StudentList=manDao.GetStudentList();
			List TeacherList= manDao.GetTeacherList();
			session.setAttribute("CourseList",CourseList);
			session.setAttribute("StudentList",StudentList);
			session.setAttribute("TeacherList",TeacherList);
			request.getRequestDispatcher("/Admin_StudentList.jsp").forward(request,
					response);}
		
		else if (service.equals("DelTeacher")) {
			String tidStr = request.getParameter("tid");
			int tid = Integer.parseInt(tidStr);
			TeacherDao teadao = new TeacherDao();
			teadao.delteacher(tid);
			//刷新数据
			ManDao manDao = new ManDao();
			List CourseList=manDao.GetCourseList();
			List StudentList=manDao.GetStudentList();
			List TeacherList= manDao.GetTeacherList();
			session.setAttribute("CourseList",CourseList);
			session.setAttribute("StudentList",StudentList);
			session.setAttribute("TeacherList",TeacherList);
			request.getRequestDispatcher("/Admin_TeacherList.jsp").forward(request,
					response);}
		
		
		
		
		else if (service.equals("signinbyAdmin")) {
			String inputsid = request.getParameter("inputsid");
			String inputname = request.getParameter("inputname");
			String gender = request.getParameter("gender");
			String inputmajor = request.getParameter("inputmajor");
			String inputgrade = request.getParameter("inputgrade");
			String inputpassword = request.getParameter("inputpassword");
			Student stu=new Student();
			int sid = Integer.parseInt(inputsid);
			int grade = Integer.parseInt(inputgrade);
			stu.setSid(sid);
			stu.setName(inputname);
			stu.setGender(gender);
			stu.setMajor(inputmajor);
			stu.setGrade(grade);
			stu.setPassword(inputpassword);
			StudentDao studao = new StudentDao();
	    	studao.addStudent(stu);
			ManDao manDao = new ManDao();
			List CourseList=manDao.GetCourseList();
			List StudentList=manDao.GetStudentList();
			List TeacherList= manDao.GetTeacherList();
			session.setAttribute("CourseList",CourseList);
			session.setAttribute("StudentList",StudentList);
			session.setAttribute("TeacherList",TeacherList);
			request.getRequestDispatcher("/Admin_StudentList.jsp").forward(request,
					response);
		
		}
		
		
		
		
		
		
	}
}
