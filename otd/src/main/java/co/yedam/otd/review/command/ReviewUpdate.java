package co.yedam.otd.review.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.common.DataSource;
import co.yedam.otd.review.service.ReviewService;
import co.yedam.otd.review.serviceImpl.ReviewServiceImpl;
import co.yedam.otd.review.vo.ReviewVO;

public class ReviewUpdate implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 리뷰수정
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		vo.setReviewContent(request.getParameter("reviewContent"));
		vo.setReviewLike(Integer.valueOf(request.getParameter("reviewLike")));
		vo.setReviewNo(Integer.valueOf(request.getParameter("reviewNo")));
		dao.reviewUpdate(vo);
		request.setAttribute("list", dao.reviewSelect(vo));
		SqlSession sqlSession = DataSource.getInstance().openSession();
		sqlSession.close();
		
		return "review/reviewList";
	}

}
