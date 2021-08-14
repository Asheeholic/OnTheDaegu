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
import co.yedam.otd.notice.command.NoticeDelete;
import co.yedam.otd.notice.command.NoticeInsert;
import co.yedam.otd.notice.command.NoticeInsertForm;
import co.yedam.otd.notice.command.NoticeList;
import co.yedam.otd.notice.command.NoticeSelect;
import co.yedam.otd.notice.command.NoticeUpdate;
import co.yedam.otd.notice.command.NoticeUpdateForm;

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
		map.put("/noticeInsertForm.do", new NoticeInsertForm()); // 공지작성폼
		map.put("/noticeInsert.do", new NoticeInsert()); // 공지작성
		map.put("/noticeUpdateForm.do", new NoticeUpdateForm()); // 공지수정폼
		map.put("/noticeUpdate.do", new NoticeUpdate()); // 공지수정
		map.put("/noticeDelete.do", new NoticeDelete()); // 공지삭제
	
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
