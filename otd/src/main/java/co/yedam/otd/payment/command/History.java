package co.yedam.otd.payment.command;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.vo.MemberVO;
import co.yedam.otd.payment.service.TicketService;
import co.yedam.otd.payment.serviceImpl.TicketServiceImpl;
import co.yedam.otd.payment.vo.HistoryVO;
import co.yedam.otd.payment.vo.PaymentVO;

public class History implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 결제정보를 db로
		HttpSession session = request.getSession();
		TicketService dao = new TicketServiceImpl();
		MemberVO vo = (MemberVO) session.getAttribute("session");
		PaymentVO pvo = new PaymentVO();
		HistoryVO hvo = new HistoryVO();

		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		pvo.setEmail(request.getParameter("email"));
		pvo.setPayment_price(request.getParameter("payment_price"));
		pvo.setPayment_method(request.getParameter("payment_method"));

		hvo.setTicket_no(request.getParameter("ticket_no"));
		hvo.setEmail(request.getParameter("email"));
		hvo.setHistory_date(Date.valueOf(sqlDate.toString()));
//		hvo.setHistory_date(Date.valueOf("2021-06-08"));

		if (request.getParameter("payment_price").equals("1000")) {
			hvo.setTicket_code("A");
			System.out.println(hvo.getTicket_code() + hvo.getTicket_code());
		} else if (request.getParameter("payment_price").equals("2000")) {
			hvo.setTicket_code("B");
		} else if (request.getParameter("payment_price").equals("3500")) {
			hvo.setTicket_code("C");
		} else if (request.getParameter("payment_price").equals("7000")) {
			hvo.setTicket_code("D");
		} else if (request.getParameter("payment_price").equals("10000")) {
			hvo.setTicket_code("E");
		} else if (request.getParameter("payment_price").equals("15000")) {
			hvo.setTicket_code("F");
		} else if (request.getParameter("payment_price").equals("25000")) {
			hvo.setTicket_code("G");
		}

		dao.paymentInsert(pvo);
		dao.historyInsert(hvo);
		System.out.println(dao);
		System.out.println(dao.paymentInsert(pvo));
		System.out.println(dao.historyInsert(hvo));
		return "yujeong/history";
	}

}
