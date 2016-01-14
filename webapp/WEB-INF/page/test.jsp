<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">

<head>
 
  <!-- 当需要使用带下拉菜单的按钮时才需要加载下面的 JavaScript 文件 -->
  <script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>

</head>
<body>

	 <div style="float: left;">
							<i><img style="height:22px;" id="codeImg" alt="点击更换"
								title="点击更换" src="" /></i>
								<button onclick="changeCode();">变</button>
	</div>

	<script type="text/javascript">
	
		 
		$(document).ready(function() {
			changeCode();
		});

	 
 
		function changeCode() {
			$("#codeImg").attr("src", "http://127.0.0.1:8080/oms-api/v2/login/getIdentifyCode.json");
		}
	</script>
 
</body>

</html>