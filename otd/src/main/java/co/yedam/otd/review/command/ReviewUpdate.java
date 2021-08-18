package co.yedam.otd.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.review.service.ReviewService;
import co.yedam.otd.review.serviceImpl.ReviewServiceImpl;
import co.yedam.otd.review.vo.ReviewVO;

public class ReviewUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 리뷰수정
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		vo.setReviewNo(Integer.valueOf(request.getParameter("reviewNo")));
		vo.setReviewLike(Integer.valueOf(request.getParameter("reviewLike")));
		vo.setReviewContent(request.getParameter("reviewContent"));
		dao.reviewUpdate(vo);
		request.setAttribute("review", dao.reviewSelect(vo));
		request.setAttribute("list", dao.reviewList());			
		
		return "review/reviewSelect";
	}

}
