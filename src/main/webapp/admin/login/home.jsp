<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style>
        .iframe-container {
            display: flex;
            flex-direction: column;
            height: 100vh; /* 使容器高度占满视口 */
        }
        .iframe-top {
            height: 103px; /* 上部分的高度 */
        }
        .iframe-content {
            flex-grow: 1; /* 内容部分自动填充剩余空间 */
            display: flex; /* 设置为flex布局 */
        }
        .iframe-left {
            width: 159px; /* 左侧列的宽度 */
        }
        .iframe-right {
            flex-grow: 1; /* 右侧列自动填充剩余空间 */
        }
        .iframe-bottom {
            height: 43px; /* 底部的高度 */
        }
        body {
            SCROLLBAR-FACE-COLOR: #dee3f7;    /* 滚动条滑块的颜色 */
            SCROLLBAR-HIGHLIGHT-COLOR: #ffffff; /* 滚动条滑块的高亮颜色 */
            SCROLLBAR-SHADOW-COLOR: #999999;   /* 滚动条滑块的阴影颜色 */
            SCROLLBAR-3DLIGHT-COLOR: #ffffff;  /* 滚动条滑块的3D高亮颜色 */
            SCROLLBAR-DARKSHADOW-COLOR: #666666; /* 滚动条滑块的暗影颜色 */
        }
    </style>
    <title></title>
</head>
<body>
<div class="iframe-container">
    <iframe class="iframe-top" src="${pageContext.request.contextPath}/admin/login/top.jsp" frameborder="0"></iframe>
    <div class="iframe-content">
        <iframe class="iframe-left" src="${pageContext.request.contextPath}/admin/login/left.jsp" frameborder="0"></iframe>
        <iframe class="iframe-right" src="${pageContext.request.contextPath}/admin/login/welcome.jsp" name="mainFrame" frameborder="0"></iframe>
    </div>
    <iframe class="iframe-bottom" src="${pageContext.request.contextPath}/admin/login/bottom.jsp" frameborder="0"></iframe>
</div>
</body>
</html>

