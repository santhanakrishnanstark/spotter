<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%String name=" "; %>
<!doctype html>
<html lang="en">
  <head>
   <% 
  
  response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");
 %> 
 <%
if(session.getAttribute("username")==null){
	   out.println("No Session");
	  
}else{ 
     name=session.getAttribute("username").toString();
    
     } %>
  
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">

    <title>Hello, world!</title>
      <style>
          @media (max-width:575px){
              nav .container{width: 100%;}
             
          }
           @media (min-width:576px){
           
        }
         @media (min-width:768px){
            
        }
         @media (min-width:992px){
            
        }
         @media (min-width:1200px){
             
        }
          nav > .container{
              border-bottom: 2px solid #34495e;
              border-bottom-left-radius: 40px;
              border-bottom-right-radius: 10px;
          }
          h1{font-size: 1.5em;}
          .add{background-color: red; color: white; border-radius: 50%; height: 50px; width: 50px;box-shadow:2px 5px 5px grey; }
          .icn{margin-left: 0.6em;
                margin-top: 0.5em;}
          .add:hover{
              
              
  -webkit-animation-name: shake;
  animation-name: shake;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  }
  @-webkit-keyframes shake {
  0%, 100% {
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  }
  10%, 30%, 50%, 70%, 90% {
  -webkit-transform: translate3d(-10px, 0, 0);
  transform: translate3d(-10px, 0, 0);
  }
  20%, 40%, 60%, 80% {
  -webkit-transform: translate3d(10px, 0, 0);
  transform: translate3d(10px, 0, 0);
  }
  }
  @keyframes shake {
  0%, 100% {
  -webkit-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0);
  }
  10%, 30%, 50%, 70%, 90% {
  -webkit-transform: translate3d(-10px, 0, 0);
  transform: translate3d(-10px, 0, 0);
  }
  20%, 40%, 60%, 80% {
  -webkit-transform: translate3d(10px, 0, 0);
  transform: translate3d(10px, 0, 0);
  }
          }
          .card:hover{
             
  -webkit-animation-name: tada;
  animation-name: tada;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
  }
  @-webkit-keyframes tada {
  0% {
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
  }
  10%, 20% {
  -webkit-transform: scale3d(.9, .9, .9) rotate3d(0, 0, 1, -3deg);
  transform: scale3d(.9, .9, .9) rotate3d(0, 0, 1, -3deg);
  }
  30%, 50%, 70%, 90% {
  -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
  transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
  }
  40%, 60%, 80% {
  -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
  transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
  }
  100% {
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
  }
  }
  @keyframes tada {
  0% {
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
  }
  10%, 20% {
  -webkit-transform: scale3d(.9, .9, .9) rotate3d(0, 0, 1, -3deg);
  transform: scale3d(.9, .9, .9) rotate3d(0, 0, 1, -3deg);
  }
  30%, 50%, 70%, 90% {
  -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
  transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, 3deg);
  }
  40%, 60%, 80% {
  -webkit-transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
  transform: scale3d(1.1, 1.1, 1.1) rotate3d(0, 0, 1, -3deg);
  }
  100% {
  -webkit-transform: scale3d(1, 1, 1);
  transform: scale3d(1, 1, 1);
  }
          }
    .notes{
    	background-color: yellow;
    	border-bottom-right-radius: 7em;
    }      
          
      </style>
      
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  </head>
  <body>

   
      <nav class="navbar mt-3 mb-3 navbar-toggleable-md navbar-light">
        <div class="container">
            <button class="navbar-toggler navbar-toggler-right" data-toggle="collapse" data-target="#mainNav">
                <span class="navbar navbar-toggler-icon"></span>
            </button>
            <a class="navbar-brand"><img src="img/ss.png"><h2 class="d-inline">potter</h2></a>
            
            <div class="collapse navbar-collapse" id="mainNav">
                 <div class="navbar-nav ml-auto">
                    <a class="nav-item nav-link" href="index.html"><i class="fa fa-home fa-fw" aria-hidden="true"></i>&nbsp;&nbsp;Home</a>
                <a style="color: #8e44ad; font-weight: 500" class="nav-item nav-link active" href="dashboard.jsp"><i class="fa fa-code" aria-hidden="true"></i>&nbsp;&nbsp;Dashboard</a>
                     <div class="dropdown"><a class="nav-item nav-link dropdown-toggle" data-toggle="dropdown" href="#"><i class="fa fa-user-circle" aria-hidden="true"></i>&nbsp;&nbsp;My_Profile</a>
                     <div class="dropdown-menu"><form action="Logout" method="post"> <a class="dropdown-item" href="editprofile.jsp">Edit Profile</a>
                                                  <a class="dropdown-item"><input class="btn-sm form-control" type="submit" value="Logout"></a> </form>
                     </div>
                     
                </div>
                </div>
          </div>
          </div>
      </nav>
      
       <% if(session.getAttribute("username")!=null){
    	   
    	  // <!-- Sticky Notes Delete Code -->
         	
         		boolean deleteclicked = request.getParameter("del")!=null?true:false;
         	if(deleteclicked){
         		int sid = Integer.parseInt(request.getParameter("del"));
         		Class.forName("oracle.jdbc.driver.OracleDriver");
   		    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","stark","stark");
   		    Statement st = con.createStatement();
   			int res = st.executeUpdate("delete from stickynotes where sid='"+sid+"' ");
         		
         	}
         	
        //  <!-- Sticky Notes Delete Code -->
           	  %>
      <div class="container mt-5">
            <h1 class="ml-5"> Hi ! <%=name.toUpperCase() %></h1>
      </div>
      <div class="container mt-5">
    
            <div class="row ml-5">
            <%  try {
                Class.forName("oracle.jdbc.OracleDriver");
      		   Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","stark","stark");
      		Statement st = con.createStatement();
            String id = session.getAttribute("rid").toString();
     		int rid = Integer.parseInt(id);
     		ResultSet rs = st.executeQuery("select * from stickynotes where regid='"+rid+"' ");
     		while(rs.next()){
           
            %>
                <div class="col-md-3">
                  <div class=" notes card mt-3">
                  
              <div class="card-block"><a href="stickynotes.jsp?del=<%=rs.getInt("sid")%>"><button class="close">&times;</button></a>
             <div class="card-title"><h3> <%=rs.getString("title") %></h3></div>
                <div class="card-text">
                   <h5><%=rs.getString("notes") %></h5>
                  </div>
                  <div class="notes card-footer">
                 	<p><%=rs.getString("sdate") %></p>
                  </div>                  
               
          </div>
          </div>
                </div> 
                <% } }catch(Exception e){ } %> 
            </div>
                  
                              
          <div class=" container fixed-bottom p-3">
       <a href="#"  data-toggle="modal" data-target="#notes"><div class="add mb-5 d-inline-block p-2 mr-3" style="float: right;"><i class="icn fa fa-plus fa-1x" aria-hidden="true"></i></div></a>
      </div>
      
     
      
      <!--   Sticky Notes Database Store Code start -->
        <%
      
     String fid=session.getAttribute("rid").toString();
     int id = Integer.parseInt(fid);
      
      		boolean hastitle = request.getParameter("stitle")!=null?true:false;
      		boolean hasnotes = request.getParameter("txtarea")!=null?true:false;
      		
      		if(hastitle && hasnotes){
      			String title  =request.getParameter("stitle");
      			String notes = request.getParameter("txtarea");
      			try{
      			// db connection 
      			Class.forName("oracle.jdbc.driver.OracleDriver");
			    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","stark","stark");
			    Statement st = con.createStatement();
				
			    int res=st.executeUpdate("insert into stickynotes values(SINC.nextval,'"+title+"','"+notes+"',sysdate,'"+id+"')");
        		if(res>=1) {
    				out.println("<script> alert('Notes Added !');  window.location='stickynotes.jsp'; </script>");
    			}else {
    				out.println("<script> alert('Error Occur !');  window.location='stickynotes.jsp'; </script>");
    			}	
      		  }catch(Exception ex){}
      		}
      		
    %>
       <!--   Sticky Notes Database Code start -->
       
      <!-- Notes Model begin  -->
      
      	<div class="modal fade" id="notes">
      		<div class="modal-dialog">
      			<form action="stickynotes.jsp">
 				 <div class="modal-content">
 				 	<div class="modal-header"><h3>Sticky Notes !</h3>
 				 	 <button class="close" data-dismiss="modal">&times;</button>
 				 	</div>
 				 	<div class="modal-body">
 				 			<div class="form-group">
 				 			<label for="title">Enter Title : </label>
 				 			<input type="text" name="stitle" class="form-control">
 				 			</div>
 				 			<div class="form-group">
 				 			<label for="title"> Notes : </label>
 				 			<textarea rows="10" cols="20" class="form-control" name="txtarea"></textarea>
 				 			</div>
 				 	</div>
 				 	<div class="modal-footer">
 				 		<button type="submit" class=" btn btn-primary" name="submit">Save...</button>
 				 	</div>
 				 </div>	
 				</form>
      		</div>
       	</div>
           
      
      <!-- Notes Model end  -->
                    

      <% } %>
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
  </body>
</html>