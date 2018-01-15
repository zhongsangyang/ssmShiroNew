<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
	String path=request.getContextPath();
%>
<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <link href="<%=path%>/css/bootstrap.min.css" rel="stylesheet"></link>
    <script src="<%=path%>/js/jquery-3.2.1.min.js"></script>
    <script src="<%=path%>/js/bootstrap/bootstrap.min.js"></script>
    <title>登录</title>
    <style>
    	.error{
    		color:red;
    	}
    	
    	a:link{
    		color:#FF0000;
    		text-decoration: underline;	
    	}
    	a:VISITED {
			color:#0000000;
			text-decoration: none;
		}
		a:HOVER {
			color:#000000;
			text-decoration: none;
		}
		a:ACTIVE {
			color:#00000F;
			text-decoration: none;
		}	
    </style>
</head>
<body>

<div class="error">${error}</div>
<shiro:authenticated>
	我已经等入过了
	<form action="${pageContext.request.contextPath }/login/loginout" method="post">
	<input type="submit" value="安全退出"/>
	</form>
</shiro:authenticated>
<shiro:guest>
<form class="form-inline" action="<%=path%>/login/login" method="post">
  <div class="form-group">
    <label for="username">Name</label>
    <input type="text" class="form-control" name="username" placeholder="username">
  </div>
  <div class="form-group">
    <label for="password">password</label>
    <input type="password" class="form-control" name="password" placeholder="password">
  </div>
  <button type="submit" class="btn btn-default">Send invitation</button>
  </form>
</shiro:guest>
</body>
</html>