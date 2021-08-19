package co.yedam.otd.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.yedam.otd.common.Command;
import co.yedam.otd.review.service.ReviewService;
import co.yedam.otd.review.serviceImpl.ReviewServiceImpl;
import co.yedam.otd.review.vo.ReviewVO;

public class ReviewUpdateForm implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 리뷰 수정
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		vo.setReviewNo(Integer.valueOf(request.getParameter("reviewNo")));
		request.setAttribute("review", dao.reviewSelect(vo));	
				
		return "review/reviewUpdateForm";
	}

}
