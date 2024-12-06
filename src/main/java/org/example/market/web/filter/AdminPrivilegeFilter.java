package org.example.market.web.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.example.market.domain.User;

public class AdminPrivilegeFilter implements Filter {

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		// 1. 强制转换
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;

		// 2. 判断是否具有权限
		User user = (User) request.getSession().getAttribute("user");

		if (user != null && "超级用户".equals(user.getRole())) {
			// 3. 放行
			chain.doFilter(request, response);
			return;
		}

		response.sendRedirect(request.getContextPath() + "/error/privilege.jsp");
	}

	@Override
	public void destroy() {

	}
}
