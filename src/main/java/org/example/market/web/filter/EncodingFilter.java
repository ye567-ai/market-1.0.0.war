package org.example.market.web.filter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.charset.StandardCharsets;
import java.util.Map;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
/**
 * 编码过滤器（用于统一项目编码）
 */
public class EncodingFilter implements Filter {
	public void init(FilterConfig filterConfig) throws ServletException {

	}
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// 处理请求乱码
		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
		HttpServletRequest myRequest = new MyRequest(httpServletRequest);
		// 处理响应乱码
		response.setContentType("text/html;charset=utf-8");
		chain.doFilter(myRequest, response);
	}
	public void destroy() {

	}
}
// 自定义request对象
// 自定义request对象
class MyRequest extends HttpServletRequestWrapper {
	private HttpServletRequest request;

	public MyRequest(HttpServletRequest request) {
		super(request); // super必须写
		this.request = request;
	}

	// 对需要增强方法 进行覆盖
	@Override
	public Map<String, String[]> getParameterMap() {
		// 获取请求方式
		String method = request.getMethod();
		if ("POST".equalsIgnoreCase(method)) {
			// post请求
			try {
				// 处理post乱码
				request.setCharacterEncoding("utf-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		// 直接返回原始的getParameterMap，不进行编码转换
		return request.getParameterMap();
	}

	@Override
	public String getParameter(String name) {
		Map<String, String[]> parameterMap = getParameterMap();
		String[] values = parameterMap.get(name);
		if (values == null || values.length == 0) {
			return null;
		}
		return values[0]; // 取回参数的第一个值
	}

	@Override
	public String[] getParameterValues(String name) {
		Map<String, String[]> parameterMap = getParameterMap();
		return parameterMap.get(name);
	}
}
