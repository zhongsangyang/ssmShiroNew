
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String basePath = request.getContextPath()+"/";
    String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort();
%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8" />
    <title>index</title>
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link
            href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css"
            rel="stylesheet" />
    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script
            src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js">

    </script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script
            src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js">

    </script>
</head>
<body>
<form id="form1" class="well"
      style="width: 30em; margin: auto; margin-top: 150px;" action="${pageContext.request.contextPath}/login/login" method="post">
    <h3>用户登录</h3>
    <div class=" input-group input-group-md">
              <span class="input-group-addon" id="sizing-addon1"><i
                      class="glyphicon glyphicon-user" aria-hidden="true"></i></span> <input
            id="userName" name="userName" type="text" class="form-control" placeholder="用户名"
            aria-describedby="sizing-addon1" />
    </div>
    <br />
    <div class="input-group input-group-md">
              <span class="input-group-addon" id="sizing-addon1"><i
                      class="glyphicon glyphicon-lock"></i></span> <input type="password"
                                                                          name="password" id="password" class="form-control" placeholder="密码"
                                                                          aria-describedby="sizing-addon1" />
    </div>
    <!--     <div class="well well-sm" style="text-align: center;">
             <input  type="radio" name="kind" value="tea" /> 管理员 <input
                   type="radio" name="kind" value="stu" /> 学生
         </div>
     -->
    <input type="submit" class="btn btn-success btn-block" value="登录"/>
    <a class="btn btn-sm btn-white btn-block" style="text-align: right;" th:href="@{register}" href="<%=basePath%>register.jsp"><h6>还没有账户？前往注册</h6></a>
</form>
<script>

</script>
</body>
</html>
