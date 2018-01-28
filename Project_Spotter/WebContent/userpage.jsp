<%@page import="com.login.CheckLoop"%>
<%@page import="com.login.LoginAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

    <title>Hello, world!</title>
      <style>
          @media (max-width:576px){
              nav .container{width: 100%;}
          }
          
          a{
             text-decoration: none;
          }
 			.en{
             text-decoration: none; background-color: #8e44ad;
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
	    //out.println("<script>  alert('welcome "+name+" '); </script>");
	   
	      
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
                    <a style="color: #8e44ad; font-weight: 500"  class="nav-item nav-link active" href="index.html"><i class="fa fa-home fa-fw" aria-hidden="true"></i>&nbsp;&nbsp;Home</a>
                <a class="nav-item nav-link" href="dashboard.jsp"><i class="fa fa-code" aria-hidden="true"></i>&nbsp;&nbsp;Dashboard</a>
                     <div class="dropdown"><a class="nav-item nav-link dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;My_Profile</a>
                     <div class="dropdown-menu">  <form action="Logout" method="post"> <a class="dropdown-item" href="editprofile.jsp">Edit Profile</a>
                                                  <a class="dropdown-item"><input class="btn-sm form-control" type="submit" value="Logout"></a> </form>
                     </div>
                     
                </div>
                </div>
          </div>
          </div>
      </nav>
      
   
      <div class="container mt-4">
          <i class="fa fa-reply mb-3 ml-5" style="color: #8e44ad; font-size: 22px" aria-hidden="true"> Back</i>
        <div class="row">
          <div class="col-md-4">
            <div class="card card-form ">
                <div class="card-header" style="background-color:#34495e ;color: white;"><h3>Add entry</h3></div>
              <div class="card-block">
                 <form action="StoreEntry" method="post">
                    <div class="form-group">
                        <label for="name">Enter Name : </label>
                        <input type="text" class="form-control" name="t2" placeholder="enter name">
                        </div>
                     <div class="form-group">
                        <label for="password">Type : </label>
                        <select name="type" class="form-control">
                            <option>Friend</option>
                            <option>Family</option>
                         </select>
                        </div>
                     <div class="form-group">
                        <label for="dob">Date of Birth : </label>
                        <input type="date" class="form-control" name="dob">
                        </div>
                      <div class="form-group">
                        <label for="no">Phone No : </label>
                        <input type="tel" class="form-control" name="phno" placeholder="enter phone number">
                        </div>
                     <div class="form-group">
                        <input type="submit" class="form-control" style="background-color: #2c3e50; color: white" name="addbt">
                        </div>
                </form>
                </div>             
              </div>
            </div>
            <div class="col-md-1"></div>
          <div class="col-md-7 ml-auto">
              <div class="mb-3"><h3>Upcomming Days..</h3> </div>
              <div class="table-responsive" style="height: 460px; max-height: 100%">
            <table class="table table-hover table-striped ">
            	
            	<tr>
                    <th>Name</th>
                     <th>Type</th>
                     <th>Date Of Birth</th>
                     <th>Phone NO</th>
                    <th></th>
                    <th></th>
                </tr>
             <%
              if(session.getAttribute("username")!=null){
           	  
           	  
              try {
                  Class.forName("oracle.jdbc.OracleDriver");
         		
         		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","stark","stark");
         		Statement st = con.createStatement();
         		//HttpSession session = request.getSession();
         		String id = session.getAttribute("rid").toString();
         		
         		int rid = Integer.parseInt(id);
         		
         		
         	//	ResultSet rs = st.executeQuery("select * from entry where regid='"+rid+"' ");
         	
         	 // To order the table by ascending date of full entry table
         	  ResultSet rs = st.executeQuery("select * from entry where regid ='"+rid+"' order by to_char(dob,'MM-DD')  ");
     		 
     		// ResultSet rs = st.executeQuery("select * from entry where to_char(sysdate,'MM-DD') < to_char(dob,'MM-DD') and regid='"+rid+"' order by to_char(dob,'MM') ");
         	while(rs.next()) {
     			
     		%>
                   <tr>
                      
                       <td>
                           <%=rs.getString("name") %>
                       </td>

                       <td>
                          <%=rs.getString("type") %>
                       </td>
                        <td>
                          <%=rs.getDate("dob") %>
                       </td>
                        <td>
                          <%=rs.getString("phno") %>
                       </td>
                       <td> 
                       	  <a href="editprofile.jsp?e=<%=rs.getString("sid")%>" type="button" class="en text-white btn-sm"> Edit</a></td>
                       </td>
                       <td> 
                       	   <a href="userpage.jsp?del=<%=rs.getString("sid")%>" type="button" class="en btn btn-secontary text-white btn-sm"> X</a></td>
                       </td>
                   </tr>  
                   
             
               <%

         	} 
     		
         	
         	 
     		}catch(Exception e) {
     			System.out.println(e);
     		} }
              %>
               
              </table>
                  </div>
            </div>
          </div>
      </div>
    
      <div class="container-fluid text-center mt-4 p-5 " style="background-color: #2980b9; color: white">
       copyright @ santhanakrishnanstark 2017
      </div>
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>