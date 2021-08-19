package co.yedam.otd.faq.service;

import java.util.List;

import co.yedam.otd.faq.vo.FaqVO;

public interface FaqMapper {
	List<FaqVO> faqRentalOffice(); // 자주 묻는 질문: 대여소
	List<FaqVO> faqPaymentRefundMileage(); // 자주 묻는 질문: 결제/환불/마일리지
	List<FaqVO> faqUseInformation(); // 자주 묻는 질문: 이용안내
	List<FaqVO> faqBicycleFacilityManagement(); // 자주 묻는 질문: 자전거 및 시설관리
	List<FaqVO> faqRentalReturn(); // 자주 묻는 질문: 대여/반납
}
