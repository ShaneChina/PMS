<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("p").click(function() {
			$(this).hide();
		});
	});
	//web-inf/logintest
</script>
</head>

<body>
	<p>web-if:If you click on me, I will disappear.</p>
	<div id="msg"></div>
</body>

</html>