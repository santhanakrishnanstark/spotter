<%@page import="com.login.Schedule"%>
<%@page import="com.login.CheckLoop"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Trigger Spotter Mail</title>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css" integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ" crossorigin="anonymous">


</head>
<body>
	
	<div class="jumbotron bg-primary">
		<div class="container">
		
			<div class="display-4 text-white">Trigger Spotter Mail</div>
		</div>
	</div>	
	
	<% 
	 boolean status= (request.getParameter("hi"))!=null?true:false;
	 String id=request.getParameter("hi");
	 if(status){
	if(id.equals("ok")) {
		Schedule.startService();
	}
	else if(id.equals("cancel")) {
		Schedule.stopService();
	}
	 }
	%>
	<form name="form1" action="">
			<div class="row">
			
			<div class="col-md-3 ">
				
			</div>
			<div class="col-md-3 ">
				<div class="form-group">
				<input type="hidden" name="hi">
				  <button  name="ok" onclick="button1()" class=" form-control btn btn-lg btn-success">Start Sending Mail</button>
				</div>
			</div>
			
			<div class="col-md-3">
			   <div class="form-group">
				  <button  name="cancel" onclick="button2()" class=" form-control btn btn-lg btn-danger">Stop Services</button>
				</div>
			</div>
			<div class="col-md-3 ">
				
			</div>
			
			</div>
	</form>
	<script>
	function button1()
    {
        document.form1.hi.value = "ok"
        form1.submit()
    }    
    function button2()
    {
        document.form1.hi.value = "cancel"
        form1.submit()
    }    
	</script>
	
	
	  <!-- jQuery first, then Tether, then Bootstrap JS. -->
    <script src="https://code.jquery.com/jquery-3.1.1.slim.min.js" integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js" integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js" integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn" crossorigin="anonymous"></script>
</body>
</html>