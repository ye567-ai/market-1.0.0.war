<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="p" uri="http://www.itcast.cn/tag"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>在线支付</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body>
	<p:user/>
	<form action="${pageContext.request.contextPath}/pay" method="post">
		订单号：<label>
		<INPUT TYPE="text" NAME="orderid" value="${param.id}">
		支付金额：
	</label>
		支付金额：<label>
		<INPUT TYPE="text" NAME="money" value="${param.money}">
		元
	</label>
		<div class="divBank">
			<div class="divText">选择网上银行</div>
			<div style="margin-left: 20px;">
				<div style="margin-bottom: 20px;">
					<label for="ICBC-NET-B2C"></label><input id="ICBC-NET-B2C" type="radio" name="yh"
															 value="ICBC-NET-B2C" checked="checked" />
						<img name="ICBC-NET-B2C" align="middle" src="<c:url value='/client/bank_img/icbc.bmp'/>"  alt=""/>
					<label for="CMBCHINA-NET-B2C"></label><input id="CMBCHINA-NET-B2C" type="radio" name="yh" value="CMBCHINA-NET-B2C" />
						<img name="CMBCHINA-NET-B2C" align="middle" src="<c:url value='/client/bank_img/cmb.bmp'/>"  alt=""/>
					<label for="ABC-NET-B2C"></label><input id="ABC-NET-B2C" type="radio" name="yh" value="ABC-NET-B2C" />
						<img name="ABC-NET-B2C" align="middle" src="<c:url value='/client/bank_img/abc.bmp'/>"  alt=""/>
					<label for="CCB-NET-B2C"></label><input id="CCB-NET-B2C" type="radio" name="yh" value="CCB-NET-B2C" />
						<img name="CCB-NET-B2C" align="middle" src="<c:url value='/client/bank_img/ccb.bmp'/>"  alt=""/>
				</div>
				<div style="margin-bottom: 20px;">
					<input id="BCCB-NET-B2C" type="radio" name="yh"
						value="BCCB-NET-B2C" /><label for="BCCB-NET-B2C"> </label> <img name="BCCB-NET-B2C" align="middle"
																						src="<c:url value='/client/bank_img/bj.bmp'/>" /> <label for="BOCO-NET-B2C"> </label><input
						id="BOCO-NET-B2C" type="radio" name="yh" value="BOCO-NET-B2C" />
					<img name="BOCO-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/bcc.bmp'/>"  alt=""/> <input
						id="CIB-NET-B2C" type="radio" name="yh" value="CIB-NET-B2C" /><label for="CIB-NET-B2C"> </label>
					<img
						name="CIB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/cib.bmp'/>"  alt=""/> <label for="NJCB-NET-B2C"> </label><input
						id="NJCB-NET-B2C" type="radio" name="yh" value="NJCB-NET-B2C" />
					<img name="NJCB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/nanjing.bmp'/>"  alt=""/>
				</div>
				<div style="margin-bottom: 20px;">
					<input id="CMBC-NET-B2C" type="radio" name="yh"
						value="CMBC-NET-B2C" /><label for="CMBC-NET-B2C"> </label> <img name="CMBC-NET-B2C" align="middle"
																						src="<c:url value='/client/bank_img/cmbc.bmp'/>" /> <input
						id="CEB-NET-B2C" type="radio" name="yh" value="CEB-NET-B2C" /> <img
						name="CEB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/guangda.bmp'/>" /> <input
						id="BOC-NET-B2C" type="radio" name="yh" value="BOC-NET-B2C" /> <img
						name="BOC-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/bc.bmp'/>" /> <input
						id="PINGANBANK-NET" type="radio" name="yh" value="PINGANBANK-NET" />
					<img name="PINGANBANK-NET" align="middle"
						src="<c:url value='/client/bank_img/pingan.bmp'/>"  alt=""/>
				</div>
				<div style="margin-bottom: 20px;">
					<input id="CBHB-NET-B2C" type="radio" name="yh"
						value="CBHB-NET-B2C" /><label for="CBHB-NET-B2C"> </label> <img name="CBHB-NET-B2C" align="middle"
																						src="<c:url value='/client/bank_img/bh.bmp'/>" /> <input
						id="HKBEA-NET-B2C" type="radio" name="yh" value="HKBEA-NET-B2C" />
					<img name="HKBEA-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/dy.bmp'/>"  alt=""/> <input
						id="NBCB-NET-B2C" type="radio" name="yh" value="NBCB-NET-B2C" />
					<img name="NBCB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/ningbo.bmp'/>"  alt=""/> <input
						id="ECITIC-NET-B2C" type="radio" name="yh" value="ECITIC-NET-B2C" />
					<img name="ECITIC-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/zx.bmp'/>"  alt=""/>
				</div>
				<div style="margin-bottom: 20px;">
					<label for="SDB-NET-B2C"></label><input id="SDB-NET-B2C" type="radio" name="yh" value="SDB-NET-B2C" />
					<img name="SDB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/sfz.bmp'/>"  alt=""/> <input
						id="GDB-NET-B2C" type="radio" name="yh" value="GDB-NET-B2C" /> <img
						name="GDB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/gf.bmp'/>" /> <input
						id="SHB-NET-B2C" type="radio" name="yh" value="SHB-NET-B2C" /> <img
						name="SHB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/sh.bmp'/>" /> <input
						id="SPDB-NET-B2C" type="radio" name="yh" value="SPDB-NET-B2C" />
					<img name="SPDB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/shpd.bmp'/>"  alt=""/>
				</div>
				<div style="margin-bottom: 20px;">
					<input id="POST-NET-B2C" type="radio" name="yh"
						value="POST-NET-B2C" /><label for="POST-NET-B2C"> </label> <img name="POST-NET-B2C" align="middle"
																						src="<c:url value='/client/bank_img/post.bmp'/>" /> <input
						id="BJRCB-NET-B2C" type="radio" name="yh" value="BJRCB-NET-B2C" />
					<img name="BJRCB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/beijingnongshang.bmp'/>"  alt=""/> <input
						id="HXB-NET-B2C" type="radio" name="yh" value="HXB-NET-B2C" /><label for="HXB-NET-B2C"> </label>
					<img
						name="HXB-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/hx.bmp'/>"  alt=""/> <input id="CZ-NET-B2C"
						type="radio" name="yh" value="CZ-NET-B2C" /><label for="CZ-NET-B2C"> </label> <img
						name="CZ-NET-B2C" align="middle"
						src="<c:url value='/client/bank_img/zheshang.bmp'/>" />
				</div>
			</div>
			<div style="margin: 40px;">
				<INPUT TYPE="submit" value="确定支付">
			</div>
		</div>
	</form>
</body>
</html>
