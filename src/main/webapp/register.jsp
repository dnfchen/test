<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户注册-Ajax体验</title>

		<script type="text/javascript">
function checkUserExists() {
	var f = document.form1;
	var username = f.username.value;
	if (username == "") {
		alert("用户名不能为空");
		return false;
	} else {
		doAjax("CheckUserServlet?username=" + username);
	}
}

var xmlhttp;
function doAjax(url) {
	try {
		xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (e) {
			try {
				xmlhttp = new XMLHttpRequest();
				if (xmlhttp.overrideMimeType) {
					xmlhttp.overrideMimeType("text/xml");
				}
			} catch (e) {
			}
		}
	}

	xmlhttp.onreadystatechange = processRequest;

	xmlhttp.open("post", url, true);
	//如果以post方式请求，必须要添加
	xmlhttp.setRequestHeader("Content-type",
			"application/x-www-form-urlencoded");

	xmlhttp.send(null);
}

function processRequest() {
	//alert(xmlhttp.readyState);
	var messdiv = document.getElementById("mess");
	var divForm=document.getElementById("divForm");
	if (xmlhttp.readyState == 4)
		if (xmlhttp.status == 200) {
			//responseText表示请求完成后，返回的字符串信息				
			if (xmlhttp.responseText == "false")
				//messdiv.innerHTML = "用户名可以使用";
				divForm.innerHTML="用户名可以使用，欢迎注册！";
			else
				messdiv.innerHTML = "用户名已被使用";
		} else {
			alert("请求处理返回的数据有错误");
		}
}

</script>

	</head>

	<body>
		<div id="divForm">
		<form name="form1" action="" method="post">
			用户名
			<input type="text" id="uname" name="username" value=""
				onblur="checkUserExists()" />
			<div id="mess" style="display: inline" />
		</form>
		</div>
	</body>
</html>
