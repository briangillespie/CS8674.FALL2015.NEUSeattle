<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Outliers</title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet" >
<link href="/simple-medicare-request/favicon.ico" rel="icon"
	type="image/x-icon">
	
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script src="/simple-medicare-request/js/common.js"></script>
</head>

<body class="container main center">
	<h1>Outlier Detection</h1>
	<h3>Outliers are institutions whose charge is among top K% for the given procedure code.</h3>   
	<form action="result-jsp" method="get" class="form-inline"> 
		<label for="proc_code" class="form-group"> Procedure Code </label> 		
		<input id="proc_code"  name="proc_code" type="text" class="form-control" required/>
		
		<label for="percentage" class="form-group"> Percentage </label> 		
		<input id="percentage" type="number" min="0" max="100" step="0.01" name="percentage" class="form-control" required/> 
		 
		<button type="submit" class="btn btn-success">Submit</button>
			
	</form>

</body>
</html>