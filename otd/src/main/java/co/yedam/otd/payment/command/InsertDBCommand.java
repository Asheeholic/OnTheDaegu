package co.yedam.otd.payment.command;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.history.service.HistoryService;
import co.yedam.otd.history.serviceImpl.HistoryServiceImpl;
import co.yedam.otd.history.vo.HistoryVO;
import co.yedam.otd.member.vo.MemberVO;
import co.yedam.otd.payment.service.TicketService;
import co.yedam.otd.payment.serviceImpl.TicketServiceImpl;
import co.yedam.otd.payment.vo.PaymentVO;

public class InsertDBCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 결제정보를 db로
		HttpSession session = request.getSession();
		TicketService dao = new TicketServiceImpl();
		HistoryService hdao = new HistoryServiceImpl(); 
		MemberVO vo = (MemberVO) session.getAttribute("session");
		PaymentVO pvo = new PaymentVO();
		HistoryVO hvo = new HistoryVO();
		
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

		pvo.setEmail(request.getParameter("email"));
		pvo.setPayment_price(request.getParameter("payment_price"));
		pvo.setPayment_method(request.getParameter("payment_method"));

		hvo.setTicketNo(request.getParameter("ticket_no"));
		hvo.setEmail(request.getParameter("email"));
		hvo.setHistoryDate(Date.valueOf(sqlDate.toString()));
//		hvo.setHistory_date(Date.valueOf("2021-06-08"));

		if (request.getParameter("payment_price").equals("1000")) {
			hvo.setTicketCode("A");
		} else if (request.getParameter("payment_price").equals("2000")) {
			hvo.setTicketCode("B");
		} else if (request.getParameter("payment_price").equals("3500")) {
			hvo.setTicketCode("C");
		} else if (request.getParameter("payment_price").equals("7000")) {
			hvo.setTicketCode("D");
		} else if (request.getParameter("payment_price").equals("10000")) {
			hvo.setTicketCode("E");
		} else if (request.getParameter("payment_price").equals("15000")) {
			hvo.setTicketCode("F");
		} else if (request.getParameter("payment_price").equals("25000")) {
			hvo.setTicketCode("G");
		}
		
		dao.paymentInsert(pvo);
		hdao.historyInsert(hvo);
		
		List<Map<String, String>> map = hdao.histroyList(hvo);
		request.setAttribute("history", map);
		
		return "history/getPayHistory";
	}

}
