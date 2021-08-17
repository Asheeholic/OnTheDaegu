package co.yedam.otd.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.member.vo.MemberVO;
import co.yedam.otd.payment.service.TicketService;
import co.yedam.otd.payment.serviceImpl.TicketServiceImpl;
import co.yedam.otd.payment.vo.PaymentVO;
import co.yedam.otd.payment.vo.TicketVO;

public class Payment implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 구매조건 입력창의 정보를 결제창으로 넘김
		HttpSession session = request.getSession();
		MemberVO vo = (MemberVO) session.getAttribute("session");
		
		String payment = request.getParameter("pay");
		String ticket = request.getParameter("ticket");
		
		request.setAttribute("payment", payment);
		request.setAttribute("ticket", ticket);

		return "yujeong/paymentForm";
	}

}
