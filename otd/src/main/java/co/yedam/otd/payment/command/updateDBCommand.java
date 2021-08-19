package co.yedam.otd.payment.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.yedam.otd.common.Command;
import co.yedam.otd.history.service.HistoryService;
import co.yedam.otd.history.serviceImpl.HistoryServiceImpl;
import co.yedam.otd.history.vo.HistoryVO;
import co.yedam.otd.member.vo.MemberVO;

public class updateDBCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 환불된 아이디값 받아서 티켓넘버르 null로 변경
		HttpSession session = request.getSession();
		HistoryService dao = new HistoryServiceImpl();
		MemberVO mvo = (MemberVO) session.getAttribute("session");
		HistoryVO vo = new HistoryVO();
		
		vo.setTicketNo(request.getParameter("ticket_no"));
		vo.setEmail(request.getParameter("email"));
		
		dao.historyUpdate(vo);
		return "yujeong/history";
	}

}
