

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class Insertion {

  public static void  main(String[] args){
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn =   DriverManager.getConnection("jdbc:mysql://localhost/test","root","ccnuccnu");
       PreparedStatement stat = conn.prepareStatement("insert into students(SID,name,gender,major,grade,password) " +
                    "values (2014004,'test1','male','information management','2014','123456')");
       stat.execute();
       conn.close();
    } catch (Exception e) {
      e.printStackTrace();
       } 
  }
}
