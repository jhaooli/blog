<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>  
  <head>  
    <title></title>  
    <link href="${ctxStatic}/sys/css/jquery.Jcrop.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    	.img{width:99.9%;height:260px;margin:0 auto 0 auto;border-top:1px solid #A9A9AA;}
    	#sub{width:65px;height:20px;opacity:0;}
    	#cutImg{text-align:center;}
    	.header{border-bottom:1px solid;margin-bottom:10px;}
    	.btn{width:50px;height:20px;background:#DFF1FF url(${ctxStatic}/sys/images/submit_btn.png) no-repeat;float:left}
    	.clear{clear:both}
    	.error{margin-top:10px;font-size:14px;height:20px;}
    	span{color:#E53C37}
    </style>
    
    <script type="text/javascript" src="${ctxStatic}/sys/js/jquery.min.js"></script>
  	<script type="text/javascript" src="${ctxStatic}/sys/js/jquery.Jcrop.js"></script>
  	<script type="text/javascript">
  		$(function(){
  			$("#sub").change(function(){
  				var s=$("#form").attr("method","post");
  				$("#form").submit();
  			});
  		});

  	</script>
  </head>    
  <body>
		
	<div class="header">
		<form action="${ctx}/a/upload" enctype="multipart/form-data" id="form" method="post">
			<div class="btn"><input type='file' name='file' id="sub" value="ceshi"></div>
			&nbsp;&nbsp;&nbsp;&nbsp;
	<c:choose>
		<c:when test="${error==null}">
			选择图片后，双击进行选择.
		</c:when>
		<c:when test="${error!=null}">
			<span>${error},支持jpg,png,gif,jpeg图片</span>
		</c:when>
	</c:choose>
</form>
	</div>

	<div class="clear"></div>
	<div class="img"><img src="${url}" id="cutImg"/><br/> </div>
  	<input type="hidden" name="x1" id="x1"/>
  	<input type="hidden" name="y1" id="y1"/>
  	<input type="hidden" name="w" id="w"/>
  	<input type="hidden" name="h" id="h"/>
  	
  	<script type="text/javascript">
  		$(function(){
  			$("#cutImg").Jcrop({
  				onChange:showCoords,
  				onSelect:showCoords,
  				onDblClick:function(){
  				var x=$("#x1").val();
  				var y=$("#y1").val();
  				var width=$("#w").val();
  				var height=$("#h").val();
  				var src=$("#cutImg").attr("src");
  				$(".error").text("       上传中...请勿连续点击");
  				$.get("${ctx}/a/saveImg", { x: x, y: y,width:width,height:height,src:src},function(data){
  					window.parent.location.reload();
  				});
	  			
	  			},
  				
  			});
  			
  		});
  		function showCoords(c){
  			$("#x1").val(parseInt(c.x));
  			$("#y1").val(parseInt(c.y));
  			$("#w").val(parseInt(c.w));
  			$("#h").val(parseInt(c.h));
  		}
  	</script>
  </body> 
</html> 