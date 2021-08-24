package co.yedam.otd.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.DataSource;
import co.yedam.otd.notice.service.NoticeService;
import co.yedam.otd.notice.serviceImpl.NoticeServiceImpl;
import co.yedam.otd.notice.vo.NoticeVO;
import co.yedam.otd.page.model.Criteria;
import co.yedam.otd.page.model.PageMakerDTO;

public class NoticeDelete implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 공지삭제
		NoticeService dao = new NoticeServiceImpl();
		NoticeVO vo = new NoticeVO();
		vo.setNoticeNo(Integer.valueOf(request.getParameter("noticeNo")));
		dao.noticeDelete(vo);
		//request.setAttribute("list", dao.noticeList());
		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();
		
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		request.setAttribute("list", dao.getListPaging(cri));
		/* 게시판 목록 페이지 접속(페이징 적용) */
        int total = dao.getTotal();
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        request.setAttribute("pageMaker", pageMake);
		
		return "notice/noticeList";
	}

}
