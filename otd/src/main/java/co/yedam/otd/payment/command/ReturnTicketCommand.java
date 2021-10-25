package co.yedam.otd.payment.command;

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
import co.yedam.otd.payment.API.RefundTicket;

public class ReturnTicketCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 환불 선택 창
		//ShowToken showToken = new ShowToken();
		//String token = showToken.showToken();
		RefundTicket refundTicket = new RefundTicket();
		String refund = refundTicket.refundTicket(request.getParameter("ticketNo"));
		//System.out.println(payInfo);
		
		HistoryService dao = new HistoryServiceImpl();
		HistoryVO vo = new HistoryVO();

		HttpSession session = request.getSession();
		MemberVO memberVo = (MemberVO) session.getAttribute("session");
		vo.setEmail(memberVo.getEmail());
		
		List<Map<String,String>> list = dao.histroyList(vo);
		request.setAttribute("history", list);
		return "history/getPayHistory";
	}
}
