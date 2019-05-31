<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String contextpath=request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>${navName } - 管理后台</title>

    <%@ include file="../../basepathTools.jsp" %>
    <%--<link rel="shortcut icon" href="<%=basePath%>images/favicon.ico" />--%>
    <style>
        .rightiframe1 {
            text-align: right;
            height: 34px;
            position: absolute;
            right: 150px;
            top: 0;
            z-index: 99;
            color: #fff;
        }
        .mya{
            color: #fff;
        }
    </style>
</head>
<body>
<div class="header" id="header">
    <h1 class="home fl fw">商城管理</h1>
    <div class="rightiframe1 fw">
                    普通用户
			</span><span class="mr10">${user.username}</span><a href="<%=basePath%>login/loginout" class="mya" >[退出]</a>
        <%--<a href="<%=basePath%>${cityUrl}/PermissionsManage/checkchangepassword" class="mya" >[修改密码]</a>--%>
    </div>
    <%--<p class="last"><a href="<%=basePath%>/login/success}" class="f12 fw" style="color:#fff">商城管理后台</a></p>--%>

</div>
<!-- E;header -->
<!-- S;content -->
<div id="content">
    <div class="siderBar" style="height:770px; overflow-y:auto;">
        <ul class="subnav">

            <li class="curr">
                <a href="<%=basePath%>login/shopList" target="mainframe"> 商品列表
                </a>
            </li>
            <li >
                <a href="<%=basePath%>login/addShop" target="mainframe"> 新增商品
                </a>
            </li>
            <li class="curr">
                <a href="<%=basePath%>login/gouwuche" target="mainframe">我的购物车
                </a>
            </li>

        </ul>
    </div>
    <div class="Maincont" style="height:770px">
        <iframe  id="mainframe" name="mainframe" scrolling="auto" width="100%" height="100%" frameborder="0" src="" title="NavigationShow"></iframe>
    </div>
</div>
<script>


    $(function () {
        var $subli = $(".subnav li");
        var dataUrl = $subli.find("a").attr("href");
        $subli.first().addClass("curr");
        if ((".subnav").length > 0) {
            $(".subnav").on("click", "li", function () {
                $(this).addClass("curr").siblings().removeClass();
            });
        }
        setTimeout(function () {
            if(dataUrl.indexOf("http")<0) {
                $("#mainframe").attr("src", dataUrl);
            }
        }, 100);

    });

    function InitBar(content) {
        var $ul = $(".siderBar .subnav");
        $ul.html(content);
        $ul.find("li:first").addClass("curr");
    }
</script>

</body>
</html>