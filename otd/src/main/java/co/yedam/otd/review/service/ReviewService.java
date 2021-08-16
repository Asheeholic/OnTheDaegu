package co.yedam.otd.review.service;

import java.util.List;

import co.yedam.otd.review.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> reviewList(); // 전체리뷰목록
	List<ReviewVO> reviewSelect(ReviewVO vo); // 리뷰조회(내가 쓴 리뷰만 조회할 수 있도록, 리뷰를 여러개 쓴 경우도 있을 수 있으니 list로 받아옴)
	int reviewInsert(ReviewVO vo); // 리뷰작성(서비스를 이용한 사람만)
	int reviewUpdate(ReviewVO vo); // 리뷰수정(리뷰 작성자 본인만)
	int reviewDelete(ReviewVO vo); // 리뷰삭제(리뷰 작성자 본인만)
}
