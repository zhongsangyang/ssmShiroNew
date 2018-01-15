<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%String path=request.getContextPath(); %>
<html>
<head>
    <title></title>
</head>
<body>
<shiro:hasPermission name="/admin/**">
test

</shiro:hasPermission>
     <shiro:hasAnyRoles name="admin">
         <shiro:principal/>拥有角色admin
     </shiro:hasAnyRoles>
     <shiro:user> 
 		<span>我已经认证了</span>
	</shiro:user>
     <h1>我是一个测试类</h1>
     <a href="<%=path%>/login/hasRole">点击去LoginController里面的hasRole方法</a>
</body>
</html>