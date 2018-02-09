package com.login;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class CheckLoop {
	
	static MailProgram mp = new MailProgram();
	static Statement st = OracleDb.getConnected(); 
	/*static void connectdb() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		
		 con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","stark","stark");
		 st = con.createStatement();
		}catch(Exception e) {
			System.out.println(e);
		}
	}*/
	
	public static void start() throws SQLException {
		// connectdb();
		
		  ResultSet rid = st.executeQuery("select e.name as enam,r.email as rema from register r,entry e where e.regid=r.regid and to_char(sysdate,'MM-DD')=to_char(e.dob,'MM-DD') ");
         System.out.println("running");
         while(rid.next()){
         String nam = rid.getString("enam");
         String ee = rid.getString("rema");
		 
		
	      mp.start(ee, nam);
	                    }
         checkFmail();
		}

	private static void checkFmail() throws SQLException {
		
		 ResultSet rid2 = st.executeQuery("select r.username as rname, r.email as rmail, f.fmessage as fmsg from register r,fmail f where f.regid=r.regid  and  to_char(sysdate,'MM-DD-YY')=to_char(f.fdate,'MM-DD-YY') ");
		 while(rid2.next()) {
			 String uname = rid2.getString("rname").toString();
			 String email = rid2.getString("rmail").toLowerCase();
			 String msg   = rid2.getString("fmsg").toString();
			 System.out.println(uname + email +msg);
			mp.sendFmail(uname, msg, email);
			 
		 }
	   }
	}
