package org.example.market.web.servlet.manager;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.example.market.service.UserService;


public class DeleteUserServlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 获取请求参数，用户id
        int id = Integer.parseInt(request.getParameter("id"));
        UserService service = new UserService();
        // 调用service完成操作
        service.deleteUser(id);
        response.sendRedirect(request.getContextPath() + "/listUser");
    }

}

