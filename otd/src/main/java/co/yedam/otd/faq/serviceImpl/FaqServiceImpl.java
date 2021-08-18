package co.yedam.otd.faq.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.faq.service.FaqMapper;
import co.yedam.otd.faq.vo.FaqVO;

public class FaqServiceImpl implements FaqMapper {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private FaqMapper map = sqlSession.getMapper(FaqMapper.class);

	@Override
	public List<FaqVO> faqSelectList(String category) {
		// TODO FAQ목록
		return map.faqSelectList(category);
	}

	@Override
	public List<FaqVO> faqList() {
		return map.faqList();
	}

}
