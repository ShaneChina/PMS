<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.springframework.web.context.WebApplicationContext"%>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils"%>

<%@ page import="com.bean.*"%>
<%@ page import="javasrc.*"%>
  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
</head>
<script type="text/javascript" src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("button").click(function(){
		$("p").hide();
	});
	$("p").mouseenter(function(){
	    $("p").css("background-color","yellow");
	  });
	  $("p").mouseleave(function(){
	    $("p").css("background-color","#E9E9E4");
	  });
});

/* var my_json='{FBI:[{name:"rose",age:"25"},{name:"jack",age:"23"}],NBA:[{name:"tom",sex:"man"},{name:"jack",sex:"women"}]}';
var my_object=eval('('+my_json+')');
document.writeln(my_object.FBI[1].name + my_object.FBI[1].age);
document.writeln("xx");
document.writeln(my_json.toJSONString());
document.writeln(my_object.toJSONString());
document.writeln("xx" + my_json.toJSONString());
document.writeln("xx" + my_object.toJSONString()); */

$(function() {
	$("#testlisttest").click(function() {
		alert("testlisttest");
		window.location.href = "http://localhost:8080/HelloWeb/test";
	});

	$("#testlist").click(function() {
		alert("testlist");
		var parms = {
				"name" : "靳立新",
				"password" : "b"
			};
			$.ajax({
				type : "post",
				url : "/HelloWeb/login",
				// 页面输入采用json时的写法:
				/*
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(parms),
				*/
				contentType : "application/x-www-form-urlencoded",
				data : parms,
				dataType : "json",
				success : loginsuccess,
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("XMLHttpRequest.status:" + XMLHttpRequest.status + "\nXMLHttpRequest.readyState:" + XMLHttpRequest.readyState + "\ntextStatus:" + textStatus);
					console.log("XMLHttpRequest.status:" + XMLHttpRequest.status + "\nXMLHttpRequest.readyState:" + XMLHttpRequest.readyState + "\ntextStatus:" + textStatus);
				}
			});
		//window.location.href = "http://localhost:8080/HelloWeb/login";
	});
	function loginsuccess(logindata) {
		console.log("logindata.status:" + logindata.status + "\nlogindata.message:" + logindata.message);
		if (logindata.status == "0000") {
			$("#msg").html(logindata.status+":"+logindata.message);
		} else if (logindata.status == "0001" || logindata.status == "0002") {
			$("#msg").html(logindata.status+":"+logindata.message);
		} else {
			$("#msg").html("未知错误,请联系管理员");
		}
	}

	$("#testlist1").click(function() {
		alert("testlist1");
		var parms = {
				"name" : "靳立新",
				"password" : "b"
			};
			$.ajax({
				type : "post",
				url : "/HelloWeb/logintest",
				// 页面输入采用json时的写法:
				/*
				contentType : "application/json;charset=UTF-8",
				data : JSON.stringify(parms),
				*/
				//contentType : "application/x-www-form-urlencoded",
				data : parms,
				//dataType : "text",
				success : loginsuccess1,
				error : function(XMLHttpRequest, textStatus, errorThrown) {
					alert("XMLHttpRequest.status:" + XMLHttpRequest.status + "\nXMLHttpRequest.readyState:" + XMLHttpRequest.readyState + "\ntextStatus:" + textStatus);
					console.log("XMLHttpRequest.status:" + XMLHttpRequest.status + "\nXMLHttpRequest.readyState:" + XMLHttpRequest.readyState + "\ntextStatus:" + textStatus);
				}
			});
		//window.location.href = "http://localhost:8080/HelloWeb/login";
	});
	function loginsuccess1(logindata) {
		console.log("logindata:" + logindata);
	}
});
</script>
<body>
hello world!新年快乐!
<%
	out.println("Hello World！");
%>
----------------------------------
<h2>${message}</h2>
----------------------------------
<h2>This is a heading</h2>
<p>This is a paragraph.</p>
<p>This is another paragraph.</p>
<button type="button">Click me</button>
<input type="button" value="login" id="testlist">
<input type="button" value="logintest" id="testlist1">
<input type="button" value="test" id="testlisttest">
<div id="msg"></div>
${userList}

</body>
</html>