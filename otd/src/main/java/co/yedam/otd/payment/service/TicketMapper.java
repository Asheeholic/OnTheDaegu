package co.yedam.otd.payment.service;

import java.util.List;

import co.yedam.otd.payment.vo.PaymentVO;
import co.yedam.otd.payment.vo.TicketVO;

public interface TicketMapper {
	// 티켓
	List<TicketVO> ticketSelectList(); // 전체 티켓 리스트

	TicketVO ticketSelect(TicketVO vo); // 구매한 티켓

	// 결제정보
	List<PaymentVO> paymentSelectList(); // 전체결제정보

	PaymentVO paymentSelect(PaymentVO vo); // 결제방법(카드,계좌이체 등)

	int paymentInsert(PaymentVO vo);
}
