<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Medicare Data Query Form</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.11.3.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="/simple-medicare-request/css/common.css">

<script src="/simple-medicare-request/js/original.js"></script>
<script src="/simple-medicare-request/js/common.js"></script>
<link href="/simple-medicare-request/favicon.ico" rel="icon"
	type="image/x-icon">

</head>
<body>
	<div class="container">
		<h2>Explore Providers and Procedures</h2>
		<b> Procedure Code:</b> <br> 
		<input id="proc_code" type="text"
			size="10"> <br> <br> 
			<select id="stateSelect"
			class="selectpicker">
			<option label="Select the state" disabled>Select the state</option>
		</select>
		<div id="proc_keyword_box" style="display: none">
			<b>Procedure Keyword:</b> <br> <input id="proc_keyword"
				type="text" size="10">
		</div>

		<form>
			<br> <input type="radio" name="use_case" value="case_1" checked
				id="case1btn" onClick="javascript:caseCheck()">Show most
			expensive provider(s) in a state for a procedure<br> <input
				type="radio" name="use_case" value="case_2" id="case2btn"
				onClick="javascript:caseCheck()">Show busiest provider(s) in
			a state for a procedure<br> <input type="radio" name="use_case"
				value="case_3" id="case3btn" onClick="javascript:caseCheck()">Find
			procedures using a keyword, show average cost in a state<br>
		</form>
			<input id="submitSearch" type="submit" value="Submit" />
	</div>
	<br />

	<br />
	<span id="feedback"></span>
	<div id="proc_keyword_box" style="display: none">
		<b> Keyword:</b> <br> <input id="proc_keyword" type="text"
			size="10"> <br>
	</div>

	<footer>
		<hr />
		<p>
			<a href="../../index.html">Home</a>
		</p>
	</footer>
</body>
</html>