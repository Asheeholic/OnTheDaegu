package co.yedam.otd.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.page.model.Criteria;
import co.yedam.otd.page.model.PageMakerDTO;
import co.yedam.otd.review.service.ReviewService;
import co.yedam.otd.review.serviceImpl.ReviewServiceImpl;

public class ReviewList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 리뷰 전체조회
		ReviewService dao = new ReviewServiceImpl();
		Criteria cri = new Criteria();
		cri.setPageNum(Integer.valueOf(request.getParameter("pageNum")));
		cri.setAmount(Integer.valueOf(request.getParameter("amount")));
//		request.setAttribute("list", dao.reviewList());

		/*페이징 처리*/
		request.setAttribute("list", dao.getListPaging(cri));
		
		/* 게시판 목록 페이지 접속(페이징 적용) */
        int total = dao.getTotal();
        PageMakerDTO pageMake = new PageMakerDTO(cri, total);
        request.setAttribute("pageMaker", pageMake);	
        
		HttpSession session = request.getSession();
		String sessionValue = (String)session.getAttribute("sessionEmail");
		System.out.println(sessionValue);
		return "review/reviewList";
	}

}
