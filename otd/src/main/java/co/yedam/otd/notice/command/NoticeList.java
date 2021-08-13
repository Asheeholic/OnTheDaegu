package co.yedam.otd.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.notice.service.NoticeService;
import co.yedam.otd.notice.serviceImpl.NoticeServiceImpl;

public class NoticeList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 공지리스트
		NoticeService dao = new NoticeServiceImpl();
		request.setAttribute("list", dao.noticeList());
		System.out.println(dao.noticeList());
		
		return "notice/noticeList";
	}

}
