package co.yedam.otd.web;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.HomeCommand;
import co.yedam.otd.login.command.IdCheckCommand;
import co.yedam.otd.login.command.LoginCommand;
import co.yedam.otd.login.command.MemberInsertCommand;
import co.yedam.otd.login.command.SignUpformCommand;
import co.yedam.otd.login.command.LoginFormCommand;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HashMap<String, Command> map = new HashMap<String, Command>();   

    public FrontController() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new HomeCommand());  //메인페이지
		
		//로그인 & 회원가입
		map.put("/signUpForm.do", new SignUpformCommand()); //회원가입 폼
		map.put("/idCheck.do", new IdCheckCommand()); // 아이디중복체크
		map.put("/memberInsert.do", new MemberInsertCommand()); //OTD 회원가입 커멘드
		map.put("/loginForm.do", new LoginFormCommand()); //로그인폼 
		map.put("/login.do", new LoginCommand()); //OTD 로그인 진행 과정
	}


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String path = uri.substring(contextPath.length());
		
		Command command = map.get(path);
		String viewPage = command.execute(request, response);
		
		if (!viewPage.endsWith(".do")) {
			if (!viewPage.endsWith(".jsp")) {
				viewPage = viewPage + ".tiles"; // home/home 타일즈
			} else {
				viewPage = "/WEB-INF/views/" + viewPage; // home/home.jsp 타일즈 안탐
			}
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
