package co.yedam.otd.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.Command;
//import co.yedam.otd.common.DataSource;
//import co.yedam.otd.review.service.ReviewService;
//import co.yedam.otd.review.serviceImpl.ReviewServiceImpl;

public class ReviewList implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 리뷰 글목록
//		ReviewService dao = new ReviewServiceImpl();
//		request.setAttribute("list", dao.reviewList());
//		
//		SqlSession sqlSession = DataSource.getInstance().openSession();
//		sqlSession.close();		
		
		return "review/reviewList";
	}

}
