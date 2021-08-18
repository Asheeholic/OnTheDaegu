package co.yedam.otd.review.service;

import java.util.List;

import co.yedam.otd.review.vo.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> reviewList(); // 전체리뷰목록
	ReviewVO reviewSelect(ReviewVO vo); // 리뷰단건조회 --수정,삭제
	int reviewInsert(ReviewVO vo); // 리뷰작성(서비스를 이용한 사람만)
	int reviewUpdate(ReviewVO vo); // 리뷰수정(리뷰 작성자 본인만)
	int reviewDelete(ReviewVO vo); // 리뷰삭제(리뷰 작성자 본인만)
}
