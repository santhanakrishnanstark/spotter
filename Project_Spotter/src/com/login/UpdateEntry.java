package com.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/UpdateEntry")
public class UpdateEntry extends HttpServlet {

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String name= request.getParameter("name");
		String type = request.getParameter("type");
		String dob = request.getParameter("dob");
		String format="yy-MM-dd";
		String phno = request.getParameter("phno");
		int id = Integer.parseInt(request.getParameter("uid"));
		Statement st = OracleDb.getConnected();
		
		try {
			int res = st.executeUpdate("update entry set name='"+name+"',type='"+type+"',dob = to_date('"+dob+"','"+format+"'),phno='"+phno+"' where sid='"+id+"' ");
		if(res>=1) {
			out.println("<script> alert('Update SUccess');  window.location='userpage.jsp'; </script>");
			//response.sendRedirect("userpage.jsp");
		}else {
			out.println("<script>alert(' No Update Occur, Fail!')</script>");
		}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
