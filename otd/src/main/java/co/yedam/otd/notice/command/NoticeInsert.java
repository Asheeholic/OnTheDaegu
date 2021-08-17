package co.yedam.otd.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.DataSource;
import co.yedam.otd.notice.service.NoticeService;
import co.yedam.otd.notice.serviceImpl.NoticeServiceImpl;
import co.yedam.otd.notice.vo.NoticeVO;

public class NoticeInsert implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 공지작성
		NoticeService dao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		vo.setNoticeTitle(request.getParameter("noticeTitle"));
		vo.setNoticeContent(request.getParameter("noticeContent"));
		dao.noticeInsert(vo);
		request.setAttribute("list", dao.noticeList());
		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();
		
		return "notice/noticeList";
	}

}
