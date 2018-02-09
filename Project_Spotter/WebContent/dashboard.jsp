<%@page import="com.login.OracleDb"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%String name=" "; %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Dashboard</title>
 <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

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
    
     } %>
   
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
       <% if(session.getAttribute("username")!=null){
           	  %>
      <div class="container mt-5">
            <h1 class=" ml-5"> Hi ! <%=name.toUpperCase() %></h1>
      </div>
       <div class="container mt-5">
           <div class="row text-center mx-5">
                <div class="col-md-4 mt-3">
                    <a href="userpage.jsp">
                        <div>
                            <img src="img/entry.png" aria-hidden="true">
                            <h3>Add People</h3>
                            <div>To add people</div>
                        </div>
                   </a>
                </div>
                <div class="col-md-4 mt-3">
                    <a href="#"><div data-toggle="modal" data-target="#fMail">
                        <div>
                             <img src="img/fmail.png" aria-hidden="true"> 
                            <h3>Future Mail</h3>
                            <div>To add people</div>
                            <a href="futuremail.jsp" type="submit" class="mt-2 btn btn-secondary">View List</a>
                        </div>
                        </div></a>
               </div>
                <div class="col-md-4 mt-3">
                    <a href="stickynotes.jsp">
                        <div>
                             <img src="img/stick.png" aria-hidden="true">
                            <h3>Sticky Notes</h3>
                            <div>To add people</div>
                        </div>
                       </a>
                </div>
               
               <!-- fMail Model begin-->
               
                    <div class="modal fade" id="fMail">
                    <div class="modal-dialog">
                        <div class="modal-content">
                       <form action="" method="post">
                            <div class="modal-header"> <h3>Future Mail</h3> 
                            <button class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form">
                                <div class="form-group">
                                  <label for="date">When you want your mail ?</label>
                                    <input type="date" name="fdate" class="form-control">
                                 </div>
                                    <div class="form-group">
                                  <label for="msg">Your Message :</label>
                                    <textarea name="editor1" class="form-control"></textarea>
                                 </div>
                                     <div class="form-group">
                                      <button type="submit" class="btn btn-primary text-white"> <i class="fa fa-paper-plane card-img-top" aria-hidden="true"></i>
                                      Send
                                      </button>  
                                   
                                 </div>
                              </div>
                            </div>
                        </form>
                        </div>
                        </div>
               </div>
               
               <!-- fMail Model end-->
               
              
               
           </div>
      </div>
      
      <%
      
     String fid=session.getAttribute("rid").toString();
     int id = Integer.parseInt(fid);
      
      		boolean hasdate = request.getParameter("fdate")!=null?true:false;
      		boolean hasmessage = request.getParameter("editor1")!=null?true:false;
      		
      		if(hasdate && hasmessage){
      			String fdate  =request.getParameter("fdate");
      			String message = request.getParameter("editor1");
      			String format="yy-MM-dd";
      			
      			// db connection 
      			Statement st = OracleDb.getConnected();
				
			    int res = st.executeUpdate("insert into fmail values(finc.nextval,to_date('"+fdate+"','"+format+"'),'"+message+"','"+id+"') ");
      			if(res>=1){
			     out.print("<script> alert(' Future Mail Sent')</script>"); } else {
			    	 out.print("<script> alert('Error Sending Message')</script>");
			     }
      		}
      %>
      
       <% } %>
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
    <script src="https://cdn.ckeditor.com/4.8.0/standard/ckeditor.js"></script>
    <script>
     CKEDITOR.replace( 'editor1' );
    </script>
   </body>
</html>

