package co.yedam.otd.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginInterceptor {
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		logger.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");
		logger.info("LoginInterceptor 진입");
		logger.info("ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ");

		if (request.getSession().getAttribute("sessionName") == null) {
			response.sendRedirect("/login/loginForm.jsp");

			return false;
		}
		return true;
	}

}
