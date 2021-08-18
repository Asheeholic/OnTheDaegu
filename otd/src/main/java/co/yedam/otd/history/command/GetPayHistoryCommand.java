package co.yedam.otd.history.command;

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

public class GetPayHistoryCommand implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO 결제내역 히스토리 커멘드
		HistoryService dao = new HistoryServiceImpl();
		HistoryVO vo = new HistoryVO();

		HttpSession session = request.getSession();
		MemberVO memberVo = (MemberVO) session.getAttribute("session");
		vo.setEmail(memberVo.getEmail());
		
		List<Map<String,String>> list = dao.histroyList(vo);
		System.out.println("vo야 넌 무엇을 담고 있니?" + list);
		request.setAttribute("history", list);

		return "history/getPayHistory";
	}

}
