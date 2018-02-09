<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.login.OracleDb"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%String name=" ";
       String id=" ";
       Statement st = OracleDb.getConnected();
       String uname="", type="", phno="", date =null;
       %>
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
          
         nav > .container{
              border-bottom: 2px solid #34495e;
              border-bottom-left-radius: 40px;
              border-bottom-right-radius: 10px;
          }
          h1{font-size: 1.5em;}
          
          a{text-decoration: none; color: black}
          hr{
          	  border: 0.1em solid #8e44ad;
          }
          .shade{
          	 padding: 3.5em 3.5em 2em 3.5em;
             box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
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
	    name=session.getAttribute("username").toString();
   }
       
   %>
   <%
   
   boolean hasid = request.getParameter("e")!=null?true:false;
    if(hasid){
    	id=request.getParameter("e");
    	ResultSet rs = st.executeQuery("select * from entry where sid ='"+id+"' ");
    	while(rs.next()){
    		uname = rs.getString("name");
    		type = rs.getString("type");
    		date  =rs.getDate("dob").toString();
    		phno = rs.getString("phno");
    		
    	}
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
                     <div class="dropdown-menu">  <form action="Logout" method="post"> <a class="dropdown-item" href="#">Edit Profile</a>
                                                  <a class="dropdown-item"><input class="btn-sm form-control" type="submit" value="Logout"></a> </form>
                     </div>
                     
                </div>
                </div>
          </div>
          </div>
      </nav>

      
      <% if(session.getAttribute("username")!=null){
       	  %>
      
      <div class="container mt-2">
            <h1 class=" ml-5"> Hi ! <%=name.toUpperCase() %></h1>
      </div>
      <div class="container ml-5 mr-5"><hr class="ml-5">
     	 <div class="row mt-5">
     	 	<div class="col-md-3">
     	 	</div>
     	 	<div class="col-md-5 shade">
     	 		<form action="UpdateEntry" method="post">
      				<div class="form-group">
      					<label for="pname"> <b>Your Name :</b></label>
      					<input type="text" name="name" value="<%=uname %>" class="form-control"> 
      				</div>
      				 <div class="form-group">
                        <label for="ptype"><b>Type : </b></label>
                        <select name="type" class="form-control" value="<%=type %>">
                            <option>Friend</option>
                            <option>Family</option>
                         </select>
                        </div>
                         <div class="form-group">
                        <label for="pdob"><b>Date of Birth : </b></label>
                        <input type="date" value="<%=date %>" class="form-control" name="dob">
                        </div>
      					 <div class="form-group">
                        <label for="no"><b>Phone No : </b></label>
                        <input type="tel" class="form-control" name="phno" value="<%=phno %>" placeholder="enter phone number">
                        </div>
                        <input type="hidden" value="<%=id%>" name="uid">
      				<div class="form-group">
      					<button type="submit" class=" btn btn-primary" name="submit">Update..</button>
      				</div>
      		</form>
     	 	</div>
     	 	<div class="col-md-4"></div>   		
      	</div>
      </div>
      
      
      <% } %>
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    <script src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
    
    
  </body>
</html>