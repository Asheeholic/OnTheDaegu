package co.yedam.otd.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.review.service.ReviewService;
import co.yedam.otd.review.serviceImpl.ReviewServiceImpl;

public class ReviewList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 리뷰 전체조회
		ReviewService dao = new ReviewServiceImpl();
		request.setAttribute("list", dao.reviewList());
		HttpSession session = request.getSession();
		String sessionValue = (String)session.getAttribute("sessionEmail");
		System.out.println(sessionValue);
		
		return "review/reviewList";
	}

}
