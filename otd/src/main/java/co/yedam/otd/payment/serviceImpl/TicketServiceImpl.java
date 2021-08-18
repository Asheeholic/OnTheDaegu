package co.yedam.otd.payment.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.yedam.otd.common.DataSource;
import co.yedam.otd.payment.service.TicketMapper;
import co.yedam.otd.payment.service.TicketService;
import co.yedam.otd.payment.vo.HistoryVO;
import co.yedam.otd.payment.vo.PaymentVO;
import co.yedam.otd.payment.vo.TicketVO;

public class TicketServiceImpl implements TicketService {
	private SqlSession sqlSession = DataSource.getInstance().openSession();
	private TicketMapper map = sqlSession.getMapper(TicketMapper.class);

	@Override
	public List<TicketVO> ticketSelectList() {
		// 티켓 전체조회
		return map.ticketSelectList();
	}

	@Override
	public TicketVO ticketSelect(TicketVO vo) {
		// 티켓 한건조회
		return map.ticketSelect(vo);
	}

	@Override
	public List<PaymentVO> paymentSelectList() {
		// 결제정보 전체조회
		return map.paymentSelectList();
	}

	@Override
	public PaymentVO paymentSelect(PaymentVO vo) {
		// 결제방법 조회(카드, 계좌이체, 00페이 등)
		return map.paymentSelect(vo);
	}

	@Override
	public int paymentInsert(PaymentVO vo) {
		// 결제정보 추가
		int n = map.paymentInsert(vo);
		sqlSession.commit();
		return n;
	}

	@Override
	public int historyInsert(HistoryVO vo) {
		// 결제내역 추가
		int n = map.historyInsert(vo);
		sqlSession.commit();
		return n;
	}

	@Override
	public int historyUpdate(HistoryVO vo) {
		// 결제내역 삭제
		int n = map.historyUpdate(vo);
		sqlSession.commit();
		return n;
	}

}
