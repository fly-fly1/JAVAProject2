package com.zhiyou.filter;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class LoginFilter
 */
public class LoginFilter implements Filter {
	private String[] uris = { "/Javaproject2/user_login", "/Javaproject2/user_reg", "/Javaproject2/admin_login",
			"/Javaproject2/admin.jsp" };

	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		if (Arrays.asList(uris).contains(req.getRequestURI())) {
			System.out.println("filter true");
			chain.doFilter(req, response);
			return;
		}
		if (req.getSession().getAttribute("user") == null && req.getSession().getAttribute("admin") == null) {
			req.setAttribute("msg", "请登录");
			System.out.println("filter false");
			req.getRequestDispatcher("admin.jsp").forward(req, response);
		} else {
			chain.doFilter(req, response);
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
