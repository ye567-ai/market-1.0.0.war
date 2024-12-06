<%@ page language="java" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link href="${pageContext.request.contextPath}/admin/css/Style.css"
          rel="stylesheet" type="text/css" />
    <script language="javascript"
            src="${pageContext.request.contextPath}/admin/js/public.js"></script>
    <script type="text/javascript">

        function u_del() {
            var msg = "您确定要删除该用户吗？";
            if (confirm(msg)==true){
                return true;
            }else{
                return false;
            }
        }
    </script>
</HEAD>
<body>
<br />
<form id="Form1" name="Form1" action="" method="post">
    <table cellSpacing="1" cellPadding="0" width="100%" align="center" bgColor="#f5fafe" border="0">
        <tbody>
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3">
                <strong>用 户 列 表</strong>
            </td>
        </tr>
        <tr>
            <td class="ta_01" align="center" bgColor="#f5fafe">
                <table cellspacing="0" cellpadding="1" rules="all"
                       bordercolor="gray" border="1" id="DataGrid1"
                       style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; WIDTH: 100%; WORD-BREAK: break-all; BORDER-BOTTOM: gray 1px solid; BORDER-COLLAPSE: collapse; BACKGROUND-COLOR: #f5fafe; WORD-WRAP: break-word">
                    <tr style="FONT-WEIGHT: bold; FONT-SIZE: 12pt; HEIGHT: 25px; BACKGROUND-COLOR: #afd1f3">
                        <td align="center" width="20%">id</td>
                        <td align="center" width="10%">用户名</td>
                        <td align="center" width="15%">性别</td>
                        <td align="center" width="10%">邮箱</td>
                        <td width="11%" align="center">电话</td>
                        <td width="8%" align="center">自我介绍</td>
                        <td width="10%" align="center">注册时间</td>
                    </tr>
                    <jsp:useBean id="users" scope="request" type="java.util.List"/>
                    <c:forEach items="${users}" var="user">
                        <tr onmouseover="this.style.backgroundColor = 'white'"
                            onmouseout="this.style.backgroundColor = '#F5FAFE';">
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="20%">${user.id}</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${user.username}</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="15%">${user.gender }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center" width="10%">${user.email }</td>
                            <td style="CURSOR: hand; HEIGHT: 22px" align="center">${user.telephone}</td>
                            <td width="8%" align="center">${user.introduce}</td>
                            <td width="10%" align="center">${user.registTime}</td>
                            <td align="center" style="HEIGHT: 22px" width="7%">
                                <a href="${pageContext.request.contextPath}/deleteUser?id=${user.id}" onclick="return u_del()">
                                    <img src="${pageContext.request.contextPath}/admin/images/i_del.gif"
                                         width="16" height="16" border="0" style="CURSOR: hand" alt="">
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </td>
        </tr>
        </TBODY>
    </table>
</form>
</body>
</HTML>