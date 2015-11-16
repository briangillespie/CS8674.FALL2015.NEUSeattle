<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script type="text/javascript">
	var jq = jQuery.noConflict();
</script>

<title>Medicare Data Query Form</title>
<link href="/simple-medicare-request/favicon.ico" rel="icon"
	type="image/x-icon">

</head>
<body>
	<div class="container">
	<div class="page-header">
			<h6><a href="../../index.html">Home</a></h6>
		</div>
		</div>
	<div>
		<div class="container"><div class="alert alert-danger fade in">
		<a href="#" class=close data-dismiss="alert" aria-label="close">&times;</a>These are instructions for this assessment</div></div>
		
		<h2>Request Doctors:</h2>
		<div>
			<b> Procedure Code:</b> <br> <input id="proc_code" type="text"
				size="10">

		</div>
		<br>
		<div class="container">
		<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
		  States <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
		<li><a href="#">AZ</a></li>
		<li><a href="#">FL</a></li>
		<li><a href="#">TX</a></li>
		</ul>
			<!-- <b> State: </b> <br> <select id="state">
				<option label="Select the state" disabled>Select the state</option>
				<option value="AZ">AZ</option>
				<option value="CA">CA</option>
				<option value="FL">FL</option>
				<option value="GA">GA</option>
				<option value="TX">TX</option>
				<option value="NY">NY</option>
			</select> -->
		</div>
		<form>
			<br> <input type="radio" name="use_case" value="case_1" checked
				id="case1btn" onClick="javascript:caseCheck()">Case 1 <br>
			<input type="radio" name="use_case" value="case_2" id="case2btn"
				onClick="javascript:caseCheck()">Case 2 <br> <input
				type="radio" name="use_case" value="case_3" id="case3btn"
				onClick="javascript:caseCheck()">Case 3 <br>
		</form>
	</div>
	<div id="proc_keyword_box" style="display: none">
		<b> Procedure Name:</b> <br> <input id="proc_keyword" type="text"
			size="10"> <br>
	</div>
	<div class="container">
	<button type="button" class="btn btn-primary btn-block" value="Submit" onclick="submit()">Submit</button>
	</div>
	<br />
	<div class= "container">
	<span id="feedback"></span>
	</div>
	<div id="proc_keyword_box" style="display: none">
		<b> Keyword:</b> <br> <input id="proc_keyword" type="text"
			size="10"> <br>
	</div>

	
	<script type="text/javascript">
		function submit() {

			if (jq('input[name="use_case"]:checked').val() != "case_3") {
				if (!document.getElementById('proc_code').value
						.match(new RegExp(/^[A-Za-z0-9]{3,5}$/))) {
					alert("Procedure Code must be filled out properly.");
					return;
				}
			}

			if (jq('input[name="use_case"]:checked').val() == "case_3") {
				if (jq("#proc_keyword").val().length == 0) {
					alert("Procedure Keyword must be filled out.");
					return;
				}
			}
			jq("#feedback").replaceWith(
					'<span id="feedback">Searching...</span>');

			switch (jq('input[name="use_case"]:checked').val()) {
			case ("case_1"):

				jq(function() {
					jq.get("submit", {
						proc_code : jq("#proc_code").val(),
						state : jq("#state").val(),
						use_case : jq('input[name="use_case"]:checked').val()
					}, function(data) {
						jq("#feedback").replaceWith(
								'<span id="feedback">' + displayDataCase1(data)
										+ '</span>');
					});
				});
				break;
			case ("case_2"):
				jq(function() {
					jq.get("submit", {
						proc_code : jq("#proc_code").val(),
						state : jq("#state").val(),
						use_case : jq('input[name="use_case"]:checked').val()
					}, function(data) {
						jq("#feedback").replaceWith(
								'<span id="feedback">' + displayDataCase2(data)
										+ '</span>');
					});
				});
				break;
			case ("case_3"):
				jq(function() {
					jq.get("submit", {
						keyword : jq("#proc_keyword").val(),
						state : jq("#state").val(),
						use_case : jq('input[name="use_case"]:checked').val()
					}, function(data) {
						jq("#feedback").replaceWith(
								'<span id="feedback">' + displayDataCase3(data)
										+ '</span>');
					});
				});
				break;
			}
		}

		function displayDataCase1(data) {
			if (checkEmpty(data)) {
				return "No providers found for that criteria.";
			}

			var text = '<table class="table table-hover" style="width:100%"><thead><tr><td>'
					+ '<b>Last Name</b></th><th><b>First Name</b></th>'
					+ '<th><b> Submitted Charge Amount </b></tr></thead><tbody>';

			for (var i = 0; i < data.length; i++) {
				text += '<tr><td>'
						+ toNameCase(data[i].last_or_org_name)
						+ '</td><td>'
						+ toNameCase(data[i].first_name)
						+ '</td><td>\$'
						+ data[i].providerDetails.averageSubmittedChargeAmount
								.toFixed(2) + '</td></tr>';
			}
			text += '</tbody></table>';

			return text;
		}

		function displayDataCase2(data) {
			if (checkEmpty(data)) {
				return "No providers found for that criteria."
			}
			var text = '<table style="width:100%"><tr><td>'
					+ '<b>Last Name</b></td><td><b>First Name</b></td>'
					+ '<td><b> Day Service Count </b></td></tr>';

			for (var i = 0; i < data.length; i++) {
				text += '<tr><td>' + toNameCase(data[i].last_or_org_name)
						+ '</td><td>' + toNameCase(data[i].first_name)
						+ '</td><td>' + data[i].beneficiaries_day_service_count
						+ '</td></tr>';
			}
			text += '</table>';
			return text;
		}

		function displayDataCase3(data) {
			if (checkEmpty(data)) {
				return "No procedures found for that keyword.";
			}
			var text = '<table style="width:100%"><tr>'
					+ '<td><b>Procedure Code</b></td>'
					+ '<td><b>Description</b></td><td><b> Average Cost </b></td>'
					+ '<td><b> State </b></td></tr>';

			for (var i = 0; i < data.length; i++) {
				text += '<tr><td>' + data[i].procCode + '</td><td>'
						+ data[i].desc + '</td><td>\$'
						+ data[i].avgCost.toFixed(2) + '</td><td>'
						+ data[i].state + '</td></tr>';
			}
			text += '</table>';
			return text;
		}

		function checkEmpty(data) {
			if (data.length == 0) {
				return true;
			} else {
				return false;
			}
		}

		function caseCheck() {
			if (document.getElementById('case3btn').checked) {
				document.getElementById('proc_keyword_box').style.display = 'block';
				document.getElementById('proc_code').disabled = true;
			} else {
				document.getElementById('proc_keyword_box').style.display = 'none';
				document.getElementById('proc_code').disabled = false;
			}
		}

		function toNameCase(str) {
			return str.replace(/\w\S*/g, function(txt) {
				return txt.charAt(0).toUpperCase()
						+ txt.substr(1).toLowerCase();
			});
		};
	</script>

</body>
</html>