package co.yedam.otd.faq.service;

import java.util.List;

import co.yedam.otd.faq.vo.FaqVO;

public interface FaqMapper {
	List<FaqVO> faqList(); // faq 전체목록
	List<FaqVO> faqSelectList(String category); // FAQ목록, 카테고리별로 select
}
