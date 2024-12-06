package org.example.market.web.servlet.manager;

import org.example.market.domain.Product;
import org.example.market.domain.User;
import org.example.market.exception.ListProductException;
import org.example.market.service.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

public class ListUserServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 1.创建service层的对象
        UserService service = new UserService();
        // 2.调用service层用于查询所有用户的方法
        List<User> users = service.findAllUser();
        // 3.将查询出的所有用户放进request域中
        request.setAttribute("users", users);
        // 4.重定向到list.jsp页面
        request.getRequestDispatcher("/admin/user/list.jsp").forward(request, response);
    }
}
