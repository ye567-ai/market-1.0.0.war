<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="javax.servlet.jsp.PageContext" %>
<script type="text/javascript">

function my_click(obj, myid){
	//点击时，如果取得的值和搜索框默认value值相同，则将搜索框清空
	if (document.getElementById(myid).value == document.getElementById(myid).defaultValue){
	  document.getElementById(myid).value = '';
	  obj.style.color='#000';
	}
}

function my_blur(obj, myid){
	//鼠标失焦时，如果搜索框没有输入值，则用搜索框的默认value值填充
	if (document.getElementById(myid).value == ''){
	 document.getElementById(myid).value = document.getElementById(myid).defaultValue;
	 obj.style.color='#999';
 }
}


	function search(){
	document.getElementById("searchform").submit();
}
</script>

<div id="divmenu">
	<a href="${pageContext.request.contextPath}/showProductByPage?category=食品">食品</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=衣服">衣服</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=电子设备">电子设备</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=书籍">书籍</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=家具">家具</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=乐器">乐器</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=鞋">鞋</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=珠宝">珠宝</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=饮品">饮品</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=化妆品">化妆品</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=药品">药品</a>
	<a href="${pageContext.request.contextPath}/showProductByPage?category=娱乐">娱乐</a>
	<a href="${pageContext.request.contextPath}/showProductByPage" style="color:#b4d76d">全部商品目录</a>
</div>
<div id="divsearch">
<form action="${pageContext.request.contextPath }/MenuSearchServlet" id="searchform">
	<table width="100%" border="0" cellspacing="0">
		<tr>
			<td style="text-align:right; padding-right:220px">
				<label for="textfield">Search</label><input type="text" name="textfield" class="inputtable" id="textfield" value="请输入商品名称"
															onmouseover="this.focus();"
															onclick="my_click(this, 'textfield');"
															onBlur="my_blur(this, 'textfield');"/>
				<a href="#">
					<img src="${pageContext.request.contextPath}/client/images/serchbutton.gif" border="0" style="margin-bottom:-4px" onclick="search()" alt=""/>
				</a>
			</td>
		</tr>
	</table>
</form>
</div>