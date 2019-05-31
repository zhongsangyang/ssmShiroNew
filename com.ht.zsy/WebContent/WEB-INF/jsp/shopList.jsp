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

        .tab_nav li.curr a {
            border-bottom: 2px solid white;
        }
    </style>
</head>
<body>
<div class="main-title clearfix">
    <div class="fl">商品列表</div>
</div>
<div class="Mainbox">
    <div class="mainwraper">
        <%--<ul class="tab_nav clearfix">--%>
        <%--<li class="curr">--%>
        <%--<a href="<%=basePath%>login/shopList">商品列表</a>--%>
        <%--</li>--%>
        <%--</ul>--%>

        <div class="p20 clearfix">
            <p class="mb10 f000">
                <strong style="font-weight: 600">共
                    <c:if test="${shopList.size()==0}">0</c:if>
                    <c:forEach items="${shopList}" var="d" begin="0" end="0" varStatus="status">
                        ${d.allcount}
                    </c:forEach> 个商品
                </strong>
            </p>
            <table class="table_fff">
                <thead>
                <tr>
                    <th width="10%">商品缩略图</th>
                    <th width="10%">商品摘要</th>
                    <th width="10%">在线购买</th>
                </tr>
                </thead>
                <c:forEach var="p" items="${shopList}" varStatus="status">
                <tr style="background: rgb(255, 255, 255);">

                    <td>
                        <p class="commentphoto">
                        </p><div >
                        <img  onclick="ModalTip(this)" width='120' height='90' src="${pageContext.request.contextPath}${p.shopimageurl}"
                              alt="点我查看封面图图片" />
                        <p></p></div>
                        <%--<p>--%>
                        <%--&nbsp;&nbsp;&nbsp;&nbsp;无封面图--%>
                        <%--</p>--%>
                    </td>
                    <td>
                       商品编号:${p.shopid}<br/>
                       商品名称:${p.shopname}<br/>
                        商品价格:${p.shopprice}<br/>
                        商品简介:${p.shopdescription}<br/>
                    </td>
                    <td>
                        <a href="javascript:void(0);"  class="cBlue" data-id="${p.shopid}">加入购物车</a>
                    </td>
                </tr>
                </c:forEach>
                <c:if test="${shopList.size()<=0}">
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
    (function ($) {
        $.manager = {
            init: function () {
                $(".cBlue").click(function () {
                    $.modalSubmit({
                        url: "${pageContext.request.contextPath}/login/addgouwuche",
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
    })(jQuery);
    function ModalTip(id){
        var content;
        var qianUrl=$(id).attr("src");

        console.log(id);
        content='\n\n';
        var size="_750x500_c";
        var imageStr="<img width='750' height='500' src="+qianUrl+" alt='' />";
        content+=imageStr;
        /*页面层*/
        layer.open({
            type: 1,
            title:'封面图',
            skin: 'layui-layer-rim', /*加上边框*/
            area: ['764px', '555px'], /*宽高*/
            content:content
        });
    }
</script>
<script>
    $('.table_fff >tbody>tr').hover(function () {
        $(this).css({ background: "#fcf4df" });
    }, function () {
        $(this).css({ background: "#fff" });
    });


</script>

</body>
</html>