<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<html>
<head>
    <title>登录</title>
    <style>
    	.error{
    		color:red;
    	}
    </style>
</head>
<body>

<div class="error">${error}</div>
<shiro:authenticated>
	我已经等入过了
</shiro:authenticated>
<shiro:guest>
	<form action="${pageContext.request.contextPath}/login/login" method="post">
    用户名：<input type="text" name="username"><br/>
    密码：<input type="password" name="password"><br/>
    <input type="submit" value="登录">
</form>
</shiro:guest>

</body>
</html>