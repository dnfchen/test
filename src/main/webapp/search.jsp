<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>搜索自动提示</title>
		<style type="text/css">
/*
搜索智能提示图书查询
*/
.suggest_link {
	background-color: #fc883b;
	padding: 2px 6px;
}

.suggest_link_over {
	background-color: #e8f2fe;
	color: #3c7a4e;
	padding: 2px 6px;
}

#suggest {
	position: absolute;
	//right: 185px;
	background-color: #fc883b;
	text-align: left;
	border: 1px solid #000000;
	width: 200px;
	display: none;
}
</style>


		<script type="text/javascript">
var xmlHttp;

//创建XMLHttpRequest
function createXmlHttpRequest() {
	try {
		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	} catch (e) {
		try {
			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
		} catch (e) {
			try {
				xmlHttp = new XMLHttpRequest();
				if (xmlHttp.overrideMimeType) {
					xmlHttp.overrideMimeType("text/xml");
				}
			} catch (e) {
			}
		}
	}
}

//处理函数
function doAjax(url) {
	//1.创建XMLHttpRequest请求
	createXmlHttpRequest();

	//var username = document.loginForm.username.value;
	//var password = document.loginForm.password.value;

	if (xmlHttp != null) {
		//var url ="chap12/AjaxLoginServlet?username="+username+"&password="+password;

		//2.打开与服务器的连接处理
		xmlHttp.open("get", url, false);
		//因为是POST方式提交，需要设置请求头部信息
		//xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded;");

		//3.设置回调函数
		xmlHttp.onreadystatechange = processRequest;

		//4.发送请求
		xmlHttp.send(null);
	} else {
		alert("不能创建XMLHttpRequest对象实例")
	}
}

//去除文本左右两端的空格
String.prototype.trim = function() {
	var m = this.match(/^\s*(\S+(\s+\S+)*)\s*$/);
	return (m == null) ? "" : m[1];
}

function searchSuggest() {
	var searchValue = document.getElementById("txtSearch").value;
	var url = "search?keyWords=" + searchValue + "&auto=auto";
	doAjax(url);
}

function processRequest() {
	//alert(xmlHttp.status);
	if (xmlHttp.readyState == 4 && xmlHttp.status == 200) {
		//获取层对象
		var divSuggest = document.getElementById("suggest");
		divSuggest.innerHTML = "";

		//获取AJAX处理响应后的返回值
		var str = xmlHttp.responseText.trim().split("-");
		var suggest = "";

		//判断处理
		if (str.length > 0 && str[0].length > 0) {
			for (i = 0; i < str.length; i++) {
				suggest += "<div onmouseover='javascript:suggestOver(this);' ";
				suggest += "onmouseout='javascript:suggestOut(this);' ";
				suggest += "onclick='javascript:setSearch(this.innerHTML);' ";
				suggest += "class='suggest_link'>" + str[i] + "</div>";
			}
			divSuggest.innerHTML = suggest;
			document.getElementById("suggest").style.display = "block";
		} else {
			document.getElementById("suggest").style.display = "none";
		}
	} else {
		//alert("请求处理错误");
		//alert(xmlHttp.status);
	}
}

//将选中的内容添加到文本框
function setSearch(select) {
	document.getElementById("txtSearch").value = select;
	//隐藏内容
	document.getElementById("suggest").style.display = "none";
}

//鼠标移上
function suggestOver(obj) {
	obj.className = "suggest_link_over";
}

//鼠标移出
function suggestOut(obj) {
	obj.className = "suggest_link";
}
</script>


	</head>

	<body>
		<h3>
			Ajax实现搜索提示
		</h3>
		<div style="width: 500px">
			<form action="" id="formSearch">
				<input type="text" id="txtSearch" name="txtSearch"
					onkeyup="searchSuggest()" autocomplete="off" />
				<input type="submit" id="cmdSearch" name="cmdSearch" value="搜索" />
				<br>
				<div id="suggest" style="width: 200px"></div>
			</form>
		</div>

	</body>
</html>
