
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<%@ include file="NewFile1.jsp" %>
<head>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

    <title>INSPINIA | Register</title>

    <link th:href="@{/css/bootstrap.min.css}" rel="stylesheet"/>
    <link th:href="@{/font-awesome/css/font-awesome.css}" rel="stylesheet"/>
    <link th:href="@{/css/plugins/iCheck/custom.css}" rel="stylesheet"/>
    <link th:href="@{/css/animate.css}" rel="stylesheet"/>
    <link th:href="@{/css/style.css}" rel="stylesheet"/>



    <!-- Sweet Alert -->
    <link th:href="@{/css/plugins/sweetalert/sweetalert.css}" rel="stylesheet"/>

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen   animated fadeInDown" style="width: 30em; margin: auto; margin-top: 150px;">
    <div>
        <div>
            <h2 class="logo-name">欢迎您，先生/女士</h2>
        </div>
        <h3>欢迎注册</h3>
        <!--<p>Create account to see it in action.</p>-->
        <form class="m-t" role="form" onsubmit="return login();" action="${pageContext.request.contextPath}/login/register" method="post">
            <div class="form-group">
                <input type="text" class="form-control" placeholder="userName" name="userName" required=""/>
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="password" id="password" name="password" required="" />
            </div>
            <div class="form-group">
                <input type="password" class="form-control" placeholder="againpassword" name="againpassword" id="againpassword" required=""/>
            </div>
            <%--<div class="form-group">--%>
                <%--<div class="checkbox i-checks"><label> <input type="checkbox"/><i></i> 记住账号密码 </label></div>--%>
            <%--</div>--%>
            <button type="submit" class="btn btn-success block full-width m-b">注  册</button>

            <p class="text-muted text-center"><small>已经注册 ?</small></p>
            <a class="btn btn-sm btn-white btn-block" th:href="login" href="<%=basePath%>weclome.jsp">登  录</a>
        </form>
        <!--<p class="m-t"> <small>Inspinia we app framework base on Bootstrap 3 &copy; 2014</small> </p>-->
    </div>
</div>
<!-- Mainly scripts -->
<script th:src="@{/js/jquery-2.1.1.js}"></script>
<script th:src="@{/js/bootstrap.min.js}"></script>
<!-- Mainly scripts -->
<!--<script src="js/jquery-2.1.1.js"></script>-->
<!--<script src="js/bootstrap.min.js"></script>-->
<!-- iCheck -->
<!-- Sweet alert -->
<!--<script>-->

<!--$(document).ready(function(){-->
<!--$('.i-checks').iCheck({-->
<!--checkboxClass: 'icheckbox_square-green',-->
<!--radioClass: 'iradio_square-green',-->
<!--});-->
<!--});-->

<!--</script>-->
<script src="${pageContext.request.contextPath}/js/jquery-3.2.1.min.js"></script>
<script th:inline="javascript">
    function login() {
        if($("#password").val()!=$("#againpassword").val()){
            alert("两次密码不一致");
            return false;
        }
        if($("#password").val().length<4){
          alert("输入密码长度应该要大于4");
          return false;
        }  if($("#againpassword").val().length<4){
            alert("确认密码长度要大于4");
            return false;
        }
        return true;
    }
    var error = [[${error}]];
    $(document).ready(function () {
        if(error!=null){
            swal({
                title : "温馨提示",
                text : error
            });
        }
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });

</script>
</body>

</html>
 
