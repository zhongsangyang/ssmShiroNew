
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加商品页面</title>
</head>
<script
        src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js">

</script>
<script>
    function login(){
        if($("#shopName").val()==''){
            alert("请填写商品名字");
            $("#shopName").focus();
            return false;
        }
        if($("#shopPrice").val()==''){
            alert("请填写商品价格");
            $("#shopPrice").focus();
            return false;
        }
        if($("#shopDescription").val()==''){
            alert("请填写商品描述");
            $("#shopDescription").focus();
            return false;
        }
        return true;
    }
</script>
<body>
<form action="${pageContext.request.contextPath}/login/addShopComplete" onsubmit="return login();" method="post" enctype="multipart/form-data">
    商品名称： <input type="text" name="shopname" id="shopName"/><br/>
    商品价格： <input type="text" name="shopprice" id="shopPrice"/><br/>
    商品描述： <input type="text" name="shopdescription" id="shopDescription"/><br/>
    商品图片 <input type="file" name="file"/><br/>
    <input type="submit" value="新增保存"/>
</form>
</body>
</html>
