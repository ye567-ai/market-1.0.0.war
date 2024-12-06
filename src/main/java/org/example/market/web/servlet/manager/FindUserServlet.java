package org.example.market.web.servlet.manager;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.example.market.domain.User;
import org.example.market.service.UserService;
//查找所有订单
public class FindUserServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 创建Service层对象
        UserService service = new UserService();
        // 调用Service层对象的findAllUser()方法查询用户
        List<User> users = service.findAllUser();
        //将查询到的用户信息添加到request作用域
        request.setAttribute("users", users);
        // 将请求转发到list.jsp页面
        request.getRequestDispatcher("/admin/orders/list.jsp").forward(request,response);
    }
}

