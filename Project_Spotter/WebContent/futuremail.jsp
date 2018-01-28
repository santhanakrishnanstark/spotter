<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

    <title>Mail List!</title>
      <style>
          @media (max-width:576px){
              nav .container{width: 100%;}
          }
          nav > .container{
              border-bottom: 2px solid #34495e;
              border-bottom-left-radius: 40px;
              border-bottom-right-radius: 10px;
          }
         
      </style>
      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body>
    <% 
     response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
    
	%>
 	<%
   		if(session.getAttribute("username")==null){
	 	  out.println("No Session");
	  
  		 }else{
	 		  String name=session.getAttribute("username").toString();
	     
 		  }
       
  	 %>
   
      <nav class="navbar mt-3 mb-3 navbar-toggleable-md navbar-light">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" data-toggle="collapse" data-target="#mainNav">
                <span class="navbar navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand"><img src="img/ss.png"><h2 class="d-inline">potter</h2></a>
            
            <div class="collapse navbar-collapse" id="mainNav">
                 <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link" href="index.html"><i class="fa fa-home fa-fw" aria-hidden="true"></i>&nbsp;&nbsp;Home</a>
                <a style="color: #8e44ad; font-weight: 500" class="nav-item nav-link active" href="#"><i class="fa fa-code" aria-hidden="true"></i>&nbsp;&nbsp;Dashboard</a>
                     <div class="dropdown"><a class="nav-item nav-link dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;My_Profile</a>
                     <div class="dropdown-menu"> <form action="Logout" method="post"> <a class="dropdown-item" href="editprofile.jsp">Edit Profile</a>
                                                  <a class="dropdown-item"><input class="btn-sm form-control" type="submit" value="Logout"></a> </form>
                     </div>
                     
                </div>
                </div>
          </div>
          </div>
      </nav>
      
      <div class="container mt-5">
            <h2 class="ml-5">Future mail list!</h2>
      </div>
      
      
      <div class="container mt-3">
      		<table class="table table-striped table-hover">
      			<thead class="bg-primary text-white">
      			<tr>
      				<th>Date</th>
      				<th>Message</th>
      				<th></th>
      			 </tr>
      			</thead>
      			<tbody>
      		<%	
      		 if(session.getAttribute("username")!=null){
              	  
              try {
                  Class.forName("oracle.jdbc.OracleDriver");
         		
         		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","stark","stark");
         		Statement st = con.createStatement();
         		//HttpSession session = request.getSession();
         		String id = session.getAttribute("rid").toString();
         		
         		int rid = Integer.parseInt(id);
         		
         	 // To order the table by ascending date of full entry table
         	  ResultSet rs = st.executeQuery("select * from fmail where regid ='"+rid+"' order by fdate ");
         	 
         	
     		 
     		// ResultSet rs = st.executeQuery("select * from entry where to_char(sysdate,'MM-DD') < to_char(dob,'MM-DD') and regid='"+rid+"' order by to_char(dob,'MM') ");
         	while(rs.next()) {
     			
     		%>
                   <tr>
                      
                       <td>
                           <%=rs.getDate("fdate") %>
                       </td>

                       <td>
                          <%=rs.getString("fmessage") %>
                       </td>
                      
                       <td> <button class="btn btn-secondary form-control"> Edit</button></td>
                   </tr>  
                 <%   }
              
     		}catch(Exception e) {
     			System.out.println(e);
     		  }
      		 }
              %>
		</table>
      </div>
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>