<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>网上商城</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/client/css/main.css" type="text/css" />
</head>
<body class="main">
	<p:user />
	<jsp:include page="head.jsp" />
	<jsp:include page="menu_search.jsp" />
	<div id="divpagecontent">
		<table width="100%" border="0" cellspacing="0">
			<tr>
				<td width="25%">
					<table width="100%" border="0" cellspacing="0"
						style="margin-top:30px">
						<tr>
							<td class="listtitle">我的账户</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon1.png" width="15" height="10"  alt=""/>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath }/client/modifyuserinfo.jsp">用户信息</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon2.png" width="15" height="10"  alt=""/>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/findOrderByUser">订单查询</a>
							</td>
						</tr>
						<tr>
							<td class="listtd">
								<img src="${pageContext.request.contextPath }/client/images/icon3.png" width="15" height="10"  alt=""/>&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/logout">用戶退出</a>
							</td>
						</tr>
					</table>
				</td>
				<td>
					<div style="text-align:right; margin:5px 10px 5px 0">
						<a href="${pageContext.request.contextPath }/index.jsp">首页</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath }/client/myAccount.jsp">&nbsp;我的帐户</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&gt;&nbsp;&nbsp;&nbsp;&nbsp;用户信息
					</div>
					<table cellspacing="0" class="infocontent">
						<tr>
							<td>
								<table width="100%" border="0" cellspacing="2" class="upline">
									<tr>
										<td style="text-align:right; width:20%">会员邮箱：</td>
										<td style="width:40%; padding-left:20px">${user.email }</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align:right">会员名：</td>
										<td style="padding-left:20px">${user.username }</td>
										<td>&nbsp;</td>
									</tr>
									<tr>
										<td style="text-align:right">性别：</td>
										<td colspan="2">&nbsp;&nbsp;
											<label>
												<input type="radio" name="radiobutton" value="radiobutton"
													   ${user.gender=='男'?'checked':'' }/>
												男
											</label>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label>
												<input type="radio" name="radiobutton" value="radiobutton"
													   ${user.gender=='女'?'checked':'' }/>
												女
											</label>
										</td>
									</tr>
									<tr>
										<td style="text-align:right">联系方式：</td>
										<td colspan="2">
											<label>
												<input name="text2" type="text" value="${user.telephone}" class="textinput" />
											</label>
										</td>
									</tr>
									<tr>
										<td style="text-align:right">&nbsp;</td>
										<td>&nbsp;</td>
										<td>&nbsp;</td>
									</tr>
								</table>
								<p style="text-align:center">
								<p style="text-align:center">&nbsp;</p>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	</div>
	<jsp:include page="foot.jsp" />
</body>
</html>
