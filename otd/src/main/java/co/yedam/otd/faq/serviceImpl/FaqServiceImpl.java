package co.yedam.otd.faq.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.faq.service.FaqMapper;
import co.yedam.otd.faq.service.FaqService;
import co.yedam.otd.faq.vo.FaqVO;

public class FaqServiceImpl implements FaqService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private FaqMapper map = sqlSession.getMapper(FaqMapper.class);
	@Override
	public List<FaqVO> faqRentalOffice() {
		return map.faqRentalOffice();
	}
	@Override
	public List<FaqVO> faqPaymentRefundMileage() {
		return map.faqPaymentRefundMileage();
	}
	@Override
	public List<FaqVO> faqUseInformation() {
		return map.faqUseInformation();
	}
	@Override
	public List<FaqVO> faqBicycleFacilityManagement() {
		return map.faqBicycleFacilityManagement();
	}
	@Override
	public List<FaqVO> faqRentalReturn() {
		return map.faqRentalReturn();
	}


}
