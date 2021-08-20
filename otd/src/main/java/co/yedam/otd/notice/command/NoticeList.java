package co.yedam.otd.notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.notice.service.NoticeService;
import co.yedam.otd.notice.serviceImpl.NoticeServiceImpl;
import co.yedam.otd.page.model.Criteria;
import co.yedam.otd.page.model.PageMakerDTO;

public class NoticeList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 공지리스트
		NoticeService dao = new NoticeServiceImpl();
		Criteria cri = new Criteria();
		cri.setPageNum(Integer.valueOf(request.getParameter("pageNum")));
		cri.setAmount(Integer.valueOf(request.getParameter("amount")));
//		request.setAttribute("list", dao.noticeList());

		/*페이징 처리*/
		request.setAttribute("list", dao.getListPaging(cri));
		
		/* 게시판 목록 페이지 접속(페이징 적용) */
        int total = dao.getTotal();
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        request.setAttribute("pageMaker", pageMake);		

		return "notice/noticeList";
	}

}
