<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<%
	String path = request.getContextPath();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>入门zTree</title>
<link rel="stylesheet" href="<%=path%>/css/zTreeStyle/zTreeStyle.css"
	type="text/css">
<script type="text/javascript" src="<%=path%>/js/jquery-1.4.4.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery.ztree.core.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/jquery.ztree.excheck.min.js"></script>
</head>
<body>
	<script>
	/* function zTreeOnCheck(event, treeId, treeNode) {
	    alert(treeNode.tId + ", " + treeNode.name + "," + treeNode.checked);
	};
 */		var zTree;
 		var nodesss;
		
		var setting = {
			view : {
				dblClickExpand : true,//双击节点时，是否自动展开父节点的标识
				showLine : true,//是否显示节点之间的连线
				fontCss : {
					'color' : 'black',
					'font-weight' : 'bold'
				},//字体样式函数
				selectedMulti : true
			//设置是否允许同时选中多个节点
			},
			check : {
				/* Y 属性定义 checkbox 被勾选后的情况； 
				N 属性定义 checkbox 取消勾选后的情况； 
				"p" 表示操作会影响父级节点； 
				"s" 表示操作会影响子级节点。 */
				chkboxType: { "Y": "s", "N": "s" },
				chkStyle : "radio",//复选框类型
				enable : true
			//每个节点上是否显示 CheckBox 
			},
			async:{
				enable:true
			},
			data : {
				simpleData : {//简单数据模式
					enable : true,
					idKey : "id",
					pIdKey : "pId",
					rootPId : ""
				}
			},
			callback : {
				beforeCollapse:zTreeBeforeCollapse,
				onClick: onClickfunction
			}
			
		};
		function zTreeBeforeCollapse() {
		    return true;
		};
		function onClickfunction(event, treeId, treeNode) {
			 	nodesss = treeNode;
				 var treeObj=$.fn.zTree.getZTreeObj("user_tree");
				 var jsonData;
				 var nodes = treeObj.getNodes();
					if(!nodesss.ZAsnyc){
						console.log("测试");
						nodesss.ZAsnyc=true;
						$.ajax({
							async:true,
							cache:false,
							data:{"pid":nodesss.id},
							type:'POST',
							dataType:'json',
							url:"<%=path%>/ztree/childrenZtree",
							error:function(){
								console.log("失败了");
							},
							success:function(data){
								jsonData=data;
								var jsonstr=JSON.stringify(data);
								//console.log(jsonstr);
								if(jsonstr!="[]"){
									if(!nodesss.isParent){
										treeObj.addNodes(nodesss,jsonData,false);
										treeObj.expandNode(nodesss,true);
									}
								}
							}
						});
				}else if(nodesss.ZAsync==true){
					treeObj.reAsyncChildNodes(jsonData,"test",chenggong());
				}	
						
		}
		var chenggong=()=>console.log("成功了");
		
		
		
	</script>
	<p class="zTreeDemoBackground left"></p>
	<shiro:user></shiro:user>
	<ul id="user_tree" class="ztree"
		style="border: 1px solid #617775; overflow-y: scroll; height: 500px;"></ul>
	<p></p>
	<!-- <script>
		var zNodes = [ {
			id : 1,
			pId : 0,
			name : "test 1",
			open : false
		}, {
			id : 11,
			pId : 1,
			name : "test 1-1",
			open : true
		}, {
			id : 111,
			pId : 11,
			name : "test 1-1-1"
		}, {
			id : 112,
			pId : 11,
			name : "test 1-1-2"
		}, {
			id : 12,
			pId : 1,
			name : "test 1-2",
			open : true
		}, ];

		$(document).ready(function() {
			$.fn.zTree.init($("#user_tree"), setting, zNodes);
		});
	
	</script> -->
	<script>
	$(document).ready(function(){
	    onLoadZTree();
	});
	 
	/**
	 * 加载树形结构数据
	 */
	function onLoadZTree(){
	    var treeNodes;
	    $.ajax({
	        async:false,//是否异步
	        cache:false,//是否使用缓存
	        type:'POST',//请求方式：post
	        dataType:'json',//数据传输格式：json
	        url:'<%=path%>/ztree/jsonZtree',
	        //请求的action路径
	        error:function(){
	            //请求失败处理函数
	            alert('亲，请求失败！');
	        },
	        success:function(data){
//	          console.log(data);
	            //请求成功后处理函数
	            treeNodes = data;//把后台封装好的简单Json格式赋给treeNodes
	        }
	    });
		$.fn.zTree.init($("#user_tree"), setting, treeNodes);
	}   
	function testNodeIndex(){
		
	}
	</script>
	<button onclick="testNodeIndex();">测试点击按钮</button>
</body>
</html>