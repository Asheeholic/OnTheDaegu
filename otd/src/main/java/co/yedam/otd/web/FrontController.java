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
import co.yedam.otd.notice.command.NoticeList;
import co.yedam.otd.notice.command.NoticeSelect;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private HashMap<String, Command> map = new HashMap<String, Command>();   

    public FrontController() {
        super();
    }


	public void init(ServletConfig config) throws ServletException {
		map.put("/home.do", new HomeCommand());  //메인페이지
		
		// Notice -김주영
		map.put("/noticeList.do", new NoticeList()); // 공지목록
		map.put("/noticeSelect.do", new NoticeSelect()); // 공지조회
	
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
