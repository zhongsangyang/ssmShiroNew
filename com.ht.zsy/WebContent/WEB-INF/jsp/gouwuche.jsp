
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <%@ include file="../../LayoutList.jsp" %>
    <style>
        .tab_nav li {
            position: relative;
        }

        .tab_nav li.curr a {
            top: 2px;
            position: relative;
            z-index: 3;
        }
        .jianshaoclass{
            text-decoration: underline
        }
        .tab_nav li.curr a {
            border-bottom: 2px solid white;
        }
    </style>
    <script type="javascript">
        function mangerDelete(id) {
            var orderid = $("#"+id).attr("data-id");
            console.log("orderid:"+orderid);
            $.modalDelete({
                prompt: "你确定要删除这页数据嘛？",
                url: "${pageContext.request.contextPath}/login/deleteOrder",
                param: {orderid: orderid},
                success: function (data) {
                    console.log("成功了");
                }
            })
        }

    </script>
</head>
<body>
<div class="main-title clearfix">
    <div class="fl">购物车列表</div>
</div>
<div class="Mainbox">
    <div class="mainwraper">
        <%--<ul class="tab_nav clearfix">--%>
        <%--<li class="curr">--%>
        <%--<a href="<%=basePath%>login/shoporderList">商品列表</a>--%>
        <%--</li>--%>
        <%--</ul>--%>

        <div class="p20 clearfix">
            <p class="mb10 f000">
                <strong style="font-weight: 600">共
                    <c:if test="${shoporderList.size()==0}">0</c:if>
                    <c:forEach items="${shoporderList}" var="d" begin="0" end="0" varStatus="status">
                        ${d.allcount}
                    </c:forEach> 个商品
                </strong>
            </p>
            <table class="table_fff">
                <thead>
                <tr>
                    <th width="10%">商品名称</th>
                    <th width="10%">商品单价</th>
                    <th width="10%">购买数量</th>
                    <th width="10%">金额</th>
                    <th width="10%">编辑</th>
                </tr>
                </thead>
                <c:forEach var="p" items="${shoporderList}" varStatus="status">
                    <tr style="background: rgb(255, 255, 255);">

                        <td>
                            ${p.shopName}
                        </td>
                        <td>
                            ${p.oneprice}
                        </td>
                        <td>
                          ${p.buycount}
                        </td>
                        <td>
                            ${p.allprice}
                        </td>
                        <td>
                            <a href="javascript:void(0);"  class="cBlue" data-id="${p.shopid}">再次加入购物车</a>
                            <a href="javaScript:void(0)"
                               data-id="${p.orderid}"
                               onclick="mangerDelete(${p.orderid})"
                               class="btn_delete js_delete editor_btnB ">
                                删除
                            </a>                            <a href="javascript:void(0);" class="jianshaoclass" data-id="${p.shopid}">减少</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${shoporderList.size()<=0}">
                    <tr style="background: rgb(255, 255, 255);">
                        <td align="center" colspan="8">暂无记录</td>
                    </tr>
                </c:if>
            </table>
        </div>



        <c:if test="${page.allPages!=1 }">
            <div class="listpage clearfix" id="pageId">
                <div class="page">
                    <div class="pageinner">
                        <c:if test="${page.hasPreviousPage }">
                            <a href="${page.pageUrl}1" class="firstpage">首页</a>
                            <a href="${page.pageUrl}${page.pageshow-1 }" class="prepage">上一页</a>
                        </c:if>
                        <c:forEach items="${page.pageshows}" var="pageIndex">
                            <c:if test="${page.pageshow==pageIndex}">
                                <span class="pagenum">${pageIndex}</span>
                            </c:if>
                            <c:if test="${page.pageshow!=pageIndex }">
                                <a href="${page.pageUrl}${pageIndex}" class="pagenum">${pageIndex }</a>
                            </c:if>
                        </c:forEach>
                        <c:if test="${page.hasNextPage }">
                            <a href="${page.pageUrl}${page.pageshow+1 }" class="prepage">下一页</a>
                            <a href="${page.pageUrl}${page.listPage}" class="nextpage">末页</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </c:if>

    </div>
</div>
<script>
    function mangerDelete(id) {
        var orderid = $("#"+id).attr("data-id");
        $.modalDelete({
            prompt: "你确定要删除这页数据嘛？",
            url: "${pageContext.request.contextPath}/login/deleteOrder",
            param: {orderid: orderid},
            success: function (data) {
                console.log("成功了");
            }
        })
    }
    (function ($) {


        $.manager = {
            init: function () {
                $(".btn_delete").click(function () {
                    var orderid = $(this).attr("data-id");
                    $.modalDelete({
                        prompt: "你确定要删除这页数据嘛？",
                        url: "${pageContext.request.contextPath}/login/deleteOrder",
                        param: {orderid: orderid},
                        success: function (data) {
                            console.log("成功了");
                        }
                    })
                });
                $(".cBlue").click(function () {
                    $.modalSubmit({
                        url: "${pageContext.request.contextPath}/login/addgouwuche",
                        param: { "shopid": $(this).attr("data-id") },
                        success: function (data) {
                        }
                    })
                });
                $(".jianshaoclass").click(function () {
                    $.modalSubmit({
                        url: "${pageContext.request.contextPath}/login/jianshaogouwuche",
                        param: { "shopid": $(this).attr("data-id") },
                        success: function (data) {
                        }
                    })
                });


            }
        };
        $(function () {
            $.manager.init();
        });
    })(jQuery);</script>